<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;

class InvoiceController extends Controller
{
    public function get_all_invoices(){

        $invoice = Invoice::with('customer')->orderBy('id','DESC')->get();

        return response()->json([
            'invos' => $invoice
        ],200);

    }

    public function search_invoice(Request $request){
        $search_keyword = $request->get('s');

        if($search_keyword != null){
            $invoice = Invoice::with('customer')
                                ->where('number','LIKE',"%$search_keyword%")
                                ->get();

        return response()->json([
            'search_invos' => $invoice
        ],200);
        }
    }
}
