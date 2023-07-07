-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2023 at 09:09 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leafo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_prediksi`
--

CREATE TABLE `data_prediksi` (
  `ID` int(11) NOT NULL,
  `Waktu` datetime DEFAULT NULL,
  `ID_Kebun` int(11) DEFAULT NULL,
  `UserID` varchar(100) DEFAULT NULL,
  `Nama_File` varchar(255) DEFAULT NULL,
  `Hasil_Prediksi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kebun`
--

CREATE TABLE `kebun` (
  `ID_Kebun` int(11) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Alamat` text NOT NULL,
  `Blok` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kebun`
--

INSERT INTO `kebun` (`ID_Kebun`, `Latitude`, `Longitude`, `Alamat`, `Blok`) VALUES
(1, '-7.144795', '107.516395', 'Mekarsari, Kec. Pasirjambu, Kabupaten Bandung, Jawa Barat', '-'),
(3, '-7.144910', '107.515573', 'PPTK Gambung, Mekarsari,Kec. Pasirjambu, Kabupaten Bandung, Jawa Barat', '-');

-- --------------------------------------------------------

--
-- Table structure for table `operator`
--

CREATE TABLE `operator` (
  `UserID` varchar(100) NOT NULL,
  `Nama_Operator` varchar(100) NOT NULL,
  `No_HP` varchar(20) DEFAULT NULL,
  `ID_Kebun` int(11) NOT NULL,
  `Alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operator`
--

INSERT INTO `operator` (`UserID`, `Nama_Operator`, `No_HP`, `ID_Kebun`, `Alamat`) VALUES
('fani', 'Ibu Fani', '081827181811', 1, 'Mekarsari,Kec. Pasirjambu, Kabupaten Bandung, Jawa Barat'),
('fitri', 'Fitri', '08122938484', 3, 'Mekarsari,Kec. Pasirjambu, Kabupaten Bandung, Jawa Barat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_prediksi`
--
ALTER TABLE `data_prediksi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Kebun` (`ID_Kebun`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `kebun`
--
ALTER TABLE `kebun`
  ADD PRIMARY KEY (`ID_Kebun`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `ID_Kebun` (`ID_Kebun`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_prediksi`
--
ALTER TABLE `data_prediksi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kebun`
--
ALTER TABLE `kebun`
  MODIFY `ID_Kebun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_prediksi`
--
ALTER TABLE `data_prediksi`
  ADD CONSTRAINT `data_prediksi_ibfk_1` FOREIGN KEY (`ID_Kebun`) REFERENCES `kebun` (`ID_Kebun`),
  ADD CONSTRAINT `data_prediksi_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `operator` (`UserID`);

--
-- Constraints for table `operator`
--
ALTER TABLE `operator`
  ADD CONSTRAINT `operator_ibfk_1` FOREIGN KEY (`ID_Kebun`) REFERENCES `kebun` (`ID_Kebun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
