-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2021 at 02:29 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_catalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `name` varchar(80) NOT NULL,
  `genre` varchar(80) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`name`, `genre`, `artist`, `date_added`, `date_updated`) VALUES
('Album 1', 'Blues', 'Sample Artist 1', '2021-03-25 01:08:43', NULL),
('Album 2', 'Blues', 'Sample Artist 2', '2021-03-25 01:09:52', NULL),
('Album 3', 'Soul', 'Sample Artist 2', '2021-03-25 01:10:52', NULL),
('Album 4', 'R&B', 'Sample Artist 3', '2021-03-25 01:10:52', NULL),
('Album 5', 'Rock', 'Sample Artist 3', '2021-03-25 01:10:52', NULL),
('Album Test', 'Soul', 'Sample Artist 4', '2021-03-25 18:33:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `name` varchar(80) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`name`, `date_added`, `date_updated`) VALUES
('Sample Artist 1', '2021-03-25 01:07:03', NULL),
('Sample Artist 2', '2021-03-25 01:07:03', NULL),
('Sample Artist 3', '2021-03-25 01:07:03', NULL),
('Sample Artist 4', '2021-03-25 01:07:22', NULL),
('Sample Artist 5', '2021-03-25 01:07:22', NULL),
('Sample Artist 6', '2021-03-25 01:07:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int NOT NULL,
  `client_ip` varchar(40) NOT NULL,
  `song` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `album` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isPurchased` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `client_ip`, `song`, `album`, `isPurchased`) VALUES
(2, '::1', NULL, 'Album 1', 1),
(4, '::1', 'Song 1', NULL, 1),
(6, '::1', 'Song 1', NULL, 1),
(10, '::1', 'Song 1', NULL, 1),
(13, '::1', 'Song 1', NULL, 1),
(15, '::1', 'Song 1', NULL, 1),
(19, '::1', 'Song 1', NULL, 1),
(22, '::1', 'Song 1', NULL, 1),
(25, '::1', 'Song 1', NULL, 1),
(28, '::1', 'Song 1', NULL, 1),
(31, '::1', 'Song 1', NULL, 1),
(33, '::1', 'Song 1', NULL, 1),
(37, '::1', 'Song 1', NULL, 1),
(5, '::1', 'Song 2', NULL, 1),
(7, '::1', 'Song 2', NULL, 1),
(11, '::1', 'Song 2', NULL, 1),
(16, '::1', 'Song 2', NULL, 1),
(17, '::1', 'Song 2', NULL, 1),
(20, '::1', 'Song 2', NULL, 1),
(24, '::1', 'Song 2', NULL, 1),
(26, '::1', 'Song 2', NULL, 1),
(29, '::1', 'Song 2', NULL, 1),
(34, '::1', 'Song 2', NULL, 1),
(35, '::1', 'Song 2', NULL, 1),
(38, '::1', 'Song 2', NULL, 1),
(42, '::1', 'Song 2', NULL, 1),
(44, '::1', 'Song 2', NULL, 1),
(47, '::1', 'Song 2', NULL, 1),
(8, '::1', 'Song 3', NULL, 1),
(9, '::1', 'Song 3', NULL, 1),
(12, '::1', 'Song 3', NULL, 1),
(14, '::1', 'Song 3', NULL, 1),
(18, '::1', 'Song 3', NULL, 1),
(21, '::1', 'Song 3', NULL, 1),
(23, '::1', 'Song 3', NULL, 1),
(27, '::1', 'Song 3', NULL, 1),
(30, '::1', 'Song 3', NULL, 1),
(32, '::1', 'Song 3', NULL, 1),
(36, '::1', 'Song 3', NULL, 1),
(39, '::1', 'Song 3', NULL, 1),
(41, '::1', 'Song 3', NULL, 1),
(45, '::1', 'Song 3', NULL, 1),
(48, '::1', 'Song 3', NULL, 1),
(3, '::2', NULL, 'Album 1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `name` varchar(80) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`name`, `date_added`, `date_updated`) VALUES
('Blues', '2021-03-25 01:02:35', NULL),
('Jazz', '2021-03-25 01:01:48', NULL),
('R&B', '2021-03-25 01:02:35', NULL),
('Rap', '2021-03-25 01:02:35', NULL),
('Rock', '2021-03-25 01:01:48', NULL),
('Soul', '2021-03-25 01:02:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `name` varchar(150) NOT NULL,
  `album` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`name`, `album`) VALUES
('Song 1', 'Album 1'),
('Song 2', 'Album 1'),
('Song 3', 'Album 1'),
('Song 1', 'Album 2'),
('Song 2', 'Album 2'),
('Song 3', 'Album 2'),
('Song 1', 'Album 3'),
('Song 2', 'Album 3'),
('Song 3', 'Album 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`name`,`artist`),
  ADD KEY `genre` (`genre`),
  ADD KEY `artist` (`artist`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `client_ip` (`client_ip`,`song`,`album`,`isPurchased`),
  ADD KEY `fk_cart_album` (`album`),
  ADD KEY `fk_cart_song` (`song`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`name`,`album`),
  ADD KEY `genre` (`album`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `fk_artist` FOREIGN KEY (`artist`) REFERENCES `artist` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_genre` FOREIGN KEY (`genre`) REFERENCES `genre` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_album` FOREIGN KEY (`album`) REFERENCES `album` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_song` FOREIGN KEY (`song`) REFERENCES `song` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `fk_album_song` FOREIGN KEY (`album`) REFERENCES `album` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
