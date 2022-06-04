-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2022 at 01:29 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resolutionx`
--
CREATE DATABASE IF NOT EXISTS `resolutionx` DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci;
USE `resolutionx`;

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `LicenseKey` varchar(32) NOT NULL,
  `Expiration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`LicenseKey`, `Expiration`) VALUES
('9ZG5-QH51-M44R-4U12', '2023-06-04 23:15:18'),
('I04Y-X5NH-I20C-7JLO', '0000-00-00 00:00:00'),
('NQ1Q-CD2V-HZZC-OFIB', '0000-00-00 00:00:00'),
('UMTY-SO88-U938-56FG', '0000-00-00 00:00:00'),
('W8SN-VZSR-GIBF-ANXO', '0000-00-00 00:00:00'),
('WC7F-2IJX-USS5-BPC9', '2022-06-03 23:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `IDUser` int(11) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Email` varchar(55) NOT NULL,
  `UserType` varchar(10) NOT NULL DEFAULT 'MEMBER',
  `LicenseKey` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`IDUser`, `Username`, `Password`, `Email`, `UserType`, `LicenseKey`) VALUES
(1, 'guihslk', 'admin', 'admin@gmail.com', 'ADMIN', '9ZG5-QH51-M44R-4U12'),
(2, 'admin', 'admin', 'admin@gmail.com', 'ADMIN', 'I04Y-X5NH-I20C-7JLO'),
(3, 'guest', 'guest', 'guest@gmail.com', 'MEMBER', 'WC7F-2IJX-USS5-BPC9');

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `Type` varchar(10) NOT NULL,
  `Permission` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`Type`, `Permission`) VALUES
('ADMIN', 10),
('MEMBER', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`LicenseKey`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUser`),
  ADD UNIQUE KEY `LicenseKey_2` (`LicenseKey`),
  ADD KEY `UserType` (`UserType`),
  ADD KEY `LicenseKey` (`LicenseKey`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`Type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`LicenseKey`) REFERENCES `licenses` (`LicenseKey`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`UserType`) REFERENCES `usertypes` (`Type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
