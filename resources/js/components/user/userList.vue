<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">User Lst</div>

                    <div class="card-body">
                        <table class="table custom-table">
                            <thead>
                                <th width="20%">Name</th>
                                <th width="20%">Email</th>
                                <th width="20%">Role</th>
                                <th width="10%">Is Active</th>
                                <th width="15%">Date Created</th>
                                <th width="15%">Actions</th>
                            </thead>
                            <tbody>
                                <tr v-for="u in users" :key="u.id">
                                    <td>{{u.name}}</td>
                                    <td>{{u.email}}</td>
                                    <td>{{u.roles.length > 0  ? u.roles[0].name :'--'}}</td>
                                    <td>{{u.is_active}}</td>
                                    <td>{{u.created_at | dateformat}}</td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                        <button type="button" class="btn btn-info btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-down-left" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M9.636 2.5a.5.5 0 0 0-.5-.5H2.5A1.5 1.5 0 0 0 1 3.5v10A1.5 1.5 0 0 0 2.5 15h10a1.5 1.5 0 0 0 1.5-1.5V6.864a.5.5 0 0 0-1 0V13.5a.5.5 0 0 1-.5.5h-10a.5.5 0 0 1-.5-.5v-10a.5.5 0 0 1 .5-.5h6.636a.5.5 0 0 0 .5-.5z"/>
                                            <path fill-rule="evenodd" d="M5 10.5a.5.5 0 0 0 .5.5h5a.5.5 0 0 0 0-1H6.707l8.147-8.146a.5.5 0 0 0-.708-.708L6 9.293V5.5a.5.5 0 0 0-1 0v5z"/>
                                            </svg>
                                        </button>
                                        <button type="button" class="btn btn-danger btn-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                            </svg>
                                        </button>
                                        </div>
                                    </td>
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
            users:[],
            aw:'hjaha',
            enfut:'nice lodz'
        }
    },
    mounted(){
        this.getUsers();
    },
    filters:{
        dateformat(date){
            if(typeof date!=='undefined'){
                return moment(date).format('LL');
            }
        }
    },
    methods:{
        edit(row){
            console.log(row);
        },
        delete(id){
            console.log(id);
        },
        getUsers(){
            axios.get('/users/list').then(
                response=>{
                    this.users = response.data
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