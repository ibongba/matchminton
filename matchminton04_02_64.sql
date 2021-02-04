-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2021 at 12:19 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `matchminton`
--

-- --------------------------------------------------------

--
-- Table structure for table `card_user`
--

CREATE TABLE `card_user` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `expire_month` varchar(255) DEFAULT NULL,
  `expire_year` varchar(255) DEFAULT NULL,
  `cvc_no` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `amount` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `amount`, `created_at`, `updated_at`, `remark`) VALUES
(105, 4, 102, 1, '2021-02-03 16:58:07', '2021-02-03 16:58:07', ''),
(106, 4, 101, 2, '2021-02-03 16:59:48', '2021-02-03 16:59:48', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `card_id` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_status` tinyint(2) NOT NULL DEFAULT 0,
  `total_price` double DEFAULT 0,
  `remark` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking` varchar(50) DEFAULT NULL,
  `stataus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `card_id`, `address`, `payment_status`, `total_price`, `remark`, `created_at`, `updated_at`, `tracking`, `stataus`) VALUES
(100000, 3, '555', '', 1, -15, '', '2020-12-05 00:34:44', '2020-12-04 17:34:44', NULL, 1),
(100001, 3, '555', '', 1, -15, '', '2020-12-05 00:35:41', '2020-12-04 17:35:41', NULL, 1),
(100002, 4, '555', '', 1, 0, '', '2020-12-13 23:19:16', '2020-12-13 16:19:16', NULL, 1),
(100003, 3, '555', '', 1, 0, '', '2020-12-13 23:20:31', '2020-12-13 16:20:31', NULL, 1),
(100004, 4, '555', '', 1, 0, '', '2020-12-13 23:23:50', '2020-12-13 16:23:50', NULL, 1),
(100005, 4, '555', '', 1, 0, '', '2020-12-13 23:48:47', '2020-12-13 16:48:47', NULL, 1),
(100006, 3, '555', '', 1, 0, '', '2020-12-14 00:59:51', '2020-12-13 17:59:51', NULL, 1),
(100007, 4, '555', '', 1, 0, '', '2020-12-14 01:01:08', '2020-12-13 18:01:08', NULL, 1),
(100008, 4, '555', '', 1, 0, '', '2020-12-14 01:04:42', '2020-12-13 18:04:42', NULL, 1),
(100009, 4, '555', '', 1, 15252, '', '2020-12-14 01:28:05', '2020-12-13 18:28:05', NULL, 1),
(100010, 4, '555', '', 1, 18504, '', '2020-12-14 01:58:18', '2020-12-13 18:58:18', NULL, 0),
(100011, 4, '555', '', 1, 0, '', '2020-12-14 01:59:55', '2020-12-13 18:59:55', NULL, 1),
(100012, 4, '555', '', 1, 18872, '', '2020-12-14 02:01:51', '2020-12-13 19:01:51', NULL, 1),
(100013, 4, '555', '', 1, 15272, '', '2020-12-14 17:49:45', '2020-12-14 10:49:45', NULL, 1),
(100041, 4, '555', '', 1, 18872, '', '2020-12-15 20:50:30', '2020-12-15 13:50:30', NULL, 1),
(100046, 4, '555', '', 1, 4060, '', '2021-01-17 22:23:54', '2021-01-17 15:23:54', NULL, 0),
(100047, 4, '555', '', 1, 2060, '', '2021-01-17 23:56:27', '2021-01-17 16:56:27', NULL, 0),
(100050, 4, '555', '', 1, 4560, '', '2021-01-21 20:20:18', '2021-01-21 13:20:18', NULL, 1),
(100062, 4, '555', '', 1, 160, '', '2021-01-21 21:23:47', '2021-01-21 14:23:47', NULL, 1),
(100063, 4, '555', '', 1, 2060, '', '2021-01-21 21:24:23', '2021-01-21 14:24:23', NULL, 1),
(100064, 4, '555', '', 1, 160, '', '2021-01-21 22:31:06', '2021-01-21 15:31:06', NULL, 1),
(100065, 4, '555', '', 1, 160, '', '2021-01-21 22:31:58', '2021-01-21 15:31:58', NULL, 1),
(100066, 4, '555', '', 1, 3660, '', '2021-01-21 22:32:36', '2021-01-21 15:32:36', NULL, 1),
(100067, 4, '555', '', 1, 160, '', '2021-01-21 22:33:47', '2021-01-21 15:33:47', NULL, 1),
(100068, 4, '555', '', 1, 160, '', '2021-01-21 22:38:45', '2021-01-21 15:38:45', NULL, 1),
(100069, 4, '555', '', 1, 160, '', '2021-01-21 22:38:45', '2021-01-21 15:38:45', NULL, 1),
(100070, 4, '555', '', 1, 160, '', '2021-01-21 22:41:38', '2021-01-21 15:41:38', NULL, 1),
(100071, 4, '555', '', 1, 2060, '', '2021-01-21 22:44:51', '2021-01-21 15:44:51', NULL, 1),
(100072, 4, '555', '', 1, 2060, '', '2021-01-21 22:45:02', '2021-01-21 15:45:02', NULL, 1),
(100079, 4, '555', '', 1, 2160, '', '2021-01-21 22:58:22', '2021-01-21 15:58:22', NULL, 0),
(100080, 4, '555', '', 1, 4720, '', '2021-01-21 23:03:47', '2021-01-21 16:03:47', NULL, 1),
(100081, 4, '555', '', 1, 3760, '', '2021-01-30 23:13:51', '2021-01-30 16:13:51', NULL, 1),
(100082, 4, '555', '', 1, 2320, '', '2021-01-30 23:18:03', '2021-01-30 16:18:03', NULL, 1),
(100083, 4, '555', '', 1, 2160, '', '2021-01-30 23:40:17', '2021-01-30 16:40:17', NULL, 1),
(100084, 4, '555', '', 1, 2160, '', '2021-01-30 23:40:59', '2021-01-30 16:40:59', NULL, 1),
(100085, 4, '555', '', 1, 2160, '', '2021-01-30 23:41:13', '2021-01-30 16:41:13', NULL, 1),
(100086, 4, '555', '', 1, 2160, '', '2021-01-30 23:41:21', '2021-01-30 16:41:21', NULL, 1),
(100087, 4, '555', '', 1, 2160, '', '2021-01-30 23:41:35', '2021-01-30 16:41:35', NULL, 1),
(100088, 4, '555', '', 1, 2160, '', '2021-01-30 23:42:04', '2021-01-30 16:42:04', NULL, 1),
(100089, 4, '555', '', 1, 0, '', '2021-01-30 23:42:08', '2021-01-30 16:42:08', NULL, 1),
(100090, 4, '555', '', 1, 2160, '', '2021-01-30 23:43:01', '2021-01-30 16:43:01', NULL, 1),
(100091, 4, '555', '', 1, 2160, '', '2021-01-31 00:01:45', '2021-01-30 17:01:45', NULL, 1),
(100092, 4, '555', '', 1, 9540, '', '2021-01-31 00:09:16', '2021-01-30 17:09:16', 'TEST12345', 1),
(100093, 0, '', '', 1, 0, '', '2021-01-31 00:12:20', '2021-01-30 17:12:20', NULL, 1),
(100094, 0, '', '', 1, 0, '', '2021-01-31 00:12:31', '2021-01-30 17:12:31', NULL, 1),
(100095, 4, '555', '', 1, 2160, '', '2021-01-31 00:13:27', '2021-01-30 17:13:27', NULL, 1),
(100096, 4, '555', '', 1, 2160, '', '2021-02-01 17:36:16', '2021-02-01 10:36:16', NULL, 1),
(100097, 4, '555', '', 1, 4220, '', '2021-02-01 18:46:28', '2021-02-01 11:46:28', NULL, 1),
(100098, 4, '555', '', 1, 0, '', '2021-02-01 20:54:16', '2021-02-01 13:54:16', NULL, 1),
(100099, 4, '555', '', 1, 4220, '', '2021-02-02 11:42:36', '2021-02-02 04:42:36', NULL, 1),
(100100, 4, '555', '', 1, 2160, '', '2021-02-02 11:45:37', '2021-02-02 04:45:37', NULL, 1),
(100101, 4, '555', '', 1, 160, '', '2021-02-03 19:18:25', '2021-02-03 12:18:25', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) NOT NULL,
  `order_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `amount`, `remark`) VALUES
(1, 100002, 0, 0, 0, ''),
(2, 100002, 0, 0, 0, ''),
(3, 100002, 0, 0, 0, ''),
(4, 100002, 0, 0, 0, ''),
(5, 100002, 0, 0, 0, ''),
(6, 100002, 0, 0, 0, ''),
(7, 100002, 0, 0, 0, ''),
(8, 100002, 0, 0, 0, ''),
(9, 100002, 0, 0, 0, ''),
(10, 100003, 0, 0, 0, ''),
(11, 100003, 0, 0, 0, ''),
(12, 100004, 85, 15252, 2, ''),
(13, 100005, 0, 0, 0, ''),
(14, 100005, 85, 15252, 1, ''),
(15, 100009, 81, 3600, 0, ''),
(16, 100009, 82, 3232, 0, ''),
(17, 100009, 88, 12132, 1, ''),
(18, 100009, 85, 15252, 1, ''),
(19, 100010, 85, 15252, 1, ''),
(20, 100010, 82, 3232, 1, ''),
(21, 100012, 85, 15252, 1, ''),
(22, 100012, 81, 3600, 1, ''),
(23, 100013, 85, 15252, 1, ''),
(24, 100041, 86, 15252, 1, ''),
(25, 100041, 81, 3600, 1, ''),
(26, 100046, 95, 2000, 1, ''),
(27, 100046, 93, 2000, 1, ''),
(28, 100047, 95, 2000, 1, ''),
(29, 100050, 94, 2000, 1, ''),
(30, 100050, 96, 2500, 1, ''),
(63, 100076, 101, 100, 2, ''),
(64, 100077, 101, 100, 2, ''),
(65, 100078, 101, 100, 1, ''),
(66, 100079, 89, 2000, 1, ''),
(67, 100079, 101, 100, 1, ''),
(68, 100080, 100, 2500, 1, ''),
(69, 100080, 91, 2000, 1, ''),
(70, 100080, 101, 100, 1, ''),
(71, 100081, 81, 3600, 1, ''),
(72, 100081, 101, 100, 1, ''),
(73, 100082, 94, 2000, 1, ''),
(74, 100082, 101, 100, 2, ''),
(75, 100083, 91, 2000, 1, ''),
(76, 100083, 101, 100, 1, ''),
(77, 100084, 0, 0, 0, ''),
(78, 100084, 0, 0, 0, ''),
(79, 100085, 0, 0, 0, ''),
(80, 100085, 0, 0, 0, ''),
(81, 100086, 0, 0, 0, ''),
(82, 100086, 0, 0, 0, ''),
(83, 100087, 0, 0, 0, ''),
(84, 100087, 0, 0, 0, ''),
(85, 100088, 0, 0, 0, ''),
(86, 100088, 0, 0, 0, ''),
(87, 100090, 94, 2000, 1, ''),
(88, 100090, 101, 100, 1, ''),
(89, 100091, 0, 0, 0, ''),
(90, 100091, 0, 0, 0, ''),
(91, 100092, 94, 2000, 1, ''),
(92, 100092, 97, 2000, 1, ''),
(93, 100092, 100, 2500, 2, ''),
(94, 100092, 101, 100, 3, ''),
(95, 100095, 95, 2000, 1, ''),
(96, 100095, 101, 100, 1, ''),
(97, 100096, 94, 2000, 1, ''),
(98, 100096, 101, 100, 1, ''),
(99, 100097, 94, 2000, 1, ''),
(100, 100097, 97, 2000, 1, ''),
(101, 100097, 101, 100, 1, ''),
(102, 100100, 94, 2000, 1, ''),
(103, 100100, 101, 100, 1, '1500'),
(104, 100101, 102, 100, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(15) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `type` int(3) NOT NULL,
  `price` double NOT NULL,
  `price_show` double NOT NULL,
  `description` text NOT NULL,
  `quantity` int(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `brand_id` int(15) NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `type`, `price`, `price_show`, `description`, `quantity`, `created_at`, `updated_at`, `brand_id`, `cost`) VALUES
(1, 'VOLTRIC 0.1 DG', 1, 1100, 0, 'Graphite / Tungsten', 500, '2020-08-20 23:24:58', '2021-01-20 11:37:34', 1, 0),
(2, 'VOLTRIC Z-FORCE Ⅱ', 1, 2875, 0, 'H.M. Graphite, Sound Filter,NANOMETRIC, Tungsten H.M. Graphite, EX-HMG, NANOMETRIC', 20, '2020-08-20 23:29:40', '2020-08-20 09:29:40', 1, 0),
(3, 'VOLTRIC FB', 1, 3645, 0, 'H.M. Graphite/Tungsten/BLACK MICRO CORE H.M. Graphite/NANOMETRIC', 20, '2020-08-20 23:31:53', '2020-08-20 09:31:53', 1, 0),
(4, 'NANORAY GLANZ', 1, 3695, 0, 'HM Graphite / REXIL FIBER / NANOMETRIC Hm Graphite / NANOMETRIC / X-FULLERENE', 20, '2020-08-20 23:33:30', '2020-08-20 09:33:30', 1, 0),
(5, 'NANORAY 10F', 1, 1090, 0, 'Hit powerful shots with comfort with the TFA CAP absorbing unwanted vibrations.', 20, '2020-08-20 23:35:22', '2020-08-20 09:35:22', 0, 0),
(6, 'DUORA 55', 1, 1750, 0, 'H.M. Graphite/NANOMETRIC β H.M. Graphite', 20, '2020-08-20 23:37:40', '2020-08-20 09:37:40', 1, 0),
(7, 'ASTROX 77', 1, 3345, 0, ' H.M. GRAPHITE + NANOMETRIC + Tungsten  H.M. GRAPHITE + Namd', 20, '2020-08-20 23:38:58', '2020-08-20 09:38:58', 1, 0),
(8, 'NANORAY I-SPEED', 1, 2890, 0, 'H.M.Graphite, SUPER HMG H.M.Graphite, X-FULLERENE', 20, '2020-08-20 23:39:42', '2020-08-20 09:39:42', 1, 0),
(9, 'NANORAY 900', 1, 3545, 0, 'H.T. Graphite, H.M. Graphite, NANOMETRIC, SUPER HMG H.M. Graphite, X-FULLERENE, Ultra PEF', 20, '2020-08-20 23:40:41', '2020-08-20 09:40:41', 1, 0),
(10, 'NANORAY Z-SPEED', 1, 2915, 0, 'H.M. Graphite, SONIC METAL, EX-HMG  H.M. Graphite, NANOMETRIC, X-FULLERENE', 20, '2020-08-20 23:42:12', '2020-08-20 09:42:12', 1, 0),
(30, 'VOLTRIC 0.1 DG', 1, 1100, 0, '', 20, '2020-09-07 13:47:10', '2020-09-06 23:47:10', 1, 0),
(31, 'ASTROX 6', 1, 1600, 0, '', 20, '2020-09-07 13:51:00', '2020-09-06 23:51:00', 1, 0),
(32, 'NANORAY 20', 1, 1200, 0, '', 20, '2020-09-07 13:52:03', '2020-09-06 23:52:03', 1, 0),
(33, 'NANORAY GlanZ', 1, 3695, 0, '', 20, '2020-09-07 13:53:15', '2020-09-06 23:53:15', 1, 0),
(34, 'NANOFLARE 600', 1, 5270, 0, '', 20, '2020-09-07 13:54:39', '2020-09-06 23:54:39', 1, 0),
(35, 'NANORAY 10F', 1, 1090, 0, '', 20, '2020-09-07 13:55:18', '2020-09-06 23:55:18', 1, 0),
(36, 'DUORA 55', 1, 1750, 0, '', 20, '2020-09-07 13:56:07', '2020-09-06 23:56:07', 1, 0),
(37, 'ASTROX 77', 1, 3345, 0, '', 20, '2020-09-07 14:00:49', '2020-09-07 00:00:49', 1, 0),
(38, 'ASTROX 7', 1, 1800, 0, '', 20, '2020-09-07 14:01:36', '2020-09-07 00:01:36', 1, 0),
(39, 'NANOFLARE 700 2020 SPECIAL EDITION', 1, 5025, 0, '', 20, '2020-09-07 14:02:24', '2020-09-07 00:02:24', 1, 0),
(40, 'NANORAY I-SPEED', 1, 2890, 0, '', 20, '2020-09-07 14:03:30', '2020-09-07 00:03:30', 1, 0),
(41, 'VOLTRIC FB', 1, 3645, 0, '', 20, '2020-09-07 14:04:26', '2020-09-07 00:04:26', 1, 0),
(42, 'VOLTRIC Z-FORCE Ⅱ', 1, 2875, 0, '', 20, '2020-09-07 14:04:58', '2020-09-07 00:04:58', 1, 0),
(43, 'ASTROX 99', 1, 4675, 0, '', 20, '2020-09-07 14:05:29', '2020-09-07 00:05:29', 1, 0),
(44, 'NANORAY 900', 1, 3545, 0, '', 20, '2020-09-07 14:06:12', '2020-09-07 00:06:12', 1, 0),
(45, 'NANORAY 300 NEO', 1, 2450, 0, '', 20, '2020-09-07 14:06:55', '2020-09-07 00:06:55', 1, 0),
(46, 'NANORAY Z-SPEED', 1, 2915, 0, '', 20, '2020-09-07 14:07:32', '2020-09-07 00:07:32', 1, 0),
(47, 'ARCSABER 11', 1, 2750, 0, '', 20, '2020-09-07 14:08:12', '2020-09-07 00:08:12', 1, 0),
(48, 'THURSTER K HMR LIGHT H', 1, 1900, 0, '', 20, '2020-09-07 14:09:32', '2020-09-07 00:09:32', 3, 0),
(49, 'ARROW POWER 5000', 1, 1590, 0, '', 20, '2020-09-07 14:10:05', '2020-09-07 00:10:05', 3, 0),
(50, 'BRAVE SWORD 55L', 1, 1290, 0, '', 20, '2020-09-07 14:10:39', '2020-09-07 00:10:39', 3, 0),
(51, 'AURASPEED 10', 1, 1290, 0, '', 20, '2020-09-07 14:11:16', '2020-09-07 00:11:16', 3, 0),
(52, 'BRAVE SWORD 12', 1, 3700, 0, '', 20, '2020-09-07 14:12:01', '2020-09-07 00:12:01', 3, 0),
(53, 'HYPERNANO X 7SP', 1, 2550, 0, '', 20, '2020-09-07 14:12:40', '2020-09-07 00:12:40', 3, 0),
(54, 'THRUSTER K HMR L', 1, 1900, 0, '', 20, '2020-09-07 14:13:48', '2020-09-07 00:13:48', 3, 0),
(55, 'ARROWSPEED 18', 1, 1290, 0, '', 20, '2020-09-07 14:14:28', '2020-09-07 00:14:28', 3, 0),
(56, 'HYPERNANO X 800', 1, 4700, 0, '', 20, '2020-09-07 14:14:59', '2020-09-07 00:14:59', 3, 0),
(57, 'THURSTER K F CLAW II', 1, 5200, 0, '', 20, '2020-09-07 14:15:33', '2020-09-07 00:15:33', 3, 0),
(58, 'JETSPEED S 10', 1, 4700, 0, '', 20, '2020-09-07 14:16:02', '2020-09-07 00:16:02', 3, 0),
(59, 'AURASPEED 90 S', 1, 4700, 0, '', 20, '2020-09-07 14:16:45', '2020-09-07 00:16:45', 3, 0),
(60, 'DRIVEX 9X', 1, 4700, 0, '', 20, '2020-09-07 14:17:15', '2020-09-07 00:17:15', 3, 0),
(61, 'SUPER SERIES 8', 1, 1290, 0, '', 20, '2020-09-07 14:18:29', '2020-09-07 00:18:29', 2, 0),
(62, 'WINDSTORM 72 SUPER LIGHT', 1, 3590, 0, '', 20, '2020-09-07 14:22:13', '2020-09-07 00:22:13', 2, 0),
(63, 'TECTONIC 7 INSTINCT', 1, 5190, 0, '', 20, '2020-09-07 14:22:42', '2020-09-07 00:22:42', 2, 0),
(64, 'WINDSTORM 700 SUPER LIGHT', 1, 2590, 0, '', 20, '2020-09-07 14:23:22', '2020-09-07 00:23:22', 2, 0),
(65, 'SUPER SERIES SS68-II', 1, 990, 0, '', 20, '2020-09-07 14:24:08', '2020-09-07 00:24:08', 2, 0),
(66, 'TURBOCHARGING 20 COMBAT', 1, 2990, 0, '', 20, '2020-09-07 14:24:51', '2020-09-07 00:24:51', 2, 0),
(67, 'G-FORCE PRO 2800I', 1, 1790, 0, '', 20, '2020-09-07 14:25:27', '2020-09-07 00:25:27', 2, 0),
(68, '3D CALIBAR 900 B', 1, 5890, 0, '', 20, '2020-09-07 14:26:07', '2020-09-07 00:26:07', 2, 0),
(69, 'AIR FORCE 77', 1, 1890, 0, '', 20, '2020-09-07 14:26:39', '2020-09-07 00:26:39', 2, 0),
(70, '3D CALIBAR 300 COMBAT', 1, 2990, 0, '', 20, '2020-09-07 14:27:13', '2020-09-07 00:27:13', 2, 0),
(71, 'AERONAUT 4000 COMBAT', 1, 3690, 0, '', 20, '2020-09-07 14:27:58', '2020-09-07 00:27:58', 0, 0),
(72, '3D CALIBAR 600 B', 1, 4890, 0, '', 20, '2020-09-07 14:28:36', '2020-09-07 00:28:36', 2, 0),
(73, 'AERONAUT 9000 COMBAT', 1, 5790, 0, '', 20, '2020-09-07 14:29:11', '2020-09-07 00:29:11', 2, 0),
(74, 'AERONAUT 9000 DRIVE', 1, 5790, 0, '', 20, '2020-09-07 14:29:40', '2020-09-07 00:29:40', 2, 0),
(75, 'TURBOCHARGING 70 COMBAT', 1, 4990, 0, '', 20, '2020-09-07 14:30:16', '2020-09-07 00:30:16', 2, 0),
(76, 'TECTONIC 7 DRIVE', 1, 5190, 0, '', 20, '2020-09-07 14:30:57', '2020-09-07 00:30:57', 2, 0),
(77, 'test description', 1, 3600, 0, 'test des color blue', -20, '2020-11-17 13:44:46', '2021-01-21 15:32:36', 4, 0),
(78, 'test description', 1, 3600, 0, 'test des color blue', 20, '2020-11-17 13:44:48', '2020-11-17 06:44:48', 4, 0),
(79, 'test description', 1, 3600, 0, 'test des color blue', 20, '2020-11-17 13:44:49', '2020-11-17 06:44:49', 4, 0),
(80, 'test description', 1, 3600, 0, 'test des color blue', 20, '2020-11-17 13:44:49', '2020-11-17 06:44:49', 4, 0),
(81, 'test description', 1, 3600, 0, 'test des color blue', -20, '2020-11-17 13:44:52', '2021-01-30 16:13:51', 4, 0),
(82, 'sadsad', 1, 3232, 0, 'efefe', 100, '2020-11-17 19:13:18', '2020-12-18 12:46:08', 4, 0),
(83, 'gsdfgsd', 1, 15252, 0, 'gdgdgd', -121, '2020-11-17 19:15:52', '2021-01-21 14:10:59', 2, 0),
(84, 'gsdfgsd', 1, 15252, 0, 'gdgdgd', 121, '2020-11-17 19:16:59', '2020-11-17 12:16:59', 2, 0),
(85, 'gsdfgsd', 1, 15252, 0, 'gdgdgd', 121, '2020-11-17 19:17:31', '2020-11-17 12:17:31', 2, 0),
(86, 'gsdfgsd', 1, 15252, 0, 'gdgdgd', 121, '2020-11-17 19:22:18', '2020-11-17 12:22:18', 2, 0),
(87, 'vyuvuj', 1, 2000, 0, 'njknknk', -20, '2020-11-17 19:22:55', '2021-02-02 04:42:37', 1, 0),
(88, 'vyuvuj', 1, 12132, 0, 'njknknk', 20, '2020-11-17 19:23:19', '2020-11-17 12:23:19', 2, 0),
(89, 'ddfdfdsf', 1, 2000, 0, 'tretre', -20, '2020-11-17 19:24:09', '2021-01-21 15:58:22', 1, 0),
(90, 'tesrf', 1, 2000, 0, 'fdfg', 10, '2020-11-17 19:25:13', '2020-12-15 13:29:01', 0, 0),
(91, 'efsesf', 1, 2000, 0, 'cccc', -10, '2020-11-17 19:27:01', '2021-01-30 16:40:17', 0, 0),
(92, 'ffdfdf', 1, 2000, 0, 'ffff', 10, '2020-11-17 19:29:36', '2020-12-15 13:29:06', 0, 0),
(93, 'fdfdf', 1, 2000, 0, 'dfdd', -10, '2020-11-17 19:29:39', '2021-01-20 15:37:24', 1, 0),
(94, 'errere', 1, 2000, 0, 'dfdfd', -10, '2020-11-17 19:31:25', '2021-02-02 04:45:37', 0, 0),
(95, 'sdsds', 1, 2000, 0, 'hhhh', 20, '2020-11-17 19:32:37', '2021-02-02 06:11:27', 1, 0),
(96, 'testcost', 1, 2500, 0, 'testcost', -20, '2020-12-18 19:33:43', '2021-01-21 13:20:18', 1, 2000),
(97, 'testcost2', 2, 2000, 0, 'testcosy', -12, '2020-12-18 19:34:40', '2021-02-02 04:42:36', 1, 1000),
(98, 'testcost3', 2, 2500, 0, 'testcisr', 20, '2020-12-18 19:35:12', '2020-12-18 12:35:12', 2, 2000),
(99, 'testcost3', 2, 2500, 0, 'testcisr', 20, '2020-12-18 19:35:34', '2020-12-18 12:35:34', 2, 2000),
(100, 'testcost_base', 2, 2500, 0, 'testcost on base', 30, '2020-12-18 19:38:01', '2021-01-30 17:09:16', 2, 2000),
(101, 'เอ็นไม้แบด', 6, 100, 0, 'ขนาดกลาง', -10, '2021-01-20 23:32:01', '2021-02-02 04:45:37', 1, 60),
(102, 'เอ็นไม้แบด 0.05', 6, 100, 150, 'ขนาด 0.05 ยี่ห้อ adidas', -20, '2021-02-03 18:24:28', '2021-02-03 12:18:25', 9, 70);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `fk_product_id` int(15) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`fk_product_id`, `path`) VALUES
(30, '../uploadFiles/VT01DGEX-BL-A.jpg'),
(30, '../uploadFiles/VT01DGEX-BL-B.jpg'),
(30, '../uploadFiles/VT01DGEX-BL-C.jpg'),
(30, '../uploadFiles/VT01DGEX-BL-D.jpg'),
(31, '../uploadFiles/AX6EX-BKLM-A.jpg'),
(31, '../uploadFiles/AX6EX-BKLM-B.jpg'),
(31, '../uploadFiles/AX6EX-BKLM-C.jpg'),
(31, '../uploadFiles/AX6EX-BKLM-D.jpg'),
(31, '../uploadFiles/AX6EX-BKLM-E.jpg'),
(31, '../uploadFiles/AX6EX-BKLM-F.jpg'),
(32, '../uploadFiles/NANO-20 (1).jpg'),
(32, '../uploadFiles/NANO-20.jpg'),
(32, '../uploadFiles/NANO-20-BKBL.jpg'),
(32, '../uploadFiles/NANO-20-BKBL_2.jpg'),
(32, '../uploadFiles/NANO-20-BKY.jpg'),
(32, '../uploadFiles/NANO-20-BKY_2.jpg'),
(33, '../uploadFiles/NANORAY GlanZ01.jpg'),
(33, '../uploadFiles/NANORAY GlanZ02.jpg'),
(33, '../uploadFiles/NANORAY GlanZ03.jpg'),
(34, '../uploadFiles/nf-600_1_1_.jpg'),
(34, '../uploadFiles/nf-600_2.jpg'),
(34, '../uploadFiles/nf-600_3.jpg'),
(34, '../uploadFiles/racket_nanoflare_orinal__3.jpg'),
(35, '../uploadFiles/NANO-10F-BKBL.jpg'),
(35, '../uploadFiles/NANO-10F-BKBL_2.jpg'),
(35, '../uploadFiles/RACKET-YONEX-NR10F-BLACK-BLUE-2.jpg'),
(36, '../uploadFiles/duora-55.jpg'),
(36, '../uploadFiles/duora-55_2.jpg'),
(36, '../uploadFiles/duora-55_3.jpg'),
(37, '../uploadFiles/AX77_MEB_01_A.jpg'),
(37, '../uploadFiles/AX77_MEB_01_B.jpg'),
(37, '../uploadFiles/AX77_SHIY_01_A(1).jpg'),
(37, '../uploadFiles/AX77_SHIY_01_B.jpg'),
(37, '../uploadFiles/AX77_SHIY_01_C(1).jpg'),
(37, '../uploadFiles/AX77_SHIY_MEB_01.jpg'),
(38, '../uploadFiles/ax7_1.jpg'),
(38, '../uploadFiles/ax7_2.jpg'),
(38, '../uploadFiles/ax7_3.jpg'),
(38, '../uploadFiles/YNX-ASTROX-7-2.jpg'),
(39, '../uploadFiles/NF-700LYX-BKBKT-A.jpg'),
(39, '../uploadFiles/NF-700LYX-BKBKT-B.jpg'),
(39, '../uploadFiles/NF-700LYX-BKBKT-C.jpg'),
(39, '../uploadFiles/NF-700LYX-BKBKT-D.jpg'),
(39, '../uploadFiles/NF-700LYX-BKBKT-E.jpg'),
(39, '../uploadFiles/NF-700LYX-BKBKT-F.jpg'),
(40, '../uploadFiles/NR-ISPYX-A.jpg'),
(40, '../uploadFiles/NR-ISPYX-B.jpg'),
(40, '../uploadFiles/NR-ISPYX-C.jpg'),
(40, '../uploadFiles/NR-ISPYX-D.jpg'),
(40, '../uploadFiles/NR-ISPYX-E.jpg'),
(40, '../uploadFiles/NR-ISPYX-F.jpg'),
(41, '../uploadFiles/706dbcda438962a2ab4551eb994ea68a.jpg'),
(41, '../uploadFiles/VTFB_1(1).jpg'),
(41, '../uploadFiles/VTFB_2(1).jpg'),
(41, '../uploadFiles/VTFB_3(1).jpg'),
(42, '../uploadFiles/vtz ii.jpg'),
(42, '../uploadFiles/vtz ii02.jpg'),
(42, '../uploadFiles/vtz ii03.jpg'),
(42, '../uploadFiles/vtz ii04.jpg'),
(43, '../uploadFiles/AX99 full.jpg'),
(43, '../uploadFiles/AX99YX-SSHIO-C.jpg'),
(43, '../uploadFiles/AX99YX-SSHIO-D.jpg'),
(43, '../uploadFiles/AX99YX-SSHIO-E.jpg'),
(43, '../uploadFiles/AX99YX-SSHIO-I.jpg'),
(43, '../uploadFiles/AX99YX-SSHIO-K.jpg'),
(44, '../uploadFiles/NR900YX-BN-A.jpg'),
(44, '../uploadFiles/NR900YX-BN-B.jpg'),
(44, '../uploadFiles/NR900YX-BN-C.jpg'),
(44, '../uploadFiles/NR900YX-BN-D.jpg'),
(44, '../uploadFiles/NR900YX-BN-E.jpg'),
(44, '../uploadFiles/NR900YX-BN-F.jpg'),
(45, '../uploadFiles/nr300neo_1.jpg'),
(45, '../uploadFiles/nr300neo_2.jpg'),
(45, '../uploadFiles/nr300neo_3.jpg'),
(45, '../uploadFiles/nr300neo_4.jpg'),
(47, '../uploadFiles/ARC11YX-MER-A.jpg'),
(47, '../uploadFiles/ARC11YX-MER-B.jpg'),
(47, '../uploadFiles/ARC11YX-MER-C.jpg'),
(47, '../uploadFiles/ARC11YX-MER-D.jpg'),
(47, '../uploadFiles/ARC11YX-MER-E.jpg'),
(47, '../uploadFiles/ARC11YX-MER-F.jpg'),
(48, '../uploadFiles/2018110211472923471.jpg'),
(48, '../uploadFiles/2018110211472939110.jpg'),
(48, '../uploadFiles/2018110211472947785.jpg'),
(48, '../uploadFiles/2018110211473060613.jpg'),
(48, '../uploadFiles/2018110211473074551.jpg'),
(49, '../uploadFiles/AP-@5000-A.jpg'),
(49, '../uploadFiles/AP-@5000-B.jpg'),
(49, '../uploadFiles/AP-@5000-C.jpg'),
(49, '../uploadFiles/AP-@5000-D.jpg'),
(49, '../uploadFiles/AP-@5000-E.jpg'),
(49, '../uploadFiles/AP-@5000-F.jpg'),
(50, '../uploadFiles/BRS-55L-F-A.jpg'),
(50, '../uploadFiles/BRS-55L-F-B.jpg'),
(50, '../uploadFiles/BRS-55L-F-C.jpg'),
(50, '../uploadFiles/BRS-55L-F-D.jpg'),
(50, '../uploadFiles/BRS-55L-F-E.jpg'),
(50, '../uploadFiles/BRS-55L-F-F.jpg'),
(51, '../uploadFiles/2019101616252841127.jpg'),
(51, '../uploadFiles/2019101616252841997.jpg'),
(51, '../uploadFiles/2019101616252849034.jpg'),
(51, '../uploadFiles/2019101616252853806.jpg'),
(51, '../uploadFiles/2019101616252999147.jpg'),
(52, '../uploadFiles/BRS-12L-A.jpg'),
(52, '../uploadFiles/BRS-12L-B.jpg'),
(52, '../uploadFiles/BRS-12L-C.jpg'),
(52, '../uploadFiles/BRS-12L-D.jpg'),
(52, '../uploadFiles/BRS-12L-E.jpg'),
(52, '../uploadFiles/BRS-12L-F.jpg'),
(53, '../uploadFiles/HX-7SP-A.jpg'),
(53, '../uploadFiles/HX-7SP-B.jpg'),
(53, '../uploadFiles/HX-7SP-C.jpg'),
(53, '../uploadFiles/HX-7SP-D.jpg'),
(53, '../uploadFiles/HX-7SP-E.jpg'),
(53, '../uploadFiles/HX-7SP-F.jpg'),
(54, '../uploadFiles/TK-HMRL-A.jpg'),
(54, '../uploadFiles/TK-HMRL-B.jpg'),
(54, '../uploadFiles/TK-HMRL-C.jpg'),
(54, '../uploadFiles/TK-HMRL-D.jpg'),
(54, '../uploadFiles/TK-HMRL-E.jpg'),
(54, '../uploadFiles/TK-HMRL-F.jpg'),
(55, '../uploadFiles/AS-@18-A.jpg'),
(55, '../uploadFiles/AS-@18-B.jpg'),
(55, '../uploadFiles/AS-@18-C.jpg'),
(55, '../uploadFiles/AS-@18-D.jpg'),
(55, '../uploadFiles/AS-@18-E.jpg'),
(55, '../uploadFiles/AS-@18-F.jpg'),
(56, '../uploadFiles/2014112116163558584.jpg'),
(56, '../uploadFiles/2016032413483923555.jpg'),
(56, '../uploadFiles/2016032413483948687.jpg'),
(56, '../uploadFiles/2016032413483982192.jpg'),
(56, '../uploadFiles/2016032413483996760.jpg'),
(57, '../uploadFiles/66222_0_20190909170555.jpg'),
(57, '../uploadFiles/66222_1_20190909170555.jpg'),
(57, '../uploadFiles/66222_2_20190909170555.jpg'),
(57, '../uploadFiles/66222_3_20190909170555.jpg'),
(57, '../uploadFiles/66222_4_20190909170555.jpg'),
(57, '../uploadFiles/66222_5_20191014094628.jpg'),
(58, '../uploadFiles/2017121218301428942.jpg'),
(58, '../uploadFiles/2017121218301542806.jpg'),
(58, '../uploadFiles/2017121218301684928.jpg'),
(58, '../uploadFiles/2017121218301727257.jpg'),
(58, '../uploadFiles/2017121218301884031.jpg'),
(59, '../uploadFiles/56620_3_20190118184947.jpg'),
(59, '../uploadFiles/56620_6_20190118184410.jpg'),
(59, '../uploadFiles/56620_8_20181210174446.jpg'),
(59, '../uploadFiles/2018102311254919643.jpg'),
(59, '../uploadFiles/2018102311254950710.jpg'),
(59, '../uploadFiles/2018102311254956535.jpg'),
(60, '../uploadFiles/DX-9X-B-A.jpg'),
(60, '../uploadFiles/DX-9X-B-B.jpg'),
(60, '../uploadFiles/DX-9X-B-C.jpg'),
(60, '../uploadFiles/DX-9X-B-D.jpg'),
(60, '../uploadFiles/DX-9X-B-E.jpg'),
(61, '../uploadFiles/REDBLACKYELLOW01.jpg'),
(61, '../uploadFiles/REDBLACKYELLOW02.jpg'),
(61, '../uploadFiles/REDBLACKYELLOW03.jpg'),
(61, '../uploadFiles/REDBLACKYELLOW04.jpg'),
(61, '../uploadFiles/REDBLACKYELLOW05.jpg'),
(62, '../uploadFiles/AYPP246-4-A.jpg'),
(62, '../uploadFiles/AYPP246-4-B.jpg'),
(62, '../uploadFiles/AYPP246-4-C.jpg'),
(62, '../uploadFiles/AYPP246-4-D.jpg'),
(62, '../uploadFiles/AYPP246-4-E.jpg'),
(62, '../uploadFiles/AYPP246-4-F.jpg'),
(63, '../uploadFiles/AYPQ126-4-A.jpg'),
(63, '../uploadFiles/AYPQ126-4-B.jpg'),
(63, '../uploadFiles/AYPQ126-4-C.jpg'),
(63, '../uploadFiles/AYPQ126-4-D.jpg'),
(63, '../uploadFiles/AYPQ126-4-E.jpg'),
(63, '../uploadFiles/AYPQ126-4-F.jpg'),
(64, '../uploadFiles/AYPJ022-1-A.jpg'),
(64, '../uploadFiles/AYPJ022-1-B.jpg'),
(64, '../uploadFiles/AYPJ022-1-C.jpg'),
(64, '../uploadFiles/AYPJ022-1-D.jpg'),
(64, '../uploadFiles/AYPJ022-1-E.jpg'),
(64, '../uploadFiles/AYPJ022-1-F.jpg'),
(65, '../uploadFiles/AYPF306-1S-A.jpg'),
(65, '../uploadFiles/AYPF306-1S-B.jpg'),
(65, '../uploadFiles/AYPF306-1S-C.jpg'),
(65, '../uploadFiles/AYPF306-1S-D.jpg'),
(65, '../uploadFiles/AYPF306-1S-E.jpg'),
(65, '../uploadFiles/AYPF306-1S-F.jpg'),
(66, '../uploadFiles/AYPP022-4S-A.jpg'),
(66, '../uploadFiles/AYPP022-4S-B.jpg'),
(66, '../uploadFiles/AYPP022-4S-C.jpg'),
(66, '../uploadFiles/AYPP022-4S-D.jpg'),
(66, '../uploadFiles/AYPP022-4S-E.jpg'),
(67, '../uploadFiles/AYPL248-4-A.jpg'),
(67, '../uploadFiles/AYPL248-4-B.jpg'),
(67, '../uploadFiles/AYPL248-4-C.jpg'),
(67, '../uploadFiles/AYPL248-4-D.jpg'),
(67, '../uploadFiles/AYPL248-4-E.jpg'),
(67, '../uploadFiles/AYPL248-4-F.jpg'),
(68, '../uploadFiles/badminton-racket-AYPM402-1-B.jpg'),
(68, '../uploadFiles/badminton-racket-AYPM402-1-C.jpg'),
(68, '../uploadFiles/badminton-racket-AYPM402-1-D.jpg'),
(68, '../uploadFiles/badminton-racket-AYPM402-1-J.jpg'),
(68, '../uploadFiles/badminton-racket-AYPM402-1-M.jpg'),
(68, '../uploadFiles/badminton-racket-AYPM402-1-O.jpg'),
(69, '../uploadFiles/Airforce77-78-79_๑๙๑๑๒๗_0046.jpg'),
(69, '../uploadFiles/Airforce77-78-79_๑๙๑๑๒๗_0047.jpg'),
(69, '../uploadFiles/Airforce77-78-79_๑๙๑๑๒๗_0048.jpg'),
(69, '../uploadFiles/Airforce77-78-79_๑๙๑๑๒๗_0049.jpg'),
(69, '../uploadFiles/Airforce77-78-79_๑๙๑๑๒๗_0050.jpg'),
(70, '../uploadFiles/AYPP014-1000-A.jpg'),
(70, '../uploadFiles/AYPP014-1000-B.jpg'),
(70, '../uploadFiles/AYPP014-1000-C.jpg'),
(70, '../uploadFiles/AYPP014-1000-D.jpg'),
(70, '../uploadFiles/AYPP014-1000-E.jpg'),
(71, '../uploadFiles/AYPM444-1.jpg'),
(71, '../uploadFiles/AYPM444-1-B.jpg'),
(71, '../uploadFiles/AYPM444-1-C.jpg'),
(71, '../uploadFiles/AYPM444-1-D.jpg'),
(71, '../uploadFiles/AYPM444-1-H.jpg'),
(72, '../uploadFiles/badminton-racket-AYPM402-1-B.jpg'),
(72, '../uploadFiles/badminton-racket-AYPM402-1-C.jpg'),
(72, '../uploadFiles/badminton-racket-AYPM402-1-D.jpg'),
(72, '../uploadFiles/badminton-racket-AYPM402-1-J.jpg'),
(72, '../uploadFiles/badminton-racket-AYPM402-1-M.jpg'),
(72, '../uploadFiles/badminton-racket-AYPM402-1-O.jpg'),
(73, '../uploadFiles/ae9000c6.png'),
(73, '../uploadFiles/IMG_9088__20099.1575517460.1280.1280.jpg'),
(73, '../uploadFiles/IMG_9100__89255.1575517460.1280.1280.jpg'),
(73, '../uploadFiles/IMG_9110__70252.1575517460.1280.1280.jpg'),
(73, '../uploadFiles/IMG_9118__57342.1575517460.1280.1280.jpg'),
(73, '../uploadFiles/IMG_9128__59295.1575517460.1280.1280.jpg'),
(74, '../uploadFiles/AYPP118-1D-A.jpg'),
(74, '../uploadFiles/AYPP118-1D-B.jpg'),
(74, '../uploadFiles/AYPP118-1D-C.jpg'),
(74, '../uploadFiles/AYPP118-1D-D.jpg'),
(74, '../uploadFiles/AYPP118-1D-E.jpg'),
(74, '../uploadFiles/AYPP118-1D-F.jpg'),
(75, '../uploadFiles/201909191202470.jpg'),
(75, '../uploadFiles/201909191202481.jpg'),
(75, '../uploadFiles/201909191202482.jpg'),
(75, '../uploadFiles/201909191202493.jpg'),
(75, '../uploadFiles/201909191202494.jpg'),
(76, '../uploadFiles/AYPQ018-1-A.jpg'),
(76, '../uploadFiles/AYPQ018-1-B.jpg'),
(76, '../uploadFiles/AYPQ018-1-C.jpg'),
(76, '../uploadFiles/AYPQ018-1-D.jpg'),
(76, '../uploadFiles/AYPQ018-1-E.jpg'),
(76, '../uploadFiles/AYPQ018-1-G.jpg'),
(77, '../uploadFiles/2018110219134029889.png'),
(78, '../uploadFiles/2018110219134029889.png'),
(79, '../uploadFiles/2018110219134029889.png'),
(80, '../uploadFiles/2018110219134029889.png'),
(81, '../uploadFiles/2018110219134029889.png'),
(82, '../uploadFiles/AX99YX-SSHIO-I.png'),
(83, '../uploadFiles/AX99YX-SSHIO-L.png'),
(84, '../uploadFiles/AX99YX-SSHIO-L.png'),
(85, '../uploadFiles/AX99YX-SSHIO-L.png'),
(86, '../uploadFiles/AX99YX-SSHIO-L.png'),
(87, '../uploadFiles/AX99YX-SSHIO-I.png'),
(88, '../uploadFiles/AX99YX-SSHIO-I.png'),
(96, '../uploadFiles/AX99YX-SSHIO-K.png'),
(97, '../uploadFiles/bg-video.png'),
(98, '../uploadFiles/banner.PNG'),
(101, '../uploadFiles/kl2.png'),
(102, '../uploadFiles/duora-55.png'),
(102, '../uploadFiles/vt.png'),
(102, '../uploadFiles/VT01DGEX-BL-A.png');

-- --------------------------------------------------------

--
-- Table structure for table `racket_detail`
--

CREATE TABLE `racket_detail` (
  `rd_id` int(15) NOT NULL,
  `grip_size` int(3) NOT NULL,
  `balance` int(3) NOT NULL,
  `tension` int(3) NOT NULL,
  `weight_min` text NOT NULL,
  `weight_max` text NOT NULL,
  `flex` int(3) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `fk_product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `racket_detail`
--

INSERT INTO `racket_detail` (`rd_id`, `grip_size`, `balance`, `tension`, `weight_min`, `weight_max`, `flex`, `level`, `created_at`, `updated_at`, `fk_product_id`) VALUES
(1, 3, 1, 35, '2', '', 4, 1, '2020-08-20 23:24:58', '2020-08-20 09:24:58', 1),
(2, 3, 1, 27, '2', '', 2, 3, '2020-08-20 23:29:40', '2020-08-20 09:29:40', 2),
(3, 3, 1, 24, '3', '', 2, 2, '2020-08-20 23:31:53', '2020-08-20 09:31:53', 3),
(4, 3, 3, 22, '2', '', 4, 2, '2020-08-20 23:33:30', '2020-08-20 09:33:30', 4),
(5, 3, 2, 24, '2', '', 5, 1, '2020-08-20 23:35:22', '2020-08-20 09:35:22', 5),
(6, 3, 2, 24, '2', '', 3, 2, '2020-08-20 23:37:40', '2020-08-20 09:37:40', 6),
(7, 3, 1, 29, '1', '', 3, 2, '2020-08-20 23:38:58', '2020-08-20 09:38:58', 7),
(8, 3, 3, 24, '1', '', 3, 2, '2020-08-20 23:39:42', '2020-08-20 09:39:42', 8),
(9, 3, 3, 24, '1', '', 2, 2, '2020-08-20 23:40:41', '2020-08-20 09:40:41', 9),
(10, 3, 2, 24, '1', '', 2, 3, '2020-08-20 23:42:12', '2020-08-20 09:42:12', 10),
(11, 2, 1, 10, '4', '', 2, 1, '2020-11-17 13:44:46', '2020-11-17 06:44:46', 77),
(12, 2, 1, 10, '4', '', 2, 1, '2020-11-17 13:44:48', '2020-11-17 06:44:48', 78),
(13, 2, 1, 10, '4', '', 2, 1, '2020-11-17 13:44:49', '2020-11-17 06:44:49', 79),
(14, 2, 1, 10, '4', '', 2, 1, '2020-11-17 13:44:49', '2020-11-17 06:44:49', 80),
(15, 2, 1, 10, '4', '', 2, 1, '2020-11-17 13:44:52', '2020-11-17 06:44:52', 81),
(16, 1, 1, 2, 'undefined', 'undefined', 2, 2, '2020-11-17 19:13:18', '2020-11-17 12:13:18', 82),
(17, 1, 1, 121, 'undefined', 'undefined', 2, 1, '2020-11-17 19:15:52', '2020-11-17 12:15:52', 83),
(18, 1, 1, 121, 'undefined', 'undefined', 2, 1, '2020-11-17 19:16:59', '2020-11-17 12:16:59', 84),
(19, 1, 1, 121, 'undefined', 'undefined', 2, 1, '2020-11-17 19:17:31', '2020-11-17 12:17:31', 85),
(20, 1, 1, 121, 'undefined', 'undefined', 2, 1, '2020-11-17 19:22:18', '2020-11-17 12:22:18', 86),
(21, 1, 3, 2, '70', '90', 3, 2, '2020-11-17 19:22:56', '2020-11-17 12:22:56', 87),
(22, 1, 1, 2, '[object Object', '[object Object', 2, 2, '2020-11-17 19:23:19', '2020-11-17 12:23:19', 88),
(23, 0, 0, 0, 'undefined', 'undefined', 0, 0, '2020-11-17 19:24:09', '2020-11-17 12:24:09', 89),
(24, 0, 0, 0, 'undefined', 'undefined', 0, 0, '2020-11-17 19:25:13', '2020-11-17 12:25:13', 90),
(25, 0, 0, 0, '[object Object', '[object Object', 0, 0, '2020-11-17 19:27:01', '2020-11-17 12:27:01', 91),
(26, 0, 3, 0, '70', '90', 3, 0, '2020-11-17 19:29:39', '2020-11-17 12:29:39', 93),
(27, 0, 0, 0, '70', '90', 0, 0, '2020-11-17 19:31:25', '2020-11-17 12:31:25', 94),
(28, 0, 3, 0, '65', '90', 2, 0, '2020-11-17 19:32:37', '2020-11-17 12:32:37', 95),
(29, 1, 1, 2, '70', '90', 1, 2, '2020-12-18 19:33:43', '2020-12-18 12:33:43', 96);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `theme_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `title` text NOT NULL,
  `category` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_id` int(11) NOT NULL,
  `ref_theme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`theme_id`, `content`, `title`, `category`, `status`, `create_at`, `update_at`, `fk_user_id`, `ref_theme`) VALUES
(1, '<p>fzdxfd</p>', 'TYRYR', 'court', 1, '2020-10-16 19:28:45', '2020-10-18 15:19:19', 3, NULL),
(2, '<p>testttttttttttttttttttttttttttttttttttttttttttttttttt</p>', 'TEST', 'court', 1, '2020-10-16 19:29:29', '2020-10-18 15:28:43', 3, NULL),
(3, '<p>tetdgycgcgcytc</p>', 'test2', 'racket', 1, '2020-10-18 23:05:48', '2020-10-18 16:05:48', 3, NULL),
(4, '<p>efwefefefrgtgfsdfdgfhfghgfdxd</p>', '', '', 0, '2020-10-18 23:33:49', '2020-12-04 17:58:06', 3, 3),
(5, '<p>swewretrgegregege</p>', '', '', 0, '2020-10-18 23:33:57', '2020-12-04 17:58:09', 3, 3),
(6, '<p>swewretrgegregege</p>', '', '', 0, '2020-10-18 23:34:15', '2020-12-04 17:58:11', 3, 3),
(9, '<p>bhjsgdjagsdjgasj</p>', '', '', 0, '2020-10-19 00:47:02', '2020-12-04 17:58:13', 3, 1),
(10, '<p>fsfsfsfsfsf</p>', 'sfsfsf', 'undefined', 1, '2020-11-09 15:48:06', '2020-11-09 08:48:06', 0, NULL),
(11, '<p>tesr</p>', 'test', 'undefined', 1, '2020-11-20 19:11:56', '2020-11-20 12:11:56', 3, NULL),
(12, '<p>cssffsdfd</p>', 'teds', 'undefined', 1, '2020-12-05 00:44:19', '2020-12-04 17:44:19', 3, NULL),
(13, '<p>scascnsahcbsjancsancjsacsa</p>', 'twcvtcvtasvc', 'undefined', 1, '2020-12-14 02:11:24', '2020-12-14 10:37:36', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `name`, `surname`, `password`, `status`, `email`) VALUES
(1, 'test', 'test', 'test', 'cee5ad84c76091a6c1bf50e9d2c1008b', 1, 'test@hotmail.com'),
(2, 'test2', 'yee', 'test', '5554dce37a915769b08d19c05ecaca8d', 1, 'test2@hotmail.com'),
(3, 'test3', 'test', 'test2', '81dc9bdb52d04dc20036dbd8313ed055', 1, 't@hotmail.com'),
(4, 'test456', 'test456', 'testest', '81dc9bdb52d04dc20036dbd8313ed055', 1, 't@mail.com'),
(5, 'test123', 'test123', 'test', '81dc9bdb52d04dc20036dbd8313ed055', 1, 't@mailcom'),
(6, 'test234', 'test234', 'test', '81dc9bdb52d04dc20036dbd8313ed055', 1, 't@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_style`
--

CREATE TABLE `user_style` (
  `user_id` int(11) NOT NULL,
  `flex` int(3) NOT NULL,
  `balance` int(3) NOT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_style`
--

INSERT INTO `user_style` (`user_id`, `flex`, `balance`, `weight`) VALUES
(0, 2, 2, 82.5),
(4, 3, 3, 82.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `racket_detail`
--
ALTER TABLE `racket_detail`
  ADD PRIMARY KEY (`rd_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100102;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `racket_detail`
--
ALTER TABLE `racket_detail`
  MODIFY `rd_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `racket_detail`
--
ALTER TABLE `racket_detail`
  ADD CONSTRAINT `fk_p_r` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
