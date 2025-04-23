@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <!-- Filters Sidebar -->
        <div class="col-md-3">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Filters</h5>
                    <form action="{{ route('properties.index') }}" method="GET">
                        <div class="mb-3">
                            <label for="price_min" class="form-label">Min Price</label>
                            <input type="number" class="form-control" id="price_min" name="price_min" value="{{ request('price_min') }}">
                        </div>
                        <div class="mb-3">
                            <label for="price_max" class="form-label">Max Price</label>
                            <input type="number" class="form-control" id="price_max" name="price_max" value="{{ request('price_max') }}">
                        </div>
                        <div class="mb-3">
                            <label for="bedrooms" class="form-label">Bedrooms</label>
                            <select class="form-select" id="bedrooms" name="bedrooms">
                                <option value="">Any</option>
                                <option value="1" {{ request('bedrooms') == 1 ? 'selected' : '' }}>1+</option>
                                <option value="2" {{ request('bedrooms') == 2 ? 'selected' : '' }}>2+</option>
                                <option value="3" {{ request('bedrooms') == 3 ? 'selected' : '' }}>3+</option>
                                <option value="4" {{ request('bedrooms') == 4 ? 'selected' : '' }}>4+</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Amenities</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="amenities[]" value="wifi" id="wifi" {{ in_array('wifi', request('amenities', [])) ? 'checked' : '' }}>
                                <label class="form-check-label" for="wifi">WiFi</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="amenities[]" value="pool" id="pool" {{ in_array('pool', request('amenities', [])) ? 'checked' : '' }}>
                                <label class="form-check-label" for="pool">Pool</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="amenities[]" value="kitchen" id="kitchen" {{ in_array('kitchen', request('amenities', [])) ? 'checked' : '' }}>
                                <label class="form-check-label" for="kitchen">Kitchen</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="amenities[]" value="parking" id="parking" {{ in_array('parking', request('amenities', [])) ? 'checked' : '' }}>
                                <label class="form-check-label" for="parking">Parking</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Apply Filters</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Properties Grid -->
        <div class="col-md-9">
            <div class="row">
                @foreach($properties as $property)
                <div class="col-md-6 mb-4">
                    <div class="card h-100">
                        <img src="{{ $property->featured_image }}" class="card-img-top" alt="{{ $property->title }}">
                        <div class="card-body">
                            <h5 class="card-title">{{ $property->title }}</h5>
                            <p class="card-text">
                                <i class="fas fa-map-marker-alt text-primary"></i> {{ $property->address }}
                            </p>
                            <p class="card-text">
                                <i class="fas fa-bed text-primary"></i> {{ $property->bedrooms }} bedrooms
                                <i class="fas fa-bath text-primary ms-3"></i> {{ $property->bathrooms }} bathrooms
                            </p>
                            <p class="card-text">
                                <strong>${{ number_format($property->price_per_night, 2) }}</strong> per night
                            </p>
                            <a href="{{ route('properties.show', $property) }}" class="btn btn-outline-primary">View Details</a>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>

            <!-- Pagination -->
            <div class="d-flex justify-content-center mt-4">
                {{ $properties->links() }}
            </div>
        </div>
    </div>
</div>
@endsection 