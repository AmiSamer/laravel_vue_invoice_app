import { createRouter, createWebHistory } from 'vue-router'
import InvoiceIndex from '../components/invoices/Index.vue'
import NotFound from '../components/NotFound.vue'


const routes = [     
         {
            path: '/invoice_app/',
            component: InvoiceIndex
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
