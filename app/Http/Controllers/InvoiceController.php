<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Counter;

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

    public function add_invoice(){

        $counter = Counter::where('key','invoice')->first();
        $random = Counter::where('key','invoice')->first();

        $invoice = Invoice::orderBy('id','DESC')->first();

        if($invoice){
            $invoice = $invoice->id+1;
            $counters = $counter->value + $invoice;
        }else{
            $counters = $counter->value; 
        }

        $formData = [
            'number' => $counter->prefix.$counters,
            'customer_id' => null,
            'customer' => null,
            'date' => date('Y-m-d'),
            'due_date' => null,
            'reference' => null,
            'discount' => 0,
            'term_and_conditions' => 'Default Terms and Conditions',
            'items' => [
                [
                'product_id' => null,
                'product' => null,
                'unit_price' => 0,
                'quantity' => 1
                ]
            ]
                
            
            ];

            return response()->json($formData);

    }

   
}
