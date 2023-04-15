-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2023 at 01:49 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Pendeteksi Kebakaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `Data Sensor Suhu`
--

CREATE TABLE `Data Sensor Suhu` (
  `ID_SensorSuhu` varchar(10) NOT NULL,
  `Data_Sensor` varchar(20) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_alat`
--

CREATE TABLE `Data_alat` (
  `ID_alat` varchar(10) NOT NULL,
  `Nama_alat` varchar(20) NOT NULL,
  `ID_SensorAsap` varchar(10) NOT NULL,
  `ID_SensorApi` varchar(10) NOT NULL,
  `ID_SensorSuhu` varchar(10) NOT NULL,
  `ID_SensorGas` varchar(10) NOT NULL,
  `ID_lokasi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Kecamatan`
--

CREATE TABLE `Data_Kecamatan` (
  `ID_Kecamatan` varchar(10) NOT NULL,
  `Nama_Kecamatan` varchar(30) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Kota`
--

CREATE TABLE `Data_Kota` (
  `ID_Kota` varchar(10) NOT NULL,
  `Nama_Kota` varchar(30) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Lokasi`
--

CREATE TABLE `Data_Lokasi` (
  `ID_Lokasi` varchar(20) NOT NULL,
  `ID_Kecamatan` varchar(20) NOT NULL,
  `ID_Kota` varchar(20) NOT NULL,
  `ID_Provinsi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Provinsi`
--

CREATE TABLE `Data_Provinsi` (
  `ID_Provinsi` varchar(10) NOT NULL,
  `Nama_Provinsi` varchar(30) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Sensor_Api`
--

CREATE TABLE `Data_Sensor_Api` (
  `ID_SensorApi` varchar(10) NOT NULL,
  `Data_Sensor` varchar(30) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Sensor_Asap`
--

CREATE TABLE `Data_Sensor_Asap` (
  `ID_SensorAsap` varchar(10) NOT NULL,
  `Data_Sensor` varchar(30) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Data_Sensor_Gas`
--

CREATE TABLE `Data_Sensor_Gas` (
  `ID_SensorGas` varchar(10) NOT NULL,
  `Data_Sensor` varchar(30) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Data Sensor Suhu`
--
ALTER TABLE `Data Sensor Suhu`
  ADD PRIMARY KEY (`ID_SensorSuhu`);

--
-- Indexes for table `Data_alat`
--
ALTER TABLE `Data_alat`
  ADD PRIMARY KEY (`ID_alat`),
  ADD KEY `ID_SensorAsap` (`ID_SensorAsap`,`ID_SensorApi`,`ID_SensorSuhu`,`ID_SensorGas`,`ID_lokasi`);

--
-- Indexes for table `Data_Kecamatan`
--
ALTER TABLE `Data_Kecamatan`
  ADD PRIMARY KEY (`ID_Kecamatan`);

--
-- Indexes for table `Data_Kota`
--
ALTER TABLE `Data_Kota`
  ADD PRIMARY KEY (`ID_Kota`);

--
-- Indexes for table `Data_Lokasi`
--
ALTER TABLE `Data_Lokasi`
  ADD PRIMARY KEY (`ID_Lokasi`),
  ADD KEY `ID_Kecamatan` (`ID_Kecamatan`),
  ADD KEY `ID_Kota` (`ID_Kota`),
  ADD KEY `ID_Provinsi` (`ID_Provinsi`);

--
-- Indexes for table `Data_Provinsi`
--
ALTER TABLE `Data_Provinsi`
  ADD PRIMARY KEY (`ID_Provinsi`);

--
-- Indexes for table `Data_Sensor_Api`
--
ALTER TABLE `Data_Sensor_Api`
  ADD PRIMARY KEY (`ID_SensorApi`);

--
-- Indexes for table `Data_Sensor_Asap`
--
ALTER TABLE `Data_Sensor_Asap`
  ADD PRIMARY KEY (`ID_SensorAsap`);

--
-- Indexes for table `Data_Sensor_Gas`
--
ALTER TABLE `Data_Sensor_Gas`
  ADD PRIMARY KEY (`ID_SensorGas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Data_alat`
--
ALTER TABLE `Data_alat`
  ADD CONSTRAINT `data_alat_ibfk_1` FOREIGN KEY (`ID_SensorSuhu`) REFERENCES `Data Sensor Suhu` (`ID_SensorSuhu`),
  ADD CONSTRAINT `data_alat_ibfk_3` FOREIGN KEY (`ID_SensorApi`) REFERENCES `Data_Sensor_Api` (`ID_SensorApi`),
  ADD CONSTRAINT `data_alat_ibfk_4` FOREIGN KEY (`ID_SensorAsap`) REFERENCES `Data_Sensor_Asap` (`ID_SensorAsap`),
  ADD CONSTRAINT `data_alat_ibfk_5` FOREIGN KEY (`ID_lokasi`) REFERENCES `Data_Lokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `data_alat_ibfk_6` FOREIGN KEY (`ID_SensorGas`) REFERENCES `Data_Sensor_Gas` (`ID_SensorGas`);

--
-- Constraints for table `Data_Lokasi`
--
ALTER TABLE `Data_Lokasi`
  ADD CONSTRAINT `data_lokasi_ibfk_1` FOREIGN KEY (`ID_Kecamatan`) REFERENCES `Data_Kecamatan` (`ID_Kecamatan`),
  ADD CONSTRAINT `data_lokasi_ibfk_2` FOREIGN KEY (`ID_Kota`) REFERENCES `Data_Kota` (`ID_Kota`),
  ADD CONSTRAINT `data_lokasi_ibfk_3` FOREIGN KEY (`ID_Provinsi`) REFERENCES `Data_Provinsi` (`ID_Provinsi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
