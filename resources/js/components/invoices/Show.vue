<template>
    <div class="container">
        <div class="invoices">
        
        <div class="card__header">
            <div>
                <h2 class="invoice__title">Invoice</h2>
            </div>
            <div>
                
            </div>
        </div>
        <div>
            <div class="card__header--title ">
                <h1 class="mr-2">#1043</h1>
                <p> {{ form.created_at }} </p>
            </div>
    
            <div>
                <ul  class="card__header-list">
                    <li>
                        <!-- Select Btn Option -->
                        <button class="selectBtnFlat" @click="print_invoice">
                            <i class="fas fa-print"></i>
                            Print
                        </button>
                        <!-- End Select Btn Option -->
                    </li>
                    <li>
                        <!-- Select Btn Option -->
                        <button class="selectBtnFlat" @click="onEdit(form.id)">
                            <i class=" fas fa-reply"></i>
                            Edit
                        </button>
                        <!-- End Select Btn Option -->
                    </li>
                    <li>
                        <!-- Select Btn Option -->
                        <button class="selectBtnFlat" @click="onDelete(form.id)">
                            <i class=" fas fa-pencil-alt"></i>
                            Delete
                        </button>
                        <!-- End Select Btn Option -->
                    </li>
                    
                </ul>
            </div>
        </div>

        <div class="table invoice">
            <div class="logo">
                <img src="assets/img/logo.png" alt="" style="width: 200px;">
            </div>
            <div class="invoice__header--title">
                <p></p>
                <p class="invoice__header--title-1">Invoice</p>
                <p></p>
            </div>

            
            <div class="invoice__header--item">
                <div>
                    <h2>Invoice To:</h2>
                    <p v-if="form.customer">{{ form.customer.first_name }}</p>
                    <!-- <p v-else></p> -->
                </div>
                <div>
                        <div class="invoice__header--item1">
                            <p>Invoice#</p>
                            <span>#{{ form.number }}</span>
                        </div>
                        <div class="invoice__header--item2">
                            <p>Date</p>
                            <span>{{ form.date }}</span>
                        </div>
                        <div class="invoice__header--item2">
                            <p>Due Date</p>
                            <span>{{ form.due_date }}</span>
                        </div>
                        <div class="invoice__header--item2">
                            <p>Reference</p>
                            <span>{{ form.reference }}</span>
                        </div>
                    
                </div>
            </div>

            <div class="table py1">

                <div class="table--heading3">
                    <p>#</p>
                    <p>Item Description</p>
                    <p>Unit Price</p>
                    <p>Qty</p>
                    <p>Total</p>
                </div>
    
                <!-- item 1 -->
                <div class="table--items3" v-for="(product_item,i) in form.invoice_items" :key="product_item.id">
                    <p>{{ i+1 }}</p>
                    <p>{{ product_item.product.description }}</p>
                    <p>$ {{ product_item.unit_price }}</p>
                    <p>{{ product_item.quantity }}</p>
                    <p>$ {{ product_item.unit_price * product_item.quantity }}</p>
                </div>
                
            </div>

            <div  class="invoice__subtotal">
                <div>
                    <h2>Thank you for your business</h2>   
                </div>
                <div>
                    <div class="invoice__subtotal--item1">
                        <p>Sub Total</p>
                        <span> $ {{ form.sub_total }}</span>
                    </div>
                    <div class="invoice__subtotal--item2">
                        <p>Discount</p>
                        <span>$ {{ form.discount }}</span>
                    </div>
                    
                </div>
            </div>

            <div class="invoice__total">
                <div>
                    <h2>Terms and Conditions</h2>
                    <p>{{ form.terms_and_conditions }}</p>
                </div>
                <div>
                    <div class="grand__total" >
                        <div class="grand__total--items">
                            <p>Grand Total</p>
                            <span>$ {{ form.total }}</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
       
        
    </div>
    </div>
    <br>
    <br>
</template>


<script setup>
import axios from "axios";
import { onMounted, ref } from "vue"
import { useRouter } from 'vue-router';

let form = ref({ id : '' })

const router = useRouter()


const props = defineProps({
    id : {
        type : String,
        default : ''
    }
})

onMounted( async() => {
    
    get_invoice()
})

const get_invoice = async() => {
    let response = await axios.get(`/invoice_app/api/show_invoice/${props.id}`)
    console.log('show_invoice_info',response.data.invoice)
    form.value = response.data.invoice;
}

const print_invoice = () => {
    window.print()
    router.push('/invoice_app/').catch( () => {} )
}

const onEdit = (id) => {
    
    router.push('/invoice_app/edit/'+id)
}

const onDelete = (id) => {


 let response = axios.get('/invoice_app/api/delete_invoice/'+id)
    router.push('/invoice_app/')
   
}

</script>