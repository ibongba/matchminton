-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 03, 2020 at 08:18 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `matchminton`
--

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

