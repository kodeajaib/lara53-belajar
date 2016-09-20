<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title> @yield('title')</title>


    @yield('css')
    <!-- Styles {{ config('app.name', 'Laravel') }} -->
    {!! Html::style('css/app.css') !!}
    <link rel="stylesheet" href="https://opensource.keycdn.com/fontawesome/4.6.3/font-awesome.min.css" integrity="sha384-Wrgq82RsEean5tP3NK3zWAemiNEXofJsTwTyHmNb/iL3dP/sZJ4+7sOld1uqYJtE" crossorigin="anonymous">

    <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
    </script>
    <!-- style menu samping -->
    <style type="text/css">
        .nav-pills a {
            color: #5e5e5e;
            font-weight: bold;
        }

        .nav-pills a:hover {
            color: #363636;
            border-radius: 0px;
            background-color: transparent ;
        }

        .nav-pills .active a:hover {

            color: #560000;
            border-radius: 0px;
            background-color: transparent ;
        }
         .nav-pills > li.active > a, .nav-pills > li.active > a:focus {
            color: #ff938f;
            background-color: transparent ;
            border-radius: 0px;
         }
    </style>
</head>
<body>
    <nav class="navbar navbar-default navbar-static-top" style="border-top:5px solid #ff938f ">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('home') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    &nbsp;
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        <li><a href="{{ url('/login') }}">Login</a></li>
                        <li><a href="{{ url('/register') }}">Register</a></li>
                    @else
                        <li><a href="{{ url('/') }}" target="_blank"><i class="fa fa-globe"></i> Web Utama</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">

                                <li>
                                    <a href="{{ url('/logout') }}"
                                        onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                        Logout
                                    </a>

                                    <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </li>
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
    <!-- contentnya -->
    <div class="container" style="margin-top: -15px">
      <div class="row">
      @if (Auth::guest())

       @else
       <div class="col-md-2">
         <ul class="nav nav-pills nav-stacked">
            @if (Auth::user()->level == 'admin')

                    <li class="{{ Request::is('home') ? 'active' : '' }}"><a href="{{ url('home') }}">
                       <img src="../img/speedometer.png" width="20px" style="margin-top: -5px" /> &nbspDashboard
                       </a>
                    </li>
                    <li class="{{ Request::is('slider') ? 'active' : '' }}"><a href="{{ url('slider') }}">
                       <img src="../img/website.png" width="20px" style="margin-top: -5px"/> &nbspSlider
                       </a>
                    </li>

                    <li><a href="#">
                      <img src="../img/image.png" width="25px" style="margin-top: -5px"/> &nbspGaleri
                      </a>
                    </li>

                    <li class="{{ Request::is('blog') ? 'active' : '' }}"><a href="{{ url('blog') }}">
                      <img src="../img/social-media.png" width="25px" style="margin-top: -5px"/> &nbspBlog
                      </a>
                    </li>


                    <li><a href="#">
                      <img src="../img/map.png" width="25px" style="margin-top: -5px"/> &nbspKontak
                      </a>
                    </li>

                    <li><a href="#">
                      <img src="../img/team.png" width="20px" style="margin-top: -5px"/> &nbspPengguna
                      </a>
                    </li>
                @else
                     <li class="{{ Request::is('home') ? 'active' : '' }}"><a href="{{ url('home') }}">
                       <img src="../img/speedometer.png" width="20px" style="margin-top: -5px" /> &nbspDashboard
                       </a>
                    </li>

                    <li><a href="#">
                      <img src="../img/image.png" width="25px" style="margin-top: -5px"/> &nbspGaleri
                      </a>
                    </li>

                    <li><a href="#">
                      <img src="../img/social-media.png" width="25px" style="margin-top: -5px"/> &nbspBlog
                      </a>
                    </li>
                @endif



                </ul>


        </div>
        @endif

         @yield('content')
        </div>
    </div>
    <!-- end content -->


     @yield('js')
    <!-- Scripts -->
    {!! HTML::script('js/app.js'); !!}

</body>
</html>
