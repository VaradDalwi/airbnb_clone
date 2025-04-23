@extends('layouts.app')

@section('content')
<!-- Hero Section -->
<section class="hero bg-primary text-white py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h1 class="display-4">Find Your Perfect Stay</h1>
                <p class="lead">Discover unique places to stay around the world.</p>
            </div>
            <div class="col-md-6">
                <form action="{{ route('home') }}" method="GET" class="bg-white p-4 rounded shadow">
                    <div class="mb-3">
                        <label for="location" class="form-label">Where</label>
                        <input type="text" class="form-control" id="location" name="location" placeholder="Search destinations">
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="check_in" class="form-label">Check-in</label>
                            <input type="date" class="form-control" id="check_in" name="check_in">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="check_out" class="form-label">Check-out</label>
                            <input type="date" class="form-control" id="check_out" name="check_out">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="guests" class="form-label">Guests</label>
                        <select class="form-select" id="guests" name="guests">
                            <option value="1">1 Guest</option>
                            <option value="2">2 Guests</option>
                            <option value="3">3 Guests</option>
                            <option value="4">4 Guests</option>
                            <option value="5">5+ Guests</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Search</button>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Featured Properties -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-4">Featured Properties</h2>
        <div class="row">
            @foreach($properties as $property)
            <div class="col-md-4 mb-4">
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
    </div>
</section>

<!-- Benefits Section -->
<section class="bg-light py-5">
    <div class="container">
        <h2 class="text-center mb-4">Why Choose Us</h2>
        <div class="row">
            <div class="col-md-4 text-center mb-4">
                <i class="fas fa-home fa-3x text-primary mb-3"></i>
                <h4>Unique Stays</h4>
                <p>Find places to stay that are perfect for your trip.</p>
            </div>
            <div class="col-md-4 text-center mb-4">
                <i class="fas fa-shield-alt fa-3x text-primary mb-3"></i>
                <h4>Secure Booking</h4>
                <p>Book with confidence with our secure payment system.</p>
            </div>
            <div class="col-md-4 text-center mb-4">
                <i class="fas fa-headset fa-3x text-primary mb-3"></i>
                <h4>24/7 Support</h4>
                <p>Our support team is always here to help you.</p>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-4">What Our Guests Say</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <img src="{{ asset('assets/images/users/john-doe.jpg') }}" class="rounded-circle me-3" alt="User" style="width: 50px; height: 50px; object-fit: cover;">
                            <div>
                                <h5 class="card-title mb-0">John Doe</h5>
                                <small class="text-muted">Verified Guest</small>
                            </div>
                        </div>
                        <p class="card-text">"Amazing experience! The property was exactly as described and the host was very helpful."</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <img src="{{ asset('assets/images/users/jane-smith.jpg') }}" class="rounded-circle me-3" alt="User" style="width: 50px; height: 50px; object-fit: cover;">
                            <div>
                                <h5 class="card-title mb-0">Jane Smith</h5>
                                <small class="text-muted">Verified Guest</small>
                            </div>
                        </div>
                        <p class="card-text">"Great location and beautiful property. Would definitely recommend to others!"</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <img src="{{ asset('assets/images/users/mike-johnson.jpg') }}" class="rounded-circle me-3" alt="User" style="width: 50px; height: 50px; object-fit: cover;">
                            <div>
                                <h5 class="card-title mb-0">Mike Johnson</h5>
                                <small class="text-muted">Verified Guest</small>
                            </div>
                        </div>
                        <p class="card-text">"Perfect for our family vacation. The amenities were excellent and the price was reasonable."</p>
                        <div class="text-warning">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection 