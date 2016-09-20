<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mblog extends Model
{
  protected $table = 'tblog';
  protected $fillable = ['judulblog', 'fotoblog','isiblog', 'kategoriblog', 'tagblog', 'slugblog',];
}
