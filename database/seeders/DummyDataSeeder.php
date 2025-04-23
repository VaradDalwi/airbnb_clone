<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Property;
use Illuminate\Support\Facades\Hash;

class DummyDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create 2 users
        $users = [
            [
                'name' => 'John Doe',
                'email' => 'john@example.com',
                'password' => Hash::make('password123'),
            ],
            [
                'name' => 'Jane Smith',
                'email' => 'jane@example.com',
                'password' => Hash::make('password123'),
            ],
        ];

        foreach ($users as $userData) {
            User::create($userData);
        }

        // Create 50 properties
        $propertyTypes = ['Apartment', 'House', 'Villa', 'Condo', 'Studio'];
        $locations = [
            'New York', 'Los Angeles', 'Chicago', 'Miami', 'San Francisco',
            'Seattle', 'Boston', 'Austin', 'Denver', 'Portland'
        ];
        $amenities = [
            ['wifi', 'pool', 'kitchen', 'parking'],
            ['wifi', 'gym', 'parking'],
            ['wifi', 'kitchen', 'beach_access'],
            ['wifi', 'pool', 'kitchen', 'parking', 'gym'],
            ['wifi', 'kitchen', 'parking', 'hot_tub']
        ];

        for ($i = 1; $i <= 50; $i++) {
            Property::create([
                'title' => 'Beautiful ' . $propertyTypes[array_rand($propertyTypes)] . ' in ' . $locations[array_rand($locations)],
                'description' => 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!',
                'price_per_night' => rand(50, 500),
                'bedrooms' => rand(1, 5),
                'bathrooms' => rand(1, 3),
                'max_guests' => rand(2, 10),
                'address' => rand(1, 1000) . ' Main Street, ' . $locations[array_rand($locations)],
                'latitude' => rand(-90, 90),
                'longitude' => rand(-180, 180),
                'user_id' => rand(1, 2), // Randomly assign to one of the two users
                'amenities' => json_encode($amenities[array_rand($amenities)]),
                'featured_image' => 'assets/images/properties/property' . rand(1, 5) . '.jpg',
            ]);
        }
    }
}
