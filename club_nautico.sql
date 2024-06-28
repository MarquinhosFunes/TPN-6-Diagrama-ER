-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 10:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `club nautico`
--

-- --------------------------------------------------------

--
-- Table structure for table `banco_socio`
--

CREATE TABLE `banco_socio` (
  `Id_Banco_Socio` int(11) NOT NULL,
  `Num_Tarjeta_Banco_Socio` varchar(255) NOT NULL,
  `Fecha_Vcto_Banco_Socio` date NOT NULL,
  `CVV_Banco_Socio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barcos`
--

CREATE TABLE `barcos` (
  `Id_Barco` int(11) NOT NULL,
  `Id_Socio` int(11) NOT NULL,
  `Id_Cuota_Amarre` int(11) NOT NULL,
  `Matricula_Barco` varchar(255) NOT NULL,
  `Nombre_Barco` varchar(255) NOT NULL,
  `NumAmarre_Barco` int(11) NOT NULL,
  `Cuota_Amarre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuota_amarre`
--

CREATE TABLE `cuota_amarre` (
  `Id_Cuota_Amarre` int(11) NOT NULL,
  `Monto_Cuota_Amarre` decimal(10,0) NOT NULL,
  `FechaPago_Cuota_Amarre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pago_socio`
--

CREATE TABLE `pago_socio` (
  `Id_Socio` int(11) NOT NULL,
  `Id_Cuota_Amarre` int(11) NOT NULL,
  `Id_Banco_Socio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patrones`
--

CREATE TABLE `patrones` (
  `Id_Patron` int(11) NOT NULL,
  `Nombre_Patron` varbinary(255) NOT NULL,
  `Apellido_Patron` varchar(255) NOT NULL,
  `DNI_Patron` varchar(255) NOT NULL,
  `TelMovil_Patron` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salidas`
--

CREATE TABLE `salidas` (
  `Id_Salida` int(11) NOT NULL,
  `Fecha_Salida` date NOT NULL,
  `Hora_Salida` time NOT NULL,
  `Destino_Salida` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salidas_barcos`
--

CREATE TABLE `salidas_barcos` (
  `Id_Salida` int(11) NOT NULL,
  `Id_Barco` int(11) NOT NULL,
  `Id_Patron` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `socios`
--

CREATE TABLE `socios` (
  `Id_Socio` int(11) NOT NULL,
  `Nombre_Socio` varchar(255) NOT NULL,
  `Apellido_Socio` varchar(255) NOT NULL,
  `DNI_Socio` varchar(255) NOT NULL,
  `Direccion_Socio` varchar(255) NOT NULL,
  `TelMovil_Socio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banco_socio`
--
ALTER TABLE `banco_socio`
  ADD PRIMARY KEY (`Id_Banco_Socio`),
  ADD UNIQUE KEY `Id_Banco_Socio` (`Id_Banco_Socio`);

--
-- Indexes for table `barcos`
--
ALTER TABLE `barcos`
  ADD PRIMARY KEY (`Id_Barco`),
  ADD UNIQUE KEY `Id_Barco` (`Id_Barco`),
  ADD KEY `Barcos_fk1` (`Id_Socio`),
  ADD KEY `Barcos_fk2` (`Id_Cuota_Amarre`);

--
-- Indexes for table `cuota_amarre`
--
ALTER TABLE `cuota_amarre`
  ADD PRIMARY KEY (`Id_Cuota_Amarre`),
  ADD UNIQUE KEY `Id_Cuota_Amarre` (`Id_Cuota_Amarre`);

--
-- Indexes for table `pago_socio`
--
ALTER TABLE `pago_socio`
  ADD UNIQUE KEY `Id_Socio` (`Id_Socio`),
  ADD KEY `Pago_Socio_fk1` (`Id_Cuota_Amarre`),
  ADD KEY `Pago_Socio_fk2` (`Id_Banco_Socio`);

--
-- Indexes for table `patrones`
--
ALTER TABLE `patrones`
  ADD PRIMARY KEY (`Id_Patron`),
  ADD UNIQUE KEY `Id_Patron` (`Id_Patron`);

--
-- Indexes for table `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`Id_Salida`),
  ADD UNIQUE KEY `Id_Salida` (`Id_Salida`);

--
-- Indexes for table `salidas_barcos`
--
ALTER TABLE `salidas_barcos`
  ADD PRIMARY KEY (`Id_Salida`),
  ADD UNIQUE KEY `Id_Salida` (`Id_Salida`),
  ADD KEY `Salidas_Barcos_fk1` (`Id_Barco`),
  ADD KEY `Salidas_Barcos_fk2` (`Id_Patron`);

--
-- Indexes for table `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`Id_Socio`),
  ADD UNIQUE KEY `Id_Socio` (`Id_Socio`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banco_socio`
--
ALTER TABLE `banco_socio`
  MODIFY `Id_Banco_Socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barcos`
--
ALTER TABLE `barcos`
  MODIFY `Id_Barco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuota_amarre`
--
ALTER TABLE `cuota_amarre`
  MODIFY `Id_Cuota_Amarre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pago_socio`
--
ALTER TABLE `pago_socio`
  MODIFY `Id_Socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patrones`
--
ALTER TABLE `patrones`
  MODIFY `Id_Patron` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salidas`
--
ALTER TABLE `salidas`
  MODIFY `Id_Salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salidas_barcos`
--
ALTER TABLE `salidas_barcos`
  MODIFY `Id_Salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socios`
--
ALTER TABLE `socios`
  MODIFY `Id_Socio` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcos`
--
ALTER TABLE `barcos`
  ADD CONSTRAINT `Barcos_fk1` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socio`),
  ADD CONSTRAINT `Barcos_fk2` FOREIGN KEY (`Id_Cuota_Amarre`) REFERENCES `cuota_amarre` (`Id_Cuota_Amarre`);

--
-- Constraints for table `pago_socio`
--
ALTER TABLE `pago_socio`
  ADD CONSTRAINT `Pago_Socio_fk0` FOREIGN KEY (`Id_Socio`) REFERENCES `socios` (`Id_Socio`),
  ADD CONSTRAINT `Pago_Socio_fk1` FOREIGN KEY (`Id_Cuota_Amarre`) REFERENCES `cuota_amarre` (`Id_Cuota_Amarre`),
  ADD CONSTRAINT `Pago_Socio_fk2` FOREIGN KEY (`Id_Banco_Socio`) REFERENCES `banco_socio` (`Id_Banco_Socio`);

--
-- Constraints for table `salidas_barcos`
--
ALTER TABLE `salidas_barcos`
  ADD CONSTRAINT `Salidas_Barcos_fk0` FOREIGN KEY (`Id_Salida`) REFERENCES `salidas` (`Id_Salida`),
  ADD CONSTRAINT `Salidas_Barcos_fk1` FOREIGN KEY (`Id_Barco`) REFERENCES `barcos` (`Id_Barco`),
  ADD CONSTRAINT `Salidas_Barcos_fk2` FOREIGN KEY (`Id_Patron`) REFERENCES `patrones` (`Id_Patron`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
