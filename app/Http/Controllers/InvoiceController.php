<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Counter;
use App\Models\InvoiceItem;

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


    public function save_invoice(Request $request){

        $invoice_item = $request->input("invoice_item");

        $invoice_data['sub_total'] = $request->input("sub_total");
        $invoice_data['total'] = $request->input("total");
        $invoice_data['customer_id'] = $request->input("customer_id");
        $invoice_data['number'] = $request->input("number");
        $invoice_data['date'] = $request->input("date");
        $invoice_data['due_date'] = $request->input("due_date");
        $invoice_data['discount'] = $request->input("discount");
        $invoice_data['reference'] = $request->input("reference");
        $invoice_data['terms_and_conditions'] = $request->input("terms_and_conditions");

        $invoice = Invoice::create($invoice_data);

        foreach(json_decode($invoice_item) as $item){

            $item_data['product_id'] = $item->id;
            $item_data['invoice_id'] = $invoice->id;
            $item_data['quantity'] = $item->quantity;
            $item_data['unit_price'] = $item->unit_price;

            InvoiceItem::create($item_data);
        }

    }

    public function show_invoice($id){

        $invoice = Invoice::with([
            'customer',
            'invoice_items.product'
        ])->find($id);

        return response()-> json([
            'invoice' => $invoice
        ],200);

    }


    public function edit_invoice($id){
           
        $invoice = Invoice::with([
            'customer',
            'invoice_items.product'
        ])->find($id);

        return response()-> json([
            'invoice' => $invoice
        ],200);

    }


    public function delete_invoice_item($id){
        
        $invoice_item = InvoiceItem::findOrFail($id);
        $invoice_item->delete();

    }

    public function update_invoice(Request $request, $id){

        $invoice = Invoice::where('id',$id)->first();

        $invoice->sub_total = $request->sub_total;
        $invoice->total = $request->total;
        $invoice->customer_id = $request->customer_id;
        $invoice->number = $request->number;
        $invoice->date = $request->date;
        $invoice->due_date = $request->due_date;
        $invoice->reference = $request->reference;
        $invoice->terms_and_conditions = $request->terms_and_conditions;
        $invoice->discount = $request->discount;
 
        $invoice->update($request->all());

        $invoice->invoice_items()->delete();

        $invoice_item = $request->input('invoice_items');

        foreach(json_decode($invoice_item) as $item){

            $item_data['product_id'] = $item->product_id;
            $item_data['invoice_id'] = $invoice->id;
            $item_data['quantity'] = $item->quantity;
            $item_data['unit_price'] = $item->unit_price;

            InvoiceItem::create($item_data);
        }



    }

    public function delete_invoice($id){

        $invoice = Invoice::findOrFail($id);
        $invoice->invoice_items()->delete();

        $invoice->delete();

    }

   
}
