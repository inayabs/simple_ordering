<template>
    <div class="col-md-5">
        <div class="card">
            <div class="card-header">New Order</div>

            <div class="card-body">
                <table class="table custom-table">
                    <thead>
                        <th width="20%">Item</th>
                        <th width="20%">Taxed Price</th>
                        <th width="10%">Quantity</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>qwe</td>
                            <td>qwe</td>
                            <td>qwe</td>
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