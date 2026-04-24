/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: tallmart_final_project
-- ------------------------------------------------------
-- Server version	12.1.2-MariaDB-ubu2404

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
-- Table structure for table `COLD_GOOD`
--

DROP TABLE IF EXISTS `COLD_GOOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COLD_GOOD` (
  `PROD_ID` int(8) unsigned NOT NULL,
  `STORAGE_TEMP` decimal(6,2) NOT NULL,
  `EXP_TYPE` varchar(15) DEFAULT NULL,
  `SHELF_LIFE` varchar(30) DEFAULT NULL,
  `PERISH_INSTRUCT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`),
  CONSTRAINT `1` FOREIGN KEY (`PROD_ID`) REFERENCES `PRODUCT` (`PROD_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLD_GOOD`
--

LOCK TABLES `COLD_GOOD` WRITE;
/*!40000 ALTER TABLE `COLD_GOOD` DISABLE KEYS */;
/*!40000 ALTER TABLE `COLD_GOOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `CUST_ID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `CUST_DELIV_ADDRESS` varchar(50) NOT NULL,
  `CUST_BALANCE` decimal(8,2) DEFAULT NULL,
  `CUST_IS_ORG` tinyint(1) NOT NULL,
  `CUST_PHONE` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DAILY_INVENTORY`
--

DROP TABLE IF EXISTS `DAILY_INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DAILY_INVENTORY` (
  `PROD_ID` int(8) unsigned NOT NULL,
  `INV_DATE` date NOT NULL,
  `PRODUCT_STUCK` int(8) unsigned DEFAULT NULL,
  `PRODUCT_INCOMING` int(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`,`INV_DATE`),
  CONSTRAINT `1` FOREIGN KEY (`PROD_ID`) REFERENCES `PRODUCT` (`PROD_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DAILY_INVENTORY`
--

LOCK TABLES `DAILY_INVENTORY` WRITE;
/*!40000 ALTER TABLE `DAILY_INVENTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `DAILY_INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HAZARDOUS`
--

DROP TABLE IF EXISTS `HAZARDOUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `HAZARDOUS` (
  `PROD_ID` int(8) unsigned NOT NULL,
  `HAZARD_TYPE` varchar(15) DEFAULT NULL,
  `HAZARD_DESCRIPT` varchar(200) DEFAULT NULL,
  `HAZARD_INSTRUCT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`),
  CONSTRAINT `1` FOREIGN KEY (`PROD_ID`) REFERENCES `PRODUCT` (`PROD_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HAZARDOUS`
--

LOCK TABLES `HAZARDOUS` WRITE;
/*!40000 ALTER TABLE `HAZARDOUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `HAZARDOUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVOICE` (
  `CUST_ID` int(8) unsigned DEFAULT NULL,
  `INV_NUM` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `V_DATE` date NOT NULL,
  `INV_STATUS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`INV_NUM`,`V_DATE`),
  KEY `CUST_ID` (`CUST_ID`),
  CONSTRAINT `1` FOREIGN KEY (`CUST_ID`) REFERENCES `CUSTOMER` (`CUST_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINE`
--

DROP TABLE IF EXISTS `LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `LINE` (
  `INV_NUM` int(8) unsigned NOT NULL,
  `V_DATE` date NOT NULL,
  `PROD_ID` int(8) unsigned NOT NULL,
  `PROD_COUNT` int(8) unsigned DEFAULT NULL,
  `TOTAL_COST` decimal(8,2) DEFAULT NULL,
  `PROD_COST` decimal(8,2) DEFAULT NULL,
  `TAX_EXEMPT` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`INV_NUM`,`V_DATE`,`PROD_ID`),
  KEY `PROD_ID` (`PROD_ID`),
  CONSTRAINT `1` FOREIGN KEY (`INV_NUM`, `V_DATE`) REFERENCES `INVOICE` (`INV_NUM`, `V_DATE`) ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`PROD_ID`) REFERENCES `PRODUCT` (`PROD_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINE`
--

LOCK TABLES `LINE` WRITE;
/*!40000 ALTER TABLE `LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORGANIZATION`
--

DROP TABLE IF EXISTS `ORGANIZATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORGANIZATION` (
  `CUST_ID` int(8) unsigned NOT NULL,
  `ORG_CONTACT_NAME` varchar(50) DEFAULT NULL,
  `ORG_TYPE` varchar(50) DEFAULT NULL,
  `ORG_JOIN_DATE` date DEFAULT NULL,
  `ORG_DESCRIPT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`),
  CONSTRAINT `1` FOREIGN KEY (`CUST_ID`) REFERENCES `CUSTOMER` (`CUST_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORGANIZATION`
--

LOCK TABLES `ORGANIZATION` WRITE;
/*!40000 ALTER TABLE `ORGANIZATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORGANIZATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL`
--

DROP TABLE IF EXISTS `PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERSONAL` (
  `CUST_ID` int(8) unsigned NOT NULL,
  `CUST_FNAME` varchar(50) DEFAULT NULL,
  `CUST_LNAME` varchar(50) DEFAULT NULL,
  `CUST_M_INITAL` char(1) DEFAULT NULL,
  `SHIPPING_TYPE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`),
  CONSTRAINT `1` FOREIGN KEY (`CUST_ID`) REFERENCES `CUSTOMER` (`CUST_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL`
--

LOCK TABLES `PERSONAL` WRITE;
/*!40000 ALTER TABLE `PERSONAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERSONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCT` (
  `PROD_ID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `VEND_ID` int(8) unsigned NOT NULL,
  `PROD_DESCRIPT` varchar(200) DEFAULT NULL,
  `PROD_TITLE` varchar(50) DEFAULT NULL,
  `PROD_TYPE` char(1) DEFAULT NULL,
  `PROD_COST` int(8) DEFAULT NULL,
  `STORAGE_INSTRUCT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`,`VEND_ID`),
  KEY `VEND_ID` (`VEND_ID`),
  CONSTRAINT `1` FOREIGN KEY (`VEND_ID`) REFERENCES `VENDOR` (`VEND_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPMENT`
--

DROP TABLE IF EXISTS `SHIPMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHIPMENT` (
  `SHIPPER_ID` int(8) unsigned DEFAULT NULL,
  `SHIP_ID` int(8) unsigned NOT NULL,
  `SHIP_DATE` date NOT NULL,
  `SHIP_STATUS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SHIP_ID`,`SHIP_DATE`),
  KEY `SHIPPER_ID` (`SHIPPER_ID`),
  CONSTRAINT `1` FOREIGN KEY (`SHIPPER_ID`) REFERENCES `SHIPPER` (`SHIPPER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPMENT`
--

LOCK TABLES `SHIPMENT` WRITE;
/*!40000 ALTER TABLE `SHIPMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIPPER`
--

DROP TABLE IF EXISTS `SHIPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHIPPER` (
  `SHIPPER_ID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `SHIPPER_NAME` varchar(15) DEFAULT NULL,
  `SHIPPER_JOIN_DATE` date DEFAULT NULL,
  `SHIPPER_BALANCE` decimal(8,2) DEFAULT NULL,
  `SHIPPER_CONTACT_PHONE` varchar(15) DEFAULT NULL,
  `SHIPPER_CONTACT_NAME` varchar(50) DEFAULT NULL,
  `SHIPPER_CONTACT_EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SHIPPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIPPER`
--

LOCK TABLES `SHIPPER` WRITE;
/*!40000 ALTER TABLE `SHIPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHIP_LINE`
--

DROP TABLE IF EXISTS `SHIP_LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHIP_LINE` (
  `SHIP_ID` int(8) unsigned NOT NULL,
  `PROD_ID` int(8) unsigned NOT NULL,
  `PROD_COUNT` int(8) unsigned NOT NULL,
  `TOTAL_COST` decimal(8,2) NOT NULL,
  PRIMARY KEY (`SHIP_ID`,`PROD_ID`),
  KEY `FK_SHIP_LINE_2` (`PROD_ID`),
  CONSTRAINT `FK_SHIP_LINE_1` FOREIGN KEY (`SHIP_ID`) REFERENCES `SHIPMENT` (`SHIP_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SHIP_LINE_2` FOREIGN KEY (`PROD_ID`) REFERENCES `PRODUCT` (`PROD_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHIP_LINE`
--

LOCK TABLES `SHIP_LINE` WRITE;
/*!40000 ALTER TABLE `SHIP_LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHIP_LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STABLE`
--

DROP TABLE IF EXISTS `STABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `STABLE` (
  `PROD_ID` int(8) unsigned NOT NULL,
  `SHELF_LIFE` varchar(50) DEFAULT NULL,
  `TEMP_RANGE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PROD_ID`),
  CONSTRAINT `1` FOREIGN KEY (`PROD_ID`) REFERENCES `PRODUCT` (`PROD_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STABLE`
--

LOCK TABLES `STABLE` WRITE;
/*!40000 ALTER TABLE `STABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `STABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENDOR`
--

DROP TABLE IF EXISTS `VENDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `VENDOR` (
  `VEND_ID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `VEND_NAME` varchar(50) DEFAULT NULL,
  `VEND_BALANCE` int(8) DEFAULT NULL,
  `VEND_CONTACT_PHONE` varchar(15) DEFAULT NULL,
  `VEND_CONTACT_EMAIL` varchar(50) DEFAULT NULL,
  `VEND_CONTACT_NAME` varchar(50) DEFAULT NULL,
  `VEND_JOIN_DATE` date DEFAULT NULL,
  `VEND_IN_BUISNESS` tinyint(1) DEFAULT 1,
  `VEND_ADDRESS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VEND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENDOR`
--

LOCK TABLES `VENDOR` WRITE;
/*!40000 ALTER TABLE `VENDOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENDOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `invoice_view`
--

DROP TABLE IF EXISTS `invoice_view`;
/*!50001 DROP VIEW IF EXISTS `invoice_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `invoice_view` AS SELECT
 1 AS `CUST_ID`,
  1 AS `INV_NUM`,
  1 AS `V_DATE`,
  1 AS `INV_STATUS`,
  1 AS `INV_TOTAL` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `invoice_view`
--

/*!50001 DROP VIEW IF EXISTS `invoice_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `invoice_view` AS select `I`.`CUST_ID` AS `CUST_ID`,`I`.`INV_NUM` AS `INV_NUM`,`I`.`V_DATE` AS `V_DATE`,`I`.`INV_STATUS` AS `INV_STATUS`,`S`.`INV_TOTAL` AS `INV_TOTAL` from (`INVOICE` `I` join (select sum(`LINE`.`TOTAL_COST`) AS `INV_TOTAL`,`LINE`.`INV_NUM` AS `INV_NUM`,`LINE`.`V_DATE` AS `V_DATE` from `LINE` group by `LINE`.`INV_NUM`,`LINE`.`V_DATE`) `S`) where `S`.`INV_NUM` = `I`.`INV_NUM` and `S`.`V_DATE` = `I`.`V_DATE` */;
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

-- Dump completed on 2026-04-23 21:06:36
