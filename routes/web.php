<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/users', 'App\Http\Controllers\UserController@index');
Route::get('/users/list', 'App\Http\Controllers\UserController@list');

Route::get('/menu', 'App\Http\Controllers\MenuController@index');
Route::get('/item/list', 'App\Http\Controllers\MenuController@list');
Route::post('/item/admod', 'App\Http\Controllers\MenuController@admod');
Route::get('/item/{id}/delete', 'App\Http\Controllers\MenuController@delete');

Route::get('/new-order', 'App\Http\Controllers\TransactionController@new_order');
Route::post('/coupon/apply', 'App\Http\Controllers\CouponController@applyCoupon');
Route::post('/order/checkout', 'App\Http\Controllers\TransactionController@checkout');
Route::get('/order/{id}/history', 'App\Http\Controllers\TransactionController@orderHistory');

Route::get('/coupons', 'App\Http\Controllers\CouponController@index');
Route::get('/coupons/list', 'App\Http\Controllers\CouponController@list');
Route::post('/coupons/admod', 'App\Http\Controllers\CouponController@admod');
Route::get('/coupons/{id}/delete', 'App\Http\Controllers\CouponController@delete');


