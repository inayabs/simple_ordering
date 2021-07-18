<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;
use App\Models\TransactionDetail;
use Auth;
use DB;

class TransactionController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
    }

    public function new_order(){
        $user_id = Auth::user()->id;
        \JavaScript::put([
            'user_id'=>$user_id
        ]);
        
        return view('order.index');
    }

    public function checkout(Request $request){
        $user_id = Auth::user()->id;
        // return $request->all();
        try{
            DB::beginTransaction();
            if($request->coupon!=null){
                $transaction = new Transaction;
                $transaction->total_amount = $request->total_amount;
                $transaction->deducted_total = $request->deducted_total;
                $transaction->coupon_code = $request->coupon['code'];
                $transaction->user_id = $user_id;
                $transaction->save();
                
                foreach($request->orders as $order){
                    $transaction_detail = new TransactionDetail;
                    $transaction_detail->transaction_id = $transaction->id;
                    $transaction_detail->item_id = $order['id'];
                    $transaction_detail->quantity = $order['quantity'];
                    $transaction_detail->subtotal = $order['subtotal'];
                    $transaction_detail->save();
                }

                DB::commit();
                return response()->json(['status'=>'success']);
            }else{
                $transaction = new Transaction;
                $transaction->total_amount = $request->total_amount;
                $transaction->user_id = $user_id;
                $transaction->save();
                
                foreach($request->orders as $order){
                    $transaction_detail = new TransactionDetail;
                    $transaction_detail->transaction_id = $transaction->id;
                    $transaction_detail->item_id = $order['id'];
                    $transaction_detail->quantity = $order['quantity'];
                    $transaction_detail->subtotal = $order['subtotal'];
                    $transaction_detail->save();
                }

                DB::commit();
                return response()->json(['status'=>'success']);
            }
        }catch(Exception $e){
            DB::rollback();
            return response()->json(['status'=>'error','message'=>$e->getMessage()]);
        }
    }   

    public function orderHistory($id){
        $transactions = Transaction::with('details.item','coupon')->where('user_id',$id)->orderBy('id','desc')->get();
        // $transactions = [];
        // dd($transactions);
        \JavaScript::put([
            'transactions'=>$transactions
        ]);
        return view('order.history');
    }
}
