-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2017 at 07:36 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sxc_helper`
--

-- --------------------------------------------------------

--
-- Table structure for table `bsc`
--

CREATE TABLE `bsc` (
  `Student_Name` varchar(50) NOT NULL,
  `CIN_Number` varchar(20) NOT NULL,
  `Registration_Number` varchar(20) NOT NULL,
  `Guardian_Name` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `Mobile_Number` bigint(20) UNSIGNED NOT NULL,
  `Image_of_Student` varchar(500) DEFAULT NULL,
  `Date_of_Birth` date NOT NULL,
  `Blood_Group` varchar(10) NOT NULL,
  `Department_Code` varchar(10) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Semester` varchar(10) NOT NULL,
  `Mail_ID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cia_marks_obtained_sem1`
--

CREATE TABLE `cia_marks_obtained_sem1` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours11` int(10) DEFAULT NULL,
  `Honours12` int(10) DEFAULT NULL,
  `Ancillary11` int(10) DEFAULT NULL,
  `Ancillary12` int(10) DEFAULT NULL,
  `MIL1` int(10) DEFAULT NULL,
  `FDNC1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cia_marks_obtained_sem2`
--

CREATE TABLE `cia_marks_obtained_sem2` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours21` int(10) DEFAULT NULL,
  `Honours22` int(10) DEFAULT NULL,
  `Honours23` int(10) DEFAULT NULL,
  `Ancillary21` int(10) DEFAULT NULL,
  `Ancillary22` int(10) DEFAULT NULL,
  `MIL2` int(10) DEFAULT NULL,
  `FDNC2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cia_marks_obtained_sem3`
--

CREATE TABLE `cia_marks_obtained_sem3` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours31` int(10) DEFAULT NULL,
  `Honours32` int(10) DEFAULT NULL,
  `Ancillary31` int(10) DEFAULT NULL,
  `Ancillary32` int(10) DEFAULT NULL,
  `ENVS1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cia_marks_obtained_sem4`
--

CREATE TABLE `cia_marks_obtained_sem4` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours41` int(10) DEFAULT NULL,
  `Honours42` int(10) DEFAULT NULL,
  `Honours43` int(10) DEFAULT NULL,
  `Honours44` int(10) DEFAULT NULL,
  `Honours45` int(10) DEFAULT NULL,
  `ENVS2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cia_marks_obtained_sem5`
--

CREATE TABLE `cia_marks_obtained_sem5` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours51` int(10) DEFAULT NULL,
  `Honours52` int(10) DEFAULT NULL,
  `Honours53` int(10) DEFAULT NULL,
  `Honours54` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cia_marks_obtained_sem6`
--

CREATE TABLE `cia_marks_obtained_sem6` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours61` int(10) DEFAULT NULL,
  `Honours62` int(10) DEFAULT NULL,
  `Honours63` int(10) DEFAULT NULL,
  `Honours64` int(10) DEFAULT NULL,
  `Honours65` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cin_password`
--

CREATE TABLE `cin_password` (
  `CIN_Number` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Security_Question` varchar(500) NOT NULL,
  `Answer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_attended_sem1`
--

CREATE TABLE `classes_attended_sem1` (
  `CIN_Number` varchar(20) NOT NULL,
  `Honours11` int(10) DEFAULT NULL,
  `Honours12` int(10) DEFAULT NULL,
  `Ancillary11` int(10) DEFAULT NULL,
  `Ancillary12` int(10) DEFAULT NULL,
  `MIL1` int(10) DEFAULT NULL,
  `FDNC1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_attended_sem2`
--

CREATE TABLE `classes_attended_sem2` (
  `CIN_Number` varchar(20) NOT NULL,
  `Honours21` int(10) DEFAULT NULL,
  `Honours22` int(10) DEFAULT NULL,
  `Honours23` int(10) DEFAULT NULL,
  `Ancillary21` int(10) DEFAULT NULL,
  `Ancillary22` int(10) DEFAULT NULL,
  `MIL2` int(10) DEFAULT NULL,
  `FDNC2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_attended_sem3`
--

CREATE TABLE `classes_attended_sem3` (
  `CIN_Number` varchar(20) NOT NULL,
  `Honours31` int(10) DEFAULT NULL,
  `Honours32` int(10) DEFAULT NULL,
  `Ancillary31` int(10) DEFAULT NULL,
  `Ancillary32` int(10) DEFAULT NULL,
  `ENVS1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_attended_sem4`
--

CREATE TABLE `classes_attended_sem4` (
  `CIN_Number` varchar(20) NOT NULL,
  `Honours41` int(10) DEFAULT NULL,
  `Honours42` int(10) DEFAULT NULL,
  `Honours43` int(10) DEFAULT NULL,
  `Honours44` int(10) DEFAULT NULL,
  `Honours45` int(10) DEFAULT NULL,
  `ENVS2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_attended_sem5`
--

CREATE TABLE `classes_attended_sem5` (
  `CIN_Number` varchar(20) NOT NULL,
  `Honours51` int(10) DEFAULT NULL,
  `Honours52` int(10) DEFAULT NULL,
  `Honours53` int(10) DEFAULT NULL,
  `Honours54` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes_attended_sem6`
--

CREATE TABLE `classes_attended_sem6` (
  `CIN_Number` varchar(20) NOT NULL,
  `Honours61` int(10) DEFAULT NULL,
  `Honours62` int(10) DEFAULT NULL,
  `Honours63` int(10) DEFAULT NULL,
  `Honours64` int(10) DEFAULT NULL,
  `Honours65` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem1_subject_code`
--

CREATE TABLE `sem1_subject_code` (
  `Department_Code` varchar(10) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Honours11` varchar(20) DEFAULT NULL,
  `Honours12` varchar(20) DEFAULT NULL,
  `Ancillary11` varchar(20) DEFAULT NULL,
  `Ancillary12` varchar(20) DEFAULT NULL,
  `MIL1` varchar(20) DEFAULT NULL,
  `FDNC1` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sem1_subject_code`
--

INSERT INTO `sem1_subject_code` (`Department_Code`, `Subject_Combination`, `Honours11`, `Honours12`, `Ancillary11`, `Ancillary12`, `MIL1`, `FDNC1`) VALUES
('STSA', 4, 'ST31022', 'ST31011T', 'EC21021T', 'MT21011T', 'HN11011T', 'FDNC1101');

-- --------------------------------------------------------

--
-- Table structure for table `sem2_subject_code`
--

CREATE TABLE `sem2_subject_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Honours21` varchar(20) DEFAULT NULL,
  `Honours22` varchar(20) DEFAULT NULL,
  `Honours23` varchar(20) DEFAULT NULL,
  `Ancillary21` varchar(20) DEFAULT NULL,
  `Ancillary22` varchar(20) DEFAULT NULL,
  `MIL2` varchar(20) DEFAULT NULL,
  `FDNC2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sem2_subject_code`
--

INSERT INTO `sem2_subject_code` (`Department_Code`, `Subject_Combination`, `Honours21`, `Honours22`, `Honours23`, `Ancillary21`, `Ancillary22`, `MIL2`, `FDNC2`) VALUES
('STSA', 4, 'ST32042', 'ST32031T', NULL, 'EC22041T', 'MT22021T', 'CE12011T', 'FDNC1202');

-- --------------------------------------------------------

--
-- Table structure for table `sem3_subject_code`
--

CREATE TABLE `sem3_subject_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Honours31` varchar(20) DEFAULT NULL,
  `Honours32` varchar(20) DEFAULT NULL,
  `Ancillary31` varchar(20) DEFAULT NULL,
  `Ancillary32` varchar(20) DEFAULT NULL,
  `ENVS1` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem4_subject_code`
--

CREATE TABLE `sem4_subject_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Honours41` varchar(20) DEFAULT NULL,
  `Honours42` varchar(20) DEFAULT NULL,
  `Honours43` varchar(20) DEFAULT NULL,
  `Honours44` varchar(20) DEFAULT NULL,
  `Honours45` varchar(20) DEFAULT NULL,
  `ENVS2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem5_subject_code`
--

CREATE TABLE `sem5_subject_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Honours51` varchar(20) DEFAULT NULL,
  `Honours52` varchar(20) DEFAULT NULL,
  `Honours53` varchar(20) DEFAULT NULL,
  `Honours54` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem6_subject_code`
--

CREATE TABLE `sem6_subject_code` (
  `Department_Code` varchar(20) NOT NULL,
  `Subject_Combination` int(5) NOT NULL,
  `Honours61` varchar(20) DEFAULT NULL,
  `Honours62` varchar(20) DEFAULT NULL,
  `Honours63` varchar(20) DEFAULT NULL,
  `Honours64` varchar(20) DEFAULT NULL,
  `Honours65` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester_marks_obtained_sem1`
--

CREATE TABLE `semester_marks_obtained_sem1` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours11` int(10) DEFAULT NULL,
  `Honours12` int(10) DEFAULT NULL,
  `Ancillary11` int(10) DEFAULT NULL,
  `Ancillary12` int(10) DEFAULT NULL,
  `MIL1` int(10) DEFAULT NULL,
  `FDNC1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester_marks_obtained_sem2`
--

CREATE TABLE `semester_marks_obtained_sem2` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours21` int(10) DEFAULT NULL,
  `Honours22` int(10) DEFAULT NULL,
  `Honours23` int(10) DEFAULT NULL,
  `Ancillary21` int(10) DEFAULT NULL,
  `Ancillary22` int(10) DEFAULT NULL,
  `MIL2` int(10) DEFAULT NULL,
  `FDNC2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester_marks_obtained_sem3`
--

CREATE TABLE `semester_marks_obtained_sem3` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours31` int(10) DEFAULT NULL,
  `Honours32` int(10) DEFAULT NULL,
  `Ancillary31` int(10) DEFAULT NULL,
  `Ancillary32` int(10) DEFAULT NULL,
  `ENVS1` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester_marks_obtained_sem4`
--

CREATE TABLE `semester_marks_obtained_sem4` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours41` int(10) DEFAULT NULL,
  `Honours42` int(10) DEFAULT NULL,
  `Honours43` int(10) DEFAULT NULL,
  `Honours44` int(10) DEFAULT NULL,
  `Honours45` int(10) DEFAULT NULL,
  `ENVS2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester_marks_obtained_sem5`
--

CREATE TABLE `semester_marks_obtained_sem5` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours51` int(10) DEFAULT NULL,
  `Honours52` int(10) DEFAULT NULL,
  `Honours53` int(10) DEFAULT NULL,
  `Honours54` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester_marks_obtained_sem6`
--

CREATE TABLE `semester_marks_obtained_sem6` (
  `Registration_Number` varchar(20) NOT NULL,
  `Honours61` int(10) DEFAULT NULL,
  `Honours62` int(10) DEFAULT NULL,
  `Honours63` int(10) DEFAULT NULL,
  `Honours64` int(10) DEFAULT NULL,
  `Honours65` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_sem1`
--

CREATE TABLE `total_classes_sem1` (
  `Subject_Code` varchar(20) NOT NULL,
  `Department_Code` varchar(20) NOT NULL,
  `Total_Classes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_classes_sem1`
--

INSERT INTO `total_classes_sem1` (`Subject_Code`, `Department_Code`, `Total_Classes`) VALUES
('FDNC1101', 'MCBA', NULL),
('FDNC1101', 'MTMA', NULL),
('FDNC1101', 'PHSA', NULL),
('FDNC1101', 'STSA', NULL),
('HN11011T', 'CEMA', NULL),
('HN11011T', 'CMSA', NULL),
('HN11011T', 'ECOA', NULL),
('HN11011T', 'MCBA', NULL),
('HN11011T', 'MTMA', NULL),
('HN11011T', 'PHSA', NULL),
('HN11011T', 'STSA', NULL),
('MB31012', 'MCBA', NULL),
('MB31022', 'MCBA', NULL),
('MT21011T', 'CEMA', NULL),
('MT21011T', 'CMSA', NULL),
('MT21011T', 'ECOA', NULL),
('MT21011T', 'PHSA', NULL),
('MT21011T', 'STSA', NULL),
('MT31011T', 'MTMA', NULL),
('MT31021T', 'MTMA', NULL),
('PH21012', 'CEMA', NULL),
('PH21012', 'CMSA', NULL),
('PH21012', 'MCBA', NULL),
('PH21012', 'MTMA', NULL),
('PH31011T', 'PHSA', NULL),
('PH31021T', 'PHSA', NULL),
('PS21011T', 'ECOA', NULL),
('ST21012', 'ECOA', NULL),
('ST21012', 'MTMA', NULL),
('ST31011T', 'STSA', NULL),
('ST31022', 'STSA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_sem2`
--

CREATE TABLE `total_classes_sem2` (
  `Subject_Code` varchar(20) NOT NULL,
  `Department_Code` varchar(20) NOT NULL,
  `Total_Classes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_classes_sem2`
--

INSERT INTO `total_classes_sem2` (`Subject_Code`, `Department_Code`, `Total_Classes`) VALUES
('FDNC1202', 'MCBA', NULL),
('FDNC1202', 'MTMA', NULL),
('FDNC1202', 'PHSA', NULL),
('FDNC1202', 'STSA', NULL),
('MB32032', 'MCBA', NULL),
('MB32042', 'MCBA', NULL),
('MT22021T', 'CEMA', NULL),
('MT22021T', 'CMSA', NULL),
('MT22021T', 'ECOA', NULL),
('MT22021T', 'PHSA', NULL),
('MT22021T', 'STSA', NULL),
('MT32031T', 'MTMA', NULL),
('MT32041T', 'MTMA', NULL),
('PH22022', 'CEMA', NULL),
('PH22022', 'CMSA', NULL),
('PH22022', 'MCBA', NULL),
('PH22022', 'MTMA', NULL),
('PH32031T', 'PHSA', NULL),
('PH32041T', 'PHSA', NULL),
('PH32511P', 'PHSA', NULL),
('PS22021T', 'ECOA', NULL),
('ST22022', 'ECOA', NULL),
('ST22022', 'MTMA', NULL),
('ST32031T', 'STSA', NULL),
('ST32042', 'STSA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_sem3`
--

CREATE TABLE `total_classes_sem3` (
  `Subject_Code` varchar(20) NOT NULL,
  `Department_Code` varchar(20) NOT NULL,
  `Total_Classes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_classes_sem3`
--

INSERT INTO `total_classes_sem3` (`Subject_Code`, `Department_Code`, `Total_Classes`) VALUES
('MT23031T', 'CMSA', NULL),
('MT23031T', 'ECOA', NULL),
('MT23031T', 'PHSA', NULL),
('MT23031T', 'STSA', NULL),
('MT33051T', 'MTMA', NULL),
('MT33061T', 'MTMA', NULL),
('PH23022', 'MCBA', NULL),
('PH23032', 'CEMA', NULL),
('PH23032', 'CMSA', NULL),
('PH23032', 'MTMA', NULL),
('PH33051T', 'PHSA', NULL),
('PH33061T', 'PHSA', NULL),
('PS23031T', 'ECOA', NULL),
('ST23032', 'ECOA', NULL),
('ST23032', 'MTMA', NULL),
('ST33051T', 'STSA', NULL),
('ST33062', 'STSA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_sem4`
--

CREATE TABLE `total_classes_sem4` (
  `Subject_Code` varchar(20) NOT NULL,
  `Department_Code` varchar(20) NOT NULL,
  `Total_Classes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_classes_sem4`
--

INSERT INTO `total_classes_sem4` (`Subject_Code`, `Department_Code`, `Total_Classes`) VALUES
('PH34091T', 'PHSA', NULL),
('PH34112', 'PHSA', NULL),
('PH34521P', 'PHSA', NULL),
('ST34071T', 'STSA', NULL),
('ST34081T', 'STSA', NULL),
('ST34091T', 'STSA', NULL),
('ST34511P', 'STSA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_sem5`
--

CREATE TABLE `total_classes_sem5` (
  `Subject_Code` varchar(20) NOT NULL,
  `Department_Code` varchar(20) NOT NULL,
  `Total_Classes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_classes_sem5`
--

INSERT INTO `total_classes_sem5` (`Subject_Code`, `Department_Code`, `Total_Classes`) VALUES
('ST35121T', 'STSA', NULL),
('ST35521P', 'STSA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_sem6`
--

CREATE TABLE `total_classes_sem6` (
  `Subject_Code` varchar(20) NOT NULL,
  `Department_Code` varchar(20) NOT NULL,
  `Total_Classes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `total_marks_sem1`
--

CREATE TABLE `total_marks_sem1` (
  `Subject_Code` varchar(20) NOT NULL,
  `Cia_Total_Marks` int(10) DEFAULT NULL,
  `Semester_Total_Marks` int(10) DEFAULT NULL,
  `Qualifying_Marks` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `total_marks_sem2`
--

CREATE TABLE `total_marks_sem2` (
  `Subject_Code` varchar(20) NOT NULL,
  `Cia_Total_Marks` int(10) DEFAULT NULL,
  `Semester_Total_Marks` int(10) DEFAULT NULL,
  `Qualifying_Marks` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `total_marks_sem3`
--

CREATE TABLE `total_marks_sem3` (
  `Subject_Code` varchar(20) NOT NULL,
  `Cia_Total_Marks` int(10) DEFAULT NULL,
  `Semester_Total_Marks` int(10) DEFAULT NULL,
  `Qualifying_Marks` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `total_marks_sem4`
--

CREATE TABLE `total_marks_sem4` (
  `Subject_Code` varchar(20) NOT NULL,
  `Cia_Total_Marks` int(10) DEFAULT NULL,
  `Semester_Total_Marks` int(10) DEFAULT NULL,
  `Qualifying_Marks` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_marks_sem4`
--

INSERT INTO `total_marks_sem4` (`Subject_Code`, `Cia_Total_Marks`, `Semester_Total_Marks`, `Qualifying_Marks`) VALUES
('PH34521P', 20, 80, 40),
('ST34071T', 20, 80, 40),
('ST34081T', 20, 80, 40),
('ST34091T', 20, 80, 40),
('ST34511P', 20, 80, 40);

-- --------------------------------------------------------

--
-- Table structure for table `total_marks_sem5`
--

CREATE TABLE `total_marks_sem5` (
  `Subject_Code` varchar(20) NOT NULL,
  `Cia_Total_Marks` int(10) DEFAULT NULL,
  `Semester_Total_Marks` int(10) DEFAULT NULL,
  `Qualifying_Marks` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_marks_sem5`
--

INSERT INTO `total_marks_sem5` (`Subject_Code`, `Cia_Total_Marks`, `Semester_Total_Marks`, `Qualifying_Marks`) VALUES
('ST35121T', 20, 80, 40),
('ST35521P', 20, 80, 40);

-- --------------------------------------------------------

--
-- Table structure for table `total_marks_sem6`
--

CREATE TABLE `total_marks_sem6` (
  `Subject_Code` varchar(20) NOT NULL,
  `Cia_Total_Marks` int(10) DEFAULT NULL,
  `Semester_Total_Marks` int(10) DEFAULT NULL,
  `Qualifying_Marks` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bsc`
--
ALTER TABLE `bsc`
  ADD PRIMARY KEY (`CIN_Number`),
  ADD UNIQUE KEY `CIN_Number` (`CIN_Number`),
  ADD UNIQUE KEY `Registration_Number` (`Registration_Number`),
  ADD UNIQUE KEY `Mobile_Number` (`Mobile_Number`),
  ADD UNIQUE KEY `Mail_ID` (`Mail_ID`);

--
-- Indexes for table `cia_marks_obtained_sem1`
--
ALTER TABLE `cia_marks_obtained_sem1`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `cia_marks_obtained_sem2`
--
ALTER TABLE `cia_marks_obtained_sem2`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `cia_marks_obtained_sem3`
--
ALTER TABLE `cia_marks_obtained_sem3`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `cia_marks_obtained_sem4`
--
ALTER TABLE `cia_marks_obtained_sem4`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `cia_marks_obtained_sem5`
--
ALTER TABLE `cia_marks_obtained_sem5`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `cia_marks_obtained_sem6`
--
ALTER TABLE `cia_marks_obtained_sem6`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `cin_password`
--
ALTER TABLE `cin_password`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `classes_attended_sem1`
--
ALTER TABLE `classes_attended_sem1`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `classes_attended_sem2`
--
ALTER TABLE `classes_attended_sem2`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `classes_attended_sem3`
--
ALTER TABLE `classes_attended_sem3`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `classes_attended_sem4`
--
ALTER TABLE `classes_attended_sem4`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `classes_attended_sem5`
--
ALTER TABLE `classes_attended_sem5`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `classes_attended_sem6`
--
ALTER TABLE `classes_attended_sem6`
  ADD PRIMARY KEY (`CIN_Number`);

--
-- Indexes for table `sem1_subject_code`
--
ALTER TABLE `sem1_subject_code`
  ADD PRIMARY KEY (`Department_Code`,`Subject_Combination`);

--
-- Indexes for table `sem2_subject_code`
--
ALTER TABLE `sem2_subject_code`
  ADD PRIMARY KEY (`Department_Code`,`Subject_Combination`);

--
-- Indexes for table `sem3_subject_code`
--
ALTER TABLE `sem3_subject_code`
  ADD PRIMARY KEY (`Department_Code`,`Subject_Combination`);

--
-- Indexes for table `sem4_subject_code`
--
ALTER TABLE `sem4_subject_code`
  ADD PRIMARY KEY (`Department_Code`,`Subject_Combination`);

--
-- Indexes for table `sem5_subject_code`
--
ALTER TABLE `sem5_subject_code`
  ADD PRIMARY KEY (`Department_Code`,`Subject_Combination`);

--
-- Indexes for table `sem6_subject_code`
--
ALTER TABLE `sem6_subject_code`
  ADD PRIMARY KEY (`Department_Code`,`Subject_Combination`);

--
-- Indexes for table `semester_marks_obtained_sem1`
--
ALTER TABLE `semester_marks_obtained_sem1`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `semester_marks_obtained_sem2`
--
ALTER TABLE `semester_marks_obtained_sem2`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `semester_marks_obtained_sem3`
--
ALTER TABLE `semester_marks_obtained_sem3`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `semester_marks_obtained_sem4`
--
ALTER TABLE `semester_marks_obtained_sem4`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `semester_marks_obtained_sem5`
--
ALTER TABLE `semester_marks_obtained_sem5`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `semester_marks_obtained_sem6`
--
ALTER TABLE `semester_marks_obtained_sem6`
  ADD PRIMARY KEY (`Registration_Number`);

--
-- Indexes for table `total_classes_sem1`
--
ALTER TABLE `total_classes_sem1`
  ADD PRIMARY KEY (`Subject_Code`,`Department_Code`);

--
-- Indexes for table `total_classes_sem2`
--
ALTER TABLE `total_classes_sem2`
  ADD PRIMARY KEY (`Subject_Code`,`Department_Code`);

--
-- Indexes for table `total_classes_sem3`
--
ALTER TABLE `total_classes_sem3`
  ADD PRIMARY KEY (`Subject_Code`,`Department_Code`);

--
-- Indexes for table `total_classes_sem4`
--
ALTER TABLE `total_classes_sem4`
  ADD PRIMARY KEY (`Subject_Code`,`Department_Code`);

--
-- Indexes for table `total_classes_sem5`
--
ALTER TABLE `total_classes_sem5`
  ADD PRIMARY KEY (`Subject_Code`,`Department_Code`);

--
-- Indexes for table `total_classes_sem6`
--
ALTER TABLE `total_classes_sem6`
  ADD PRIMARY KEY (`Subject_Code`,`Department_Code`);

--
-- Indexes for table `total_marks_sem1`
--
ALTER TABLE `total_marks_sem1`
  ADD PRIMARY KEY (`Subject_Code`);

--
-- Indexes for table `total_marks_sem2`
--
ALTER TABLE `total_marks_sem2`
  ADD PRIMARY KEY (`Subject_Code`);

--
-- Indexes for table `total_marks_sem3`
--
ALTER TABLE `total_marks_sem3`
  ADD PRIMARY KEY (`Subject_Code`);

--
-- Indexes for table `total_marks_sem4`
--
ALTER TABLE `total_marks_sem4`
  ADD PRIMARY KEY (`Subject_Code`);

--
-- Indexes for table `total_marks_sem5`
--
ALTER TABLE `total_marks_sem5`
  ADD PRIMARY KEY (`Subject_Code`);

--
-- Indexes for table `total_marks_sem6`
--
ALTER TABLE `total_marks_sem6`
  ADD PRIMARY KEY (`Subject_Code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cia_marks_obtained_sem1`
--
ALTER TABLE `cia_marks_obtained_sem1`
  ADD CONSTRAINT `cia1` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `cia_marks_obtained_sem2`
--
ALTER TABLE `cia_marks_obtained_sem2`
  ADD CONSTRAINT `cia2` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `cia_marks_obtained_sem3`
--
ALTER TABLE `cia_marks_obtained_sem3`
  ADD CONSTRAINT `cia3` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `cia_marks_obtained_sem4`
--
ALTER TABLE `cia_marks_obtained_sem4`
  ADD CONSTRAINT `cia4` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `cia_marks_obtained_sem5`
--
ALTER TABLE `cia_marks_obtained_sem5`
  ADD CONSTRAINT `cia5` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `cia_marks_obtained_sem6`
--
ALTER TABLE `cia_marks_obtained_sem6`
  ADD CONSTRAINT `cia6` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `cin_password`
--
ALTER TABLE `cin_password`
  ADD CONSTRAINT `cinpassword` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `classes_attended_sem1`
--
ALTER TABLE `classes_attended_sem1`
  ADD CONSTRAINT `attendance1` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `classes_attended_sem2`
--
ALTER TABLE `classes_attended_sem2`
  ADD CONSTRAINT `attendance2` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `classes_attended_sem3`
--
ALTER TABLE `classes_attended_sem3`
  ADD CONSTRAINT `attendance3` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `classes_attended_sem4`
--
ALTER TABLE `classes_attended_sem4`
  ADD CONSTRAINT `attendance4` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `classes_attended_sem5`
--
ALTER TABLE `classes_attended_sem5`
  ADD CONSTRAINT `attendance5` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `classes_attended_sem6`
--
ALTER TABLE `classes_attended_sem6`
  ADD CONSTRAINT `attendance6` FOREIGN KEY (`CIN_Number`) REFERENCES `bsc` (`CIN_Number`);

--
-- Constraints for table `semester_marks_obtained_sem1`
--
ALTER TABLE `semester_marks_obtained_sem1`
  ADD CONSTRAINT `semester1` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `semester_marks_obtained_sem2`
--
ALTER TABLE `semester_marks_obtained_sem2`
  ADD CONSTRAINT `semester2` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `semester_marks_obtained_sem3`
--
ALTER TABLE `semester_marks_obtained_sem3`
  ADD CONSTRAINT `semester3` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `semester_marks_obtained_sem4`
--
ALTER TABLE `semester_marks_obtained_sem4`
  ADD CONSTRAINT `semester4` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `semester_marks_obtained_sem5`
--
ALTER TABLE `semester_marks_obtained_sem5`
  ADD CONSTRAINT `semester5` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

--
-- Constraints for table `semester_marks_obtained_sem6`
--
ALTER TABLE `semester_marks_obtained_sem6`
  ADD CONSTRAINT `semester6` FOREIGN KEY (`Registration_Number`) REFERENCES `bsc` (`Registration_Number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
