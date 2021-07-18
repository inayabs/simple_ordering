<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaction extends Model
{
    use HasFactory;
    use softDeletes;
    
    protected $table = 'transaction';

    protected $fillable = [
        'coupon_code',
        'total_amount',
        'user_id'
    ];
    
    public function details(){
        return $this->hasMany(TransactionDetail::class,'transaction_id','id');
    }

    public function coupon(){
        return $this->belongsTo(Coupon::class,'coupon_code','code');
    }
}
