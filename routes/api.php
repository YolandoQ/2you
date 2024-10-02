<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\User;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\VehicleController;
use App\Http\Controllers\ApiAuthController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/login', [ApiAuthController::class, 'login'])->name('api.login');
Route::post('/logout', [ApiAuthController::class, 'logout'])->middleware('auth:sanctum')->name('api.logout');

Route::as('api.')->middleware('auth:sanctum')->group(function () {
    Route::apiResource('veiculo', VehicleController::class);
    Route::apiResource('categorias', CategoryController::class);
});