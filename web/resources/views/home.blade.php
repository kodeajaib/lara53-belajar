@extends('layouts.app')
@section('title', 'Home - Admin')
@section('content')

        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body" style="min-height: 470px">
                    You are logged in as {{ Auth::user()->name }}
                </div>
            </div>
        </div>

@endsection
