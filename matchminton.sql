-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2020 at 12:12 AM
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
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(15) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `type` int(3) NOT NULL,
  `price` double NOT NULL,
  `description` text NOT NULL,
  `quantity` int(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `brand_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `type`, `price`, `description`, `quantity`, `created_at`, `updated_at`, `brand_id`) VALUES
(1, 'VOLTRIC 0.1 DG', 1, 1100, 'Graphite / Tungsten', 20, '2020-08-20 23:24:58', '2020-08-20 09:24:58', 1),
(2, 'VOLTRIC Z-FORCE Ⅱ', 1, 2875, 'H.M. Graphite, Sound Filter,NANOMETRIC, Tungsten H.M. Graphite, EX-HMG, NANOMETRIC', 20, '2020-08-20 23:29:40', '2020-08-20 09:29:40', 1),
(3, 'VOLTRIC FB', 1, 3645, 'H.M. Graphite/Tungsten/BLACK MICRO CORE H.M. Graphite/NANOMETRIC', 20, '2020-08-20 23:31:53', '2020-08-20 09:31:53', 1),
(4, 'NANORAY GLANZ', 1, 3695, 'HM Graphite / REXIL FIBER / NANOMETRIC Hm Graphite / NANOMETRIC / X-FULLERENE', 20, '2020-08-20 23:33:30', '2020-08-20 09:33:30', 1),
(5, 'NANORAY 10F', 1, 1090, 'Hit powerful shots with comfort with the TFA CAP absorbing unwanted vibrations.', 20, '2020-08-20 23:35:22', '2020-08-20 09:35:22', 0),
(6, 'DUORA 55', 1, 1750, 'H.M. Graphite/NANOMETRIC β H.M. Graphite', 20, '2020-08-20 23:37:40', '2020-08-20 09:37:40', 1),
(7, 'ASTROX 77', 1, 3345, ' H.M. GRAPHITE + NANOMETRIC + Tungsten  H.M. GRAPHITE + Namd', 20, '2020-08-20 23:38:58', '2020-08-20 09:38:58', 1),
(8, 'NANORAY I-SPEED', 1, 2890, 'H.M.Graphite, SUPER HMG H.M.Graphite, X-FULLERENE', 20, '2020-08-20 23:39:42', '2020-08-20 09:39:42', 1),
(9, 'NANORAY 900', 1, 3545, 'H.T. Graphite, H.M. Graphite, NANOMETRIC, SUPER HMG H.M. Graphite, X-FULLERENE, Ultra PEF', 20, '2020-08-20 23:40:41', '2020-08-20 09:40:41', 1),
(10, 'NANORAY Z-SPEED', 1, 2915, 'H.M. Graphite, SONIC METAL, EX-HMG  H.M. Graphite, NANOMETRIC, X-FULLERENE', 20, '2020-08-20 23:42:12', '2020-08-20 09:42:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `fk_product_id` int(15) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `racket_detail`
--

CREATE TABLE `racket_detail` (
  `rd_id` int(15) NOT NULL,
  `grip_size` int(3) NOT NULL,
  `balance` int(3) NOT NULL,
  `tension` int(3) NOT NULL,
  `weight` int(3) NOT NULL,
  `flex` int(3) NOT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `fk_product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `racket_detail`
--

INSERT INTO `racket_detail` (`rd_id`, `grip_size`, `balance`, `tension`, `weight`, `flex`, `level`, `created_at`, `updated_at`, `fk_product_id`) VALUES
(1, 3, 1, 35, 2, 4, 1, '2020-08-20 23:24:58', '2020-08-20 09:24:58', 1),
(2, 3, 1, 27, 2, 2, 3, '2020-08-20 23:29:40', '2020-08-20 09:29:40', 2),
(3, 3, 1, 24, 3, 2, 2, '2020-08-20 23:31:53', '2020-08-20 09:31:53', 3),
(4, 3, 3, 22, 2, 4, 2, '2020-08-20 23:33:30', '2020-08-20 09:33:30', 4),
(5, 3, 2, 24, 2, 5, 1, '2020-08-20 23:35:22', '2020-08-20 09:35:22', 5),
(6, 3, 2, 24, 2, 3, 2, '2020-08-20 23:37:40', '2020-08-20 09:37:40', 6),
(7, 3, 1, 29, 1, 3, 2, '2020-08-20 23:38:58', '2020-08-20 09:38:58', 7),
(8, 3, 3, 24, 1, 3, 2, '2020-08-20 23:39:42', '2020-08-20 09:39:42', 8),
(9, 3, 3, 24, 1, 2, 2, '2020-08-20 23:40:41', '2020-08-20 09:40:41', 9),
(10, 3, 2, 24, 1, 2, 3, '2020-08-20 23:42:12', '2020-08-20 09:42:12', 10);

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
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`theme_id`, `content`, `title`, `category`, `status`, `create_at`, `update_at`, `fk_user_id`) VALUES
(1, '<p>fzdxfd</p>', 'TYRYR', 'court', 1, '2020-10-16 19:28:45', '2020-10-16 13:04:59', 3),
(2, '<p>fzdxfd</p>', 'TYRYR', 'court', 1, '2020-10-16 19:29:29', '2020-10-16 13:05:03', 3);

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
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `name`, `surname`, `password`, `status`, `phone`, `email`) VALUES
(1, 'test', 'test', 'test', 'cee5ad84c76091a6c1bf50e9d2c1008b', 1, '', 'test@hotmail.com'),
(2, 'test2', 'yee', 'test', '5554dce37a915769b08d19c05ecaca8d', 1, '', 'test2@hotmail.com'),
(3, 'test', 'test', 'test2', '81dc9bdb52d04dc20036dbd8313ed055', 1, '', 't@hotmail.com');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `racket_detail`
--
ALTER TABLE `racket_detail`
  MODIFY `rd_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
