<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        return view('user.index');
    }

    public function list(){
        $users = User::with('roles')->orderBy('id','desc')->get();

        return $users;
    }
}
