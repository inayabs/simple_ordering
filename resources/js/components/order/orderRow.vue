<template>
    <tr>
        <td>{{order.name}}</td>
        <td>{{order.taxed_price}}</td>
        <td>
            <input type="number" min="1" class="form-control" v-model="quantity">
        </td>
        <td>{{subtotal}}</td>
        <td>
            <button class="btn btn-danger" @click="removeOrder">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                </svg>

            </button>
        </td>
    </tr>
</template>
<script>
export default {
    props:['order','order_index'],
    data(){
        return{
            quantity:0,
            subtotal:0
        }
    },
    mounted(){
        this.quantity = 1;
    },
    watch:{
        quantity(){
            this.subtotal = parseInt(this.order.taxed_price) * parseInt(this.quantity);
            this.$parent.orders[this.order_index].quantity = this.quantity;
            this.$parent.switz = !this.$parent.switz;
        },
        subtotal(){
            this.$parent.orders[this.order_index].subtotal = this.subtotal;
            this.$parent.computeTotal();

        }
    },
    methods:{
        removeOrder(){
            this.$parent.orders.splice(this.order_index,1);
            this.$parent.computeTotal();

        }
    }
}
</script>