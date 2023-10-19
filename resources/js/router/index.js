import { createRouter, createWebHistory } from 'vue-router'
import InvoiceIndex from '../components/invoices/Index.vue'
import CreateInvoice from '../components/invoices/Create.vue'
import ShowInvoice from '../components/invoices/Show.vue'
import EditInvoice from '../components/invoices/Edit.vue'
import NotFound from '../components/NotFound.vue'


const routes = [     
         {
            path: '/invoice_app/',
            component: InvoiceIndex
          },

          {
            path: '/invoice_app/invoice/new',
            component: CreateInvoice
          },

          {
            path: '/invoice_app/invoice/show/:id',
            component : ShowInvoice,
            props : true
          },

          {
            path: '/invoice_app/edit/:id',
            component : EditInvoice,
            props : true
            
          },
         
          {
            path: '/:pathMatch(.*)*',
            component: NotFound
            // component: () => import('../components/UserList.vue')
          }
   
]



const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
