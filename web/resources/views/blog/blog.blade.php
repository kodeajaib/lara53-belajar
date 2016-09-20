@extends('layouts.app')
@section('title', 'Blog/Berita - Admin')
@section('content')

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">Blog  <a href="{{ url('/blog/create') }}" class="btn btn-success btn-xs"><i class="fa fa-plus"></i> Tambah Blog</a></div>
                @if(Session::has('message'))
                   <div class="alert alert-success" role="alert">{{ Session::get('message') }}</div>
                 @endif
                <div class="panel-body" style="min-height: 470px">


				      @foreach ($blog as $row)
                <div class="well">
                  <h2 class="media-heading">{{ $row->judulblog }}</h2>
                  <div class="media">
                  	<a class="pull-left" href="#">
                      <img src="{{ url('uploads') }}/{{ $row->fotoblog }}" class="media-object" width="220px" max-height="80px">
              		  </a>
              		<div class="media-body">
                    <p>  {{ str_limit($row->isiblog, 600) }} </p>
                      <ul class="list-inline list-unstyled">
              			    <li><span><i class="fa fa-calendar"></i> {{ $row->created_at }} </span></li>
                        <li>|</li>
                        <li>{{ $row->kategoriblog }}</li>
                        <li>|</li>
                        <li>{{ $row->tagblog }}</li>
                        <li>|</li>
                        <li class="text-right">By Admin</li>
                        <li>|</li>
                        <li>
                          <a class="btn btn-sm btn-danger" href="{{url('blog/destroy/'.$row->id.'') }}" onclick="return confirm('Anda yakin?')"><i class="fa fa-trash"></i> Hapus</a>
                          <a class="btn btn-sm btn-warning" href="{{ url('blog/'.$row->id.'/edit') }}"><i class="fa fa-edit"></i> Edit</a>
                        </li>
                      </ul>
                   </div>
                </div>
              </div>
		        @endforeach

                <!-- paginasi nya -->
                {!! $blog->render() !!}




                </div>
            </div>
        </div>

@endsection
