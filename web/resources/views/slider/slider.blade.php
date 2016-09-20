@extends('layouts.app')
@section('title', 'Slider - Admin')
@section('content')

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">Edit Slider  <a href="{{ url('/slider/create') }}" class="btn btn-success btn-xs"><i class="fa fa-plus"></i> Tambah Slider</a></div>
                @if(Session::has('message'))
                   <div class="alert alert-success" role="alert">{{ Session::get('message') }}</div>
                 @endif
                <div class="panel-body" style="min-height: 470px">
                @if(count($gambar) > 0)

				        @foreach ($gambar as $file)
				        <div class="col-sm-4 col-md-4">
			                <div class="thumbnail">
						      <img src="{{ url('uploads') }}/{{ $file->foto }}" class="img-responsive">
						      <div class="caption">
						        <h3>{{ $file->judul_gambar }}</h3>
						        <p>{{ $file->ket_gambar }}</p>
						        <p><a href="{{url('slider/destroy/'.$file->id.'') }}" onclick="return confirm('Anda yakin?')" class="btn btn-sm btn-danger">
                            <i class="fa fa-trash"></i> Hapus</a>

                        <a class="btn btn-sm btn-info" href="{{ url('slider/'.$file->id.'/edit') }}"><i class="fa fa-edit"></i> Edit</a>
                    </p>
						      </div>
						    </div>
				        	</div>
				        @endforeach

                <!-- paginasi nya -->
                {!! $gambar->render() !!}



				    @endif
                </div>
            </div>
        </div>

@endsection
