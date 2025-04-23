<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Property;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class BookingController extends Controller
{
    public function index()
    {
        $bookings = Auth::user()->bookings()->with('property')->latest()->get();
        return view('bookings.index', compact('bookings'));
    }

    public function store(Request $request, Property $property)
    {
        try {
            $validated = $request->validate([
                'check_in' => 'required|date|after:today',
                'check_out' => 'required|date|after:check_in',
                'adults' => 'required|integer|min:1',
                'children' => 'required|integer|min:0',
            ]);

            if (!Auth::check()) {
                Log::error('User not authenticated when trying to make a booking');
                return redirect()->route('login')->with('error', 'Please log in to make a booking.');
            }

            $nights = \Carbon\Carbon::parse($request->check_in)->diffInDays($request->check_out);
            $total_price = $property->price_per_night * $nights;

            $booking = Booking::create([
                'property_id' => $property->id,
                'user_id' => Auth::id(),
                'check_in' => $request->check_in,
                'check_out' => $request->check_out,
                'adults' => $request->adults,
                'children' => $request->children,
                'total_price' => $total_price,
                'status' => 'pending',
            ]);

            return redirect()->route('bookings.show', $booking);
        } catch (ValidationException $e) {
            Log::error('Validation error in booking: ' . json_encode($e->errors()));
            throw $e;
        } catch (\Exception $e) {
            Log::error('Booking error: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());
            return back()->withErrors(['error' => 'There was an error processing your booking. Please try again.']);
        }
    }

    public function show(Booking $booking)
    {
        if (!Gate::allows('view-booking', $booking)) {
            abort(403);
        }
        return view('bookings.show', compact('booking'));
    }

    public function calculatePrice(Request $request, Property $property)
    {
        $request->validate([
            'check_in' => 'required|date|after:today',
            'check_out' => 'required|date|after:check_in',
        ]);

        $nights = \Carbon\Carbon::parse($request->check_in)->diffInDays($request->check_out);
        $total_price = $property->price_per_night * $nights;

        return response()->json([
            'nights' => $nights,
            'price_per_night' => $property->price_per_night,
            'total_price' => $total_price,
        ]);
    }
}
