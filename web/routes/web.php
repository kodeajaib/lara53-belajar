<?php


Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index');

Route::group(['middleware' => 'isadmin'], function () {
  //Slider
    Route::resource('slider', 'SliderController');
    Route::get('slider/destroy/{id}', 'SliderController@destroy'); //hapus data
    Route::post('slider/update/{id}', 'SliderController@update'); //update datanya
    //Route::get('slider/edit/{id}', 'SliderController@edit'); //cek data yang akan di edit
    //Route::get('/slider', 'SliderController@index');
    //Route::get('slider/create', 'SliderController@create');
    //Route::post('/slider/store', 'SliderController@store');

  //BlogController
  Route::resource('blog', 'BlogController');
  Route::get('blog/destroy/{id}', 'BlogController@destroy'); //hapus data
  Route::post('blog/update/{id}', 'BlogController@update'); //update datanya


});
