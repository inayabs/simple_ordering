<template>
    <div class="container">
        <checkout-modal :coupon="coupon"/> 
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">New Order</div>

                    <div class="card-body">
                        <table class="table custom-table">
                            <thead>
                                <th width="30%">Item</th>
                                <th width="25%">Taxed Price</th>
                                <th width="20%">Quantity</th>
                                <th width="20%%">Subtotal</th>
                                <th width="5%"></th>
                            </thead>
                            <tbody v-if="orders.length > 0">
                                <template v-for="(order,index) in orders">
                                    <order-row :order="order" :key="order.id" :order_index="index"/>
                                </template> 
                                
                            </tbody>
                            <tbody v-else>
                                <tr>
                                    <td class="text-center" colspan="5">
                                        No Orders Yet
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot v-if="orders.length > 0">
                                <template v-if="coupon==null">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>Total</td>
                                        <td>{{total_amount}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm" @click="checkout"> Checkout</button>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td></td> 
                                    <td></td> 
                                    <td colspan="2"><a href="javascript:void(0)" @click="openCoupon">Apply Coupon</a></td> 
                                    </tr>
                                </template>
                                <template v-else>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>Total</td>
                                        <td>{{total_amount}}</td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>Less({{coupon.less_percent}}%)</td>
                                        <td>{{less_amount.toFixed(2)}}</td>
                                        <td>
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>Deducted Total</td>
                                        <td>{{deducted_total.toFixed(2)}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm" @click="checkout"> Checkout</button>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td></td> 
                                    <td></td> 
                                    <td colspan="2"><a href="javascript:void(0)" @click="openCoupon">Change Coupon</a></td> 
                                    </tr>
                                </template>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Menu List</div>

                    <div class="card-body">
                        <table class="table custom-table">
                            <thead>
                                <th width="20%">Item</th>
                                <th width="20%">Category</th>
                                <th width="10%">Price</th>
                                <th width="15%">Tax</th>
                                <th width="15%"></th>
                            </thead>
                            <tbody v-if="items.length > 0">
                                
                                <tr v-for="it in items" :key="it.id">
                                    <td >{{it.name}}</td>
                                    <td >{{it.category}}</td>
                                    <td >{{it.price}}</td>
                                    <td >{{it.tax}}</td>
                                    <td>
                                        <button class="btn btn-warning btn-sm" @click="addItem(it)" :disabled="selected_ids.includes(it.id) ? true : false">
                                            Add
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                            <tbody v-else>
                                <tr>
                                    <td colspan="4" class="text-center">No data found.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import checkoutModal from './checkoutModal'
import orderRow from './orderRow'
export default {
    components:{
        orderRow,
        checkoutModal
    },
    data(){
        return{
            items:[],
            orders:[],
            selected_ids:[],
            switz:false,
            total_amount:0,
            coupon:null,
            less_amount:0,
            deducted_total:0,
            user_id:window.user_id
        }
    },
    watch:{
       orders:{
           handler:function(data){
               console.log('something changed');
               let ids = [];
               data.forEach(function(order){
                   ids.push(order.id);
               });
               this.selected_ids = ids;
           },
           deep:true
       },
       coupon(){
           this.less_amount = parseInt(this.total_amount) * (parseInt(this.coupon.less_percent)/100);
           this.deducted_total = this.total_amount - this.less_amount;
       },
       switz(){
        //    var amount = 0;
        //     let dis = this;
        //    this.orders.forEach(function(data){
        //        amount += data.subtotal;
        //    });
        //    console.log(amount);
        //    dis.subtotal = amount;


        //    this.total_amount = amount;
       }
    },
    created(){
        this.getItems();
    },  
    methods:{
        checkout(){
           
            swal.fire({
                title:'Loading please wait.',
                didOpen:()=>{
                    swal.showLoading()
                }
            });

            axios.post(`order/checkout`,{
                orders:this.orders,
                coupon:this.coupon,
                less_amount:this.less_amount,
                total_amount:this.total_amount,
                deducted_total:this.deducted_total
            }).then(
                response=>{
                    if(response.data.status=='success'){
                         swal.fire({
                            icon:'success',
                            title: 'Order Success!',
                            showDenyButton: true,
                            confirmButtonText: `View Order History`,
                            denyButtonText: `New Transaction`,
                            }).then((result) => {
                            /* Read more about isConfirmed, isDenied below */
                            
                                this.orders = [];
                            if (result.isConfirmed) {
                                location.href= `/order/${this.user_id}/history`

                            } else if (result.isDenied) {
                                Swal.fire('Changes are not saved', '', 'info')
                            }
                        });
                    }
                }
            );
        },
        openCoupon(){
            this.$modal.show('my-first-modal');
        },
        computeTotal(){
            var amount = 0;
            let dis = this;
            this.orders.forEach(function(data){
                amount += data.subtotal;
            });
            this.total_amount = amount;
        },
        removeItem(idx){
            this.orders.splice(idx,1);
        },
        addItem(item){
            item.quantity = 0;
            item.taxed_price = parseInt(item.price) + parseInt(item.tax);
            item.subtotal = 0;
            this.orders.push(item);
            // this.selected_ids.push(item.id);
        },
        getItems(){
            axios.get('/item/list').then(
                response=>{
                    this.items = response.data
                }
            ).catch(
                err=>{
                    alert(err);
                }
            );
        }
    }
}
</script>