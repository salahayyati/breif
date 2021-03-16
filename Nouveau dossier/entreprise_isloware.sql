-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2021 at 11:21 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `entreprise_isloware`
--

-- --------------------------------------------------------

--
-- Table structure for table `asso_3`
--

DROP TABLE IF EXISTS `asso_3`;
CREATE TABLE IF NOT EXISTS `asso_3` (
  `asso_3` int(11) NOT NULL AUTO_INCREMENT,
  `num_employer` int(11) DEFAULT NULL,
  `num_projet` int(11) DEFAULT NULL,
  PRIMARY KEY (`asso_3`),
  KEY `num_employer` (`num_employer`,`num_projet`),
  KEY `num_projet` (`num_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asso_5`
--

DROP TABLE IF EXISTS `asso_5`;
CREATE TABLE IF NOT EXISTS `asso_5` (
  `asso_5` int(11) NOT NULL AUTO_INCREMENT,
  `num_projet` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`asso_5`),
  KEY `num_projet` (`num_projet`,`num`),
  KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asso_8`
--

DROP TABLE IF EXISTS `asso_8`;
CREATE TABLE IF NOT EXISTS `asso_8` (
  `ass_8` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`ass_8`),
  KEY `num` (`num`,`numero`),
  KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `num_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(20) DEFAULT NULL,
  `mont_salaire` double DEFAULT NULL,
  PRIMARY KEY (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `chef` int(11) NOT NULL AUTO_INCREMENT,
  `num_employer` int(11) DEFAULT NULL,
  `num_service` int(11) DEFAULT NULL,
  PRIMARY KEY (`chef`),
  KEY `num_employer` (`num_employer`),
  KEY `num_service` (`num_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `directeur`
--

DROP TABLE IF EXISTS `directeur`;
CREATE TABLE IF NOT EXISTS `directeur` (
  `directeur` int(11) NOT NULL AUTO_INCREMENT,
  `num_employer` int(11) DEFAULT NULL,
  `num_projet` int(11) DEFAULT NULL,
  PRIMARY KEY (`directeur`),
  KEY `num_employer` (`num_employer`),
  KEY `num_projet` (`num_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
CREATE TABLE IF NOT EXISTS `employer` (
  `num_employer` int(11) NOT NULL AUTO_INCREMENT,
  `nom_employer` varchar(20) DEFAULT NULL,
  `sex_employer` tinyint(1) DEFAULT NULL,
  `num_categorie` int(11) DEFAULT NULL,
  `num_service` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_employer`),
  KEY `num_service` (`num_service`),
  KEY `num_categorie` (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `partenaire`
--

DROP TABLE IF EXISTS `partenaire`;
CREATE TABLE IF NOT EXISTS `partenaire` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  `numero_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `nom` (`nom`),
  KEY `numero_type` (`numero_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `num_projet` int(11) NOT NULL AUTO_INCREMENT,
  `nom_projet` varchar(20) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`num_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `num_service` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_part`
--

DROP TABLE IF EXISTS `type_part`;
CREATE TABLE IF NOT EXISTS `type_part` (
  `numero_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numero_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asso_3`
--
ALTER TABLE `asso_3`
  ADD CONSTRAINT `asso_3_ibfk_1` FOREIGN KEY (`num_employer`) REFERENCES `employer` (`num_employer`),
  ADD CONSTRAINT `asso_3_ibfk_2` FOREIGN KEY (`num_projet`) REFERENCES `projet` (`num_projet`);

--
-- Constraints for table `asso_5`
--
ALTER TABLE `asso_5`
  ADD CONSTRAINT `asso_5_ibfk_1` FOREIGN KEY (`num_projet`) REFERENCES `projet` (`num_projet`),
  ADD CONSTRAINT `asso_5_ibfk_2` FOREIGN KEY (`num`) REFERENCES `partenaire` (`num`);

--
-- Constraints for table `asso_8`
--
ALTER TABLE `asso_8`
  ADD CONSTRAINT `asso_8_ibfk_1` FOREIGN KEY (`num`) REFERENCES `partenaire` (`num`),
  ADD CONSTRAINT `asso_8_ibfk_2` FOREIGN KEY (`numero`) REFERENCES `pays` (`numero`);

--
-- Constraints for table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`num_employer`) REFERENCES `employer` (`num_employer`),
  ADD CONSTRAINT `chef_ibfk_2` FOREIGN KEY (`num_service`) REFERENCES `service` (`num_service`);

--
-- Constraints for table `directeur`
--
ALTER TABLE `directeur`
  ADD CONSTRAINT `directeur_ibfk_1` FOREIGN KEY (`num_employer`) REFERENCES `employer` (`num_employer`),
  ADD CONSTRAINT `directeur_ibfk_2` FOREIGN KEY (`num_projet`) REFERENCES `projet` (`num_projet`);

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`num_service`) REFERENCES `service` (`num_service`),
  ADD CONSTRAINT `employer_ibfk_2` FOREIGN KEY (`num_categorie`) REFERENCES `categorie` (`num_categorie`);

--
-- Constraints for table `partenaire`
--
ALTER TABLE `partenaire`
  ADD CONSTRAINT `partenaire_ibfk_1` FOREIGN KEY (`numero_type`) REFERENCES `type_part` (`numero_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
