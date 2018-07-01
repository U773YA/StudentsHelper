-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2017 at 01:49 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `subject_code`
--
CREATE DATABASE IF NOT EXISTS `subject_code` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `subject_code`;

-- --------------------------------------------------------

--
-- Table structure for table `sem1_code`
--

DROP TABLE IF EXISTS `sem1_code`;
CREATE TABLE IF NOT EXISTS `sem1_code` (
  `Department_Code` varchar(10) NOT NULL,
  `Honours11` varchar(20) NOT NULL,
  `Honours12` varchar(20) NOT NULL,
  `Honours13` varchar(20) DEFAULT NULL,
  `Honours14` varchar(20) DEFAULT NULL,
  `Ancillary11` varchar(20) NOT NULL,
  `Ancillary12` varchar(20) NOT NULL,
  `MIL1` varchar(20) NOT NULL,
  `FDNC1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem2_code`
--

DROP TABLE IF EXISTS `sem2_code`;
CREATE TABLE IF NOT EXISTS `sem2_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Honours21` varchar(20) NOT NULL,
  `Honours22` varchar(20) NOT NULL,
  `Honours23` varchar(20) NOT NULL,
  `Honours24` varchar(20) NOT NULL,
  `Ancillary21` varchar(20) NOT NULL,
  `Ancillary22` varchar(20) NOT NULL,
  `MIL2` varchar(20) NOT NULL,
  `FDNC2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem3_code`
--

DROP TABLE IF EXISTS `sem3_code`;
CREATE TABLE IF NOT EXISTS `sem3_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Honours31` varchar(20) NOT NULL,
  `Honours32` varchar(20) NOT NULL,
  `Honours33` varchar(20) DEFAULT NULL,
  `Honours34` varchar(20) DEFAULT NULL,
  `Ancillary31` varchar(20) NOT NULL,
  `Ancillary32` varchar(20) NOT NULL,
  `ENVS1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem4_code`
--

DROP TABLE IF EXISTS `sem4_code`;
CREATE TABLE IF NOT EXISTS `sem4_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Honours41` varchar(20) NOT NULL,
  `Honours42` varchar(20) NOT NULL,
  `Honours43` varchar(20) DEFAULT NULL,
  `Honours44` varchar(20) DEFAULT NULL,
  `Honours45` varchar(20) DEFAULT NULL,
  `Honours46` varchar(20) DEFAULT NULL,
  `ENVS2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem5_code`
--

DROP TABLE IF EXISTS `sem5_code`;
CREATE TABLE IF NOT EXISTS `sem5_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Honours51` varchar(20) NOT NULL,
  `Honours52` varchar(20) NOT NULL,
  `Honours53` varchar(20) DEFAULT NULL,
  `Honours54` varchar(20) DEFAULT NULL,
  `Honours55` varchar(20) DEFAULT NULL,
  `Honours56` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem6_code`
--

DROP TABLE IF EXISTS `sem6_code`;
CREATE TABLE IF NOT EXISTS `sem6_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Honours61` varchar(20) NOT NULL,
  `Honours62` varchar(20) NOT NULL,
  `Honours63` varchar(20) DEFAULT NULL,
  `Honours64` varchar(20) DEFAULT NULL,
  `Honours65` varchar(20) DEFAULT NULL,
  `Honours66` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
