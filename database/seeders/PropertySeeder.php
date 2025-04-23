<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Property;
use App\Models\PropertyImage;

class PropertySeeder extends Seeder
{
    public function run()
    {
        $properties = [
            [
                'title' => 'Luxury Beachfront Villa',
                'description' => 'Stunning beachfront villa with panoramic ocean views. Enjoy direct beach access, private pool, and modern amenities.',
                'address' => '123 Ocean Drive, Malibu, CA',
                'price_per_night' => 500.00,
                'bedrooms' => 4,
                'bathrooms' => 3,
                'max_guests' => 8,
                'amenities' => ['wifi', 'pool', 'kitchen', 'parking', 'beach_access'],
                'featured_image' => 'assets/images/properties/property1.jpg',
            ],
            [
                'title' => 'Downtown Loft',
                'description' => 'Modern loft in the heart of downtown. Walking distance to restaurants, shops, and entertainment.',
                'address' => '456 Main Street, New York, NY',
                'price_per_night' => 250.00,
                'bedrooms' => 2,
                'bathrooms' => 2,
                'max_guests' => 4,
                'amenities' => ['wifi', 'gym', 'doorman', 'parking'],
                'featured_image' => 'assets/images/properties/property2.jpg',
            ],
            [
                'title' => 'Mountain Cabin Retreat',
                'description' => 'Cozy cabin surrounded by nature. Perfect for hiking, skiing, and outdoor activities.',
                'address' => '789 Pine Road, Aspen, CO',
                'price_per_night' => 300.00,
                'bedrooms' => 3,
                'bathrooms' => 2,
                'max_guests' => 6,
                'amenities' => ['wifi', 'fireplace', 'kitchen', 'hot_tub'],
                'featured_image' => 'assets/images/properties/property3.jpg',
            ],
            [
                'title' => 'City View Apartment',
                'description' => 'Spacious apartment with stunning city views. Modern design and convenient location.',
                'address' => '321 Skyline Blvd, Chicago, IL',
                'price_per_night' => 200.00,
                'bedrooms' => 2,
                'bathrooms' => 1,
                'max_guests' => 4,
                'amenities' => ['wifi', 'gym', 'pool', 'parking'],
                'featured_image' => 'assets/images/properties/property4.jpg',
            ],
            [
                'title' => 'Historic Townhouse',
                'description' => 'Beautifully restored historic townhouse in a charming neighborhood.',
                'address' => '654 Heritage Lane, Boston, MA',
                'price_per_night' => 350.00,
                'bedrooms' => 3,
                'bathrooms' => 2,
                'max_guests' => 6,
                'amenities' => ['wifi', 'garden', 'kitchen', 'parking'],
                'featured_image' => 'assets/images/properties/property5.jpg',
            ],
            [
                'title' => 'Desert Oasis',
                'description' => 'Unique desert retreat with private pool and mountain views.',
                'address' => '987 Cactus Road, Phoenix, AZ',
                'price_per_night' => 275.00,
                'bedrooms' => 2,
                'bathrooms' => 2,
                'max_guests' => 4,
                'amenities' => ['wifi', 'pool', 'kitchen', 'parking'],
                'featured_image' => 'assets/images/properties/property1.jpg',
            ],
            [
                'title' => 'Lakeside Cottage',
                'description' => 'Charming cottage on the lake with private dock and fishing access.',
                'address' => '147 Lake View Drive, Lake Tahoe, CA',
                'price_per_night' => 325.00,
                'bedrooms' => 2,
                'bathrooms' => 1,
                'max_guests' => 4,
                'amenities' => ['wifi', 'kitchen', 'fishing', 'kayak'],
                'featured_image' => 'assets/images/properties/property2.jpg',
            ],
            [
                'title' => 'Modern Studio',
                'description' => 'Stylish studio apartment in a trendy neighborhood.',
                'address' => '258 Art District, Portland, OR',
                'price_per_night' => 150.00,
                'bedrooms' => 1,
                'bathrooms' => 1,
                'max_guests' => 2,
                'amenities' => ['wifi', 'gym', 'parking'],
                'featured_image' => 'assets/images/properties/property3.jpg',
            ],
            [
                'title' => 'Vineyard Estate',
                'description' => 'Luxurious estate surrounded by vineyards. Wine tasting and tours available.',
                'address' => '369 Wine Valley Road, Napa, CA',
                'price_per_night' => 600.00,
                'bedrooms' => 5,
                'bathrooms' => 4,
                'max_guests' => 10,
                'amenities' => ['wifi', 'pool', 'kitchen', 'wine_tasting'],
                'featured_image' => 'assets/images/properties/property4.jpg',
            ],
            [
                'title' => 'Seaside Bungalow',
                'description' => 'Cozy bungalow steps from the beach. Perfect for a romantic getaway.',
                'address' => '741 Coastal Highway, Miami, FL',
                'price_per_night' => 225.00,
                'bedrooms' => 1,
                'bathrooms' => 1,
                'max_guests' => 2,
                'amenities' => ['wifi', 'beach_access', 'kitchen'],
                'featured_image' => 'assets/images/properties/property5.jpg',
            ],
        ];

        foreach ($properties as $propertyData) {
            $property = Property::create($propertyData);

            // Create additional images for each property
            for ($i = 0; $i < 3; $i++) {
                PropertyImage::create([
                    'property_id' => $property->id,
                    'image_path' => 'assets/images/properties/property' . rand(1, 5) . '.jpg',
                    'is_featured' => false,
                ]);
            }
        }
    }
} 