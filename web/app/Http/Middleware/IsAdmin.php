<?php

namespace App\Http\Middleware;

use Closure;

class IsAdmin
{

    public function handle($request, Closure $next)
    {
        //return $next($request);

        if ( auth()->check() && $request->user()->level == 'admin' )
        {
            return $next($request);
        }

        return redirect('home');

    }
}
