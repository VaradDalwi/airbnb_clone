<?php

namespace App\Http\Controllers;

use App\Models\Property;
use Illuminate\Http\Request;

class PropertyController extends Controller
{
    public function index(Request $request)
    {
        $query = Property::query();

        // Apply filters
        if ($request->has('price_min')) {
            $query->where('price_per_night', '>=', $request->price_min);
        }
        if ($request->has('price_max')) {
            $query->where('price_per_night', '<=', $request->price_max);
        }
        if ($request->has('bedrooms')) {
            $query->where('bedrooms', '>=', $request->bedrooms);
        }
        if ($request->has('amenities')) {
            $amenities = explode(',', $request->amenities);
            $query->whereJsonContains('amenities', $amenities);
        }

        $properties = $query->with('featuredImage')->paginate(12);

        return view('properties.index', compact('properties'));
    }

    public function show(Property $property)
    {
        $property->load(['images', 'featuredImage']);
        return view('properties.show', compact('property'));
    }

    public function search(Request $request)
    {
        $query = Property::query();

        if ($request->has('location')) {
            $query->where('address', 'like', '%' . $request->location . '%');
        }

        $properties = $query->with('featuredImage')->take(6)->get();

        return view('home', compact('properties'));
    }
}
