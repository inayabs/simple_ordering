<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Order History</div>
                    <div class="card-body" v-if="transactions.length==0">
                        No transactions found
                    </div>
                    <div class="card-body" v-else>
                        <div :id="'accordion'+index" v-for="(transaction,index) in transactions" :key="index">
                            <div class="card">
                                <div class="card-header">
                                    <h5>
                                        <button class="btn btn-link" data-toggle="collapse" :data-target="'#collapseOne'+index">
                                        Transaction ID : {{transaction.id}} - {{transaction.created_at | dateformat}}
                                        </button>
                                    </h5>
                                    </div>
                                    <div :id="'collapseOne'+index" class="collapse" :data-parent="'#accordion'+index">
                                    <div class="card-body">
                                        <table class="table custom-table">
                                            <thead>
                                                <th>Item</th>
                                                <th>Category</th>
                                                <th>Price(+Tax)</th>
                                                <th>Quantity</th>
                                                <th>Subtotal</th>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(detail,index) in transaction.details" :key="index">
                                                    <td>{{detail.item.name}}</td>
                                                    <td>{{detail.item.category}}</td>
                                                    <td>{{detail.item.price}}(+{{detail.item.tax}})</td>
                                                    <td>{{detail.quantity}}</td>
                                                    <td>{{detail.subtotal}}</td>
                                                </tr>
                                            </tbody>
                                            <tfoot v-if="transaction.coupon_code!==null">
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>Total</td>
                                                    <td>{{transaction.total_amount}}</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>   
                                                    <td>Code: {{transaction.coupon_code}}</td>
                                                    <td>Less({{transaction.coupon.less_percent}}%)</td>
                                                    <td>{{transaction.total_amount * (transaction.coupon.less_percent/100)}}</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>Deducted Total</td>
                                                    <td>{{transaction.deducted_total}}</td>
                                                </tr>
                                            </tfoot>
                                            <tfoot v-else> 
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>Total</td>
                                                    <td>{{transaction.total_amount}}</td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td colspan="2" class="text-center">No Coupon Applied</td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import moment from 'moment'
export default {
    data(){
        return{
            transactions:window.transactions,
        }
    },
    filters:{
        dateformat(date){
            if(typeof date!=='undefined'){
                return moment(date).format('LL');
            }
        }
    },
    methods:{
        getTransactions(){
            
        }
    }
}
</script>