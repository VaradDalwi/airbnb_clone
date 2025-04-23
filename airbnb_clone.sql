-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 08:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airbnb_clone`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `property_id`, `user_id`, `check_in`, `check_out`, `adults`, `children`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2025-04-23', '2025-04-25', 2, 0, 500.00, 'pending', '2025-04-22 08:17:41', '2025-04-22 08:17:41'),
(2, 5, 2, '2025-04-23', '2025-04-25', 3, 0, 700.00, 'pending', '2025-04-22 08:32:31', '2025-04-22 08:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('airbnb_clone_cache_test@example.com|127.0.0.1', 'i:1;', 1745328750),
('airbnb_clone_cache_test@example.com|127.0.0.1:timer', 'i:1745328750;', 1745328750);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_19_000000_create_properties_table', 1),
(5, '2024_03_19_000001_create_property_images_table', 1),
(6, '2024_03_19_000002_create_bookings_table', 1),
(7, '2025_04_22_132010_add_max_guests_to_properties_table', 1),
(8, '2025_04_22_132126_add_coordinates_to_properties_table', 1),
(9, '2025_04_22_132212_add_user_id_to_properties_table', 1),
(10, '2024_03_20_000000_add_profile_fields_to_users_table', 2),
(11, '2025_04_22_162529_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `max_guests` int(11) NOT NULL,
  `amenities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`amenities`)),
  `featured_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `description`, `address`, `price_per_night`, `bedrooms`, `bathrooms`, `max_guests`, `amenities`, `featured_image`, `created_at`, `updated_at`, `latitude`, `longitude`, `user_id`) VALUES
(1, 'Luxury Beachfront Villa', 'Stunning beachfront villa with panoramic ocean views. Enjoy direct beach access, private pool, and modern amenities.', '123 Ocean Drive, Malibu, CA', 500.00, 4, 3, 8, '[\"wifi\",\"pool\",\"kitchen\",\"parking\",\"beach_access\"]', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(2, 'Downtown Loft', 'Modern loft in the heart of downtown. Walking distance to restaurants, shops, and entertainment.', '456 Main Street, New York, NY', 250.00, 2, 2, 4, '[\"wifi\",\"gym\",\"doorman\",\"parking\"]', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(3, 'Mountain Cabin Retreat', 'Cozy cabin surrounded by nature. Perfect for hiking, skiing, and outdoor activities.', '789 Pine Road, Aspen, CO', 300.00, 3, 2, 6, '[\"wifi\",\"fireplace\",\"kitchen\",\"hot_tub\"]', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(4, 'City View Apartment', 'Spacious apartment with stunning city views. Modern design and convenient location.', '321 Skyline Blvd, Chicago, IL', 200.00, 2, 1, 4, '[\"wifi\",\"gym\",\"pool\",\"parking\"]', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(5, 'Historic Townhouse', 'Beautifully restored historic townhouse in a charming neighborhood.', '654 Heritage Lane, Boston, MA', 350.00, 3, 2, 6, '[\"wifi\",\"garden\",\"kitchen\",\"parking\"]', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(6, 'Desert Oasis', 'Unique desert retreat with private pool and mountain views.', '987 Cactus Road, Phoenix, AZ', 275.00, 2, 2, 4, '[\"wifi\",\"pool\",\"kitchen\",\"parking\"]', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(7, 'Lakeside Cottage', 'Charming cottage on the lake with private dock and fishing access.', '147 Lake View Drive, Lake Tahoe, CA', 325.00, 2, 1, 4, '[\"wifi\",\"kitchen\",\"fishing\",\"kayak\"]', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(8, 'Modern Studio', 'Stylish studio apartment in a trendy neighborhood.', '258 Art District, Portland, OR', 150.00, 1, 1, 2, '[\"wifi\",\"gym\",\"parking\"]', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(9, 'Vineyard Estate', 'Luxurious estate surrounded by vineyards. Wine tasting and tours available.', '369 Wine Valley Road, Napa, CA', 600.00, 5, 4, 10, '[\"wifi\",\"pool\",\"kitchen\",\"wine_tasting\"]', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(10, 'Seaside Bungalow', 'Cozy bungalow steps from the beach. Perfect for a romantic getaway.', '741 Coastal Highway, Miami, FL', 225.00, 1, 1, 2, '[\"wifi\",\"beach_access\",\"kitchen\"]', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(11, 'Beautiful Studio in San Francisco', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '831 Main Street, Boston', 400.00, 3, 1, 9, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -76.00000000, -155.00000000, NULL),
(12, 'Beautiful House in Seattle', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '979 Main Street, Austin', 154.00, 2, 1, 8, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 53.00000000, -152.00000000, NULL),
(13, 'Beautiful Villa in Portland', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '668 Main Street, Los Angeles', 268.00, 2, 2, 7, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 86.00000000, 8.00000000, 2),
(14, 'Beautiful Condo in Chicago', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '64 Main Street, San Francisco', 453.00, 4, 3, 7, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -66.00000000, 24.00000000, 2),
(15, 'Beautiful Studio in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '725 Main Street, Boston', 335.00, 5, 3, 10, '\"[\\\"wifi\\\",\\\"gym\\\",\\\"parking\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -33.00000000, 39.00000000, 2),
(16, 'Beautiful House in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '316 Main Street, Boston', 453.00, 3, 2, 6, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 54.00000000, 111.00000000, 2),
(17, 'Beautiful Apartment in Austin', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '64 Main Street, Portland', 465.00, 3, 3, 6, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -41.00000000, 45.00000000, 2),
(18, 'Beautiful Condo in Seattle', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '603 Main Street, Denver', 136.00, 2, 3, 7, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 60.00000000, 40.00000000, NULL),
(19, 'Beautiful Studio in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '345 Main Street, Seattle', 273.00, 1, 2, 8, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -85.00000000, -114.00000000, 2),
(20, 'Beautiful Condo in New York', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '743 Main Street, Miami', 344.00, 2, 2, 6, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 69.00000000, -10.00000000, 2),
(21, 'Beautiful Studio in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '920 Main Street, Austin', 84.00, 5, 3, 2, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -17.00000000, -38.00000000, 2),
(22, 'Beautiful Condo in San Francisco', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '358 Main Street, Seattle', 499.00, 5, 3, 2, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -51.00000000, -178.00000000, NULL),
(23, 'Beautiful Apartment in Chicago', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '195 Main Street, Austin', 202.00, 2, 2, 5, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 45.00000000, 0.00000000, NULL),
(24, 'Beautiful Apartment in San Francisco', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '51 Main Street, New York', 410.00, 4, 2, 6, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 50.00000000, 100.00000000, 2),
(25, 'Beautiful Apartment in San Francisco', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '835 Main Street, New York', 234.00, 3, 2, 6, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -72.00000000, -147.00000000, NULL),
(26, 'Beautiful Condo in Austin', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '377 Main Street, New York', 156.00, 5, 1, 5, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 22.00000000, 45.00000000, 2),
(27, 'Beautiful House in Portland', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '484 Main Street, Miami', 475.00, 3, 3, 10, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 44.00000000, -40.00000000, NULL),
(28, 'Beautiful Studio in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '760 Main Street, Los Angeles', 246.00, 3, 2, 7, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -65.00000000, 73.00000000, 2),
(29, 'Beautiful Studio in Los Angeles', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '831 Main Street, Los Angeles', 445.00, 1, 1, 10, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -67.00000000, -65.00000000, NULL),
(30, 'Beautiful Condo in Miami', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '623 Main Street, Chicago', 384.00, 2, 1, 2, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 30.00000000, 175.00000000, 2),
(31, 'Beautiful Villa in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '801 Main Street, Miami', 144.00, 1, 3, 10, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -42.00000000, 137.00000000, NULL),
(32, 'Beautiful Villa in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '393 Main Street, San Francisco', 185.00, 1, 2, 9, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -38.00000000, -116.00000000, NULL),
(33, 'Beautiful House in New York', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '934 Main Street, Seattle', 196.00, 5, 2, 4, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -70.00000000, -141.00000000, NULL),
(34, 'Beautiful Villa in Portland', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '171 Main Street, Austin', 107.00, 4, 1, 10, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 86.00000000, -88.00000000, 2),
(35, 'Beautiful House in Austin', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '330 Main Street, New York', 264.00, 5, 1, 5, '\"[\\\"wifi\\\",\\\"gym\\\",\\\"parking\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -27.00000000, 25.00000000, 2),
(36, 'Beautiful Condo in New York', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '826 Main Street, Denver', 384.00, 4, 1, 8, '\"[\\\"wifi\\\",\\\"gym\\\",\\\"parking\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -24.00000000, -71.00000000, NULL),
(37, 'Beautiful House in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '77 Main Street, Chicago', 231.00, 1, 1, 8, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 49.00000000, -21.00000000, NULL),
(38, 'Beautiful Apartment in San Francisco', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '274 Main Street, Chicago', 266.00, 2, 3, 8, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 18.00000000, -88.00000000, NULL),
(39, 'Beautiful Villa in Seattle', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '284 Main Street, Miami', 128.00, 3, 3, 6, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 25.00000000, 68.00000000, NULL),
(40, 'Beautiful Villa in Los Angeles', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '504 Main Street, Portland', 292.00, 5, 1, 4, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 62.00000000, -126.00000000, NULL),
(41, 'Beautiful Studio in Portland', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '141 Main Street, Austin', 314.00, 4, 2, 7, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -88.00000000, -178.00000000, NULL),
(42, 'Beautiful Apartment in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '270 Main Street, San Francisco', 455.00, 4, 1, 3, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 67.00000000, -134.00000000, NULL),
(43, 'Beautiful Villa in San Francisco', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '730 Main Street, Miami', 80.00, 4, 3, 8, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -79.00000000, 117.00000000, 2),
(44, 'Beautiful Villa in Seattle', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '159 Main Street, Portland', 415.00, 5, 3, 9, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 87.00000000, -163.00000000, NULL),
(45, 'Beautiful House in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '477 Main Street, Los Angeles', 55.00, 1, 1, 10, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -74.00000000, -166.00000000, NULL),
(46, 'Beautiful Studio in Chicago', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '311 Main Street, Austin', 433.00, 5, 1, 8, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 15.00000000, 164.00000000, 2),
(47, 'Beautiful Apartment in Los Angeles', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '925 Main Street, Austin', 387.00, 2, 3, 4, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -12.00000000, -133.00000000, NULL),
(48, 'Beautiful Apartment in Chicago', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '252 Main Street, San Francisco', 164.00, 3, 3, 9, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"gym\\\"]\"', 'assets/images/properties/property1.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -1.00000000, 66.00000000, 2),
(49, 'Beautiful House in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '821 Main Street, Austin', 356.00, 1, 1, 2, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -4.00000000, 130.00000000, 2),
(50, 'Beautiful Studio in Miami', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '484 Main Street, New York', 341.00, 3, 3, 9, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -9.00000000, -22.00000000, NULL),
(51, 'Beautiful Studio in New York', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '882 Main Street, New York', 279.00, 5, 3, 6, '\"[\\\"wifi\\\",\\\"gym\\\",\\\"parking\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 50.00000000, 72.00000000, NULL),
(52, 'Beautiful Studio in Austin', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '724 Main Street, Chicago', 447.00, 4, 2, 5, '\"[\\\"wifi\\\",\\\"pool\\\",\\\"kitchen\\\",\\\"parking\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 68.00000000, 97.00000000, 2),
(53, 'Beautiful House in Chicago', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '242 Main Street, Austin', 493.00, 4, 2, 5, '\"[\\\"wifi\\\",\\\"gym\\\",\\\"parking\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 27.00000000, -70.00000000, 2),
(54, 'Beautiful Villa in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '972 Main Street, Denver', 289.00, 5, 1, 5, '\"[\\\"wifi\\\",\\\"gym\\\",\\\"parking\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -70.00000000, -50.00000000, NULL),
(55, 'Beautiful Condo in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '868 Main Street, Los Angeles', 254.00, 5, 2, 2, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property4.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -32.00000000, -81.00000000, NULL),
(56, 'Beautiful Studio in New York', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '734 Main Street, New York', 454.00, 1, 2, 7, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -73.00000000, -176.00000000, NULL),
(57, 'Beautiful Condo in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '471 Main Street, Denver', 155.00, 4, 3, 7, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property2.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', -38.00000000, 48.00000000, NULL),
(58, 'Beautiful Villa in Miami', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '895 Main Street, New York', 166.00, 3, 1, 5, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 13.00000000, 50.00000000, NULL),
(59, 'Beautiful Studio in Boston', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '734 Main Street, Boston', 481.00, 5, 1, 6, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"beach_access\\\"]\"', 'assets/images/properties/property3.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 51.00000000, -68.00000000, 2),
(60, 'Beautiful Studio in Denver', 'This is a beautiful property with amazing views and modern amenities. Perfect for your stay!', '71 Main Street, Denver', 154.00, 2, 1, 4, '\"[\\\"wifi\\\",\\\"kitchen\\\",\\\"parking\\\",\\\"hot_tub\\\"]\"', 'assets/images/properties/property5.jpg', '2025-04-22 08:00:20', '2025-04-22 08:00:20', 59.00000000, -36.00000000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `image_path`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 1, 'assets/images/properties/property5.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(2, 1, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(3, 1, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(4, 2, 'assets/images/properties/property5.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(5, 2, 'assets/images/properties/property1.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(6, 2, 'assets/images/properties/property4.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(7, 3, 'assets/images/properties/property2.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(8, 3, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(9, 3, 'assets/images/properties/property4.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(10, 4, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(11, 4, 'assets/images/properties/property4.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(12, 4, 'assets/images/properties/property1.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(13, 5, 'assets/images/properties/property4.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(14, 5, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(15, 5, 'assets/images/properties/property4.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(16, 6, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(17, 6, 'assets/images/properties/property2.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(18, 6, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(19, 7, 'assets/images/properties/property2.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(20, 7, 'assets/images/properties/property5.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(21, 7, 'assets/images/properties/property1.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(22, 8, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(23, 8, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(24, 8, 'assets/images/properties/property1.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(25, 9, 'assets/images/properties/property3.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(26, 9, 'assets/images/properties/property2.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(27, 9, 'assets/images/properties/property5.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(28, 10, 'assets/images/properties/property2.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(29, 10, 'assets/images/properties/property4.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20'),
(30, 10, 'assets/images/properties/property5.jpg', 0, '2025-04-22 08:00:20', '2025-04-22 08:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`, `address`, `profile_image`) VALUES
(2, 'John Doe', 'john@example.com', NULL, '$2y$12$EwnVyyX6AL0OyLRg/ui3euuCkYcHyL9CzXoauop6ryUQCel3TgrRe', '5TWQ1nV7OUEFFLhUrMQViWjFFdbX1Ay3YI7jEPrHhDL1N1xc09lMDiKIJMMo', '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL),
(3, 'Jane Smith', 'jane@example.com', NULL, '$2y$12$Z.Ai8hN5k.6nIH4PGVxLruiffSfLY1jKKLo..BXrVTA79/skiKe62', NULL, '2025-04-22 08:00:20', '2025-04-22 08:00:20', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_property_id_foreign` (`property_id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_user_id_foreign` (`user_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_images_property_id_foreign` (`property_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `property_images`
--
ALTER TABLE `property_images`
  ADD CONSTRAINT `property_images_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
