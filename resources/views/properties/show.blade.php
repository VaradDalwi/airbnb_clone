@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <!-- Property Images -->
        <div class="col-md-8">
            <div id="propertyCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="{{ asset($property->featured_image) }}" class="d-block w-100" alt="{{ $property->title }}">
                    </div>
                    @foreach($property->images as $image)
                    <div class="carousel-item">
                        <img src="{{ asset($image->image_path) }}" class="d-block w-100" alt="{{ $property->title }}">
                    </div>
                    @endforeach
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#propertyCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#propertyCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>

            <!-- Property Details -->
            <div class="card mb-4">
                <div class="card-body">
                    <h1 class="card-title">{{ $property->title }}</h1>
                    <p class="card-text">
                        <i class="fas fa-map-marker-alt text-primary"></i> {{ $property->address }}
                    </p>
                    <div class="d-flex mb-3">
                        <span class="me-3">
                            <i class="fas fa-bed text-primary"></i> {{ $property->bedrooms }} bedrooms
                        </span>
                        <span class="me-3">
                            <i class="fas fa-bath text-primary"></i> {{ $property->bathrooms }} bathrooms
                        </span>
                    </div>
                    <h4>About this property</h4>
                    <p class="card-text">{{ $property->description }}</p>
                    
                    <h4>Amenities</h4>
                    <div class="row">
                        @foreach($property->amenities as $amenity)
                        <div class="col-md-4 mb-2">
                            <i class="fas fa-check text-primary"></i> {{ ucfirst($amenity) }}
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <!-- Booking Widget -->
        <div class="col-md-4">
            <div class="card sticky-top" style="top: 20px;">
                <div class="card-body">
                    <h3 class="card-title">${{ number_format($property->price_per_night, 2) }} <small class="text-muted">per night</small></h3>
                    
                    @if($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                    @endif

                    <form action="{{ route('bookings.store', $property) }}" method="POST" id="bookingForm">
                        @csrf
                        <div class="mb-3">
                            <label for="check_in" class="form-label">Check-in</label>
                            <input type="date" class="form-control @error('check_in') is-invalid @enderror" id="check_in" name="check_in" value="{{ old('check_in') }}" required>
                            @error('check_in')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="check_out" class="form-label">Check-out</label>
                            <input type="date" class="form-control @error('check_out') is-invalid @enderror" id="check_out" name="check_out" value="{{ old('check_out') }}" required>
                            @error('check_out')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="adults" class="form-label">Adults</label>
                            <select class="form-select @error('adults') is-invalid @enderror" id="adults" name="adults" required>
                                <option value="1" {{ old('adults') == 1 ? 'selected' : '' }}>1</option>
                                <option value="2" {{ old('adults') == 2 ? 'selected' : '' }}>2</option>
                                <option value="3" {{ old('adults') == 3 ? 'selected' : '' }}>3</option>
                                <option value="4" {{ old('adults') == 4 ? 'selected' : '' }}>4</option>
                                <option value="5" {{ old('adults') == 5 ? 'selected' : '' }}>5+</option>
                            </select>
                            @error('adults')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="children" class="form-label">Children</label>
                            <select class="form-select @error('children') is-invalid @enderror" id="children" name="children" required>
                                <option value="0" {{ old('children') == 0 ? 'selected' : '' }}>0</option>
                                <option value="1" {{ old('children') == 1 ? 'selected' : '' }}>1</option>
                                <option value="2" {{ old('children') == 2 ? 'selected' : '' }}>2</option>
                                <option value="3" {{ old('children') == 3 ? 'selected' : '' }}>3</option>
                                <option value="4" {{ old('children') == 4 ? 'selected' : '' }}>4</option>
                            </select>
                            @error('children')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div id="priceBreakdown" class="mb-3">
                            <div class="d-flex justify-content-between">
                                <span>${{ number_format($property->price_per_night, 2) }} x <span id="nights">0</span> nights</span>
                                <span id="subtotal">$0.00</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Cleaning fee</span>
                                <span>$50.00</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <span>Service fee</span>
                                <span>$20.00</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <strong>Total</strong>
                                <strong id="totalPrice">$0.00</strong>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100">Book Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const checkInInput = document.getElementById('check_in');
    const checkOutInput = document.getElementById('check_out');
    const nightsSpan = document.getElementById('nights');
    const subtotalSpan = document.getElementById('subtotal');
    const totalPriceSpan = document.getElementById('totalPrice');
    const pricePerNight = {{ $property->price_per_night }};
    
    function calculatePrice() {
        const checkIn = new Date(checkInInput.value);
        const checkOut = new Date(checkOutInput.value);
        
        if (checkIn && checkOut && checkOut > checkIn) {
            const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));
            const subtotal = nights * pricePerNight;
            const total = subtotal + 50 + 20; // Adding cleaning and service fees
            
            nightsSpan.textContent = nights;
            subtotalSpan.textContent = `$${subtotal.toFixed(2)}`;
            totalPriceSpan.textContent = `$${total.toFixed(2)}`;
        }
    }
    
    checkInInput.addEventListener('change', calculatePrice);
    checkOutInput.addEventListener('change', calculatePrice);
});
</script>
@endpush
@endsection 