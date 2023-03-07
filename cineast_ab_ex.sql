-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: cineast_updated
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id_actor` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Oliver Quizz'),(2,'James Smeeth'),(3,'Oliver Archibald'),(4,'Jenny Matthew');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors_films`
--

DROP TABLE IF EXISTS `actors_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors_films` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_actor` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_actor` (`id_actor`),
  KEY `id_film` (`id_film`),
  CONSTRAINT `actors_films_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actors_films_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors_films`
--

LOCK TABLES `actors_films` WRITE;
/*!40000 ALTER TABLE `actors_films` DISABLE KEYS */;
INSERT INTO `actors_films` VALUES (1,7,2),(2,2,2);
/*!40000 ALTER TABLE `actors_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_city` varchar(50) NOT NULL,
  `cinema_title` varchar(50) NOT NULL,
  `seats` int(20) DEFAULT NULL CHECK (`seats` > 0),
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`cinema_city`,`cinema_title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Stockholm','Sunrise',30),(2,'Malmö','SolenSida ',20),(3,'Göteborg','Heaven ',40),(4,'Uppsala','Lucky Star',20),(5,'Sollefteå','Nightvision',20);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Oliver','+4444444'),(2,'James','+211111'),(3,'Mikael','+4242424'),(4,'Peter','+222222'),(6,'Nick','+1223'),(7,'Olivia','+12313'),(8,'Jess','+1312313');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id_country` int(3) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Sweden'),(2,'USA'),(3,'England'),(4,'Italy');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `year` year(4) NOT NULL CHECK (`year` > 0),
  `duration` time NOT NULL CHECK (`duration` > 0),
  `id_country` int(3) NOT NULL,
  `id_genre` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`,`year`),
  KEY `id_country` (`id_country`),
  KEY `id_genre` (`id_genre`),
  KEY `idx_year` (`year`),
  CONSTRAINT `films_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Shark 3D',2002,'02:40:00',4,1),(2,'Commando',2005,'03:00:00',2,3),(3,'The Matrix',2001,'02:40:00',3,2),(4,'The Matrix 2',2003,'01:40:00',3,1),(5,'Survivor ',2001,'02:30:00',2,1),(6,'Eminem',2005,'03:00:00',2,1),(7,'Hitman',2001,'02:00:00',3,3);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id_genre` int(2) NOT NULL AUTO_INCREMENT,
  `genre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Horror'),(2,'Comedy'),(3,'Action'),(4,'Romantic');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_id` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`),
  KEY `cinema_title` (`cinema_id`),
  CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,3,2,'2023-03-16 17:00:00'),(2,2,7,'2023-04-17 15:00:00'),(3,5,1,'2023-04-16 13:00:00'),(4,1,3,'2023-03-20 17:00:00'),(5,4,4,'2023-03-10 12:00:00'),(6,4,2,'2023-03-05 20:00:00'),(7,3,5,'2023-03-01 18:00:00'),(8,2,7,'2023-03-16 18:00:00');
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfomance_id` int(11) NOT NULL,
  `clients_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perfomance_id` (`perfomance_id`),
  KEY `clients_id` (`clients_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`perfomance_id`) REFERENCES `performances` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,2),(2,2,1),(3,3,1),(4,1,3),(5,4,4),(6,1,3),(7,2,4),(8,8,4),(9,2,4),(10,8,4),(11,1,2),(12,1,2),(13,1,2),(14,1,2),(27,1,3),(28,2,2),(29,2,3),(30,3,3),(31,4,3),(32,5,2),(33,4,1);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_name`
--

DROP TABLE IF EXISTS `view_name`;
/*!50001 DROP VIEW IF EXISTS `view_name`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_name` AS SELECT
 1 AS `id`,
  1 AS `title`,
  1 AS `duration`,
  1 AS `year`,
  1 AS `cinema_city`,
  1 AS `Started at:`,
  1 AS `cinema_title`,
  1 AS `seats`,
  1 AS `genre`,
  1 AS `TICKETS SOLD`,
  1 AS `AVAILABLE TO BUY` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_name`
--

/*!50001 DROP VIEW IF EXISTS `view_name`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_name` AS select `performances`.`id` AS `id`,`films`.`title` AS `title`,`films`.`duration` AS `duration`,`films`.`year` AS `year`,`cinema`.`cinema_city` AS `cinema_city`,`performances`.`start_time` AS `Started at:`,`cinema`.`cinema_title` AS `cinema_title`,`cinema`.`seats` AS `seats`,`genre`.`genre` AS `genre`,(select count(0) from `tickets` where `tickets`.`perfomance_id` = `performances`.`id`) AS `TICKETS SOLD`,(select count(0) from `tickets` where `tickets`.`perfomance_id` = `performances`.`id`) - `cinema`.`seats` AS `AVAILABLE TO BUY` from (((`performances` join `films` on(`performances`.`id_film` = `films`.`id`)) join `cinema` on(`cinema`.`id` = `films`.`id`)) join `genre` on(`genre`.`id_genre` = `films`.`id_genre`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-07  7:05:47
