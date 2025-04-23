<?php

namespace App\Providers;

use App\Models\Booking;
use App\Policies\BookingPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    protected $policies = [
        Booking::class => BookingPolicy::class,
    ];

    public function boot(): void
    {
        $this->registerPolicies();

        Gate::define('view-booking', [BookingPolicy::class, 'viewBooking']);
    }
} 