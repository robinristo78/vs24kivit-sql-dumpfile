-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 21, 2025 at 01:41 AM
-- Server version: 11.4.8-MariaDB
-- PHP Version: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vs24kivit_haaletusDB`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`vs24kivit`@`localhost` PROCEDURE `haaleta` (IN `p_id` INT, IN `p_otsus` ENUM('poolt','vastu'))   BEGIN
  UPDATE haaletus 
  SET otsus = p_otsus,
      haaletuse_aeg = NOW()
  WHERE id = p_id;

  CALL uuenda_tulemused();
END$$

CREATE DEFINER=`vs24kivit`@`localhost` PROCEDURE `restart_haaletus` ()   BEGIN
  SET @system_override = 1;

  UPDATE haaletus SET haaletuse_aeg = NOW();

  UPDATE tulemused 
  SET haaletuse_algus = NOW(),
      haaletanute_arv = 0,
      poolt_arv = 0,
      vastu_arv = 0
  WHERE id = 1;
  TRUNCATE logi;

  SET @system_override = NULL;
END$$

CREATE DEFINER=`vs24kivit`@`localhost` PROCEDURE `uuenda_tulemused` ()   BEGIN
  DECLARE kokku INT;
  DECLARE poolt INT;
  DECLARE vastu INT;

  SELECT COUNT(*) INTO kokku FROM haaletus;
  SELECT COUNT(*) INTO poolt FROM haaletus WHERE otsus='poolt';
  SELECT COUNT(*) INTO vastu FROM haaletus WHERE otsus='vastu';

  UPDATE tulemused
  SET haaletanute_arv = kokku,
      poolt_arv = poolt,
      vastu_arv = vastu
  WHERE id = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `haaletus`
--

CREATE TABLE `haaletus` (
  `id` int(11) NOT NULL,
  `eesnimi` varchar(50) DEFAULT NULL,
  `perenimi` varchar(50) DEFAULT NULL,
  `otsus` enum('poolt','vastu') DEFAULT NULL,
  `haaletuse_aeg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `haaletus`
--

INSERT INTO `haaletus` (`id`, `eesnimi`, `perenimi`, `otsus`, `haaletuse_aeg`) VALUES
(1, 'Jaan', 'Tamm', 'poolt', '2025-10-21 01:36:54'),
(2, 'Mari', 'Maasikas', 'poolt', '2025-10-21 01:37:14'),
(3, 'Karl', 'Kask', 'poolt', '2025-10-21 01:36:54'),
(4, 'Kati', 'Karu', 'vastu', '2025-10-21 01:36:54'),
(5, 'Peeter', 'Põder', 'vastu', '2025-10-21 01:37:35'),
(6, 'Anna', 'Aas', 'poolt', '2025-10-21 01:36:54'),
(7, 'Rasmus', 'Rändur', 'vastu', '2025-10-21 01:36:54'),
(8, 'Liisa', 'Lind', 'poolt', '2025-10-21 01:36:54'),
(9, 'Kristjan', 'Kukk', 'vastu', '2025-10-21 01:36:54'),
(10, 'Laura', 'Lepp', 'poolt', '2025-10-21 01:36:54'),
(11, 'Marko', 'Mets', 'vastu', '2025-10-21 01:36:54');

--
-- Triggers `haaletus`
--
DELIMITER $$
CREATE TRIGGER `logi_muutus` BEFORE UPDATE ON `haaletus` FOR EACH ROW BEGIN
  INSERT INTO logi (haaletaja_id, vana_otsus, uus_otsus)
  VALUES (OLD.id, OLD.otsus, NEW.otsus);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `piiratud_muutmine` BEFORE UPDATE ON `haaletus` FOR EACH ROW BEGIN
  DECLARE algus DATETIME;
  SELECT haaletuse_algus INTO algus FROM tulemused WHERE id=1;
  
  IF (@system_override IS NULL OR @system_override = 0) THEN
    IF (TIMESTAMPDIFF(MINUTE, algus, NOW()) > 5) THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Hääletusaeg on lõppenud (5 min möödas)';
    END IF;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logi`
--

CREATE TABLE `logi` (
  `id` int(11) NOT NULL,
  `haaletaja_id` int(11) DEFAULT NULL,
  `vana_otsus` enum('poolt','vastu') DEFAULT NULL,
  `uus_otsus` enum('poolt','vastu') DEFAULT NULL,
  `muutmise_aeg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `logi`
--

INSERT INTO `logi` (`id`, `haaletaja_id`, `vana_otsus`, `uus_otsus`, `muutmise_aeg`) VALUES
(1, 2, 'vastu', 'poolt', '2025-10-21 01:37:14'),
(2, 5, 'poolt', 'vastu', '2025-10-21 01:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `tulemused`
--

CREATE TABLE `tulemused` (
  `id` int(11) NOT NULL,
  `haaletuse_algus` datetime DEFAULT NULL,
  `haaletanute_arv` int(11) DEFAULT 0,
  `poolt_arv` int(11) DEFAULT 0,
  `vastu_arv` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tulemused`
--

INSERT INTO `tulemused` (`id`, `haaletuse_algus`, `haaletanute_arv`, `poolt_arv`, `vastu_arv`) VALUES
(1, '2025-10-21 01:36:54', 11, 6, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `haaletus`
--
ALTER TABLE `haaletus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logi`
--
ALTER TABLE `logi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `haaletaja_id` (`haaletaja_id`);

--
-- Indexes for table `tulemused`
--
ALTER TABLE `tulemused`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `haaletus`
--
ALTER TABLE `haaletus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `logi`
--
ALTER TABLE `logi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tulemused`
--
ALTER TABLE `tulemused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logi`
--
ALTER TABLE `logi`
  ADD CONSTRAINT `logi_ibfk_1` FOREIGN KEY (`haaletaja_id`) REFERENCES `haaletus` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
