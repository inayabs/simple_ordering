<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;
use DB;
use Validator;
class MenuController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        return view('menu.index');
    }

    public function list(){
        $items = Item::orderBy('id','desc')->get();

        return $items;
    }

    public function admod(Request $request){
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'category'=>'required',
            'price'=>'required',
            'tax'=>'required',
        ]);
        
        if($validator->fails()){
            return response()->json(['status'=>'error','message'=>$validator->errors()]);
        }

        try{
            DB::beginTransaction();

            if(isset($request->id)){ // update
                $item = Item::find($request->id);
                $item->name = $request->name;
                $item->category = $request->category;
                $item->price = $request->price;
                $item->tax = $request->tax;

                $item->update();
            }else{ //store
                $item = new Item;
                $item->name = $request->name;
                $item->category = $request->category;
                $item->price = $request->price;
                $item->tax = $request->tax;

                $item->save();
            }

            DB::commit();

            return response()->json(['status'=>'success']);
        }catch(Exception $e){
            DB::rollback();
            return response()->json(['status'=>'error','error'=>$e->getMessage()]);
        }
    }

    public function delete($id){
        $item = Item::find($id);

        $item->delete();
    }
}
