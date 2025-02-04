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
-- Table structure for table `ATTs`
--

DROP TABLE IF EXISTS `ATTs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ATTs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `bname` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `cnty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `telcel` varchar(255) DEFAULT NULL,
  `telfax` varchar(255) DEFAULT NULL,
  `eml1` varchar(255) NOT NULL,
  `eml2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTs`
--

LOCK TABLES `ATTs` WRITE;
/*!40000 ALTER TABLE `ATTs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ATTs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CWORKERs`
--

DROP TABLE IF EXISTS `CWORKERs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CWORKERs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Index` int NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `telcel` varchar(255) DEFAULT NULL,
  `telfax` varchar(255) DEFAULT NULL,
  `eml1` varchar(255) NOT NULL,
  `eml2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  `M_ID` int DEFAULT NULL,
  `A_ID` int DEFAULT NULL,
  `P_ID` int DEFAULT NULL,
  `T1_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  KEY `M_ID` (`M_ID`),
  KEY `A_ID` (`A_ID`),
  KEY `P_ID` (`P_ID`),
  KEY `T1_ID` (`T1_ID`),
  CONSTRAINT `CWORKERs_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `OWNs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CWORKERs_ibfk_2` FOREIGN KEY (`M_ID`) REFERENCES `MANs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CWORKERs_ibfk_3` FOREIGN KEY (`A_ID`) REFERENCES `ATTs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CWORKERs_ibfk_4` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `CWORKERs_ibfk_5` FOREIGN KEY (`T1_ID`) REFERENCES `TENs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CWORKERs`
--

LOCK TABLES `CWORKERs` WRITE;
/*!40000 ALTER TABLE `CWORKERs` DISABLE KEYS */;
/*!40000 ALTER TABLE `CWORKERs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANs`
--

DROP TABLE IF EXISTS `MANs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MANs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `bname` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `cnty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `telcel` varchar(255) DEFAULT NULL,
  `telfax` varchar(255) DEFAULT NULL,
  `eml1` varchar(255) NOT NULL,
  `eml2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANs`
--

LOCK TABLES `MANs` WRITE;
/*!40000 ALTER TABLE `MANs` DISABLE KEYS */;
/*!40000 ALTER TABLE `MANs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTICETBLs`
--

DROP TABLE IF EXISTS `NOTICETBLs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NOTICETBLs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `noticetyp` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `NOTICETBLs_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTICETBLs`
--

LOCK TABLES `NOTICETBLs` WRITE;
/*!40000 ALTER TABLE `NOTICETBLs` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTICETBLs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OWNs`
--

DROP TABLE IF EXISTS `OWNs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OWNs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `bname` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `cnty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `telcel` varchar(255) NOT NULL,
  `telfax` varchar(255) NOT NULL,
  `eml1` varchar(255) NOT NULL,
  `eml2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OWNs`
--

LOCK TABLES `OWNs` WRITE;
/*!40000 ALTER TABLE `OWNs` DISABLE KEYS */;
/*!40000 ALTER TABLE `OWNs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTICULARs`
--

DROP TABLE IF EXISTS `PARTICULARs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PARTICULARs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RentFrom` datetime NOT NULL,
  `RentThrough` datetime NOT NULL,
  `Dollars` int NOT NULL,
  `Cents` int NOT NULL,
  `Written` varchar(255) NOT NULL,
  `PayToFirst` varchar(255) NOT NULL,
  `PayToLast` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `cnty` varchar(255) NOT NULL,
  `OpenHours` varchar(255) NOT NULL,
  `OpenDays` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `PARTICULARs_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTICULARs`
--

LOCK TABLES `PARTICULARs` WRITE;
/*!40000 ALTER TABLE `PARTICULARs` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTICULARs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYs`
--

DROP TABLE IF EXISTS `PAYs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `dllr` int NOT NULL,
  `cent` int DEFAULT NULL,
  `ptyp` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `PAYs_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYs`
--

LOCK TABLES `PAYs` WRITE;
/*!40000 ALTER TABLE `PAYs` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAYs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROPs`
--

DROP TABLE IF EXISTS `PROPs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROPs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `cnty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `numunits` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  `M_ID` int DEFAULT NULL,
  `A_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  KEY `M_ID` (`M_ID`),
  KEY `A_ID` (`A_ID`),
  CONSTRAINT `PROPs_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `OWNs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PROPs_ibfk_2` FOREIGN KEY (`M_ID`) REFERENCES `MANs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `PROPs_ibfk_3` FOREIGN KEY (`A_ID`) REFERENCES `ATTs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROPs`
--

LOCK TABLES `PROPs` WRITE;
/*!40000 ALTER TABLE `PROPs` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROPs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECEIVERs`
--

DROP TABLE IF EXISTS `RECEIVERs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECEIVERs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tnt1` tinyint(1) NOT NULL,
  `tnt2` tinyint(1) DEFAULT NULL,
  `tnt3` tinyint(1) DEFAULT NULL,
  `tnt4` tinyint(1) DEFAULT NULL,
  `lndld` varchar(255) DEFAULT NULL,
  `mngr` varchar(255) DEFAULT NULL,
  `attn` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `RECEIVERs_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECEIVERs`
--

LOCK TABLES `RECEIVERs` WRITE;
/*!40000 ALTER TABLE `RECEIVERs` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECEIVERs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECT8s`
--

DROP TABLE IF EXISTS `SECT8s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SECT8s` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `cty` varchar(255) NOT NULL,
  `st` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `telcel` varchar(255) DEFAULT NULL,
  `telfax` varchar(255) DEFAULT NULL,
  `eml1` varchar(255) NOT NULL,
  `eml2` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  `M_ID` int DEFAULT NULL,
  `A_ID` int DEFAULT NULL,
  `P_ID` int DEFAULT NULL,
  `T1_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  KEY `M_ID` (`M_ID`),
  KEY `A_ID` (`A_ID`),
  KEY `P_ID` (`P_ID`),
  KEY `T1_ID` (`T1_ID`),
  CONSTRAINT `SECT8s_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `OWNs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SECT8s_ibfk_2` FOREIGN KEY (`M_ID`) REFERENCES `MANs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SECT8s_ibfk_3` FOREIGN KEY (`A_ID`) REFERENCES `ATTs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SECT8s_ibfk_4` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `SECT8s_ibfk_5` FOREIGN KEY (`T1_ID`) REFERENCES `TENs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECT8s`
--

LOCK TABLES `SECT8s` WRITE;
/*!40000 ALTER TABLE `SECT8s` DISABLE KEYS */;
/*!40000 ALTER TABLE `SECT8s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TENs`
--

DROP TABLE IF EXISTS `TENs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TENs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `Index` int DEFAULT NULL,
  `tel` varchar(255) NOT NULL,
  `telcel` varchar(255) DEFAULT NULL,
  `telfax` varchar(255) DEFAULT NULL,
  `eml1` varchar(255) NOT NULL,
  `eml2` varchar(255) DEFAULT NULL,
  `SS` varchar(255) DEFAULT NULL,
  `DOB` varchar(255) DEFAULT NULL,
  `DL` varchar(255) DEFAULT NULL,
  `DLST` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `O_ID` int DEFAULT NULL,
  `M_ID` int DEFAULT NULL,
  `A_ID` int DEFAULT NULL,
  `P_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `O_ID` (`O_ID`),
  KEY `M_ID` (`M_ID`),
  KEY `A_ID` (`A_ID`),
  KEY `P_ID` (`P_ID`),
  CONSTRAINT `TENs_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `OWNs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `TENs_ibfk_2` FOREIGN KEY (`M_ID`) REFERENCES `MANs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `TENs_ibfk_3` FOREIGN KEY (`A_ID`) REFERENCES `ATTs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `TENs_ibfk_4` FOREIGN KEY (`P_ID`) REFERENCES `PROPs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TENs`
--

LOCK TABLES `TENs` WRITE;
/*!40000 ALTER TABLE `TENs` DISABLE KEYS */;
/*!40000 ALTER TABLE `TENs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-09  1:20:17
