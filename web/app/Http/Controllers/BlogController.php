<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\LengthAwarePaginator;
use App\Mblog;
use App\Http\Requests;


class BlogController extends Controller
{
  public function __construct()
  {
      $this->middleware('auth');
  }

    public function index()
    {
      $blog = Mblog::paginate(5);
      return view('blog/blog',  compact('blog'));
    }


    public function create()
    {
        return view('blog.tambah');
    }


    public function store(Request $request)
    {
      $this->validate($request, [
       'judulblog' => ['required', 'min:5'] ,
       'foto' => ['mimes:jpg,jpeg,JPEG,png,gif,bmp', 'max:2024'],
       'isiblog' => ['required', 'min:5'],
       ]);

         $tambah = new Mblog();
         $tambah->judulblog = $request->get('judulblog');
         //Judul kita jadikan slug
         $tambah->slugblog = Str::slug($request->get('judulblog'));
         $tambah->isiblog = $request->get('isiblog');
         $tambah->kategoriblog = $request->get('kategoriblog');
         $tambah->tagblog = $request->get('tagblog');
         // Disini proses mendapatkan judul dan memindahkan letak gambar ke folder image
         $fotoblog       = $request->file('fotoblog');
         $namaFile   = $fotoblog->getClientOriginalName();
         $request->file('fotoblog')->move('uploads', $namaFile);

         $tambah->fotoblog = $namaFile;
         $tambah->save();

         return redirect()->to('blog');
    }


    public function show($id)
    {
        //
    }


    public function edit($id)
    {
      $data = DB::table('tblog')
             ->where('id','=',$id)
             ->get();

      return view('blog.edit')->with('blog',$data);
    }


    public function update(Request $request, $id)
    {
      $this->validate($request, [
       'judulblog' => ['required', 'min:5'] ,
       'foto' => ['mimes:jpg,jpeg,JPEG,png,gif,bmp', 'max:2024'],
       'isiblog' => ['required', 'min:5'],
       ]);

         $update = Mblog::where('id', $id)->first();
         $update->judulblog = $request->get('judulblog');
         //Judul kita jadikan slug
         $update->slugblog = Str::slug($request->get('judulblog'));
         $update->isiblog = $request->get('isiblog');
         $update->kategoriblog = $request->get('kategoriblog');
         $update->tagblog = $request->get('tagblog');
         if($request->file('fotoblog') == "")
         {
             $update->fotoblog = $update->fotoblog;
         }
         else
         {
             $fotoblog     = $request->file('fotoblog');
             $namaFile = $fotoblog->getClientOriginalName();
             $request->file('fotoblog')->move('uploads', $namaFile);
             $update->fotoblog = $namaFile;
         }

         $update->update();
         return redirect('blog');
    }


    public function destroy($id)
    {
      $blog = Mblog::findOrFail($id);
      $blog->delete();
      return redirect('blog');
    }
}
