<?php

namespace App\Imports;

use App\Models\Invoice;
use Maatwebsite\Excel\Concerns\Importable;

use Maatwebsite\Excel\Concerns\ToModel;

class ImportInvoice implements ToModel
{
    use Importable;

    // /**
    // * @param array $row
    // *
    // * @return \Illuminate\Database\Eloquent\Model|null
    // */
    // public function rules(): array
    // {
    //     return [
    //         '1' => 'required',
    //         '2' => 'required'

    //     ];

    // }

    // public function customValidationMessages()
    // {
    //     return [
    //         '1.required' => 'Record Failed to Import!',
    //         '2.required' => 'Record Failed to Import!',

    //     ];
    // }

    public function model(array $row)
    {
        // $row[1] = 'issue_date';
        // $row[2] =  'due_date';

        // return new Teacher([

        //  'issue_date'              =>  $row[1],
        //  'due_date'                =>  $row[2],

        // ]);
    }



}
