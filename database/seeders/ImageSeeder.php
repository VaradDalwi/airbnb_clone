<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;

class ImageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Download user profile images
        $userImages = [
            'john-doe.jpg' => 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
            'jane-smith.jpg' => 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
            'mike-johnson.jpg' => 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
        ];

        foreach ($userImages as $filename => $url) {
            $response = Http::get($url);
            if ($response->successful()) {
                File::put(public_path("assets/images/users/{$filename}"), $response->body());
            }
        }

        // Download property images
        $propertyImages = [
            'property1.jpg' => 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750',
            'property2.jpg' => 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688',
            'property3.jpg' => 'https://images.unsplash.com/photo-1518780664697-55e3ad937233',
            'property4.jpg' => 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
            'property5.jpg' => 'https://images.unsplash.com/photo-1564013799919-ab600027ffc6',
        ];

        foreach ($propertyImages as $filename => $url) {
            $response = Http::get($url);
            if ($response->successful()) {
                File::put(public_path("assets/images/properties/{$filename}"), $response->body());
            }
        }
    }
}
