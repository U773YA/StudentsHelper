-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2017 at 01:48 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noticeboard`
--
CREATE DATABASE IF NOT EXISTS `noticeboard` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `noticeboard`;

-- --------------------------------------------------------

--
-- Table structure for table `notice_slip`
--

DROP TABLE IF EXISTS `notice_slip`;
CREATE TABLE IF NOT EXISTS `notice_slip` (
  `Teacher_Name` varchar(50) NOT NULL,
  `Department_Code` varchar(10) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELIMITER $$
--
-- Events
--
DROP EVENT `Delete`$$
CREATE DEFINER=`root`@`localhost` EVENT `Delete` ON SCHEDULE EVERY 1 DAY STARTS '2017-03-15 00:15:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM notice_slip WHERE notice_slip.End_Date=CURRENT_DATE$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
