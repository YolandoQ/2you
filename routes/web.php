<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('manage.vehicles');
    }
    
    return Inertia::render('Auth/Login', [
        'canResetPassword' => True,
    ]);
});

Route::get('/welcome', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canResetPassword' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
    
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');

    Route::get('/manage-vehicles', function () {
        return Inertia::render('Manager/VehicleManager');
    })->name('manage.vehicles');

    Route::get('/manage-categories', function () {
        return Inertia::render('Manager/CategoryManager');
    })->name('manage.categories');
});
