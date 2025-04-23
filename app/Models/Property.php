<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'address',
        'price_per_night',
        'bedrooms',
        'bathrooms',
        'amenities',
        'featured_image',
    ];

    protected $casts = [
        'amenities' => 'array',
        'price_per_night' => 'decimal:2',
    ];

    public function images()
    {
        return $this->hasMany(PropertyImage::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }

    public function featuredImage()
    {
        return $this->hasOne(PropertyImage::class)->where('is_featured', true);
    }
}
