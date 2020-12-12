-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 10:12 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `amount`, `created_at`, `updated_at`) VALUES
(10, 0, 9, 1, '2020-12-07 11:54:25', '2020-12-07 11:54:25');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `card_id`, `address`, `payment_status`, `total_price`, `remark`, `created_at`, `updated_at`) VALUES
(1, 4, '10', '', 1, 2935, '', '2020-12-07 11:26:47', '2020-12-07 04:26:47'),
(2, 4, '10', '', 1, 4695, '', '2020-12-07 11:27:04', '2020-12-07 04:27:04'),
(3, 9, '10', '', 1, 1220, '', '2020-12-07 18:54:50', '2020-12-07 11:54:50'),
(4, 0, '10', '', 1, 0, '', '2020-12-09 20:29:20', '2020-12-09 13:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) NOT NULL,
  `order_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `amount`) VALUES
(1, 1, 8, 2915, 1),
(2, 2, 7, 4675, 1),
(3, 3, 3, 1200, 1),
(4, 4, 0, 0, 0),
(5, 4, 8, 2915, 1);

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
(1, 'ASTROX 6', 1, 1600, 'Graphite / Tungsten H.T. GRAPHITE + NANOMESH NEO', 20, '2020-11-21 12:45:45', '2020-11-21 05:45:45', 1),
(2, 'NANORAY 10F', 1, 1090, 'Graphite Graphite/NANOMESH + CARBON NANOTUBE', 20, '2020-11-21 12:48:59', '2020-11-21 05:48:59', 1),
(3, 'NANORAY 20', 1, 1200, 'Graphite Graphite/NANOMESH + CARBON NANOTUBE', 20, '2020-11-21 13:01:30', '2020-11-21 06:01:30', 1),
(4, 'ASTROX 77', 1, 3345, ' H.M. GRAPHITE + NANOMETRIC + Tungsten  H.M. GRAPHITE + Namd', 20, '2020-11-21 13:09:33', '2020-11-21 06:09:33', 1),
(5, 'DUORA 55', 1, 1750, 'H.M. Graphite/NANOMETRIC β H.M. Graphite', 20, '2020-11-21 13:16:00', '2020-11-21 06:16:00', 1),
(6, 'NANOFLARE 700 2020 SPECIAL EDITION', 1, 5025, 'H.M. Graphite / M40X / SUPER HMG H.M. Graphite', 20, '2020-11-21 13:17:44', '2020-11-21 06:17:44', 1),
(7, 'ASTROX 99', 1, 4675, 'H.M. GRAPHITE/Namd/NANOMETRIC/Tungsten H.M. Graphite/Namd', 20, '2020-11-21 13:19:13', '2020-11-21 06:19:13', 1),
(8, 'NANORAY Z-SPEED', 1, 2915, 'H.M. Graphite, SONIC METAL, EX-HMG  H.M. Graphite, NANOMETRIC, X-FULLERENE', 20, '2020-11-21 13:24:11', '2020-11-21 06:24:11', 1),
(9, 'NANORAY 800', 1, 3850, 'X-FULLERINE combined with SONIC METAL produces a fast and controlled swing that generates powerfully accurate, rapid-fire shots.', 20, '2020-11-21 13:27:47', '2020-11-21 06:27:47', 1);

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
(1, '../uploadFiles/AX6EX-BKLM-A.jpg'),
(1, '../uploadFiles/AX6EX-BKLM-B.jpg'),
(1, '../uploadFiles/AX6EX-BKLM-C.jpg'),
(1, '../uploadFiles/AX6EX-BKLM-D.jpg'),
(1, '../uploadFiles/AX6EX-BKLM-E.jpg'),
(1, '../uploadFiles/AX6EX-BKLM-F.jpg'),
(2, '../uploadFiles/NANO-10F-BKBL.jpg'),
(2, '../uploadFiles/NANO-10F-BKBL_2.jpg'),
(2, '../uploadFiles/RACKET-YONEX-NR10F-BLACK-BLUE-2.jpg'),
(3, '../uploadFiles/NANO-20 (1).jpg'),
(3, '../uploadFiles/NANO-20.jpg'),
(3, '../uploadFiles/NANO-20-BKBL.jpg'),
(3, '../uploadFiles/NANO-20-BKBL_2.jpg'),
(3, '../uploadFiles/NANO-20-BKY.jpg'),
(3, '../uploadFiles/NANO-20-BKY_2.jpg'),
(4, '../uploadFiles/AX77_MEB_01_A.jpg'),
(4, '../uploadFiles/AX77_MEB_01_B.jpg'),
(4, '../uploadFiles/AX77_SHIY_01_A(1).jpg'),
(4, '../uploadFiles/AX77_SHIY_01_B.jpg'),
(4, '../uploadFiles/AX77_SHIY_01_C(1).jpg'),
(4, '../uploadFiles/AX77_SHIY_MEB_01.jpg'),
(5, '../uploadFiles/duora-55.jpg'),
(5, '../uploadFiles/duora-55_2.jpg'),
(5, '../uploadFiles/duora-55_3.jpg'),
(6, '../uploadFiles/NF-700LYX-BKBKT-A.jpg'),
(6, '../uploadFiles/NF-700LYX-BKBKT-B.jpg'),
(6, '../uploadFiles/NF-700LYX-BKBKT-C.jpg'),
(6, '../uploadFiles/NF-700LYX-BKBKT-D.jpg'),
(6, '../uploadFiles/NF-700LYX-BKBKT-E.jpg'),
(6, '../uploadFiles/NF-700LYX-BKBKT-F.jpg'),
(7, '../uploadFiles/AX99 full.jpg'),
(7, '../uploadFiles/AX99YX-SSHIO-C.jpg'),
(7, '../uploadFiles/AX99YX-SSHIO-D.jpg'),
(7, '../uploadFiles/AX99YX-SSHIO-E.jpg'),
(7, '../uploadFiles/AX99YX-SSHIO-I.jpg'),
(7, '../uploadFiles/AX99YX-SSHIO-K.jpg'),
(7, '../uploadFiles/AX99YX-SSHIO-L.jpg'),
(8, '../uploadFiles/NANORAY GlanZ.jpg'),
(8, '../uploadFiles/NR-ZSP_1(3).jpg'),
(8, '../uploadFiles/NR-ZSP_2(1).jpg'),
(8, '../uploadFiles/NR-ZSP_3(2).jpg'),
(9, '../uploadFiles/NR800_1.jpg'),
(9, '../uploadFiles/NR800_2.jpg'),
(9, '../uploadFiles/NR800_3.jpg'),
(10, '../uploadFiles/Yonex-DUORA77_1 (1).jpg'),
(10, '../uploadFiles/Yonex-DUORA77_1.jpg'),
(10, '../uploadFiles/Yonex-DUORA77_2.jpg'),
(10, '../uploadFiles/Yonex-DUORA77_3.jpg');

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
(1, 3, 1, 24, '80', '84', 3, 1, '2020-11-21 12:45:45', '2020-11-21 05:45:45', 1),
(2, 3, 2, 24, '80', '84', 3, 1, '2020-11-21 12:48:59', '2020-11-21 05:48:59', 2),
(3, 3, 3, 24, '80', '84', 3, 1, '2020-11-21 13:01:30', '2020-11-21 06:01:30', 3),
(4, 3, 1, 29, '85', '89', 2, 2, '2020-11-21 13:09:33', '2020-11-21 06:09:33', 4),
(5, 3, 2, 24, '80', '84', 2, 2, '2020-11-21 13:16:00', '2020-11-21 06:16:00', 5),
(6, 3, 3, 28, '80', '84', 2, 2, '2020-11-21 13:17:44', '2020-11-21 06:17:44', 6),
(7, 3, 1, 28, '80', '84', 1, 3, '2020-11-21 13:19:13', '2020-11-21 06:19:13', 7),
(8, 3, 2, 24, '85', '89', 1, 3, '2020-11-21 13:24:11', '2020-11-21 06:24:11', 8),
(9, 3, 3, 28, '80', '84', 1, 3, '2020-11-21 13:27:47', '2020-11-21 06:27:47', 9);

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
(1, '<p>55555555555</p>', '55555555', 'undefined', 1, '2020-12-07 19:11:38', '2020-12-07 12:11:38', 0, NULL);

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
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `name`, `surname`, `password`, `status`, `phone`, `email`) VALUES
(0, 'admin', 'ปลาหยุด', 'จันoชา1234', '81dc9bdb52d04dc20036dbd8313ed055', 2, '0896956499', 'aus@hotmail.com'),
(9, 'member', 'ADISORN', 'PAKORNPANIT', '81dc9bdb52d04dc20036dbd8313ed055', 1, NULL, 'adison_aus@hotmail.com');

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
(0, 3, 3, 82.5),
(4, 1, 1, 82.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card_user`
--
ALTER TABLE `card_user`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `card_user`
--
ALTER TABLE `card_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `racket_detail`
--
ALTER TABLE `racket_detail`
  MODIFY `rd_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
