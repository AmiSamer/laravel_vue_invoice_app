<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ProductController;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/get_all_invoice',[InvoiceController::class,'get_all_invoices']);
Route::get('/search_invoice',[InvoiceController::class,'search_invoice']);
Route::get('/add_invoice',[InvoiceController::class,'add_invoice']);
Route::get('/customers',[CustomerController::class,'all_customers']);
Route::get('/products',[ProductController::class,'all_products']);
