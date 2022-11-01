<?php

namespace App\Imports;

use App\Models\Invoice;
use Maatwebsite\Excel\Concerns\Importable;

use Maatwebsite\Excel\Concerns\ToModel;

class ImportInvoice implements ToModel
{
    use Importable;

    public function model(array $row)
    {

    }



}
