<template>
    <div class="col-md-7">
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
                                <button class="btn btn-warning btn-sm">
                                    Order
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
</template>
<script>
export default {
    data(){
        return{
            items:[],
        }
    },
    created(){
        this.getItems();
    },  
    methods:{
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