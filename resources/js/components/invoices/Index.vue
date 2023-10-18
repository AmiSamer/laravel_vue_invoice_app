
<template>
    <div class="container">
        <div class="invoices">
        
        <div class="card__header">
            <div>
                <h2 class="invoice__title">Invoices</h2>
            </div>
            <div>
                <a class="btn btn-secondary" @click="add_invoice()">
                    New Invoice
                </a>
            </div>
        </div>

        <div class="table card__content">
            <div class="table--filter">
                <span class="table--filter--collapseBtn ">
                    <i class="fas fa-ellipsis-h"></i>
                </span>
                <div class="table--filter--listWrapper">
                    <ul class="table--filter--list">
                        <li>
                            <p class="table--filter--link table--filter--link--active">
                                All
                            </p>
                        </li>
                        <li>
                            <p class="table--filter--link ">
                                Paid
                            </p>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="table--search">
                <div class="table--search--wrapper">
                    <select class="table--search--select" name="" id="">
                        <option value="">Filter</option>
                    </select>
                </div>
                <div class="relative">
                    <i class="table--search--input--icon fas fa-search "></i>
                    <input class="table--search--input" type="text" placeholder="Search invoice" v-model="searchInvoice" @keyup="search()">
                </div>
            </div>

            <div class="table--heading">
                <p>ID</p>
                <p>Date</p>
                <p>Number</p>
                <p>Customer</p>
                <p>Due Date</p>
                <p>Total</p>
            </div>

            <!-- item 1 -->
            <div class="table--items" v-for="item in invoices" :key="item.id" v-if="invoices.length > 0">
                <a href="#" @click="show_invoice(item.id)" class="table--items--transactionId">{{ item.id }}</a>
                <p>{{ item.date }}</p>
                <p>{{ item.number }}</p>
                <p v-if="item.customer">{{ item.customer.first_name }}</p>
                <p v-else></p>
                <p>{{ item.due_date }}</p>
                <p>{{ item.total }}</p>
            </div>
            
            <div class="table--items" v-else>
              <p>Invoice not found</p>
            </div>
            
        </div>
        
    </div>
    </div>
</template>

<!-- <script setup>
import {onMounted, ref} from 'vue'
let invoices = ref([])

onMounted(async() => {
    getInvoices();
})
const getInvoices = async() =>{
    let response = await axios.get("/invoice_app/api/get_all_invoice")
    console.log('response',response)
}
</script> -->
<script>

import router from '../../router/index.js'

export default {

    name : "invoice list",

    data : function(){
        return {
            loading : false,
            invoices: [],  //for getting all invoice data
            searchInvoice: [],  //for getting searched invoice data
            errorMessage: null
        }
    },   
    created: async function(){
        try{
            this.loading = true;
            let response_for_all_invoices = await axios.get("/invoice_app/api/get_all_invoice"); //for getting all invoice data
            this.loading = false;
            this.invoices = response_for_all_invoices.data.invos;  //for getting all invoice data          
            console.log('my_response',response_for_all_invoices);
        }catch(error){
            this.loading = false;
            this.errorMessage = error;
        }
    },

    methods : {
         search : async function(){

                this.loading = true;
                let samer = this.searchInvoice;  
                this.loading = false;            
                let invoice_search_response = await axios.get('/invoice_app/api/search_invoice?s='+samer);
                 
                if(invoice_search_response.data.search_invos != null)
                {
                this.invoices = invoice_search_response.data.search_invos;
                console.log('searched_response',invoice_search_response);
                }else{
                    location.reload();
                }           
                 },

        add_invoice : async function(){

                    let invoice_form = await axios.get('/invoice_app/api/add_invoice');
                    console.log('my_form_data',invoice_form.data);                 
                        router.push("/invoice_app/invoice/new");
                                   

                 },

          show_invoice : async function(id){
                     router.push("/invoice_app/invoice/show/"+id);
                 }       
             }
} 

</script>


