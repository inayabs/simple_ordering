<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use Validator;
use DB;

class CouponController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        return view('coupon.index');
    }

    public function admod(Request $request){
        $validator = Validator::make($request->all(),[
            'code'=>'required',
            'less_percent'=>'required',
        ]);
        
        if($validator->fails()){
            return response()->json(['status'=>'error','message'=>$validator->errors()]);
        }

        try{
            DB::beginTransaction();

            if(isset($request->id)){ // update
                $coupon = Coupon::find($request->id);
                $coupon->code = $request->code;
                $coupon->less_percent = $request->less_percent;
                $coupon->is_active = $request->is_active;

                $coupon->update();
            }else{ //store
                $coupon = new Coupon;
                $coupon->code = $request->code;
                $coupon->less_percent = $request->less_percent;

                $coupon->save();
            }

            DB::commit();

            return response()->json(['status'=>'success']);
        }catch(Exception $e){
            DB::rollback();
            return response()->json(['status'=>'error','error'=>$e->getMessage()]);
        }
    }

    public function list(){
        $coupons = Coupon::orderBy('id','desc')->get();

        return $coupons;
    }

    public function delete($id){
        $coupon = Coupon::find($id);

        $coupon->delete();
    }

    public function applyCoupon(Request $request){
        $coupon = Coupon::where('code',$request->code)->first();
        
        if(isset($coupon)){
            return response()->json(['status'=>'success','coupon'=>$coupon]);
        }else{
            return response()->json(['status'=>'error','message'=>'Invalid Coupon Code.']);
        }
    }
}
