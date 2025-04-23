@extends('layouts.app')

@section('content')
<div class="container-fluid px-4">
    <div class="row justify-content-center">
        <div class="col-md-11">
            <div class="card">
                <div class="card-header bg-white py-3">
                    <h2 class="mb-0">My Bookings</h2>
                </div>
                <div class="card-body">
                    @if($bookings->isEmpty())
                        <div class="alert alert-info">
                            You haven't made any bookings yet. <a href="{{ route('properties.index') }}">Browse properties</a> to make your first booking!
                        </div>
                    @else
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th class="py-3">Property</th>
                                        <th class="py-3">Location</th>
                                        <th class="py-3">Check-in</th>
                                        <th class="py-3">Check-out</th>
                                        <th class="py-3">Guests</th>
                                        <th class="py-3">Total Price</th>
                                        <th class="py-3">Status</th>
                                        <th class="py-3">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($bookings as $booking)
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="{{ asset($booking->property->featured_image) }}" alt="{{ $booking->property->title }}" class="rounded" style="width: 80px; height: 80px; object-fit: cover;">
                                                <div class="ms-3">
                                                    <h6 class="mb-1">{{ $booking->property->title }}</h6>
                                                    <small class="text-muted">{{ $booking->property->bedrooms }} beds • {{ $booking->property->bathrooms }} baths</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-map-marker-alt text-primary me-2"></i>
                                                <span>{{ $booking->property->address }}</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <span class="fw-bold">{{ $booking->check_in->format('M d') }}</span>
                                                <small class="text-muted">{{ $booking->check_in->format('Y') }}</small>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <span class="fw-bold">{{ $booking->check_out->format('M d') }}</span>
                                                <small class="text-muted">{{ $booking->check_out->format('Y') }}</small>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <span class="fw-bold">{{ $booking->adults }} adults</span>
                                                @if($booking->children > 0)
                                                    <small class="text-muted">{{ $booking->children }} children</small>
                                                @endif
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <span class="fw-bold">${{ number_format($booking->total_price + 70, 2) }}</span>
                                                <small class="text-muted">Total</small>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge bg-{{ $booking->status === 'confirmed' ? 'success' : ($booking->status === 'cancelled' ? 'danger' : 'warning') }} px-3 py-2">
                                                {{ ucfirst($booking->status) }}
                                            </span>
                                        </td>
                                        <td>
                                            <a href="{{ route('bookings.show', $booking) }}" class="btn btn-primary btn-sm px-3">
                                                <i class="fas fa-eye me-1"></i> View
                                            </a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .table > :not(caption) > * > * {
        padding: 1rem 0.75rem;
    }
    .badge {
        font-size: 0.85rem;
    }
    .btn-sm {
        padding: 0.5rem 1rem;
    }
</style>
@endsection 