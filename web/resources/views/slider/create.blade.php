@extends('layouts.app')
@section('title', 'Create Slider - Admin')
@section('content')

        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">Add Slider</div>

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

                    <form action="{{ url('slider') }}" method="POST" enctype="multipart/form-data">
                        {!! csrf_field() !!}

                                <div class="form-group">
                                    <label for="judul_gambar">Judul Gambar</label>
                                    <input type="text" class="form-control" id="judul_gambar" name="judul_gambar" placeholder="Judul Gambar">
                                </div>

                                <div class="form-group">
                                    <label for="foto">Judul Gambar</label>
                                    <input type="file" class="form-control" id="foto" name="foto">
                                </div>

                                  <div class="form-group">
                                    <label for="ket_gambar">Ket Gambar</label>
                                    <input type="text" class="form-control" id="ket_gambar" name="ket_gambar">
                                </div>

                                <input class="btn btn-primary" type="submit" value="Upload">
                            </form>

                       


                </div>
            </div>
        </div>

@endsection
