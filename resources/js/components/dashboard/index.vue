<template>
<div v-if="role.name == 'User'">
    <!-- <div class="container">
        <div class="row justify-content-center">
            <order-cart />
            <menu-order />
        </div>
    </div> -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dashboard for {{role.name}}</div>

                    <div class="card-body">
                        Go to:
                        <ul v-if="role.name == 'User'">
                            <li><a href="/new-order">New Order</a></li>
                            <li><a :href="'/order/'+user_id+'/history'">Order History</a></li>
                        </ul>
                        <ul v-else-if="role.name=='Staff'">
                            <li>Menu List</li>
                            <li>Orders</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div v-else>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Dashboard for {{role.name}}</div>

                    <div class="card-body">
                        Go to:
                        <ul v-if="role.name == 'Admin'">
                            <li><a href="/users">Users List</a></li>
                            <li><a href="/menu">Menu List</a></li>
                            <li><a href="/coupons">Coupons</a></li>
                        </ul>
                        <ul v-else-if="role.name=='Staff'">
                            <li>Menu List</li>
                            <li>Orders</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
<script>
export default {
    data(){
        return{
            role:window.role,
            user_id:window.user_id
        }   
    }
}
</script>