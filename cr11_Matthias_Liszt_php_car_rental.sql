-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 30, 2018 at 10:10 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr11_Matthias_Liszt_php_car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalCharges`
--

CREATE TABLE `additionalCharges` (
  `aChargeId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carId` int(11) NOT NULL,
  `carType` varchar(32) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `prodYear` year(4) DEFAULT NULL,
  `tankCapacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`carId`, `carType`, `capacity`, `power`, `seats`, `prodYear`, `tankCapacity`) VALUES
(1, 'Fiat', 2, 50, 6, 1991, 50),
(2, 'Mercedes', 4, 100, 6, 1997, 90),
(3, 'VW', 3, 70, 6, 1993, 60),
(4, 'Opel', 3, 80, 6, 1996, 70),
(5, 'Mazda', 2, 50, 6, 1991, 50),
(6, 'Suzuki', 4, 100, 6, 1997, 90),
(7, 'Skoda', 3, 70, 6, 1993, 60),
(8, 'Trabant', 3, 80, 6, 1996, 70),
(9, 'Yamaha', 2, 50, 6, 1991, 50),
(10, 'Honda', 4, 100, 6, 1997, 90),
(11, 'Wattburg', 3, 70, 6, 1993, 60),
(12, 'Jaguar', 3, 80, 6, 1996, 70),
(13, 'Bentley', 2, 50, 6, 1991, 50),
(14, 'Ferrari', 4, 100, 6, 1997, 90),
(15, 'Lada', 3, 70, 6, 1993, 60),
(16, 'Niva', 3, 80, 6, 1996, 70);

-- --------------------------------------------------------

--
-- Table structure for table `carDamage`
--

CREATE TABLE `carDamage` (
  `reportId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `damageId` int(11) DEFAULT NULL,
  `transactionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carPrice`
--

CREATE TABLE `carPrice` (
  `carPriceId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `carPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carRent`
--

CREATE TABLE `carRent` (
  `transactionId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `carId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carRent`
--

INSERT INTO `carRent` (`transactionId`, `userId`, `carId`) VALUES
(1, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `carSign`
--

CREATE TABLE `carSign` (
  `carSign` varchar(16) NOT NULL,
  `carId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carSign`
--

INSERT INTO `carSign` (`carSign`, `carId`) VALUES
('W-1234 AX', 1),
('W-1264 FG', 15),
('W-2134 EY', 8),
('W-2234 AE', 7),
('W-2238 XE', 9),
('W-2345 YT', 14),
('W-3234 OJ', 5),
('W-3238 UE', 10),
('W-3334 GH', 2),
('W-4434 SX', 6),
('W-4567 QW', 13),
('W-5678 KU', 11),
('W-6234 DC', 16),
('W-7774 DX', 3),
('W-8239 CE', 4),
('W-8765 WE', 12);

-- --------------------------------------------------------

--
-- Table structure for table `carTank`
--

CREATE TABLE `carTank` (
  `tankId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `transactionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `damageCalculation`
--

CREATE TABLE `damageCalculation` (
  `calculationId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `carType` varchar(32) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `damageId` int(11) NOT NULL,
  `name` varchar(21) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gps`
--

CREATE TABLE `gps` (
  `gpsId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `gpsLat` float DEFAULT NULL,
  `gpsLong` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gps`
--

INSERT INTO `gps` (`gpsId`, `carId`, `gpsLat`, `gpsLong`) VALUES
(1, 3, 48, 16);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationId` int(11) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  `officeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationId`, `carId`, `officeId`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 3),
(12, 12, 3),
(13, 13, 4),
(14, 14, 5),
(15, 15, 5),
(16, 16, 5);

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `officeId` int(11) NOT NULL,
  `officeName` varchar(32) DEFAULT NULL,
  `officeAddress` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`officeId`, `officeName`, `officeAddress`) VALUES
(1, 'Urania', 'Schottenring 12'),
(2, 'Meidling', 'Meidlinger Hauptstrasse 3'),
(3, 'Naschmarkt', 'Kettengasse 7'),
(4, 'Hermelin', 'Herkratzgasse 9'),
(5, 'Pinky', 'Panthergasse 6');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paymentService`
--

CREATE TABLE `paymentService` (
  `serviceId` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `cardNumber` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `surname` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `name`, `surname`, `birthday`) VALUES
(1, 'Max', 'Boehm', '1981-11-11'),
(2, 'Stefan', 'Czerny', '1981-12-11'),
(3, 'Andrzej', 'Pettyn', '1979-10-21'),
(4, 'Ivan', 'Zykov', '1986-11-11'),
(5, 'Yoshiko', 'Hashimoto', '1981-12-12'),
(6, 'George', 'Eddington', '1978-11-11'),
(7, 'Goran', 'Ivanisevic', '1983-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `userLog`
--

CREATE TABLE `userLog` (
  `userName` varchar(12) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userLog`
--

INSERT INTO `userLog` (`userName`, `userId`, `password`) VALUES
('Admin', 7, '75d360a6998b05ff984f545288738f0659d1314a1fa8fa100e9323740fe863eb'),
('goldhamster', 5, '30c7d68271113c030acc25353463562afcefa33400fb7d01f9d4085e6461d0bc'),
('hauskatze', 4, 'f15c16b99f82d8201767d3a841ff40849c8a1b812ffbfd2e393d2b6aa6682a6e'),
('wildschwein', 6, 'd9e36ff2055d23ac1b39509df8e7fa4f34d86b3da922e51fd8a1d539dd10b026');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `documentNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `document` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`documentNumber`, `userId`, `document`) VALUES
(34523462, 1, 'passport'),
(65435567, 2, 'passport'),
(97834566, 3, 'passport');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalCharges`
--
ALTER TABLE `additionalCharges`
  ADD PRIMARY KEY (`aChargeId`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carId`);

--
-- Indexes for table `carDamage`
--
ALTER TABLE `carDamage`
  ADD PRIMARY KEY (`reportId`);

--
-- Indexes for table `carPrice`
--
ALTER TABLE `carPrice`
  ADD PRIMARY KEY (`carPriceId`);

--
-- Indexes for table `carRent`
--
ALTER TABLE `carRent`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `carSign`
--
ALTER TABLE `carSign`
  ADD PRIMARY KEY (`carSign`);

--
-- Indexes for table `carTank`
--
ALTER TABLE `carTank`
  ADD PRIMARY KEY (`tankId`);

--
-- Indexes for table `damageCalculation`
--
ALTER TABLE `damageCalculation`
  ADD PRIMARY KEY (`calculationId`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`damageId`);

--
-- Indexes for table `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`gpsId`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationId`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`officeId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `paymentService`
--
ALTER TABLE `paymentService`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `userLog`
--
ALTER TABLE `userLog`
  ADD PRIMARY KEY (`userName`);

--
-- Indexes for table `verification`
--
ALTER TABLE `verification`
  ADD PRIMARY KEY (`documentNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additionalCharges`
--
ALTER TABLE `additionalCharges`
  MODIFY `aChargeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `carId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `carDamage`
--
ALTER TABLE `carDamage`
  MODIFY `reportId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carPrice`
--
ALTER TABLE `carPrice`
  MODIFY `carPriceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carRent`
--
ALTER TABLE `carRent`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carTank`
--
ALTER TABLE `carTank`
  MODIFY `tankId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damageCalculation`
--
ALTER TABLE `damageCalculation`
  MODIFY `calculationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `damageId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gps`
--
ALTER TABLE `gps`
  MODIFY `gpsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `officeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentService`
--
ALTER TABLE `paymentService`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
