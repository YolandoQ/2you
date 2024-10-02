<?php

namespace App\Http\Controllers;

use App\Models\Vehicle;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;

class VehicleController extends Controller
{
    /**
     * Listar todos os veículos.
     */
    public function index(Request $request): JsonResponse
    {
        $perPage = $request->get('per_page', 10);
        $page = $request->get('page', 1);
        $sortBy = $request->get('sortBy', []);
    
        $query = Vehicle::with('category');
    
        if (!empty($sortBy)) {
            foreach ($sortBy as $sort) {
                $query->orderBy($sort['key'], $sort['order'] ?? 'asc');
            }
        }
    
        $vehicles = $query->paginate($perPage, ['*'], 'page', $page);
    
        return response()->json([
            'success' => true,
            'data' => $vehicles->items(),
            'current_page' => $vehicles->currentPage(),
            'last_page' => $vehicles->lastPage(),
            'per_page' => $vehicles->perPage(),
            'total' => $vehicles->total(),
        ], 200);
    }    

    /**
     * Criar um novo veículo.
     */
    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'nullable|exists:categories,id',
            'brand' => 'required|string|max:255',
            'model' => 'required|string|max:255',
            'year' => 'required|integer|min:1900|max:' . date('Y'),
            'weight' => 'required|numeric',
            'color' => 'required|string|max:50',
            'status' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Erro de validação.',
                'errors' => $validator->errors(),
            ], 422);
        }

        $vehicle = Vehicle::create($request->all());
        $vehicle->load('category');

        return response()->json([
            'success' => true,
            'message' => 'Veículo criado com sucesso.',
            'data' => $vehicle,
        ], 201);
    }

    /**
     * Mostrar um veículo específico.
     */
    public function show($id): JsonResponse
    {
        $vehicle = Vehicle::with('category')->find($id);

        if (!$vehicle) {
            return response()->json([
                'success' => false,
                'message' => 'Veículo não encontrado.',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $vehicle,
        ], 200);
    }

    /**
     * Atualizar um veículo.
     */
    public function update(Request $request, $id): JsonResponse
    {
        $vehicle = Vehicle::find($id);

        if (!$vehicle) {
            return response()->json([
                'success' => false,
                'message' => 'Veículo não encontrado.',
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'category_id' => 'nullable|exists:categories,id',
            'brand' => 'required|string|max:255',
            'model' => 'required|string|max:255',
            'year' => 'required|integer|min:1900|max:' . date('Y'),
            'weight' => 'required|numeric',
            'color' => 'required|string|max:50',
            'status' => 'required|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Erro de validação.',
                'errors' => $validator->errors(),
            ], 422);
        }

        $data = $request->except('category');
        $vehicle->update($data);
        $vehicle->load('category');

        return response()->json([
            'success' => true,
            'message' => 'Veículo atualizado com sucesso.',
            'data' => $vehicle,
        ], 200);
    }

    /**
     * Deletar um veículo.
     */
    public function destroy($id): JsonResponse
    {
        $vehicle = Vehicle::find($id);

        if (!$vehicle) {
            return response()->json([
                'success' => false,
                'message' => 'Veículo não encontrado.',
            ], 404);
        }

        $vehicle->delete();

        return response()->json([
            'success' => true,
            'message' => 'Veículo deletado com sucesso.',
        ], 200);
    }
}
