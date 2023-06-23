-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pruebatest
CREATE DATABASE IF NOT EXISTS `pruebatest` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pruebatest`;

-- Volcando estructura para tabla pruebatest.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `PunchIn` time NOT NULL,
  `PunchOut` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pruebatest.customers: ~2 rows (aproximadamente)
INSERT INTO `customers` (`id`, `UserName`, `Date`, `PunchIn`, `PunchOut`) VALUES
	(8, 'test', '0000-00-00', '17:36:25', '17:36:27'),
	(9, 'Prueba1', '2023-06-22', '00:00:00', '00:00:00'),
	(10, 'Prueba3', '2023-06-22', '05:39:55', '05:40:01');

-- Volcando estructura para tabla pruebatest.data
CREATE TABLE IF NOT EXISTS `data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `PunchIn` time NOT NULL,
  `PunchOut` time NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla pruebatest.data: ~2 rows (aproximadamente)
INSERT INTO `data` (`Id`, `UserName`, `Date`, `PunchIn`, `PunchOut`) VALUES
	(1, 'Prueatest', '2023-06-22', '09:34:57', '09:34:59'),
	(2, 'pruebatest2', '2023-06-22', '09:35:15', '09:35:17');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
