<template>
    <div class="container">
        <div class="invoices">
        
        <div class="card__header">
            <div>
                <h2 class="invoice__title">New Invoice</h2>
            </div>
            <div>
                
            </div>
        </div>

        <div class="card__content">
            <div class="card__content--header">
                <div>
                    <p class="my-1">Customer</p>
                    <select name="" id="" class="input" v-model="customer_id">
                        <option value="" disabled>select customer</option>
                        <option :value="customer.id" v-for="customer in all_customers" :key="customer.id" >{{ customer.first_name }}</option>
                    </select>
                </div>
                <div>
                    <p class="my-1">Date</p> 
                    <input id="date" placeholder="dd-mm-yyyy" type="date" class="input" v-model="form.date"> <!---->
                    <p class="my-1">Due Date</p> 
                    <input id="due_date" type="date" class="input" v-model="form.due_date">
                </div>
                <div>
                    <p class="my-1">Number</p> 
                    <input type="text" class="input" v-model="form.number"> 
                    <p class="my-1">Reference(Optional)</p> 
                    <input type="text" class="input" v-model="form.reference">
                </div>
            </div>
            <br><br>
            <div class="table">

                <div class="table--heading2">
                    <p>Item Description</p>
                    <p>Unit Price</p>
                    <p>Qty</p>
                    <p>Total</p>
                    <p></p>
                </div>
    
                <!-- item 1 -->
                <div class="table--items2" v-for="(cart_product,i) in cart_list" :key="cart_product.id">
                    <p>#{{ cart_product.item_code }}{{ cart_product.description }}</p>
                    <p>
                        <input type="text" class="input" v-model="cart_product.unit_price">
                    </p>
                    <p>
                        <input type="text" class="input" v-model="cart_product.quantity">
                    </p>
                    <p v-if="cart_product.quantity">
                        $ {{ (cart_product.quantity)*(cart_product.unit_price) }}
                    </p>
                    <p v-else></p>
                    <p style="color: red; font-size: 24px;cursor: pointer;" @click="removeItem(i)">
                        &times;
                    </p>
                </div>
                <div style="padding: 10px 30px !important;">
                    <button class="btn btn-sm btn__open--modal" @click="openModal()">Add New Line</button>
                </div>
            </div>

            <div class="table__footer">
                <div class="document-footer" >
                    <p>Terms and Conditions</p>
                    <textarea cols="50" rows="7" class="textarea" v-model="form.terms_and_conditions"></textarea>
                </div>
                <div>
                    <div class="table__footer--subtotal">
                        <p>Sub Total</p>
                        <span>$ {{ subTotal() }}</span>
                    </div>
                    <div class="table__footer--discount">
                        <p>Discount</p>
                        <input type="text" class="input" v-model="form.discount">
                    </div>
                    <div class="table__footer--total">
                        <p>Grand Total</p>
                        <span>$ {{ total() }}</span>
                    </div>
                </div>
            </div>

           
        </div>
        <div class="card__header" style="margin-top: 40px;">
            <div>
                
            </div>
            <div>
                <a class="btn btn-secondary" @click="onSave()">
                    Save
                </a>
            </div>
        </div>
        
    </div>
    <!--==================== add modal items ====================-->
   
        <div class="modal main__modal" :class="{ show : show_modal }">
        <div class="modal__content">
            <span class="modal__close btn__close--modal" @click="closeModal()">×</span>
            <h3 class="modal__title">Add Item</h3>
            <hr><br>
            <div class="modal__items">
                
                <ul style="list-style: none;">
                    <li v-for="(item,i) in product_list" :key="product_list.id" style="display: grid;
                grid-template-columns: 30px 350px 15px;
                align-items: center;padding-bottom: 5px;">
                <p>{{ i+1 }}</p>
                 <a href="#">{{ item.item_code }} {{ item.description }}</a>
                 <button @click="addCart(item)" style="border: 1px solid #e0e0e0;width: 35px;height: 35px;cursor: pointer;" >
                    +
                 </button>
                </li>
                </ul>
                
            </div>
            <br><hr>
            <div class="model__footer">
                <button class="btn btn-light mr-2 btn__close--modal" @click="closeModal()">
                    Cancel
                </button>
                <button class="btn btn-light btn__close--modal ">Save</button>
            </div>
        </div>
    </div>

    
    
    <br><br><br>
    </div>
</template>

<script setup>

import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';

let form = ref([])
let all_customers = ref([])
let customer_id = ref([])
let item = ref([])
let cart_list = ref([])
let product_list = ref([])
const show_modal = ref(false)
const hide_modal = ref(true)
const router = useRouter()



onMounted(async() => {

    indexForm();
    get_all_customers();
    get_all_products();

})

const indexForm = async() => {
    let response = await axios.get("/invoice_app/api/add_invoice");
    console.log('invoice_form',response.data);
    form.value = response.data;
}

const get_all_customers = async() =>{
    let response = await axios.get("/invoice_app/api/customers")
    console.log('customer_details',response)
    all_customers.value = response.data.customers;
}

const addCart = (item) => {
    const cart_item = {
        id : item.id,
        item_code : item.item_code,
        description : item.description,
        unit_price : item.unit_price,
        quantity: item.quantity

    }
    cart_list.value.push(cart_item);
    closeModal();
}

const removeItem = (i) => {

    cart_list.value.splice(i,1);

}


const subTotal = () => {
    let total = 0
    cart_list.value.map((data)=>{
        total = total+(data.quantity*data.unit_price)
    })

    return total
}

const total = () => {
    return subTotal() - form.value.discount
}

const onSave = () => {

    let sub_total = 0
    sub_total = subTotal()

    let total_cost = 0
    total_cost = total()

    const myForm = new FormData()
    myForm.append('invoice_item',JSON.stringify(cart_list.value))
    myForm.append('customer_id',customer_id.value)
    myForm.append('date',form.value.date)
    myForm.append('due_date',form.value.due_date)
    myForm.append('number',form.value.number)
    myForm.append('reference',form.value.reference)
    myForm.append('discount',form.value.discount)
    myForm.append('sub_total',sub_total)
    myForm.append('total',total_cost)
    myForm.append('terms_and_conditions',form.value.terms_and_conditions)

    axios.post("/invoice_app/api/save_invoice",myForm)
    cart_list.value = []
    router.push("/invoice_app/");


    
}

const openModal = () => {
    show_modal.value =! show_modal.value
}

const closeModal = () => {
    show_modal.value =! hide_modal.value
}


const get_all_products = async() => {

    let response = await axios.get("/invoice_app/api/products")
    console.log('all_product_list',response);
    product_list.value = response.data.products;
}




</script>


<!-- <script>
export default  {

name : "create new invoice",

data : function(){

    return {
        show_modal : false
    }

},

methods : {
    openModal : function(){
       this.show_modal =! this.show_modal
    }
}

}
</script> -->