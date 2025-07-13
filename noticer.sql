-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: nnoticer
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Attorneys`
--

DROP TABLE IF EXISTS `Attorneys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attorneys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `BusinessName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Zipcode` varchar(255) NOT NULL,
  `Telephone1` varchar(255) NOT NULL,
  `Telephone2` varchar(255) DEFAULT NULL,
  `TelephoneFax` varchar(255) DEFAULT NULL,
  `Email1` varchar(255) NOT NULL,
  `Email2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  CONSTRAINT `Attorneys_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `Landlords` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attorneys`
--

LOCK TABLES `Attorneys` WRITE;
/*!40000 ALTER TABLE `Attorneys` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attorneys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CaseWorkers`
--

DROP TABLE IF EXISTS `CaseWorkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CaseWorkers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Index` int NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Telephone1` varchar(255) DEFAULT NULL,
  `Telephone2` varchar(255) DEFAULT NULL,
  `TelephoneFax` varchar(255) DEFAULT NULL,
  `Email1` varchar(255) NOT NULL,
  `Email2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `CaseWorkers_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaseWorkers`
--

LOCK TABLES `CaseWorkers` WRITE;
/*!40000 ALTER TABLE `CaseWorkers` DISABLE KEYS */;
INSERT INTO `CaseWorkers` VALUES (1,1,NULL,NULL,'sao paulo','','sao paulo','SC',NULL,NULL,NULL,'jamespotter0825@gmail.com',NULL,'2024-11-06 18:29:28','2024-11-06 18:29:28',1),(2,1,NULL,NULL,'sao paulo','','sao paulo','SC',NULL,NULL,NULL,'jamespotter0825@gmail.com',NULL,'2024-11-06 18:31:00','2024-11-06 18:31:00',1);
/*!40000 ALTER TABLE `CaseWorkers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Landlords`
--

DROP TABLE IF EXISTS `Landlords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Landlords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `BusinessName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Zipcode` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `TelephoneCell` varchar(255) DEFAULT NULL,
  `TelephoneFax` varchar(255) DEFAULT NULL,
  `Email1` varchar(255) NOT NULL,
  `Email2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Landlords`
--

LOCK TABLES `Landlords` WRITE;
/*!40000 ALTER TABLE `Landlords` DISABLE KEYS */;
INSERT INTO `Landlords` VALUES (1,'Lucas','Carvalho','','sao paulo','','sao paulo','Los Angeles','California','123435','260-351-5454',NULL,NULL,'jamespotter0825@gmail.com',NULL,'2024-11-06 18:28:04','2024-11-06 18:28:04');
/*!40000 ALTER TABLE `Landlords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Managers`
--

DROP TABLE IF EXISTS `Managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `BusinessName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Zipcode` varchar(255) NOT NULL,
  `Telephone1` varchar(255) NOT NULL,
  `Telephone2` varchar(255) DEFAULT NULL,
  `TelephoneFax` varchar(255) DEFAULT NULL,
  `Email1` varchar(255) NOT NULL,
  `Email2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  CONSTRAINT `Managers_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `Landlords` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Managers`
--

LOCK TABLES `Managers` WRITE;
/*!40000 ALTER TABLE `Managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Particulars`
--

DROP TABLE IF EXISTS `Particulars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Particulars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RentFrom` datetime NOT NULL,
  `RentThrough` datetime NOT NULL,
  `Dollars` int NOT NULL,
  `Cents` int NOT NULL,
  `Written` varchar(255) NOT NULL,
  `PayToFirst` varchar(255) NOT NULL,
  `PayToLast` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Zipcode` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `OpenHours` varchar(255) NOT NULL,
  `OpenDays` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Particulars_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Particulars`
--

LOCK TABLES `Particulars` WRITE;
/*!40000 ALTER TABLE `Particulars` DISABLE KEYS */;
INSERT INTO `Particulars` VALUES (1,'2024-11-05 00:00:00','2024-11-09 00:00:00',123,0,'One hundred and twenty three','Lucas','Carvalho','260-351-5454','sao paulo','','sao paulo','SC','123435','Madera','9am - 5pm','Monday - Saturday (no holidays)','2024-11-06 18:28:33','2024-11-06 18:28:33',1);
/*!40000 ALTER TABLE `Particulars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Dollor` int NOT NULL,
  `Cent` int DEFAULT NULL,
  `PaymentType` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Payments_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,'Kenta','Ishii',75,0,'Mastercard','2024-11-06 18:31:19','2024-11-06 18:31:19',1);
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Properties`
--

DROP TABLE IF EXISTS `Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `County` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Zipcode` varchar(255) NOT NULL,
  `NumUnitTotal` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  CONSTRAINT `Properties_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `Landlords` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Properties`
--

LOCK TABLES `Properties` WRITE;
/*!40000 ALTER TABLE `Properties` DISABLE KEYS */;
INSERT INTO `Properties` VALUES (1,NULL,'sao paulo','','sao paulo','Lake','California','123435',NULL,'2024-11-06 18:28:09','2024-11-06 18:28:09',1);
/*!40000 ALTER TABLE `Properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receivers`
--

DROP TABLE IF EXISTS `Receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receivers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tenant1` tinyint(1) NOT NULL,
  `Tenant2` tinyint(1) DEFAULT NULL,
  `Tenant3` tinyint(1) DEFAULT NULL,
  `Tenant4` tinyint(1) DEFAULT NULL,
  `Landlord` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL,
  `Attorney` varchar(255) DEFAULT NULL,
  `CaseWorker` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Receivers_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receivers`
--

LOCK TABLES `Receivers` WRITE;
/*!40000 ALTER TABLE `Receivers` DISABLE KEYS */;
INSERT INTO `Receivers` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-11-06 18:29:28','2024-11-06 18:29:28',NULL),(2,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2024-11-06 18:31:00','2024-11-06 18:31:00',1);
/*!40000 ALTER TABLE `Receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section8s`
--

DROP TABLE IF EXISTS `Section8s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Section8s` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) NOT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Telephone1` varchar(255) DEFAULT NULL,
  `Telephone2` varchar(255) DEFAULT NULL,
  `TelephoneFax` varchar(255) DEFAULT NULL,
  `Email1` varchar(255) NOT NULL,
  `Email2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Section8s_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section8s`
--

LOCK TABLES `Section8s` WRITE;
/*!40000 ALTER TABLE `Section8s` DISABLE KEYS */;
/*!40000 ALTER TABLE `Section8s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tenants`
--

DROP TABLE IF EXISTS `Tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tenants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Index` int DEFAULT NULL,
  `Telephone1` varchar(255) DEFAULT NULL,
  `Telephone2` varchar(255) DEFAULT NULL,
  `TelephoneFax` varchar(255) DEFAULT NULL,
  `Email1` varchar(255) DEFAULT NULL,
  `Email2` varchar(255) DEFAULT NULL,
  `SS` varchar(255) DEFAULT NULL,
  `DOB` varchar(255) DEFAULT NULL,
  `DL` varchar(255) DEFAULT NULL,
  `DLST` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `Tenants_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `Properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tenants`
--

LOCK TABLES `Tenants` WRITE;
/*!40000 ALTER TABLE `Tenants` DISABLE KEYS */;
INSERT INTO `Tenants` VALUES (1,'tenant','jlk',1,NULL,NULL,NULL,'jamespotter0825@gmail.com',NULL,NULL,NULL,NULL,NULL,'2024-11-06 18:28:18','2024-11-06 18:29:28',1),(2,'qwe','two',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-11-06 18:28:18','2024-11-06 18:31:00',1),(3,'tenant','jlk',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-11-06 18:28:18','2024-11-06 18:28:18',1),(4,'qwe','two',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-11-06 18:28:18','2024-11-06 18:28:18',1);
/*!40000 ALTER TABLE `Tenants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07  1:41:38
