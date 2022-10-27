<?php

namespace App\Http\Controllers;


use App\Models\Customer;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\Retainer;
use App\Models\RetainerPayment;
use App\Models\Utility;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use PayPal\Api\Amount;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;

class PaypalController extends Controller
{
    private $_api_context;

    public function setApiContext()
    {
        $user = \Auth::user();

        $payment_setting = Utility::getCompanyPaymentSetting();



        $paypal_conf['settings']['mode'] = $payment_setting['paypal_mode'];
        $paypal_conf['client_id']        = $payment_setting['paypal_client_id'];
        $paypal_conf['secret_key']       = $payment_setting['paypal_secret_key'];

        $this->_api_context = new ApiContext(
            new OAuthTokenCredential(
                $paypal_conf['client_id'], $paypal_conf['secret_key']
            )
            );
        $this->_api_context->setConfig($paypal_conf['settings']);
    }

     public function non_auth_setApiContext($id)
    {

        $payment_setting = Utility::getNonAuthCompanyPaymentSetting($id);
        $paypal_conf['settings']['mode'] = $payment_setting['paypal_mode'];
        $paypal_conf['client_id']        = $payment_setting['paypal_client_id'];
        $paypal_conf['secret_key']       = $payment_setting['paypal_secret_key'];

        $this->_api_context = new ApiContext(
            new OAuthTokenCredential(
                $paypal_conf['client_id'], $paypal_conf['secret_key']
            )
        );
        $this->_api_context->setConfig($paypal_conf['settings']);
    }

    public function customerPayWithPaypal(Request $request, $invoice_id)
    {
        $invoice = Invoice::find($invoice_id);
        if(Auth::check()){
            $settings = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
            $user     = \Auth::user();

        }else{
            $user = User::where('id',$invoice->created_by)->first();
            $settings = Utility::settingById($invoice->created_by);
        }


        $get_amount = $request->amount;

        $request->validate(['amount' => 'required|numeric|min:0']);



        if($invoice)
        {
            if($get_amount > $invoice->getDue())
            {
                return redirect()->back()->with('error', __('Invalid amount.'));
            }
            else
            {
                if(Auth::check()){
                    $this->setApiContext();
                }else{
                    $this->non_auth_setApiContext($invoice->created_by);
                }

                $orderID = strtoupper(str_replace('.', '', uniqid('', true)));
                //dd($settings);
                $name = Utility::invoiceNumberFormat($settings, $invoice->invoice_id);


                $payer = new Payer();
                $payer->setPaymentMethod('paypal');

                $item_1 = new Item();
                $item_1->setName($name)->setCurrency(Utility::getValByName('site_currency'))->setQuantity(1)->setPrice($get_amount);

                $item_list = new ItemList();
                $item_list->setItems([$item_1]);

                $amount = new Amount();
                $amount->setCurrency(Utility::getValByName('site_currency'))->setTotal($get_amount);

                $transaction = new Transaction();
                $transaction->setAmount($amount)->setItemList($item_list)->setDescription($name)->setInvoiceNumber($orderID);

                $redirect_urls = new RedirectUrls();
                $redirect_urls->setReturnUrl(
                    route(
                        'customer.get.payment.status', $invoice->id
                    )
                )->setCancelUrl(
                    route(
                        'customer.get.payment.status', $invoice->id
                    )
                );

                $payment = new Payment();
                $payment->setIntent('Sale')->setPayer($payer)->setRedirectUrls($redirect_urls)->setTransactions([$transaction]);

                try
                {

                    $payment->create($this->_api_context);
                }
                catch(\PayPal\Exception\PayPalConnectionException $ex) //PPConnectionException
                {
                    if(\Config::get('app.debug'))
                    {
                        return redirect()->route('customer.invoice.show', \Crypt::encrypt($invoice_id))->back()->with('error', __('Connection timeout'));
                    }
                    else
                    {
                        return redirect()->route('customer.invoice.show', \Crypt::encrypt($invoice_id))->back()->with('error', __('Some error occur, sorry for inconvenient'));
                    }
                }
                foreach($payment->getLinks() as $link)
                {
                    if($link->getRel() == 'approval_url')
                    {
                        $redirect_url = $link->getHref();
                        break;
                    }
                }
                Session::put('paypal_payment_id', $payment->getId());
                if(isset($redirect_url))
                {
                    return Redirect::away($redirect_url);
                }

                return redirect()->route('customer.invoice.show', \Crypt::encrypt($invoice_id))->back()->with('error', __('Unknown error occurred'));
            }
        }
        else
        {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }
    public function customerGetPaymentStatus(Request $request, $invoice_id)
    {
        // dd($request->all());
        $invoice = Invoice::find($invoice_id);
        if(Auth::check()){
            $settings = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
            $user     = \Auth::user();
            $this->setApiContext();
        }else{
            $user = User::where('id',$invoice->created_by)->first();
            $settings = Utility::settingById($invoice->created_by);
            $this->non_auth_setApiContext($invoice->created_by);
        }



        $payment_id = Session::get('paypal_payment_id');

        Session::forget('paypal_payment_id');

        if(empty($request->PayerID || empty($request->token)))
        {
            return redirect()->back()->with('error', __('Payment failed'));
        }

        $payment = Payment::get($payment_id, $this->_api_context);

        $execution = new PaymentExecution();
        $execution->setPayerId($request->PayerID);

        try
        {
            $result   = $payment->execute($execution, $this->_api_context)->toArray();
            $order_id = strtoupper(str_replace('.', '', uniqid('', true)));
            $status   = ucwords(str_replace('_', ' ', $result['state']));
            if($result['state'] == 'approved')
            {
                $amount = $result['transactions'][0]['amount']['total'];
            }
            else
            {
                $amount = isset($result['transactions'][0]['amount']['total']) ? $result['transactions'][0]['amount']['total'] : '0.00';
            }


            if($result['state'] == 'approved')
            {
                $payments = InvoicePayment::create(
                    [

                        'invoice_id' => $invoice->id,
                        'date' => date('Y-m-d'),
                        'amount' => $amount,
                        'account_id' => 0,
                        'payment_method' => 0,
                        'order_id' => $order_id,
                        'currency' => Utility::getValByName('site_currency'),
                        'txn_id' => $payment_id,
                        'payment_type' => __('PAYPAL'),
                        'receipt' => '',
                        'reference' => '',
                        'description' => 'Invoice ' . Utility::invoiceNumberFormat($settings, $invoice->invoice_id),
                    ]
                );

                if($invoice->getDue() <= 0)
                {
                    $invoice->status = 4;
                    $invoice->save();
                }
                elseif(($invoice->getDue() - $payments->amount) == 0)
                {
                    $invoice->status = 3;
                    $invoice->save();
                }
                else
                {
                    $invoice->status = 2;
                    $invoice->save();
                }

                $invoicePayment              = new Transaction();
                $invoicePayment->user_id     = $invoice->customer_id;
                $invoicePayment->user_type   = 'Customer';
                $invoicePayment->type        = 'PAYPAL';
                $invoicePayment->created_by  = \Auth::check()?\Auth::user()->id:$invoice->customer_id;
                $invoicePayment->payment_id  = $invoicePayment->id;
                $invoicePayment->category    = 'Invoice';
                $invoicePayment->amount      = $amount;
                $invoicePayment->date        = date('Y-m-d');
                $invoicePayment->created_by  = \Auth::check()?\Auth::user()->creatorId():$invoice->created_by;
                $invoicePayment->payment_id  = $payments->id;
                $invoicePayment->description = 'Invoice ' . Utility::invoiceNumberFormat($settings, $invoice->invoice_id);
                $invoicePayment->account     = 0;

                \App\Models\Transaction::addTransaction($invoicePayment);

                Utility::userBalance('customer', $invoice->customer_id, $request->amount, 'debit');

                Utility::bankAccountBalance($request->account_id, $request->amount, 'credit');

                //Twilio Notification
                if (Auth::check()) {
                    $setting  = Utility::settings(\Auth::user()->creatorId());
                    }
                    $customer = Customer::find($invoice->customer_id);
                if(isset($setting['payment_notification']) && $setting['payment_notification'] ==1)
                {
                    $msg = __("New payment of").' ' . $amount . __("created for").' ' . $customer->name . __("by").' '.  $invoicePayment->type . '.';
                    Utility::send_twilio_msg($customer->contact,$msg);
                }

                if (Auth::check()) {
                    return redirect()->route('invoice.show', \Crypt::encrypt($invoice->id))->with('success', __('Payment successfully added.'));
                } else {
                    return redirect()->back()->with('success', __(' Payment successfully added.'));
                }
            }
            else
            {
                if (Auth::check()) {
                    return redirect()->route('invoice.show', \Crypt::encrypt($invoice->id))->with('error', __('Transaction has been ' . $status));
                } else {
                    return redirect()->back()->with('success', __('Transaction succesfull'));
                }
            }

        }
        catch(\Exception $e)
        {
            if (Auth::check()) {
                return redirect()->route('invoice.show', \Crypt::encrypt($invoice->id))->with('error', __('Transaction has been failed.'));
            } else {
                return redirect()->back()->with('success', __('Transaction has been complted.'));
            }

        }

    }

    public function customerretainerPayWithPaypal(Request $request, $retainer_id)
    {
        
        $retainer = Retainer::find($retainer_id);
        if (Auth::check()) {
            $settings = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
            $user     = \Auth::user();
        } else {
            $user = User::where('id', $retainer->created_by)->first();
            $settings = Utility::settingById($retainer->created_by);
        }


        $get_amount = $request->amount;

            $request->validate(['amount' => 'required|numeric|min:0']);



        if ($retainer) {
            if ($get_amount > $retainer->getDue()) {
                return redirect()->back()->with('error', __('Invalid amount.'));
            } else {
                if (Auth::check()) {
                    $this->setApiContext();
                } else {
                    $this->non_auth_setApiContext($retainer->created_by);
                }

                $orderID = strtoupper(str_replace('.', '', uniqid('', true)));

                $name = Utility::retainerNumberFormat($settings, $retainer->retainer_id);


                $payer = new Payer();
                $payer->setPaymentMethod('paypal');

                $item_1 = new Item();
                $item_1->setName($name)->setCurrency(Utility::getValByName('site_currency'))->setQuantity(1)->setPrice($get_amount);

                $item_list = new ItemList();
                $item_list->setItems([$item_1]);

                $amount = new Amount();
                $amount->setCurrency(Utility::getValByName('site_currency'))->setTotal($get_amount);

                $transaction = new Transaction();
                $transaction->setAmount($amount)->setItemList($item_list)->setDescription($name)->setInvoiceNumber($orderID);

                $redirect_urls = new RedirectUrls();
                $redirect_urls->setReturnUrl(
                    route(
                        'customer.get.retainer.payment.status',
                        $retainer->id
                    )
                )->setCancelUrl(
                    route(
                        'customer.get.retainer.payment.status',
                        $retainer->id
                    )
                );

                $payment = new Payment();
                $payment->setIntent('Sale')->setPayer($payer)->setRedirectUrls($redirect_urls)->setTransactions([$transaction]);

                try {

                    $payment->create($this->_api_context);
                } catch (\PayPal\Exception\PayPalConnectionException $ex) //PPConnectionException
                {
                    if (\Config::get('app.debug')) {
                        return redirect()->route('customer.retainer.show', \Crypt::encrypt($retainer_id))->back()->with('error', __('Connection timeout'));
                    } else {
                        return redirect()->route('customer.retainer.show',\Crypt::encrypt($retainer_id))->back()->with('error', __('Some error occur, sorry for inconvenient'));
                    }
                }
                foreach ($payment->getLinks() as $link) {
                    if ($link->getRel() == 'approval_url') {
                        $redirect_url = $link->getHref();
                        break;
                    }
                }
                Session::put('paypal_payment_id', $payment->getId());
                if (isset($redirect_url)) {
                    return Redirect::away($redirect_url);
                }

                return redirect()->route('customer.retainer.show',\Crypt::encrypt($retainer_id))->back()->with('error', __('Unknown error occurred'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function customerGetRetainerPaymentStatus(Request $request, $retainer_id)
    {
        // dd($request->all());
        $retainer = Retainer::find($retainer_id);
        if (Auth::check()) {
            $settings = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
            $user     = \Auth::user();
            $this->setApiContext();
        } else {
            $user = User::where('id', $retainer->created_by)->first();
            $settings = Utility::settingById($retainer->created_by);
            $this->non_auth_setApiContext($retainer->created_by);
        }



        $payment_id = Session::get('paypal_payment_id');

        Session::forget('paypal_payment_id');

        if (empty($request->PayerID || empty($request->token))) {
            return redirect()->back()->with('error', __('Payment failed'));
        }

        $payment = Payment::get($payment_id, $this->_api_context);

        $execution = new PaymentExecution();
        $execution->setPayerId($request->PayerID);

        try {
            $result   = $payment->execute($execution, $this->_api_context)->toArray();
            $order_id = strtoupper(str_replace('.', '', uniqid('', true)));
            $status   = ucwords(str_replace('_', ' ', $result['state']));
            if ($result['state'] == 'approved') {
                $amount = $result['transactions'][0]['amount']['total'];
            } else {
                $amount = isset($result['transactions'][0]['amount']['total']) ? $result['transactions'][0]['amount']['total'] : '0.00';
            }


            if ($result['state'] == 'approved') {
                $payments = RetainerPayment::create(
                    [

                        'retainer_id' => $retainer->id,
                        'date' => date('Y-m-d'),
                        'amount' => $amount,
                        'account_id' => 0,
                        'payment_method' => 0,
                        'order_id' => $order_id,
                        'currency' => Utility::getValByName('site_currency'),
                        'txn_id' => $payment_id,
                        'payment_type' => __('PAYPAL'),
                        'receipt' => '',
                        'reference' => '',
                        'description' => 'Retainer ' . Utility::retainerNumberFormat($settings, $retainer->retainer_id),
                    ]
                );

                if ($retainer->getDue() <= 0) {
                    $retainer->status = 4;
                    $retainer->save();
                } elseif (($retainer->getDue() - $payments->amount) == 0) {
                    $retainer->status = 4;
                    $retainer->save();
                } else {
                    $retainer->status = 3;
                    $retainer->save();
                }

                $retainerPayment              = new Transaction();
                $retainerPayment->user_id     = $retainer->customer_id;
                $retainerPayment->user_type   = 'Customer';
                $retainerPayment->type        = 'PAYPAL';
                $retainerPayment->created_by  = \Auth::check() ? \Auth::user()->id : $retainer->customer_id;
                $retainerPayment->payment_id  = $retainerPayment->id;
                $retainerPayment->category    = 'Retainer';
                $retainerPayment->amount      = $amount;
                $retainerPayment->date        = date('Y-m-d');
                $retainerPayment->created_by  = \Auth::check() ? \Auth::user()->creatorId() : $retainer->created_by;
                $retainerPayment->payment_id  = $payments->id;
                $retainerPayment->description = 'Retainer ' . Utility::retainerNumberFormat($settings, $retainer->retainer_id);
                $retainerPayment->account     = 0;

                \App\Models\Transaction::addTransaction($retainerPayment);

                Utility::userBalance('customer', $retainer->customer_id, $request->amount, 'debit');

                Utility::bankAccountBalance($request->account_id, $request->amount, 'credit');

                //Twilio Notification
                if (Auth::check()) {
                $setting  = Utility::settings(\Auth::user()->creatorId());
                }
                $customer = Customer::find($retainer->customer_id);
                if(isset($setting['payment_notification']) && $setting['payment_notification'] ==1)
                {
                    $msg = __("New payment of").' ' . $amount . __("created for").' ' . $customer->name . __("by").' '.  $retainerPayment->type . '.';
                    Utility::send_twilio_msg($customer->contact,$msg);
                }

                if (Auth::check()) {
                    return redirect()->route('customer.retainer.show', \Crypt::encrypt($retainer->id))->with('success', __('Payment successfully added.'));
                } else {
                    return redirect()->back()->with('success', __(' Payment successfully added.'));
                }
            } else {
                if (Auth::check()) {
                    return redirect()->route('customer.retainer.show', \Crypt::encrypt($retainer->id))->with('error', __('Transaction has been ' . $status));
                } else {
                    return redirect()->back()->with('success', __('Transaction succesfull'));
                }
            }
        } catch (\Exception $e) {
            if (Auth::check()) {
                return redirect()->route('customer.retainer.show', \Crypt::encrypt($retainer->id))->with('error', __('Transaction has been failed.'));
            } else {
                return redirect()->back()->with('success', __('Transaction has been complted.'));
            }
        }
    }
}
