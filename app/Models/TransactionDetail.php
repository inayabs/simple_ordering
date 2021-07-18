<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TransactionDetail extends Model
{
    use softDeletes;
    use HasFactory;

    protected $fillable = [
        'transaction_id',
        'item_id',
        'quantity',
        'subtotal',
    ];

    public function item(){
        return $this->belongsTo(Item::class,'item_id');
    }
}
