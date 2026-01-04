-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 24, 2025 at 04:53 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wigglepop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'QRIS',
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','processing','completed','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `color_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `color_value` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` enum('phonestrap','keychain','bracelet','custom') COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gradient` text COLLATE utf8mb4_general_ci,
  `emoji` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT '4.5',
  `reviews` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `gradient`, `emoji`, `rating`, `reviews`, `created_at`, `updated_at`) VALUES
(1, 'Daisy Chain Strap', 'phonestrap', 30000.00, 'images/phonestrap/daisy-chain.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #AB9DFF 100%)', NULL, 4.8, 45, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(2, 'Stars Night Strap', 'phonestrap', 32000.00, 'images/phonestrap/stars-night.jpg', 'linear-gradient(135deg, #253A82 0%, #88A2FF 100%)', NULL, 4.9, 52, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(3, 'Rainbow Dream Strap', 'phonestrap', 33000.00, 'images/phonestrap/rainbow-dream.jpg', 'linear-gradient(135deg, #E3FC87 0%, #C0E0FF 100%)', NULL, 4.7, 38, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(4, 'Cherry Blossom Strap', 'phonestrap', 31000.00, 'images/phonestrap/cherry-blossom.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #FFE5F1 100%)', NULL, 4.8, 41, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(5, 'Ocean Wave Strap', 'phonestrap', 34000.00, 'images/phonestrap/ocean-wave.jpg', 'linear-gradient(135deg, #88A2FF 0%, #C0E0FF 100%)', NULL, 4.9, 48, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(6, 'Butterfly Garden Strap', 'phonestrap', 35000.00, 'images/phonestrap/butterfly-garden.jpg', 'linear-gradient(135deg, #AB9DFF 0%, #E3FC87 100%)', NULL, 4.7, 36, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(7, 'Sunset Glow Strap', 'phonestrap', 32000.00, 'images/phonestrap/sunset-glow.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #E3FC87 100%)', NULL, 4.8, 44, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(8, 'Moon Phases Strap', 'phonestrap', 33000.00, 'images/phonestrap/moon-phases.jpg', 'linear-gradient(135deg, #253A82 0%, #AB9DFF 100%)', NULL, 4.9, 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(9, 'Flower Power Strap', 'phonestrap', 31000.00, 'images/phonestrap/flower-power.jpg', 'linear-gradient(135deg, #E3FC87 0%, #FFB2E7 100%)', NULL, 4.6, 33, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(10, 'Sparkle Magic Strap', 'phonestrap', 36000.00, 'images/phonestrap/sparkle-magic.jpg', 'linear-gradient(135deg, #AB9DFF 0%, #C0E0FF 100%)', NULL, 4.9, 55, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(11, 'Flower Keychain', 'keychain', 25000.00, 'images/keychain/flower.jpg', 'linear-gradient(135deg, #88A2FF 0%, #AB9DFF 100%)', NULL, 4.8, 62, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(12, 'Rainbow Keychain', 'keychain', 28000.00, 'images/keychain/rainbow.jpg', 'linear-gradient(135deg, #E3FC87 0%, #C0E0FF 100%)', NULL, 4.9, 58, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(13, 'Ribbon Keychain', 'keychain', 26000.00, 'images/keychain/ribbon.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #AB9DFF 100%)', NULL, 4.7, 47, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(14, 'Star Keychain', 'keychain', 27000.00, 'images/keychain/star.jpg', 'linear-gradient(135deg, #253A82 0%, #88A2FF 100%)', NULL, 4.8, 53, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(15, 'Cloud Keychain', 'keychain', 29000.00, 'images/keychain/cloud.jpg', 'linear-gradient(135deg, #C0E0FF 0%, #88A2FF 100%)', NULL, 4.9, 61, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(16, 'Butterfly Keychain', 'keychain', 28000.00, 'images/keychain/butterfly.jpg', 'linear-gradient(135deg, #AB9DFF 0%, #E3FC87 100%)', NULL, 4.7, 44, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(17, 'Smiley Keychain', 'keychain', 26000.00, 'images/keychain/smiley.jpg', 'linear-gradient(135deg, #E3FC87 0%, #FFB2E7 100%)', NULL, 4.8, 56, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(18, 'Moon Keychain', 'keychain', 27000.00, 'images/keychain/moon.jpg', 'linear-gradient(135deg, #253A82 0%, #AB9DFF 100%)', NULL, 4.9, 49, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(19, 'Cherry Keychain', 'keychain', 25000.00, 'images/keychain/cherry.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #E3FC87 100%)', NULL, 4.6, 39, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(20, 'Sparkle Keychain', 'keychain', 30000.00, 'images/keychain/sparkle.jpg', 'linear-gradient(135deg, #AB9DFF 0%, #C0E0FF 100%)', NULL, 4.9, 67, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(21, 'Pastel Dream Bracelet', 'bracelet', 35000.00, 'images/bracellet/pastel-dream.jpg', 'linear-gradient(135deg, #C0E0FF 0%, #E3FC87 100%)', NULL, 4.9, 71, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(22, 'Butterfly Charm Bracelet', 'bracelet', 38000.00, 'images/bracellet/butterfly-charm.jpg', 'linear-gradient(135deg, #AB9DFF 0%, #FFB2E7 100%)', NULL, 4.8, 64, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(23, 'Ocean Beads Bracelet', 'bracelet', 36000.00, 'images/bracellet/ocean-beads.jpg', 'linear-gradient(135deg, #88A2FF 0%, #C0E0FF 100%)', NULL, 4.7, 55, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(24, 'Rainbow Pearl Bracelet', 'bracelet', 37000.00, 'images/bracellet/rainbow-pearl.jpg', 'linear-gradient(135deg, #E3FC87 0%, #FFB2E7 100%)', NULL, 4.9, 68, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(25, 'Flower Garden Bracelet', 'bracelet', 39000.00, 'images/bracellet/flower-garden.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #AB9DFF 100%)', NULL, 4.8, 62, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(26, 'Star Galaxy Bracelet', 'bracelet', 40000.00, 'images/bracellet/star-galaxy.jpg', 'linear-gradient(135deg, #253A82 0%, #88A2FF 100%)', NULL, 4.9, 73, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(27, 'Crystal Clear Bracelet', 'bracelet', 38000.00, 'images/bracellet/crystal-clear.jpg', 'linear-gradient(135deg, #C0E0FF 0%, #AB9DFF 100%)', NULL, 4.7, 58, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(28, 'Sunset Glow Bracelet', 'bracelet', 37000.00, 'images/bracellet/sunset-glow.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #E3FC87 100%)', NULL, 4.8, 60, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(29, 'Heart Love Bracelet', 'bracelet', 36000.00, 'images/bracellet/heart-love.jpg', 'linear-gradient(135deg, #FFB2E7 0%, #C0E0FF 100%)', NULL, 4.9, 69, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(30, 'Magic Sparkle Bracelet', 'bracelet', 42000.00, 'images/bracellet/magic-sparkle.jpg', 'linear-gradient(135deg, #AB9DFF 0%, #E3FC87 100%)', NULL, 4.9, 78, '2025-12-23 15:54:38', '2025-12-23 15:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `stock_in`
--

CREATE TABLE `stock_in` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `color_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `color_value` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_in`
--

INSERT INTO `stock_in` (`id`, `product_id`, `color_name`, `color_value`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(2, 2, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(3, 3, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(4, 4, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(5, 5, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(6, 6, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(7, 7, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(8, 8, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(9, 9, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(10, 10, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(11, 11, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(12, 12, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(13, 13, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(14, 14, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(15, 15, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(16, 16, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(17, 17, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(18, 18, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(19, 19, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(20, 20, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(21, 21, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(22, 22, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(23, 23, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(24, 24, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(25, 25, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(26, 26, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(27, 27, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(28, 28, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(29, 29, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(30, 30, 'Pink', '#FFB2E7', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(31, 1, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(32, 2, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(33, 3, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(34, 4, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(35, 5, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(36, 6, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(37, 7, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(38, 8, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(39, 9, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(40, 10, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(41, 11, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(42, 12, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(43, 13, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(44, 14, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(45, 15, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(46, 16, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(47, 17, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(48, 18, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(49, 19, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(50, 20, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(51, 21, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(52, 22, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(53, 23, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(54, 24, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(55, 25, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(56, 26, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(57, 27, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(58, 28, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(59, 29, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(60, 30, 'Purple', '#AB9DFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(61, 1, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(62, 2, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(63, 3, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(64, 4, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(65, 5, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(66, 6, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(67, 7, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(68, 8, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(69, 9, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(70, 10, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(71, 11, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(72, 12, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(73, 13, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(74, 14, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(75, 15, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(76, 16, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(77, 17, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(78, 18, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(79, 19, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(80, 20, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(81, 21, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(82, 22, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(83, 23, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(84, 24, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(85, 25, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(86, 26, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(87, 27, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(88, 28, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(89, 29, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(90, 30, 'Blue', '#88A2FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(91, 1, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(92, 2, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(93, 3, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(94, 4, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(95, 5, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(96, 6, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(97, 7, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(98, 8, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(99, 9, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(100, 10, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(101, 11, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(102, 12, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(103, 13, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(104, 14, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(105, 15, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(106, 16, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(107, 17, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(108, 18, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(109, 19, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(110, 20, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(111, 21, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(112, 22, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(113, 23, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(114, 24, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(115, 25, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(116, 26, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(117, 27, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(118, 28, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(119, 29, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(120, 30, 'Sky', '#C0E0FF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(121, 1, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(122, 2, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(123, 3, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(124, 4, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(125, 5, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(126, 6, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(127, 7, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(128, 8, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(129, 9, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(130, 10, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(131, 11, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(132, 12, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(133, 13, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(134, 14, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(135, 15, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(136, 16, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(137, 17, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(138, 18, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(139, 19, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(140, 20, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(141, 21, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(142, 22, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(143, 23, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(144, 24, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(145, 25, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(146, 26, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(147, 27, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(148, 28, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(149, 29, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(150, 30, 'Neon', '#E3FC87', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(151, 1, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(152, 2, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(153, 3, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(154, 4, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(155, 5, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(156, 6, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(157, 7, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(158, 8, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(159, 9, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(160, 10, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(161, 11, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(162, 12, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(163, 13, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(164, 14, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(165, 15, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(166, 16, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(167, 17, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(168, 18, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(169, 19, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(170, 20, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(171, 21, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(172, 22, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(173, 23, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(174, 24, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(175, 25, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(176, 26, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(177, 27, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(178, 28, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(179, 29, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(180, 30, 'Navy', '#253A82', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(181, 1, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(182, 2, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(183, 3, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(184, 4, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(185, 5, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(186, 6, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(187, 7, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(188, 8, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(189, 9, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(190, 10, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(191, 11, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(192, 12, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(193, 13, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(194, 14, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(195, 15, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(196, 16, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(197, 17, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(198, 18, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(199, 19, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(200, 20, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(201, 21, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(202, 22, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(203, 23, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(204, 24, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(205, 25, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(206, 26, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(207, 27, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(208, 28, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(209, 29, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(210, 30, 'White', '#FFFFFF', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(211, 1, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(212, 2, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(213, 3, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(214, 4, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(215, 5, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(216, 6, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(217, 7, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(218, 8, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(219, 9, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(220, 10, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(221, 11, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(222, 12, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(223, 13, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(224, 14, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(225, 15, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(226, 16, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(227, 17, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(228, 18, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(229, 19, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(230, 20, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(231, 21, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(232, 22, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(233, 23, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(234, 24, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(235, 25, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(236, 26, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(237, 27, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(238, 28, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(239, 29, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38'),
(240, 30, 'Black', '#2D3748', 50, '2025-12-23 15:54:38', '2025-12-23 15:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'WigglePop', 'admin@wigglepop.id', '081234567890', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '2025-12-23 15:54:38', '2025-12-23 15:54:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_in`
--
ALTER TABLE `stock_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `stock_in`
--
ALTER TABLE `stock_in`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_in`
--
ALTER TABLE `stock_in`
  ADD CONSTRAINT `stock_in_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
