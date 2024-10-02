<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    /**
     * Campos que podem ser preenchidos em massa.
     */
    protected $fillable = ['name'];

    /**
     * Relacionamento One-to-Many com o model Vehicle.
     * Uma categoria pode ter vários veículos.
     */
    public function vehicles()
    {
        return $this->hasMany(Vehicle::class);
    }
}
