@extends('layouts.app')
@section('title', 'Create Blog - Admin')
@section('content')

        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">Add Blog</div>

                <div class="panel-body" style="min-height: 470px">

                 	 @if(count($errors) > 0)
                            <div class="row">
                                    <ul>
                                        @foreach($errors->all() as $error)
                                            <li>{{$error}}</li>
                                        @endforeach
                                    </ul>
                            </div>
                        @endif

                    <form action="{{ url('blog') }}" method="POST" enctype="multipart/form-data">
                        {!! csrf_field() !!}

                                <div class="form-group">
                                    <label for="judulblog">Judul </label>
                                    <input type="text" class="form-control" id="judulblog" name="judulblog" placeholder="Judul Gambar">
                                </div>
                                <div class="form-group">
                                   <label for="kategoriblog">Kategori</label>
                                   <select class="form-control" name="kategoriblog">
                                     <option>-- Pilih --</option>
                                     <option value="umum">Umum</option>
                                     <option value="hiburan">Hiburan</option>
                                     <option value="sport">Sport</option>
                                   </select>
                                </div>
                                <div class="form-group">
                                    <label for="ket_gambar">Isi</label>
                                     <textarea type="text" class="form-control" name="isiblog" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="judulblog">Tag </label>
                                    <input type="text" class="form-control" id="tagblog" name="tagblog" placeholder="tag Blog">
                                </div>
                                <div class="form-group">
                                    <label for="foto">Judul Gambar</label>
                                    <input type="file" class="form-control" id="fotoblog" name="fotoblog">
                                </div>



                                <input class="btn btn-primary" type="submit" value="Upload">
                            </form>




                </div>
            </div>
        </div>

@endsection
