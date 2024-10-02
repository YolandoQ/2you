<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Vehicle;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Vehicle>
 */
class VehicleFactory extends Factory
{
    
    protected $model = Vehicle::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'category_id' => Category::factory(),
            'brand' => $this->faker->company(),
            'model' => $this->faker->word(),
            'year' => $this->faker->year(),
            'weight' => $this->faker->numberBetween(1000, 3000),
            'color' => $this->faker->safeColorName(),
            'status' => $this->faker->boolean(),
        ];
    }
}
