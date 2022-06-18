-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2022 at 12:07 AM
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
-- Database: `shinobialliance`
--

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE `ranks` (
  `Rank_Id` int(11) NOT NULL,
  `Rank_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`Rank_Id`, `Rank_Name`) VALUES
(1, 'Genin'),
(2, 'Chunin'),
(3, 'Jonin');

-- --------------------------------------------------------

--
-- Table structure for table `shinobis`
--

CREATE TABLE `shinobis` (
  `Shinobi_Id` int(11) NOT NULL,
  `IG_Username` varchar(20) NOT NULL,
  `Rank_Id` int(11) NOT NULL,
  `Shinobi_Rank_Date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shinobis`
--

INSERT INTO `shinobis` (`Shinobi_Id`, `IG_Username`, `Rank_Id`, `Shinobi_Rank_Date`) VALUES
(1, 'gaara.1t', 1, '18.06.2022'),
(2, 'ok', 1, '18.06.2022'),
(3, 'boruto', 3, '18.06.2022');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shinobiview`
-- (See below for the actual view)
--
CREATE TABLE `shinobiview` (
`Shinobi_Id` int(11)
,`IG_Username` varchar(20)
,`Rank_Name` varchar(30)
,`Shinobi_Rank_Date` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `shinobiview`
--
DROP TABLE IF EXISTS `shinobiview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shinobiview`  AS SELECT `shinobis`.`Shinobi_Id` AS `Shinobi_Id`, `shinobis`.`IG_Username` AS `IG_Username`, `ranks`.`Rank_Name` AS `Rank_Name`, `shinobis`.`Shinobi_Rank_Date` AS `Shinobi_Rank_Date` FROM (`shinobis` join `ranks`) WHERE `shinobis`.`Rank_Id` = `ranks`.`Rank_Id``Rank_Id`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`Rank_Id`);

--
-- Indexes for table `shinobis`
--
ALTER TABLE `shinobis`
  ADD PRIMARY KEY (`Shinobi_Id`),
  ADD KEY `Rank_Id` (`Rank_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ranks`
--
ALTER TABLE `ranks`
  MODIFY `Rank_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shinobis`
--
ALTER TABLE `shinobis`
  MODIFY `Shinobi_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shinobis`
--
ALTER TABLE `shinobis`
  ADD CONSTRAINT `shinobis_ibfk_1` FOREIGN KEY (`Rank_Id`) REFERENCES `ranks` (`Rank_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
