-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2019 at 06:57 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

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
(55, 6, 'batman', '474ee9ee179b0ecf0bc27408079a0b15eda4c99d', 'Man', 'Batangas', NULL, 100001, 2, NULL, 1, '0000-00-00', '2019-03-11 13:02:26', '2019-04-12 07:30:18', 1),
(65, 7, 'hruser', '07e0c412a674d3a1257dfe795e3819835c8c7526', 'Negro', 'Boy', NULL, 100003, 3, NULL, 1, '0000-00-00', '2019-04-02 19:39:51', '2019-04-02 19:41:19', 0),
(64, 5, 'tina', '147f6d8564d1761fc0c68ea22b70f8c09545ebc1', 'Sold', 'Tina', NULL, 100002, 1, NULL, 1, '0000-00-00', '2019-04-02 17:32:46', '2019-04-12 07:30:23', 1);

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
(6, 'Sales Representative', 'Handles Client Sales'),
(7, 'Human Resource', 'Handles internal functions within the organization');

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
-- Table structure for table `buying_stage`
--

CREATE TABLE `buying_stage` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `buying_stage`
--

INSERT INTO `buying_stage` (`id`, `name`) VALUES
(1, 'Awareness'),
(2, 'Consideration'),
(3, 'Decision - Won'),
(4, 'Decision - Lost');

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
(1, 1, 'Airi', 'Satou', 'satou@gmail.jp.com', '09123456789', 'Japan', 'facebook.com/airi143', '55', 'Social Media', 'Investment', 3, '2019-03-26', 'any size', 'Sample note'),
(2, 1, 'Angelica', 'Ramos', 'angelrams@yahoo.com', '09123456789', 'AM', 'facebook.com/yourangel', '55', 'Social Media', 'Business', 3, '2019-03-26', 'any size', 'Will meet on monday for further discussion.'),
(3, 1, 'Ashton', 'Cox', 'cox@gmail.com', '09123456789', 'AM', 'facebook.com/cox', '55', 'Walk In', 'Business', 1, '2019-03-28', 'king size', 'did not proceed'),
(4, 1, 'Bradley', 'Greer', 'bradg@hotmail.com', '09123456789', 'AM', 'facebook.com/bradg', '55', 'Flyer', 'Investment', 3, '2019-03-28', 'any size', 'brad g comment'),
(5, 1, 'Bruno', 'Nash', 'nash@no-reply.gmail.com', '09123456789', 'Iran', 'facebook.com/allahu.akbar', '55', 'Facebook', 'Terrorism', 3, '2019-03-29', 'Nuclear Size', 'Allahu akbar!'),
(14, 1, 'Cara', 'Stevens', 'cstevens@special.com', '09123456789', 'American Samoa', 'facebook.com/cstevens', '55', 'Walk In', 'asd', 3, '2019-03-29', 'asd', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `client2`
--

CREATE TABLE `client2` (
  `id` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL,
  `FirstName` varchar(255) COLLATE utf8_bin NOT NULL,
  `LastName` varchar(255) COLLATE utf8_bin NOT NULL,
  `Country` int(11) NOT NULL,
  `ContactNumber` varchar(255) COLLATE utf8_bin NOT NULL,
  `Email` varchar(255) COLLATE utf8_bin NOT NULL,
  `Facebook` varchar(255) COLLATE utf8_bin NOT NULL,
  `BuyingStage` int(11) NOT NULL,
  `BuyingPurpose` varchar(255) COLLATE utf8_bin NOT NULL,
  `Source` varchar(255) COLLATE utf8_bin NOT NULL,
  `InterestLevel` varchar(255) COLLATE utf8_bin NOT NULL,
  `Notes` varchar(255) COLLATE utf8_bin NOT NULL,
  `ProjectName` int(11) NOT NULL,
  `Unit` varchar(255) COLLATE utf8_bin NOT NULL,
  `PreferredSize` varchar(255) COLLATE utf8_bin NOT NULL,
  `EstimatedAmount` int(11) NOT NULL,
  `FinalAmount` int(11) NOT NULL,
  `DateAwareness` date NOT NULL,
  `DateConsideration` date NOT NULL,
  `DateDecision` date NOT NULL,
  `AverageDaysDecision` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client2`
--

INSERT INTO `client2` (`id`, `ClientID`, `AccountID`, `TeamID`, `FirstName`, `LastName`, `Country`, `ContactNumber`, `Email`, `Facebook`, `BuyingStage`, `BuyingPurpose`, `Source`, `InterestLevel`, `Notes`, `ProjectName`, `Unit`, `PreferredSize`, `EstimatedAmount`, `FinalAmount`, `DateAwareness`, `DateConsideration`, `DateDecision`, `AverageDaysDecision`) VALUES
(1, 1, 55, 1, 'Airi', 'Satou', 106, '09123456789', 'satou@gmail.jp.com', 'facebook.com/airi143', 3, 'Investment', 'Social Media', 'High', 'Sample note', 1, 'unit xhr-056', 'any size', 23000, 20000, '2019-04-01', '2019-04-03', '2019-04-05', 4),
(2, 2, 55, 1, 'Cara', 'Stevens', 4, '09123456789', 'cstevens@special.com', 'facebook.com/cstevens', 1, 'Business', 'Walk In', 'Neutral', 'Meetup next Tuesday', 2, 'unit tcrs-143', 'Queen Size', 36500, 0, '2019-04-12', '0000-00-00', '0000-00-00', 0),
(3, 2, 55, 1, 'Cara', 'Stevens', 4, '09123456789', 'cstevens@special.com', 'facebook.com/cstevens', 3, 'Investment', 'Walk In', 'High', '', 1, 'unit xhr-056', 'King Size', 0, 25000, '2019-04-11', '0000-00-00', '2019-04-11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 243),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 7),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

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
(1, 100003, 0, 3, 'Negro', 'Boy', '', '', '', '', NULL, NULL, NULL, 2, 1, '561 Mabini St.', 'Manila', 'Caloocan', 1999, '', '09123456788', NULL, NULL, NULL, NULL, NULL, NULL, '1993-10-16', 'Mandaluyong City', 'Complicated', 'Male', '', 'Filipino', '', '', '', '', '', '', '', '', '', '2019-03-09', '0000-00-00', '0000-00-00', '0000-00-00', NULL, '2019-04-12 07:36:19');

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
(1, 'TCRS', 'unit tcrs-143', '36500', NULL, 14, 55, 1, 'Awareness', '2019-03-29', '2019-04-03', '2019-04-04', NULL),
(2, 'DBR-SR', 'unit xhr-056', NULL, NULL, 1, 56, 2, 'Decision - Won', '2019-03-30', NULL, '2019-03-30', '0'),
(3, 'TFV', 'unit tfv-055', '22050', NULL, 14, 55, 1, 'Consideration', '2019-03-29', NULL, NULL, NULL),
(4, 'DBR-SR', 'unit xhr-056', NULL, '25000', 14, 55, 1, 'Decision - Won', '2019-03-29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_name`
--

CREATE TABLE `project_name` (
  `id` int(11) NOT NULL,
  `ProjectName` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `project_name`
--

INSERT INTO `project_name` (`id`, `ProjectName`) VALUES
(1, 'DBR-SR'),
(2, 'TCRS'),
(3, 'TFV');

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
-- Dumping data for table `team`
--

INSERT INTO `team` (`TeamID`, `TeamName`, `TeamLeadID`) VALUES
(1, 'Teamba', 64);

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
-- Indexes for table `buying_stage`
--
ALTER TABLE `buying_stage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `client2`
--
ALTER TABLE `client2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `project_name`
--
ALTER TABLE `project_name`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `AccountTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `ApplicantID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buying_stage`
--
ALTER TABLE `buying_stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `client2`
--
ALTER TABLE `client2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

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
-- AUTO_INCREMENT for table `project_name`
--
ALTER TABLE `project_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
