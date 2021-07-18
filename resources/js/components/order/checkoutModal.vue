<template>
    <modal name="my-first-modal"
        width="500"
        height="150"
    >
        <transition name="modal">
        <div class="modal-mask">
          <div class="modal-wrapper">
            <div class="modal-container">
                <div class="modal-header">
                    <h3>Apply Coupon</h3>
                </div>
              <div class="modal-body">
                <slot name="body">
                    <div class="d-flex justify-content-center">
                        <div class="row">
                            <div class="input-group md-12">
                            <input type="text" class="form-control" placeholder="Enter Code" aria-label="Recipient's username" aria-describedby="basic-addon2" v-model="code">
                            <div class="input-group-append">
                                <button class="btn btn-success" @click="checkCoupon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
                                    <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
                                    </svg>
                                </button>
                            </div>
                            </div>
                        </div>
                    </div>
                </slot>
              </div>
            </div>
          </div>
        </div>
      </transition>
    </modal>
</template>
<script>
export default {
    props:['coupon'],
    data(){
        return{
            code:''
        }
    },
    methods:{
        checkCoupon(){
            swal.fire({
                title:'Loading please wait.',
                didOpen:()=>{
                    swal.showLoading()
                }
            });
            
                axios.post(`/coupon/apply`,{
                    code:this.code
                }).then(
                    response=>{
                        console.log(response.data.coupon);
                        if(response.data.status=='success'){
                            this.$parent.coupon = response.data.coupon;
                            Toast.fire({
                                icon: "success",
                                title: "Coupon Applied Successfully.",
                                position: "top-end",
                            });
                            this.$modal.hide('my-first-modal');
                        }else{
                            Toast.fire({
                                icon: "error",
                                title: "Invalid Coupon Code.",
                                position: "top-end",
                            });
                        }
                    }
                ).catch(
                    err=>{
                    Toast.fire({
                            icon: "error",
                            title: err,
                            position: "top-end",
                        });  
                    }
                );
        }
    }
}
</script>