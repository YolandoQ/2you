<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    use HasFactory;

    /**
     * Campos que podem ser preenchidos em massa.
     */
    protected $fillable = [
        'category_id',
        'brand',
        'model',
        'year',
        'weight',
        'color',
        'status'
    ];

    /**
     * Relacionamento Many-to-One com o model Category.
     * Um veículo pertence a uma única categoria.
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
