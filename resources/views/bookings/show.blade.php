@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h2 class="mb-0">Booking Confirmation</h2>
                </div>
                <div class="card-body">
                    <div class="alert alert-success">
                        <h4 class="alert-heading">Booking Successful!</h4>
                        <p>Your booking has been confirmed. Here are your booking details:</p>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h4>Property Details</h4>
                            <p><strong>Property:</strong> {{ $booking->property->title }}</p>
                            <p><strong>Address:</strong> {{ $booking->property->address }}</p>
                            <p><strong>Check-in:</strong> {{ $booking->check_in->format('M d, Y') }}</p>
                            <p><strong>Check-out:</strong> {{ $booking->check_out->format('M d, Y') }}</p>
                        </div>
                        <div class="col-md-6">
                            <h4>Guest Details</h4>
                            <p><strong>Adults:</strong> {{ $booking->adults }}</p>
                            <p><strong>Children:</strong> {{ $booking->children }}</p>
                            <p><strong>Total Nights:</strong> {{ $booking->check_in->diffInDays($booking->check_out) }}</p>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            <h4 class="mb-0">Price Breakdown</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2">
                                <span>Price per night</span>
                                <span>${{ number_format($booking->property->price_per_night, 2) }}</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Number of nights</span>
                                <span>{{ $booking->check_in->diffInDays($booking->check_out) }}</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Cleaning fee</span>
                                <span>$50.00</span>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Service fee</span>
                                <span>$20.00</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <strong>Total</strong>
                                <strong>${{ number_format($booking->total_price + 70, 2) }}</strong>
                            </div>
                        </div>
                    </div>

                    <div class="text-center">
                        <a href="{{ route('home') }}" class="btn btn-primary">Return to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 