<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mslider extends Model
{
    protected $table = 'tgambar';
    protected $fillable = ['judul_gambar', 'foto','ket_gambar'];
}
