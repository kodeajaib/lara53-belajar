<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use App\Mslider;
use App\Http\Requests;

class SliderController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
         $gambar = Mslider::paginate(1);
         return view('slider/slider',  compact('gambar'));
    }


    public function create()
    {
        return view('slider.create');
    }



    public function store(Request $request)
    {
           $this->validate($request, [
            'judul_gambar' => ['required', 'min:5'] ,
            'foto' => ['required','mimes:jpg,jpeg,JPEG,png,gif,bmp', 'max:2024'],
            'ket_gambar' => ['required', 'min:5'],
            ]);

            $foto = $request->file('foto');
            $namaFile = $foto->getClientOriginalName();
            $request->file('foto')->move('uploads', $namaFile);
            $do = new Mslider($request->all());
            $do->foto = $namaFile;
            $do->save();
            //return redirect('slider');
              }



    public function show($id)
    {
        //
    }


    public function edit($id)
    {
        $data = DB::table('tgambar')
               ->where('id','=',$id)
               ->get();

        return view('slider.edit')->with('gambar',$data);
    }


    public function update(Request $request, $id)
    {
     $this->validate($request, [
       'judul_gambar' => ['required', 'min:5'] ,
       'foto' => ['mimes:jpg,jpeg,JPEG,png,gif,bmp', 'max:2024'],
       'ket_gambar' => ['required', 'min:5'],
     ]);

        $update = Mslider::where('id', $id)->first();
        $update->judul_gambar = $request['judul_gambar'];
        $update->ket_gambar = $request['ket_gambar'];

        if($request->file('foto') == "")
        {
            $update->foto = $update->foto;
        }
        else
        {
            $foto     = $request->file('foto');
            $namaFile = $foto->getClientOriginalName();
            $request->file('foto')->move('uploads', $namaFile);
            $update->foto = $namaFile;
        }

        $update->update();
        return redirect('slider');


    }


    public function destroy($id)
    {
      $gambar = Mslider::findOrFail($id);
      $gambar->delete();
      return redirect('slider');
    }
}
