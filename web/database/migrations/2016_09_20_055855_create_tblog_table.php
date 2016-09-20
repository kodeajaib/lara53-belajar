<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tblog', function (Blueprint $table) {
            $table->increments('id');
            $table->string('judulblog', 200);
            $table->string('fotoblog', 200);
            $table->string('isiblog', 200);
            $table->string('kategoriblog', 200);
            $table->string('tagblog', 200);
            $table->string('slugblog', 200);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tblog');
    }
}
