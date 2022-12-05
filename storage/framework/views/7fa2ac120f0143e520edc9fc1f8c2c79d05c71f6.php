<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Vouchers')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Dashboard')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Voucher')); ?></li>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-sm-12">
        <div class=" multi-collapse mt-2 " id="multiCollapseExample1">
            <div class="card">
                <div class="card-body">
                    <?php if(!\Auth::guard('customer')->check()): ?>
                        <?php echo e(Form::open(['route' => ['customer.bill'], 'method' => 'GET', 'id' => 'customer_submitt'])); ?>

                    <?php else: ?>
                        <?php echo e(Form::open(['route' => ['customer.bill'], 'method' => 'GET', 'id' => 'customer_submitt'])); ?>

                    <?php endif; ?>
                        <div class="d-flex align-items-center justify-content-end">
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mr-2">
                                <div class="btn-box">
                                    <?php echo e(Form::label('date', __('Date'), ['class' => 'text-type'])); ?>


                                    <?php echo e(Form::text('date', isset($_GET['issue_date'])?$_GET['issue_date']:null, array('class' => 'form-control month-btn','id'=>'pc-daterangepicker-1'))); ?>


                                </div>
                            </div>
                            <?php if(!\Auth::guard('customer')->check()): ?>
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12 mr-2">
                                    <div class="btn-box">
                                        <?php echo e(Form::label('customer', __('Customer'), ['class' => 'text-type'])); ?>


                                        <?php echo e(Form::select('customer', $customer, isset($_GET['customer']) ? $_GET['customer'] : '', ['class' => 'form-control select2'])); ?>

                                    </div>
                                </div>
                            <?php endif; ?>

                            <div class="col-auto float-end ms-2 mt-4">

                                <a href="#" class="btn btn-sm btn-primary"
                                onclick="document.getElementById('customer_submitt').submit(); return false;"
                                data-bs-toggle="tooltip" title="<?php echo e(__('Search')); ?>" data-original-title="<?php echo e(__('apply')); ?>">
                                    <span class="btn-inner--icon"><i class="ti ti-search"></i></span>
                                </a>

                                
                        </div>

                        </div>
                    <?php echo e(Form::close()); ?>

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
                            <th><?php echo e(__('Sr.')); ?></th>
                            <th><?php echo e(__('Voucher #')); ?></th>
                            <th><?php echo e(__('Date')); ?></th>
                            <th><?php echo e(__('Description')); ?></th>
                            <th><?php echo e(__('Debit')); ?></th>
                            <th><?php echo e(__('Credit')); ?></th>
                            <th><?php echo e(__('Amount')); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php $balance = 0; ?>
                            <?php $sum_debit = 0 ?>
                            <?php $sum_credit = 0 ?>
                        <?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $result): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr class="font-style">
                                <td><?php echo e($result->id); ?></td>
                                <td><?php echo e($result->voucher_no); ?></td>
                                <td><?php echo e($result->date); ?></td>
                                <td><?php echo e($result->description); ?></td>
                                <td><?php echo e($result->debit); ?></td>
                                <td><?php echo e($result->credit); ?></td>
                                <td>
                                <?php $bal = $result->debit - $result->credit;  echo $balance  += $bal; ?>
                                </td>
                            </tr>
                            <?php $sum_debit += $result->debit ?>
                            <?php $sum_credit += $result->credit ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong><?php echo e($sum_debit); ?></strong></td>
                            <td><strong><?php echo e($sum_credit); ?></strong></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\warehouse_baketown\resources\views/bill/customer_bill.blade.php ENDPATH**/ ?>