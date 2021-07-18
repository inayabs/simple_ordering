<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Coupon</div>
                    
                    <div class="card-body">
                        <button class="btn btn-success btn-sm" @click="drawer = true" v-if="drawer==false" style="margin-bottom:10px;">New Coupon</button>
                        <div class="row"  v-if="drawer===true">
                            <div class="col-md-12 text-right">
                                <button class="btn btn-success btn-sm" @click="save()">Save</button>
                                <button class="btn btn-danger btn-sm" @click="discard">Discard</button>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Code</label>
                                    <input type="text" class="form-control" v-model="coupon.code">
                                    <span v-if="errors.code" :class="['badge badge-danger']">{{ errors.code[0] }}</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="">Less %</label>
                                    <input type="number" class="form-control" v-model="coupon.less_percent" min="0">
                                    <span v-if="errors.less_percent" :class="['badge badge-danger']">{{ errors.less_percent[0] }}</span>
                                </div>
                            </div>
                            <div class="col-md-3" v-if="toType(coupon.id)!=='undefined'"> 
                                <div class="form-group">
                                    <label for="">Active</label>
                                    <select name="" id="" class="form-control" v-model="coupon.is_active">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                    <span v-if="errors.is_active" :class="['badge badge-danger']">{{ errors.is_active[0] }}</span>
                                </div>
                            </div>
                        </div>
                        <table class="table custom-table">
                            <thead>
                                <th width="20%">Coupon Code</th>
                                <th width="20%">Less Percent</th>
                                <th width="10%">Active</th>
                                <th width="15%">Date Created</th>
                                <th width="15%">Actions</th>
                            </thead>
                            <tbody v-if="coupons.length > 0">
                                <tr v-for="coupon in coupons" :key="coupon.id">
                                    <td >{{coupon.code}}</td>
                                    <td >{{coupon.less_percent}}</td>
                                    <td >{{coupon.is_active==1 ? 'Yes' : 'No'}}</td>
                                    <td >{{coupon.created_at | dateformat}}</td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                        <button type="button" class="btn btn-info btn-sm" title="edit" @click="edit(coupon)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-down-left" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M9.636 2.5a.5.5 0 0 0-.5-.5H2.5A1.5 1.5 0 0 0 1 3.5v10A1.5 1.5 0 0 0 2.5 15h10a1.5 1.5 0 0 0 1.5-1.5V6.864a.5.5 0 0 0-1 0V13.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                            <path fill-rule="evenodd" d="M5 10.5a.5.5 0 0 0 .5.5h5a.5.5 0 0 0 0-1H6.707l8.147-8.146a.5.5 0 0 0-.708-.708L6 9.293V5.5a.5.5 0 0 0-1 0v5z"/>
                                            </svg>
                                        </button>
                                        <button type="button" class="btn btn-danger btn-sm" title="delete" @click="remove(coupon.id)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                            </svg>
                                        </button>
                                        </div>
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
import moment from 'moment'
export default {
    data(){
        return{
            drawer:false,
            item:{},
            items:[],
            coupons:[],
            coupon:{},
            errors:[]
        }
    },
    filters:{
        dateformat(date){
            if(typeof date!=='undefined'){
                return moment(date).format('LL');
            }
        }
    },
    created(){
        this.getCoupons();
    },
    methods:{
        toType(obj) {
            return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
        },
        edit(row){
            this.coupon = row;
            this.drawer = true;
        },
        remove(id){
            let dis = this;
            swal
                .fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!",
                })
                .then((result) => {
                let vm = this;
                if (result.value === true) {
                    axios.get(`/coupons/${id}/delete`).then(
                        response=>{
                            Toast.fire({
                                icon: "success",
                                title: "Item removed  successfully.",
                                position: "top-end",
                            });
                            dis.getCoupons();
                        }
                    ).catch(
                        err=>{
                            Toast.fire({
                                icon: "error",
                                title: "Something went wrong.",
                                position: "top-end",
                                html:err
                            });
                        }
                    );
                }
            });
        },
        discard(){
            this.item = {},
            this.errors = [];
            this.drawer = false;
        },
        save(){
            let dis = this;
            swal.fire({
                title:'Loading please wait.',
                didOpen:()=>{
                    swal.showLoading()
                }
            });
            axios.post('/coupons/admod',this.coupon).then(
                response=>{
                    if(response.data.status == 'success'){
                        dis.getCoupons();
                        dis.item = {};
                        dis.drawer = false;
                        Toast.fire({
                            icon: "success",
                            title: "Data saved successfully.",
                            position: "top-end",
                        });
                    }else{
                        Toast.fire({
                            icon: "error",
                            title: "Opss.. something went wrong",
                            // html:response.data.message,
                            position: "top-end",
                        });
                        dis.errors = response.data.message
                    }
                }
            ).catch(
                err=>{
                    Toast.fire({
                            icon: "error",
                            title: "Opss.. something went wrong",
                            html:response.data.message,
                            position: "top-end",
                        });
                }
            );
        },
        getCoupons(){
            axios.get('/coupons/list').then(
                response=>{
                    this.coupons = response.data
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