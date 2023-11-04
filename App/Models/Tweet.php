<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
/**
 * 
 */
class Tweet extends Model
{
	
	protected $fillable = [
        'id_usuario', 'tweet', 'data'
    ];

    public $timestamps = false;

}