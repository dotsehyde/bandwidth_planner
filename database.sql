-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2023 at 08:41 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bandwidth`
--

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `course_download` float(10,2) NOT NULL,
  `registration` float(10,2) NOT NULL,
  `submit_assign` float(10,2) NOT NULL,
  `video` float(10,2) NOT NULL,
  `online_exam` float(10,2) NOT NULL,
  `tutoring` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `course_download`, `registration`, `submit_assign`, `video`, `online_exam`, `tutoring`) VALUES
(1, 51.87, 12.24, 117.43, 0.00, 13.67, 22.89),
(2, 102.19, 23.57, 118.32, 0.00, 7.43, 12.53),
(3, 98.60, 21.99, 161.35, 0.00, 10.58, 17.73),
(4, 169.11, 59.38, 103.10, 24.71, 29.66, 56.95),
(5, 123.42, 57.53, 117.56, 86.67, 18.99, 31.91),
(6, 132.62, 46.27, 175.22, 87.35, 12.76, 19.13),
(7, 59.96, 33.01, 382.22, 68.74, 14.91, 24.94);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
