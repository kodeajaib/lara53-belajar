@extends('layouts.app')
@section('title', 'Edit Slider - Admin')
@section('content')

        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">Edit Slider</div>

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

                    @foreach ($gambar as $file)
                    <form action="{{ url('slider/update', $file->id) }}" method="POST" enctype="multipart/form-data">
                        {!! csrf_field() !!}

                        <div class="form-group">
                            <label for="judul_gambar">ID Gambar</label>
                            <input type="text" class="form-control" name="id" value="{{ $file->id }}" readonly="">
                        </div>

                                <div class="form-group">
                                    <label for="judul_gambar">Judul Gambar</label>
                                    <input type="text" class="form-control" id="judul_gambar" name="judul_gambar" value="{{ $file->judul_gambar }}">
                                </div>

                                <div class="form-group">
                                    <label for="foto">Judul Gambar</label>
                                    <input type="file" class="form-control" id="foto" name="foto">
                                    <br/>
                                    <img src="{{ url('uploads') }}/{{ $file->foto }}" class="img-responsive" width="120px">
                                </div>

                                  <div class="form-group">
                                    <label for="ket_gambar">Ket Gambar</label>
                                    <input type="text" class="form-control" id="ket_gambar" name="ket_gambar" value="{{ $file->ket_gambar }}">
                                </div>

                                <input class="btn btn-primary" type="submit" value="Upload">
                            </form>

                        @endforeach


                </div>
            </div>
        </div>

@endsection
