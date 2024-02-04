-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: WEATHERINFORMATIONSYSTEM
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destination` (
  `DestinationID` int(11) NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL,
  `EmergencyContact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DestinationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (0,'arusha',-3.369162,36.677997,'119'),(1,'dar es salaam',-6.792400,39.208300,'119'),(3,'dodoma',-6.173056,35.741944,'119'),(4,'iringa',-7.766900,35.698600,'119'),(5,'kagera',-3.369162,31.430556,'119'),(6,'kigoma',-4.883333,29.633333,'119'),(7,'kilimanjaro',-3.067425,37.355627,'119'),(8,'Lindi',-10.000000,39.500000,'119'),(9,'manyara',-3.593300,35.819000,'119'),(10,'mara',-1.874600,34.984200,'119'),(11,'mbeya',-8.900000,33.450000,'119'),(12,'morogoro',-6.821700,37.661900,'119'),(13,'mtwara',-10.266700,40.183300,'119'),(14,'mwanza',-2.516700,32.900000,'119'),(15,'njombe',-9.333300,34.766700,'119'),(16,'pwani',-6.751400,38.183300,'119'),(17,'rukwa',-7.000000,31.000000,'119'),(18,'ruvuma',-10.450000,35.633300,'119'),(19,'shinyanga',-3.333300,33.500000,'119'),(20,'simiyu',-3.500000,33.500000,'119'),(21,'singida',-4.820800,34.750000,'119'),(22,'songwe',-9.200000,33.850000,'119'),(23,'tabora',-5.017000,32.819000,'119'),(24,'Tanga',-5.070000,39.819000,'119'),(25,'zanzibar central/South',-6.165000,39.201900,'119'),(26,'zanzibar north',-5.953900,39.272800,'119'),(27,'zanzibar urban_west',-6.165900,39.201900,'119');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tips`
--

DROP TABLE IF EXISTS `tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tips` (
  `HealthTip` varchar(255) DEFAULT NULL,
  `ShelterTip` varchar(255) DEFAULT NULL,
  `FoodTip` varchar(255) DEFAULT NULL,
  `ClothingTip` varchar(255) DEFAULT NULL,
  `tipID` int(11) NOT NULL,
  `DestinationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tipID`),
  KEY `id_last` (`DestinationID`),
  CONSTRAINT `id_last` FOREIGN KEY (`DestinationID`) REFERENCES `destination` (`DestinationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tips`
--

LOCK TABLES `tips` WRITE;
/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
INSERT INTO `tips` VALUES ('get covered if have an athma','get cover from cold','eat hot food','wear sweaters',0,0),('not suitable for high blood pressure','stay at open area','drink more water','wear open clotehes',1,1);
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tim John','*A59253709535BA1CF9437DB29175E38297DBC78D','timjohn@hotmail.com'),(2,'john doe','e5841df2166dd424a57127423d276bbe','johndoe@hotmail.com'),(3,'jane doe','hellotherejane','janedoe@hotmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_data`
--

DROP TABLE IF EXISTS `weather_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_data` (
  `weather_of_area` varchar(255) NOT NULL,
  `DestinationID` int(11) NOT NULL,
  `TipID` int(11) NOT NULL,
  `Data_ID` int(11) NOT NULL,
  PRIMARY KEY (`Data_ID`),
  KEY `one` (`DestinationID`),
  KEY `two` (`TipID`),
  CONSTRAINT `one` FOREIGN KEY (`DestinationID`) REFERENCES `destination` (`DestinationID`),
  CONSTRAINT `two` FOREIGN KEY (`TipID`) REFERENCES `tips` (`tipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_data`
--

LOCK TABLES `weather_data` WRITE;
/*!40000 ALTER TABLE `weather_data` DISABLE KEYS */;
INSERT INTO `weather_data` VALUES ('rainy',12,0,0),('sunny',1,1,1),('cloudy',0,0,2),('stormy',3,1,3),('windy',21,0,4);
/*!40000 ALTER TABLE `weather_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-04 11:56:33
