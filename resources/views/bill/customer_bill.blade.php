@extends('layouts.admin')
@section('page-title')
    {{ __('Manage Vouchers') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">{{__('Dashboard')}}</a></li>
    <li class="breadcrumb-item">{{__('Voucher')}}</li>
@endsection


@section('content')
<div class="row">
    <div class="col-sm-12">
        <div class=" multi-collapse mt-2 " id="multiCollapseExample1">
            <div class="card">
                <div class="card-body">
                    @if (!\Auth::guard('customer')->check())
                        {{ Form::open(['route' => ['customer.bill'], 'method' => 'GET', 'id' => 'customer_submitt']) }}
                    @else
                        {{ Form::open(['route' => ['customer.bill'], 'method' => 'GET', 'id' => 'customer_submitt']) }}
                    @endif
                        <div class="d-flex align-items-center justify-content-end">
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mr-2">
                                <div class="btn-box">
                                    {{ Form::label('date', __('Date'), ['class' => 'text-type']) }}

                                    {{ Form::text('date', isset($_GET['issue_date'])?$_GET['issue_date']:null, array('class' => 'form-control month-btn','id'=>'pc-daterangepicker-1')) }}

                                </div>
                            </div>
                            @if (!\Auth::guard('customer')->check())
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mr-2">
                                    <div class="btn-box">
                                        {{ Form::label('customer', __('Customer'), ['class' => 'text-type']) }}

                                        {{ Form::select('customer', $customer, isset($_GET['customer']) ? $_GET['customer'] : '', ['class' => 'form-control select2']) }}
                                    </div>
                                </div>
                            @endif

                            <div class="col-auto float-end ms-2 mt-4">

                                <a href="#" class="btn btn-sm btn-primary"
                                onclick="document.getElementById('customer_submitt').submit(); return false;"
                                data-bs-toggle="tooltip" title="{{__('Search')}}" data-original-title="{{ __('apply') }}">
                                    <span class="btn-inner--icon"><i class="ti ti-search"></i></span>
                                </a>

                                {{--  @if (!\Auth::guard('customer')->check())
                                    <a href="{{ route('invoice.index') }}" class="btn btn-sm btn-danger" data-bs-toggle="tooltip" title="{{ __('Reset') }}">
                                        <span class="btn-inner--icon"><i class="ti ti-refresh text-white-off"></i></span>
                                    </a>
                                @else
                                    <a href="{{ route('customer.invoice') }}" class="btn btn-sm btn-danger" data-bs-toggle="tooltip" title="{{__('Reset')}}">
                                        <span class="btn-inner--icon"><i class="ti ti-refresh text-white-off"></i></span>
                                    </a>
                                @endif  --}}
                        </div>

                        </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body table-border-style">
                <div class="table-responsive">
                    <table class="table datatable">
                        <thead>
                        <tr role="row">
                            <th>{{ __('Sr.') }}</th>
                            <th>{{ __('Voucher #') }}</th>
                            <th>{{ __('Date') }}</th>
                            <th>{{ __('Description') }}</th>
                            <th>{{ __('Debit') }}</th>
                            <th>{{ __('Credit') }}</th>
                            <th>{{ __('Amount') }}</th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php $balance = 0; ?>
                            <?php $sum_debit = 0 ?>
                            <?php $sum_credit = 0 ?>
                        @foreach ($results as $result)
                            <tr class="font-style">
                                <td>{{ $result->id }}</td>
                                <td>{{ $result->voucher_no }}</td>
                                <td>{{ $result->date }}</td>
                                <td>{{ $result->description}}</td>
                                <td>{{ $result->debit }}</td>
                                <td>{{ $result->credit }}</td>
                                <td>
                                <?php $bal = $result->debit - $result->credit;  echo $balance  += $bal; ?>
                                </td>
                            </tr>
                            <?php $sum_debit += $result->debit ?>
                            <?php $sum_credit += $result->credit ?>
                        @endforeach
                        </tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>{{ $sum_debit}}</strong></td>
                            <td><strong>{{ $sum_credit}}</strong></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
