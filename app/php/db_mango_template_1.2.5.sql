-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2019 at 11:11 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mango`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `AccountID` int(11) NOT NULL,
  `AccountTypeID` int(11) DEFAULT NULL,
  `Username` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FirstName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MiddleName` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `PositionID` int(11) DEFAULT NULL,
  `WelcomeMessage` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AccountStatus` int(11) DEFAULT NULL,
  `PasswordDateChange` date DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `TeamID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountID`, `AccountTypeID`, `Username`, `Password`, `LastName`, `FirstName`, `MiddleName`, `EmployeeID`, `PositionID`, `WelcomeMessage`, `AccountStatus`, `PasswordDateChange`, `DateCreated`, `DateModified`, `TeamID`) VALUES
(55, 6, 'batman', '474ee9ee179b0ecf0bc27408079a0b15eda4c99d', 'Man', 'Batangas', NULL, 100001, 2, NULL, 1, '0000-00-00', '2019-03-11 13:02:26', '2019-04-02 17:31:12', 0),
(65, 7, 'hruser', '07e0c412a674d3a1257dfe795e3819835c8c7526', 'Negro', 'Boy', NULL, 100003, 3, NULL, 1, '0000-00-00', '2019-04-02 19:39:51', '2019-04-02 19:41:19', 0),
(64, 5, 'tina', '147f6d8564d1761fc0c68ea22b70f8c09545ebc1', 'Sold', 'Tina', NULL, 100002, 1, NULL, 1, '0000-00-00', '2019-04-02 17:32:46', '2019-04-02 17:33:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `accountlogs`
--

CREATE TABLE `accountlogs` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `IpAddress` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Device` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Browser` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `BrowserVersion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OperatingSystem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateLogs` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DateCreated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounttype`
--

CREATE TABLE `accounttype` (
  `AccountTypeID` int(11) NOT NULL,
  `AccountType` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounttype`
--

INSERT INTO `accounttype` (`AccountTypeID`, `AccountType`, `Description`) VALUES
(5, 'Team Leader', 'Manages Team of Sales Representatives'),
(6, 'Sales Representative', 'Handles Client Sales');

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `ApplicantID` int(11) NOT NULL,
  `ApplicantTypeID` int(11) DEFAULT NULL,
  `LastName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `FirstName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `MiddleName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `BirthPlace` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `CivilStatus` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Gender` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `EmailAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `TelNo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ContactNo1` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ContactNo2` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `InCaseOfEmergency` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `SchoolName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Course` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `DateGraduate` date DEFAULT NULL,
  `Honor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `DateApplied` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL,
  `FirstName` varchar(255) COLLATE utf8_bin NOT NULL,
  `LastName` varchar(255) COLLATE utf8_bin NOT NULL,
  `Email` varchar(255) COLLATE utf8_bin NOT NULL,
  `ContactNumber` varchar(255) COLLATE utf8_bin NOT NULL,
  `Country` varchar(255) COLLATE utf8_bin NOT NULL,
  `Facebook` varchar(255) COLLATE utf8_bin NOT NULL,
  `AccountID` varchar(255) COLLATE utf8_bin NOT NULL,
  `Source` varchar(255) COLLATE utf8_bin NOT NULL,
  `BuyingPurpose` varchar(255) COLLATE utf8_bin NOT NULL,
  `InterestLevel` int(3) NOT NULL,
  `StartDate` date NOT NULL,
  `PreferredSize` varchar(255) COLLATE utf8_bin NOT NULL,
  `Notes` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ClientID`, `TeamID`, `FirstName`, `LastName`, `Email`, `ContactNumber`, `Country`, `Facebook`, `AccountID`, `Source`, `BuyingPurpose`, `InterestLevel`, `StartDate`, `PreferredSize`, `Notes`) VALUES
(1, 0, 'Airi', 'Satou', 'satou@gmail.jp.com', '09123456789', 'Japan', 'facebook.com/airi143', '55', 'Social Media', 'Investment', 3, '2019-03-26', 'any size', 'Sample note'),
(2, 0, 'Angelica', 'Ramos', 'angelrams@yahoo.com', '09123456789', 'AM', 'facebook.com/yourangel', '55', 'Social Media', 'Business', 3, '2019-03-26', 'any size', 'Will meet on monday for further discussion.'),
(3, 0, 'Ashton', 'Cox', 'cox@gmail.com', '09123456789', 'AM', 'facebook.com/cox', '55', 'Walk In', 'Business', 1, '2019-03-28', 'king size', 'did not proceed'),
(4, 0, 'Bradley', 'Greer', 'bradg@hotmail.com', '09123456789', 'AM', 'facebook.com/bradg', '55', 'Flyer', 'Investment', 3, '2019-03-28', 'any size', 'brad g comment'),
(5, 0, 'Bruno', 'Nash', 'nash@no-reply.gmail.com', '09123456789', 'Iran', 'facebook.com/allahu.akbar', '55', 'Facebook', 'Terrorism', 3, '2019-03-29', 'Nuclear Size', 'Allahu akbar!'),
(14, 0, 'Cara', 'Stevens', 'cstevens@special.com', '09123456789', 'American Samoa', 'facebook.com/cstevens', '55', 'Walk In', 'asd', 3, '2019-03-29', 'asd', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL,
  `POSITION_ID` int(11) DEFAULT NULL,
  `LAST_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIDDLE_NAME` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIDEN_NAME` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREFIX_NAME` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUFFIX_NAME` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIAL_NAME` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OTHER_NAME` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NICK_NAME` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMPLOYEE_TYPEID` int(11) DEFAULT NULL,
  `STATUS_ID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROV_CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOWN_CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZIP_CODE` int(20) DEFAULT NULL,
  `TEL_NO` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_NO_1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_NO_2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INCASE_OF_EMERGENCY_NO` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_EMAIL_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FACEBOOK_EMAIL_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_EMAIL_ADDRESS_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_EMAIL_ADDRESS_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `BIRTH_PLACE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CIVIL_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GENDER` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELIGION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NATIONALITY` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOOD_TYPE` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEIGHT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CRN` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIN` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SSS` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHILHEALTH` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGIBIG` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DRIVER_LICENSE` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_HIRED_PROVISIONARY` date DEFAULT NULL,
  `DATE_HIRED_REGULAR` date DEFAULT NULL,
  `DATE_RESIGNED_SEPERATED` date DEFAULT NULL,
  `DATE_RETIREMENT` date DEFAULT NULL,
  `DATE_CREATED` timestamp NULL DEFAULT NULL,
  `DATE_MODIFIED` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `EMPLOYEE_ID`, `DEPARTMENT_ID`, `POSITION_ID`, `LAST_NAME`, `FIRST_NAME`, `MIDDLE_NAME`, `MAIDEN_NAME`, `PREFIX_NAME`, `SUFFIX_NAME`, `INITIAL_NAME`, `OTHER_NAME`, `NICK_NAME`, `EMPLOYEE_TYPEID`, `STATUS_ID`, `ADDRESS`, `PROV_CODE`, `TOWN_CODE`, `ZIP_CODE`, `TEL_NO`, `CONTACT_NO_1`, `CONTACT_NO_2`, `INCASE_OF_EMERGENCY_NO`, `PERSONAL_EMAIL_ADDRESS`, `FACEBOOK_EMAIL_ADDRESS`, `COMPANY_EMAIL_ADDRESS_1`, `COMPANY_EMAIL_ADDRESS_2`, `BIRTH_DATE`, `BIRTH_PLACE`, `CIVIL_STATUS`, `GENDER`, `RELIGION`, `NATIONALITY`, `BLOOD_TYPE`, `HEIGHT`, `WEIGHT`, `CRN`, `TIN`, `SSS`, `PHILHEALTH`, `PAGIBIG`, `DRIVER_LICENSE`, `DATE_HIRED_PROVISIONARY`, `DATE_HIRED_REGULAR`, `DATE_RESIGNED_SEPERATED`, `DATE_RETIREMENT`, `DATE_CREATED`, `DATE_MODIFIED`) VALUES
(109, 100002, 1, 1, 'Sold', 'Tina', 'A', 'Tina Sale', '', '', NULL, NULL, NULL, 1, 1, 'Mabini', 'Manila', 'Caloocan', 0, '09123456789', '09973184463', NULL, NULL, NULL, NULL, NULL, NULL, '1994-11-13', 'Laguna', 'Married', 'Female', 'Catholic', 'Fil-Am', 'O', '156', '180', '', '', '', '', '', '', '2019-03-09', '0000-00-00', '0000-00-00', '0000-00-00', NULL, '2019-04-02 17:31:37'),
(108, 100001, 1, 2, 'Man', 'Batangas', '', '', '', '', NULL, NULL, NULL, 2, 1, 'L.Wood', 'Rizal', 'Taytay', 1920, '09123456789', '09973184463', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'Caloocan City', 'Single but ready to mingle', 'Male', 'Bhuddist', 'Filipino', '', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', NULL, '2019-04-02 17:22:39'),
(1, 100003, 1, 2, 'Negro', 'Boy', '', '', '', '', NULL, NULL, NULL, 2, 1, '561 Mabini St.', 'Manila', 'Caloocan', 1999, '', '09123456788', NULL, NULL, NULL, NULL, NULL, NULL, '1993-10-16', 'Mandaluyong City', 'Complicated', 'Male', '', 'Filipino', '', '', '', '', '', '', '', '', '', '2019-03-09', '0000-00-00', '0000-00-00', '0000-00-00', NULL, '2019-04-02 19:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `employee_department`
--

CREATE TABLE `employee_department` (
  `DEPARTMENT_ID` int(10) UNSIGNED NOT NULL,
  `DEPARTMENT_NAME` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_department`
--

INSERT INTO `employee_department` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `STATUS`) VALUES
(1, 'SALES MARKETING', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `POSITION_ID` int(10) UNSIGNED NOT NULL,
  `POSITION_FULL` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `JOB_DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_position`
--

INSERT INTO `employee_position` (`POSITION_ID`, `POSITION_FULL`, `JOB_DESCRIPTION`) VALUES
(1, 'Team Leader', 'LEADS A TEAM OF SALES REPRESENTATIVES'),
(2, 'Sales Representative', 'HANDLES CLIENT SALES'),
(3, 'Human Resource', 'HANDLES EMPLOYEE ON-BOARDING');

-- --------------------------------------------------------

--
-- Table structure for table `employee_status`
--

CREATE TABLE `employee_status` (
  `STATUS_ID` int(11) NOT NULL,
  `STATUS_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_status`
--

INSERT INTO `employee_status` (`STATUS_ID`, `STATUS_TYPE`) VALUES
(1, 'ACTIVE'),
(2, 'INACTIVE'),
(3, 'TRANSFER'),
(4, 'RETIREE'),
(5, 'DECEASED');

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

CREATE TABLE `employee_type` (
  `ID` int(11) NOT NULL,
  `EMPLOYEE_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`ID`, `EMPLOYEE_TYPE`, `DESCRIPTION`) VALUES
(1, 'REGULAR', 'REGULAR EMPLOYEE'),
(2, 'CONTRACTUAL', 'CONTRACTUAL EMPLOYEE'),
(3, 'OJT', 'ON-THE-JOB TRAINEE'),
(4, 'OUTSOURCE', 'OUTSIDE SOURCE');

-- --------------------------------------------------------

--
-- Table structure for table `interaction`
--

CREATE TABLE `interaction` (
  `InteractionID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `Notes` varchar(255) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(255) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `EstimatedAmount` varchar(255) DEFAULT NULL,
  `FinalAmount` varchar(255) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `TeamID` int(11) DEFAULT NULL,
  `BuyingStage` varchar(255) DEFAULT NULL,
  `DateAware` date DEFAULT NULL,
  `DateConsidered` date DEFAULT NULL,
  `DateDecision` date DEFAULT NULL,
  `AverageDaysDecision` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `ProjectName`, `Unit`, `EstimatedAmount`, `FinalAmount`, `ClientID`, `AccountID`, `TeamID`, `BuyingStage`, `DateAware`, `DateConsidered`, `DateDecision`, `AverageDaysDecision`) VALUES
(1, 'TCRS', NULL, NULL, NULL, 14, 55, 0, 'Awareness', '2019-03-29', '2019-04-03', '2019-04-03', NULL),
(2, 'DBR-SR', 'unit xhr-056', NULL, NULL, 1, 56, 1, 'Decision - Won', '2019-03-30', NULL, '2019-03-30', '0'),
(3, 'TFV', NULL, NULL, NULL, 14, 55, 0, 'Consideration', '2019-03-29', NULL, NULL, NULL),
(4, 'DBR-SR', NULL, NULL, NULL, 14, 55, 0, 'Decision - Won', '2019-03-29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(255) COLLATE utf8_bin NOT NULL,
  `TeamLeadID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountID`) USING BTREE,
  ADD KEY `employee` (`EmployeeID`);

--
-- Indexes for table `accountlogs`
--
ALTER TABLE `accountlogs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `accounttype`
--
ALTER TABLE `accounttype`
  ADD PRIMARY KEY (`AccountTypeID`) USING BTREE,
  ADD KEY `AccountTypeID` (`AccountTypeID`,`AccountType`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`ApplicantID`) USING BTREE;

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMPLOYEE_ID`) USING BTREE,
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`,`DEPARTMENT_ID`,`LAST_NAME`,`FIRST_NAME`,`MIDDLE_NAME`,`MAIDEN_NAME`,`PREFIX_NAME`,`SUFFIX_NAME`,`STATUS_ID`,`TEL_NO`,`CONTACT_NO_1`),
  ADD KEY `EMPLOYEE_ID_2` (`EMPLOYEE_ID`,`DEPARTMENT_ID`,`LAST_NAME`,`FIRST_NAME`,`MIDDLE_NAME`,`MAIDEN_NAME`,`PREFIX_NAME`,`SUFFIX_NAME`,`STATUS_ID`,`TEL_NO`,`CONTACT_NO_1`,`ID`),
  ADD KEY `EMPLOYEE_ID_3` (`EMPLOYEE_ID`,`DEPARTMENT_ID`,`POSITION_ID`,`LAST_NAME`,`FIRST_NAME`,`MIDDLE_NAME`,`MAIDEN_NAME`,`PREFIX_NAME`,`SUFFIX_NAME`,`EMPLOYEE_TYPEID`,`STATUS_ID`,`TEL_NO`,`CONTACT_NO_1`);

--
-- Indexes for table `employee_department`
--
ALTER TABLE `employee_department`
  ADD PRIMARY KEY (`DEPARTMENT_ID`);

--
-- Indexes for table `employee_position`
--
ALTER TABLE `employee_position`
  ADD PRIMARY KEY (`POSITION_ID`);

--
-- Indexes for table `employee_status`
--
ALTER TABLE `employee_status`
  ADD PRIMARY KEY (`STATUS_ID`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `interaction`
--
ALTER TABLE `interaction`
  ADD PRIMARY KEY (`InteractionID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ProjectID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TeamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `accountlogs`
--
ALTER TABLE `accountlogs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `accounttype`
--
ALTER TABLE `accounttype`
  MODIFY `AccountTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `ApplicantID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `employee_department`
--
ALTER TABLE `employee_department`
  MODIFY `DEPARTMENT_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `POSITION_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_status`
--
ALTER TABLE `employee_status`
  MODIFY `STATUS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_type`
--
ALTER TABLE `employee_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `interaction`
--
ALTER TABLE `interaction`
  MODIFY `InteractionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
