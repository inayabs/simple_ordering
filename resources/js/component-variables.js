

//dashboard
Vue.component('dshboard',require('./components/dashboard/index.vue').default);

//user
Vue.component('user-list',require('./components/user/userList.vue').default);

//menu 
Vue.component('menu-list',require('./components/menu/menuList.vue').default);

// menu order
Vue.component('order-index',require('./components/order/index.vue').default);
Vue.component('menu-order',require('./components/order/menuList.vue').default);
Vue.component('order-cart',require('./components/order/cart.vue').default);
Vue.component('order-history',require('./components/order/history.vue').default);

//coupons
Vue.component('coupon-index',require('./components/coupon/index.vue').default);
