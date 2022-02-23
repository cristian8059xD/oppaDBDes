-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: oppaAWS
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `users_user_id` int NOT NULL,
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `other` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`,`users_user_id`),
  KEY `fk_addresses_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,5,'av.providencia 244',NULL,'Providencia','Metropolitana de Santiago','2021-12-01 10:33:14','2021-12-01 10:33:13'),(2,2,'Río ñuble 797',NULL,'La Florida','Metropolitana de Santiago','2021-12-08 11:39:54','2021-12-08 11:39:53'),(3,1,'Av Providencia 286',NULL,'Providencia','Metropolitana de Santiago','2021-12-09 07:27:59','2021-12-09 07:27:59'),(4,17,'Tobalaba 7311','204 torre 2','La Florida','Metropolitana de Santiago','2021-12-09 17:16:42','2021-12-09 17:16:41'),(5,1,'Av. Providencia 286',NULL,'Arica','Arica y Parinacota','2021-12-10 15:14:31','2021-12-10 15:14:31'),(6,23,'tobalaba 7113','204','Macul','Metropolitana de Santiago','2021-12-15 16:16:24','2021-12-15 16:16:24'),(8,23,'Nueva las condes 286',NULL,'Las Condes','Metropolitana de Santiago','2022-01-08 09:24:32','2022-01-08 09:24:32'),(9,104,'av falsa 123',NULL,'Putre','Arica y Parinacota','2022-02-18 20:17:27','2022-02-18 20:17:27'),(10,104,'providencia 123',NULL,'Arica','Arica y Parinacota','2022-02-19 18:19:30','2022-02-19 18:19:29');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `users_user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`,`users_user_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  KEY `fk_admins_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_admins_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `super_categories_super_category_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`super_categories_super_category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  KEY `fk_categories_super_categories1_idx` (`super_categories_super_category_id`),
  CONSTRAINT `fk_categories_super_categories1` FOREIGN KEY (`super_categories_super_category_id`) REFERENCES `super_categories` (`super_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Salud','Relacionados con la salud del cliente','2021-11-29 14:20:49','2021-11-29 14:20:48',1),(2,'Belleza','Relacionados con el bienestar físico','2021-11-29 14:21:10','2021-11-29 14:21:09',1),(3,'Acompañamiento','Acompañamiento','2021-11-29 14:21:23','2021-11-29 14:21:23',2);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `receptor_img_url` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `provider_img_url` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `receptor_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `provider_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `scheduled_services_scheduled_services_id` int NOT NULL,
  PRIMARY KEY (`chat_id`),
  UNIQUE KEY `chat_id_UNIQUE` (`chat_id`),
  KEY `scheduled_services_scheduled_services_id_idx` (`scheduled_services_scheduled_services_id`),
  CONSTRAINT `scheduled_services_scheduled_services_id` FOREIGN KEY (`scheduled_services_scheduled_services_id`) REFERENCES `scheduled_services` (`scheduled_services_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'2021-12-13 17:22:36',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',5),(2,'2021-12-16 19:54:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',6),(3,'2021-12-16 20:00:41',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',7),(4,'2021-12-16 20:02:08',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',8),(5,'2021-12-29 17:34:13',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',9),(6,'2021-12-29 17:43:17',NULL,NULL,'Paseo','active','Javier Muñoz','sofia perez ',10),(7,'2021-12-29 17:47:29',NULL,NULL,'Paseo','active','Rosa  Arancibia','sofia perez ',11),(8,'2021-12-29 18:28:46',NULL,NULL,'Acompañamiento hora médica','active','María José  Berríos Arancibia ','Christian higuera',12),(9,'2022-01-01 14:30:59',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',13),(10,'2022-01-04 17:19:56',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',14),(11,'2022-01-04 17:19:57',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',16),(12,'2022-01-04 17:19:57',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',15),(13,'2022-01-04 17:19:57',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',18),(14,'2022-01-04 17:19:57',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',17),(15,'2022-01-04 17:19:57',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',19),(16,'2022-01-04 17:19:57',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',20),(17,'2022-01-04 17:19:58',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',21),(18,'2022-01-04 17:21:15',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',22),(19,'2022-01-04 17:21:15',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',23),(20,'2022-01-04 17:21:15',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',24),(21,'2022-01-04 17:21:16',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',25),(22,'2022-01-04 17:21:16',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',26),(23,'2022-01-04 17:21:16',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',27),(24,'2022-01-04 17:21:16',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',28),(25,'2022-01-04 17:39:23',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',30),(26,'2022-01-04 17:39:24',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',31),(27,'2022-01-04 17:39:24',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',29),(28,'2022-01-04 17:39:24',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',32),(29,'2022-01-04 17:39:25',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',33),(30,'2022-01-04 17:39:25',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',34),(31,'2022-01-04 17:39:25',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',35),(32,'2022-01-04 17:39:25',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',36),(33,'2022-01-04 17:55:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',37),(34,'2022-01-04 17:55:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',39),(35,'2022-01-04 17:55:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',38),(36,'2022-01-04 17:55:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',40),(37,'2022-01-04 17:55:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',41),(38,'2022-01-04 17:55:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',42),(39,'2022-01-04 17:55:32',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',43),(40,'2022-01-04 17:58:52',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',44),(41,'2022-01-04 17:58:52',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',45),(42,'2022-01-04 17:58:53',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',46),(43,'2022-01-04 17:58:53',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',47),(44,'2022-01-04 17:58:55',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',48),(45,'2022-01-04 18:00:18',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',49),(46,'2022-01-04 18:00:18',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',51),(47,'2022-01-04 18:00:18',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',50),(48,'2022-01-04 18:00:18',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',53),(49,'2022-01-04 18:00:18',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',52),(50,'2022-01-04 18:00:20',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',54),(51,'2022-01-04 18:03:39',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',55),(52,'2022-01-04 18:03:39',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',56),(53,'2022-01-04 18:03:40',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',57),(54,'2022-01-04 18:03:40',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',58),(55,'2022-01-04 18:03:40',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',59),(56,'2022-01-04 18:03:41',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',60),(57,'2022-01-04 18:03:42',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',61),(58,'2022-01-04 18:03:42',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',62),(59,'2022-01-04 18:11:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',63),(60,'2022-01-04 18:11:32',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',64),(61,'2022-01-04 18:11:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',65),(62,'2022-01-04 18:11:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',66),(63,'2022-01-04 18:11:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',67),(64,'2022-01-04 18:11:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',68),(65,'2022-01-04 18:11:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',69),(66,'2022-01-04 18:11:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',70),(67,'2022-01-04 18:15:30',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',71),(68,'2022-01-04 18:15:31',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',72),(69,'2022-01-04 18:15:32',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',73),(70,'2022-01-04 18:15:32',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',74),(71,'2022-01-04 18:15:33',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',75),(72,'2022-01-04 18:15:33',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',76),(73,'2022-01-04 18:15:33',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',77),(74,'2022-01-04 18:15:34',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',78),(75,'2022-01-04 18:27:53',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',80),(76,'2022-01-08 09:30:09',NULL,NULL,'Acompañamiento hora médica','active','Rosa  Arancibia','alex blaauboer',81),(77,'2022-01-08 16:33:15',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',82),(78,'2022-01-08 16:43:03',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',83),(79,'2022-01-08 16:43:03',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',84),(80,'2022-01-08 16:43:04',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',85),(81,'2022-01-08 16:43:04',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',86),(82,'2022-01-08 16:43:04',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',87),(83,'2022-01-08 16:43:05',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',88),(84,'2022-01-08 16:43:05',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',90),(85,'2022-01-08 16:43:05',NULL,NULL,'Peluquería','active','Javier Muñoz','Test Provider',89),(86,'2022-02-19 18:21:29',NULL,NULL,'Peluquería','active','camilo molina','Test Provider',91),(87,'2022-02-19 18:43:34',NULL,NULL,'Peluquería','active','camilo molina','Test Provider',92),(88,'2022-02-22 14:45:07',NULL,NULL,'Peluquería','active','camilo molina','Test Provider',93);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `users_user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`,`users_user_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`),
  UNIQUE KEY `users_user_id_UNIQUE` (`users_user_id`),
  KEY `fk_clients_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_clients_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'2021-11-28 21:24:04'),(2,2,'2021-11-29 14:17:28'),(3,4,'2021-12-01 08:12:06'),(4,5,'2021-12-01 09:49:00'),(5,7,'2021-12-08 11:24:42'),(6,8,'2021-12-08 11:28:36'),(8,17,'2021-12-08 11:34:22'),(9,22,'2021-12-09 07:23:05'),(10,23,'2021-12-09 17:10:19'),(11,24,'2021-12-09 17:19:45'),(12,45,'2021-12-15 16:32:17'),(13,87,'2021-12-23 16:50:45'),(14,88,'2021-12-23 17:23:16'),(17,101,'2022-01-08 09:25:15'),(18,103,'2022-01-11 12:05:37'),(19,104,'2022-02-18 15:33:01'),(20,105,'2022-02-19 17:04:59');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_has_clients`
--

DROP TABLE IF EXISTS `clients_has_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_has_clients` (
  `user_client_id` int NOT NULL,
  `senior_client_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_client_id`,`senior_client_id`),
  UNIQUE KEY `senior_client_id_UNIQUE` (`senior_client_id`),
  KEY `fk_clients_has_clients_clients2_idx` (`senior_client_id`),
  KEY `fk_clients_has_clients_clients1_idx` (`user_client_id`),
  CONSTRAINT `fk_clients_has_clients_clients1` FOREIGN KEY (`user_client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_clients_has_clients_clients2` FOREIGN KEY (`senior_client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_has_clients`
--

LOCK TABLES `clients_has_clients` WRITE;
/*!40000 ALTER TABLE `clients_has_clients` DISABLE KEYS */;
INSERT INTO `clients_has_clients` VALUES (1,9,'2021-12-09 07:23:06'),(2,8,'2021-12-08 11:34:23'),(2,10,'2021-12-09 17:10:19'),(5,11,'2021-12-09 17:19:46');
/*!40000 ALTER TABLE `clients_has_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_reports`
--

DROP TABLE IF EXISTS `clients_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_reports` (
  `client_report_id` int NOT NULL AUTO_INCREMENT,
  `providers_provider_id` int NOT NULL,
  `providers_users_user_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `clients_client_id` int NOT NULL,
  `clients_users_user_id` int NOT NULL,
  PRIMARY KEY (`client_report_id`,`providers_provider_id`,`providers_users_user_id`,`clients_client_id`,`clients_users_user_id`),
  UNIQUE KEY `client_report_id_UNIQUE` (`client_report_id`),
  KEY `fk_clients_reports_providers1_idx` (`providers_provider_id`,`providers_users_user_id`),
  KEY `fk_clients_reports_clients1_idx` (`clients_client_id`,`clients_users_user_id`),
  CONSTRAINT `fk_clients_reports_clients1` FOREIGN KEY (`clients_client_id`, `clients_users_user_id`) REFERENCES `clients` (`client_id`, `users_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_clients_reports_providers1` FOREIGN KEY (`providers_provider_id`, `providers_users_user_id`) REFERENCES `providers` (`provider_id`, `users_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_reports`
--

LOCK TABLES `clients_reports` WRITE;
/*!40000 ALTER TABLE `clients_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `district` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `region` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `provider_has_services_provider_has_services_id` int NOT NULL,
  PRIMARY KEY (`location_id`,`provider_has_services_provider_has_services_id`),
  UNIQUE KEY `location_id_UNIQUE` (`location_id`),
  KEY `fk_locations_provider_hast_services21_idx` (`provider_has_services_provider_has_services_id`),
  CONSTRAINT `fk_locations_provider_hast_services21` FOREIGN KEY (`provider_has_services_provider_has_services_id`) REFERENCES `provider_has_services` (`provider_has_services_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Alhué','Metropolitana de Santiago',1),(2,'Buin','Metropolitana de Santiago',1),(3,'Calera de Tango','Metropolitana de Santiago',1),(4,'Cerrillos','Metropolitana de Santiago',1),(5,'Cerro Navia','Metropolitana de Santiago',1),(6,'Colina','Metropolitana de Santiago',1),(7,'Conchalí','Metropolitana de Santiago',1),(8,'Curacaví','Metropolitana de Santiago',1),(9,'El Bosque','Metropolitana de Santiago',1),(10,'El Monte','Metropolitana de Santiago',1),(11,'Estación Central','Metropolitana de Santiago',1),(12,'Huechuraba','Metropolitana de Santiago',1),(13,'Independencia','Metropolitana de Santiago',1),(14,'Isla de Maipo','Metropolitana de Santiago',1),(15,'La Cisterna','Metropolitana de Santiago',1),(16,'La Florida','Metropolitana de Santiago',1),(17,'La Granja','Metropolitana de Santiago',1),(18,'La Pintana','Metropolitana de Santiago',1),(19,'La Reina','Metropolitana de Santiago',1),(20,'Lampa','Metropolitana de Santiago',1),(21,'Las Condes','Metropolitana de Santiago',1),(22,'Lo Barnechea','Metropolitana de Santiago',1),(23,'Lo Espejo','Metropolitana de Santiago',1),(24,'Lo Prado','Metropolitana de Santiago',1),(25,'Macul','Metropolitana de Santiago',1),(26,'Maipú','Metropolitana de Santiago',1),(27,'María Pinto','Metropolitana de Santiago',1),(28,'Melipilla','Metropolitana de Santiago',1),(29,'Ñuñoa','Metropolitana de Santiago',1),(30,'Padre Hurtado','Metropolitana de Santiago',1),(31,'Paine','Metropolitana de Santiago',1),(32,'Pedro Aguirre Cerda','Metropolitana de Santiago',1),(33,'Peñaflor','Metropolitana de Santiago',1),(34,'Peñalolén','Metropolitana de Santiago',1),(35,'Pirque','Metropolitana de Santiago',1),(36,'Providencia','Metropolitana de Santiago',1),(37,'Pudahuel','Metropolitana de Santiago',1),(38,'Puente Alto','Metropolitana de Santiago',1),(39,'Quilicura','Metropolitana de Santiago',1),(40,'Quinta Normal','Metropolitana de Santiago',1),(41,'Recoleta','Metropolitana de Santiago',1),(42,'Renca','Metropolitana de Santiago',1),(43,'San Bernardo','Metropolitana de Santiago',1),(44,'San Joaquín','Metropolitana de Santiago',1),(45,'San José de Maipo','Metropolitana de Santiago',1),(46,'San Miguel','Metropolitana de Santiago',1),(47,'San Pedro','Metropolitana de Santiago',1),(48,'San Ramón','Metropolitana de Santiago',1),(49,'Santiago Centro','Metropolitana de Santiago',1),(50,'Talagante','Metropolitana de Santiago',1),(51,'Tiltil','Metropolitana de Santiago',1),(52,'Vitacura','Metropolitana de Santiago',1),(105,'La Reina','Metropolitana de Santiago',3),(106,'Lampa','Metropolitana de Santiago',3),(107,'Las Condes','Metropolitana de Santiago',3),(112,'Arica','Arica y Parinacota',8),(113,'Camarones','Arica y Parinacota',8),(114,'General Lagos','Arica y Parinacota',8),(115,'Putre','Arica y Parinacota',8),(116,'Arica','Arica y Parinacota',9),(117,'Camarones','Arica y Parinacota',9),(118,'General Lagos','Arica y Parinacota',9),(119,'Putre','Arica y Parinacota',9),(120,'Alhué','Metropolitana de Santiago',10),(121,'Buin','Metropolitana de Santiago',10),(122,'Calera de Tango','Metropolitana de Santiago',10),(123,'Cerrillos','Metropolitana de Santiago',10),(124,'Cerro Navia','Metropolitana de Santiago',10),(125,'Colina','Metropolitana de Santiago',10),(126,'Conchalí','Metropolitana de Santiago',10),(127,'Curacaví','Metropolitana de Santiago',10),(128,'El Bosque','Metropolitana de Santiago',10),(129,'El Monte','Metropolitana de Santiago',10),(130,'Estación Central','Metropolitana de Santiago',10),(131,'Huechuraba','Metropolitana de Santiago',10),(132,'Independencia','Metropolitana de Santiago',10),(133,'Isla de Maipo','Metropolitana de Santiago',10),(134,'La Cisterna','Metropolitana de Santiago',10),(135,'La Florida','Metropolitana de Santiago',10),(136,'La Granja','Metropolitana de Santiago',10),(137,'La Pintana','Metropolitana de Santiago',10),(138,'La Reina','Metropolitana de Santiago',10),(139,'Lampa','Metropolitana de Santiago',10),(140,'Las Condes','Metropolitana de Santiago',10),(141,'Lo Barnechea','Metropolitana de Santiago',10),(142,'Lo Espejo','Metropolitana de Santiago',10),(143,'Lo Prado','Metropolitana de Santiago',10),(144,'Macul','Metropolitana de Santiago',10),(145,'Maipú','Metropolitana de Santiago',10),(146,'María Pinto','Metropolitana de Santiago',10),(147,'Melipilla','Metropolitana de Santiago',10),(148,'Ñuñoa','Metropolitana de Santiago',10),(149,'Padre Hurtado','Metropolitana de Santiago',10),(150,'Paine','Metropolitana de Santiago',10),(151,'Pedro Aguirre Cerda','Metropolitana de Santiago',10),(152,'Peñaflor','Metropolitana de Santiago',10),(153,'Peñalolén','Metropolitana de Santiago',10),(154,'Pirque','Metropolitana de Santiago',10),(155,'Providencia','Metropolitana de Santiago',10),(156,'Pudahuel','Metropolitana de Santiago',10),(157,'Puente Alto','Metropolitana de Santiago',10),(158,'Quilicura','Metropolitana de Santiago',10),(159,'Quinta Normal','Metropolitana de Santiago',10),(160,'Recoleta','Metropolitana de Santiago',10),(161,'Renca','Metropolitana de Santiago',10),(162,'San Bernardo','Metropolitana de Santiago',10),(163,'San Joaquín','Metropolitana de Santiago',10),(164,'San José de Maipo','Metropolitana de Santiago',10),(165,'San Miguel','Metropolitana de Santiago',10),(166,'San Pedro','Metropolitana de Santiago',10),(167,'San Ramón','Metropolitana de Santiago',10),(168,'Santiago Centro','Metropolitana de Santiago',10),(169,'Talagante','Metropolitana de Santiago',10),(170,'Tiltil','Metropolitana de Santiago',10),(171,'Vitacura','Metropolitana de Santiago',10),(172,'Alhué','Metropolitana de Santiago',11),(173,'Buin','Metropolitana de Santiago',11),(174,'Calera de Tango','Metropolitana de Santiago',11),(175,'Cerrillos','Metropolitana de Santiago',11),(176,'Cerro Navia','Metropolitana de Santiago',11),(177,'Colina','Metropolitana de Santiago',11),(178,'Conchalí','Metropolitana de Santiago',11),(179,'Curacaví','Metropolitana de Santiago',11),(180,'El Bosque','Metropolitana de Santiago',11),(181,'El Monte','Metropolitana de Santiago',11),(182,'Estación Central','Metropolitana de Santiago',11),(183,'Huechuraba','Metropolitana de Santiago',11),(184,'Independencia','Metropolitana de Santiago',11),(185,'Isla de Maipo','Metropolitana de Santiago',11),(186,'La Cisterna','Metropolitana de Santiago',11),(187,'La Florida','Metropolitana de Santiago',11),(188,'La Granja','Metropolitana de Santiago',11),(189,'La Pintana','Metropolitana de Santiago',11),(190,'La Reina','Metropolitana de Santiago',11),(191,'Lampa','Metropolitana de Santiago',11),(192,'Las Condes','Metropolitana de Santiago',11),(193,'Lo Barnechea','Metropolitana de Santiago',11),(194,'Lo Espejo','Metropolitana de Santiago',11),(195,'Lo Prado','Metropolitana de Santiago',11),(196,'Macul','Metropolitana de Santiago',11),(197,'Maipú','Metropolitana de Santiago',11),(198,'María Pinto','Metropolitana de Santiago',11),(199,'Melipilla','Metropolitana de Santiago',11),(200,'Ñuñoa','Metropolitana de Santiago',11),(201,'Padre Hurtado','Metropolitana de Santiago',11),(202,'Paine','Metropolitana de Santiago',11),(203,'Pedro Aguirre Cerda','Metropolitana de Santiago',11),(204,'Peñaflor','Metropolitana de Santiago',11),(205,'Peñalolén','Metropolitana de Santiago',11),(206,'Pirque','Metropolitana de Santiago',11),(207,'Providencia','Metropolitana de Santiago',11),(208,'Pudahuel','Metropolitana de Santiago',11),(209,'Puente Alto','Metropolitana de Santiago',11),(210,'Quilicura','Metropolitana de Santiago',11),(211,'Quinta Normal','Metropolitana de Santiago',11),(212,'Recoleta','Metropolitana de Santiago',11),(213,'Renca','Metropolitana de Santiago',11),(214,'San Bernardo','Metropolitana de Santiago',11),(215,'San Joaquín','Metropolitana de Santiago',11),(216,'San José de Maipo','Metropolitana de Santiago',11),(217,'San Miguel','Metropolitana de Santiago',11),(218,'San Pedro','Metropolitana de Santiago',11),(219,'San Ramón','Metropolitana de Santiago',11),(220,'Santiago Centro','Metropolitana de Santiago',11),(221,'Talagante','Metropolitana de Santiago',11),(222,'Tiltil','Metropolitana de Santiago',11),(223,'Vitacura','Metropolitana de Santiago',11),(224,'Alhué','Metropolitana de Santiago',12),(225,'Buin','Metropolitana de Santiago',12),(226,'Calera de Tango','Metropolitana de Santiago',12),(227,'Cerrillos','Metropolitana de Santiago',12),(228,'Cerro Navia','Metropolitana de Santiago',12),(229,'Colina','Metropolitana de Santiago',12),(230,'Conchalí','Metropolitana de Santiago',12),(231,'Curacaví','Metropolitana de Santiago',12),(232,'El Bosque','Metropolitana de Santiago',12),(233,'El Monte','Metropolitana de Santiago',12),(234,'Estación Central','Metropolitana de Santiago',12),(235,'Huechuraba','Metropolitana de Santiago',12),(236,'Independencia','Metropolitana de Santiago',12),(237,'Isla de Maipo','Metropolitana de Santiago',12),(238,'La Cisterna','Metropolitana de Santiago',12),(239,'La Florida','Metropolitana de Santiago',12),(240,'La Granja','Metropolitana de Santiago',12),(241,'La Pintana','Metropolitana de Santiago',12),(242,'La Reina','Metropolitana de Santiago',12),(243,'Lampa','Metropolitana de Santiago',12),(244,'Las Condes','Metropolitana de Santiago',12),(245,'Lo Barnechea','Metropolitana de Santiago',12),(246,'Lo Espejo','Metropolitana de Santiago',12),(247,'Lo Prado','Metropolitana de Santiago',12),(248,'Macul','Metropolitana de Santiago',12),(249,'Maipú','Metropolitana de Santiago',12),(250,'María Pinto','Metropolitana de Santiago',12),(251,'Melipilla','Metropolitana de Santiago',12),(252,'Ñuñoa','Metropolitana de Santiago',12),(253,'Padre Hurtado','Metropolitana de Santiago',12),(254,'Paine','Metropolitana de Santiago',12),(255,'Pedro Aguirre Cerda','Metropolitana de Santiago',12),(256,'Peñaflor','Metropolitana de Santiago',12),(257,'Peñalolén','Metropolitana de Santiago',12),(258,'Pirque','Metropolitana de Santiago',12),(259,'Providencia','Metropolitana de Santiago',12),(260,'Pudahuel','Metropolitana de Santiago',12),(261,'Puente Alto','Metropolitana de Santiago',12),(262,'Quilicura','Metropolitana de Santiago',12),(263,'Quinta Normal','Metropolitana de Santiago',12),(264,'Recoleta','Metropolitana de Santiago',12),(265,'Renca','Metropolitana de Santiago',12),(266,'San Bernardo','Metropolitana de Santiago',12),(267,'San Joaquín','Metropolitana de Santiago',12),(268,'San José de Maipo','Metropolitana de Santiago',12),(269,'San Miguel','Metropolitana de Santiago',12),(270,'San Pedro','Metropolitana de Santiago',12),(271,'San Ramón','Metropolitana de Santiago',12),(272,'Santiago Centro','Metropolitana de Santiago',12),(273,'Talagante','Metropolitana de Santiago',12),(274,'Tiltil','Metropolitana de Santiago',12),(275,'Vitacura','Metropolitana de Santiago',12),(276,'Providencia','Metropolitana de Santiago',13),(277,'Providencia','Metropolitana de Santiago',14),(278,'Puchuncaví','Valparaíso',15),(279,'Alhué','Metropolitana de Santiago',16),(280,'Buin','Metropolitana de Santiago',16),(281,'Calera de Tango','Metropolitana de Santiago',16),(282,'Cerrillos','Metropolitana de Santiago',16),(283,'Cerro Navia','Metropolitana de Santiago',16),(284,'Colina','Metropolitana de Santiago',16),(285,'Conchalí','Metropolitana de Santiago',16),(286,'Curacaví','Metropolitana de Santiago',16),(287,'El Bosque','Metropolitana de Santiago',16),(288,'El Monte','Metropolitana de Santiago',16),(289,'Estación Central','Metropolitana de Santiago',16),(290,'Huechuraba','Metropolitana de Santiago',16),(291,'Independencia','Metropolitana de Santiago',16),(292,'Isla de Maipo','Metropolitana de Santiago',16),(293,'La Cisterna','Metropolitana de Santiago',16),(294,'La Florida','Metropolitana de Santiago',16),(295,'La Granja','Metropolitana de Santiago',16),(296,'La Pintana','Metropolitana de Santiago',16),(297,'La Reina','Metropolitana de Santiago',16),(298,'Lampa','Metropolitana de Santiago',16),(299,'Las Condes','Metropolitana de Santiago',16),(300,'Lo Barnechea','Metropolitana de Santiago',16),(301,'Lo Espejo','Metropolitana de Santiago',16),(302,'Lo Prado','Metropolitana de Santiago',16),(303,'Macul','Metropolitana de Santiago',16),(304,'Maipú','Metropolitana de Santiago',16),(305,'María Pinto','Metropolitana de Santiago',16),(306,'Melipilla','Metropolitana de Santiago',16),(307,'Ñuñoa','Metropolitana de Santiago',16),(308,'Padre Hurtado','Metropolitana de Santiago',16),(309,'Paine','Metropolitana de Santiago',16),(310,'Pedro Aguirre Cerda','Metropolitana de Santiago',16),(311,'Peñaflor','Metropolitana de Santiago',16),(312,'Peñalolén','Metropolitana de Santiago',16),(313,'Pirque','Metropolitana de Santiago',16),(314,'Providencia','Metropolitana de Santiago',16),(315,'Pudahuel','Metropolitana de Santiago',16),(316,'Puente Alto','Metropolitana de Santiago',16),(317,'Quilicura','Metropolitana de Santiago',16),(318,'Quinta Normal','Metropolitana de Santiago',16),(319,'Recoleta','Metropolitana de Santiago',16),(320,'Renca','Metropolitana de Santiago',16),(321,'San Bernardo','Metropolitana de Santiago',16),(322,'San Joaquín','Metropolitana de Santiago',16),(323,'San José de Maipo','Metropolitana de Santiago',16),(324,'San Miguel','Metropolitana de Santiago',16),(325,'San Pedro','Metropolitana de Santiago',16),(326,'San Ramón','Metropolitana de Santiago',16),(327,'Santiago Centro','Metropolitana de Santiago',16),(328,'Talagante','Metropolitana de Santiago',16),(329,'Tiltil','Metropolitana de Santiago',16),(330,'Vitacura','Metropolitana de Santiago',16),(331,'Las Condes','Metropolitana de Santiago',17),(332,'Providencia','Metropolitana de Santiago',17),(333,'Vitacura','Metropolitana de Santiago',17),(370,'Arica','Arica y Parinacota',7),(371,'Putre','Arica y Parinacota',7);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `chats_chat_id` int NOT NULL,
  `users_user_id` int NOT NULL,
  PRIMARY KEY (`message_id`,`users_user_id`),
  UNIQUE KEY `message_id_UNIQUE` (`message_id`),
  KEY `fk_messages_chats1_idx` (`chats_chat_id`),
  KEY `fk_messages_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_messages_chats1` FOREIGN KEY (`chats_chat_id`) REFERENCES `chats` (`chat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'asdasdasd',NULL,'text','2022-01-08 20:00:07',1,1),(2,'asdasd',NULL,'text','2022-01-08 20:00:48',1,1),(3,'asdasd',NULL,'text','2022-01-08 20:16:05',1,1),(4,'lalalalala',NULL,'text','2022-01-08 20:16:43',1,1),(5,'asdasdasd',NULL,'text','2022-01-08 20:18:29',1,1),(6,'asdasd',NULL,'text','2022-01-08 20:18:31',1,1),(7,'asdasd',NULL,'text','2022-01-08 20:18:32',1,1),(8,'asdasd',NULL,'text','2022-01-08 20:18:33',1,1),(9,'asdasd',NULL,'text','2022-01-08 20:18:34',1,1),(10,'asdasdad',NULL,'text','2022-01-08 20:18:35',1,1),(11,'asdasdasd',NULL,'text','2022-01-08 20:18:36',1,1),(12,'asdasdasdads',NULL,'text','2022-01-08 20:18:37',1,1),(13,'asdasdasd',NULL,'text','2022-01-08 20:18:38',1,1),(14,'asdasdasd',NULL,'text','2022-01-08 20:18:40',1,1),(15,'asdasdasd',NULL,'text','2022-01-08 20:18:41',1,1),(16,'asdasdasd',NULL,'text','2022-01-08 20:18:42',1,1),(17,'asdasdasd',NULL,'text','2022-01-08 20:18:43',1,1),(18,'lalala',NULL,'text','2022-01-08 20:28:58',1,1),(19,'jajaja',NULL,'text','2022-01-08 20:31:38',1,1),(20,'jakd xkdb',NULL,'text','2022-01-08 20:31:44',1,1),(21,'asdasdasd',NULL,'text','2022-01-08 20:34:53',1,1),(22,'wawawa',NULL,'text','2022-01-08 20:35:19',1,1),(23,'dwdawdwawd',NULL,'text','2022-01-08 20:36:01',1,1),(24,'ienxkfnsb',NULL,'text','2022-01-08 20:36:02',1,1),(25,'asdasdasd',NULL,'text','2022-01-08 20:38:42',1,1),(26,'asdas',NULL,'text','2022-01-08 20:43:38',1,1),(27,'asdasd',NULL,'text','2022-01-08 21:24:54',2,1),(28,'asdasdas',NULL,'text','2022-01-08 21:29:33',1,1),(29,'ksbfnzjd',NULL,'text','2022-01-08 21:56:08',1,1),(30,'nsjfbdlwnd',NULL,'text','2022-01-08 21:56:10',1,1),(31,'ksbfnfkwnd',NULL,'text','2022-01-08 21:56:13',1,1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `buyOrder` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `providers_provider_id` int NOT NULL,
  `services_service_id` int NOT NULL,
  `clients_client_id` int NOT NULL,
  `scheduled_services_scheduled_services_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`,`providers_provider_id`,`services_service_id`),
  UNIQUE KEY `payment_id_UNIQUE` (`payment_id`),
  UNIQUE KEY `scheduled_services_scheduled_services_id_UNIQUE` (`scheduled_services_scheduled_services_id`),
  KEY `fk_payments_providers1_idx` (`providers_provider_id`),
  KEY `fk_payments_services1_idx` (`services_service_id`),
  CONSTRAINT `fk_payments_providers1` FOREIGN KEY (`providers_provider_id`) REFERENCES `providers` (`provider_id`),
  CONSTRAINT `fk_payments_services1` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,12000,'en proceso','CLM20211213172235','2021-12-13 17:22:35','2021-12-13 17:22:35',4,10,1,5),(2,12000,'en proceso','ordenCompra12345678','2021-12-16 19:54:33','2021-12-16 19:54:33',4,10,1,6),(3,12000,'en proceso','ordenCompra12345678','2021-12-16 20:00:41','2021-12-16 20:00:41',4,10,1,7),(4,12000,'en proceso','ordenCompra12345678','2021-12-16 20:02:07','2021-12-16 20:02:07',4,10,1,8),(5,12000,'en proceso','CLM20211229173412','2021-12-29 17:34:13','2021-12-29 17:34:12',4,10,1,9),(6,15000,'en proceso','CLM20211229174316','2021-12-29 17:43:16','2021-12-29 17:43:16',28,13,1,10),(7,15000,'cancelado','CLM20211229174728','2021-12-29 17:47:29','2021-12-29 17:47:29',28,13,10,11),(8,20000,'en proceso','CLM20211229182845','2021-12-29 18:28:46','2021-12-29 18:28:45',29,14,2,12),(9,12000,'en proceso','CLM20220101143058','2022-01-01 14:30:59','2022-01-01 14:30:58',4,10,1,13),(10,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:56','2022-01-04 17:19:56',4,10,1,14),(11,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:56','2022-01-04 17:19:56',4,10,1,15),(12,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:56','2022-01-04 17:19:56',4,10,1,16),(13,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:56','2022-01-04 17:19:56',4,10,1,18),(14,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:56','2022-01-04 17:19:56',4,10,1,17),(15,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:57','2022-01-04 17:19:57',4,10,1,19),(16,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:57','2022-01-04 17:19:57',4,10,1,20),(17,12000,'en proceso','CLTBK20220104191932','2022-01-04 17:19:57','2022-01-04 17:19:57',4,10,1,21),(18,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:14','2022-01-04 17:21:14',4,10,1,22),(19,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:15','2022-01-04 17:21:14',4,10,1,23),(20,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:15','2022-01-04 17:21:15',4,10,1,24),(21,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:15','2022-01-04 17:21:15',4,10,1,25),(22,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:15','2022-01-04 17:21:15',4,10,1,26),(23,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:15','2022-01-04 17:21:15',4,10,1,27),(24,12000,'en proceso','CLTBK20220104192053','2022-01-04 17:21:15','2022-01-04 17:21:15',4,10,1,28),(25,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:23','2022-01-04 17:39:23',4,10,1,29),(26,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:23','2022-01-04 17:39:23',4,10,1,30),(27,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:23','2022-01-04 17:39:23',4,10,1,31),(28,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:24','2022-01-04 17:39:24',4,10,1,32),(29,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:25','2022-01-04 17:39:24',4,10,1,33),(30,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:25','2022-01-04 17:39:24',4,10,1,34),(31,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:25','2022-01-04 17:39:25',4,10,1,35),(32,12000,'en proceso','CLTBK20220104193855','2022-01-04 17:39:25','2022-01-04 17:39:25',4,10,1,36),(33,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:30','2022-01-04 17:55:30',4,10,1,37),(34,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:30','2022-01-04 17:55:30',4,10,1,38),(35,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:30','2022-01-04 17:55:30',4,10,1,39),(36,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:30','2022-01-04 17:55:30',4,10,1,40),(37,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:30','2022-01-04 17:55:30',4,10,1,41),(38,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:31','2022-01-04 17:55:30',4,10,1,42),(39,12000,'en proceso','CLTBK20220104225404','2022-01-04 17:55:32','2022-01-04 17:55:32',4,10,1,43),(40,12000,'en proceso','CLTBK20220104225818','2022-01-04 17:58:52','2022-01-04 17:58:51',4,10,1,44),(41,12000,'en proceso','CLTBK20220104225818','2022-01-04 17:58:52','2022-01-04 17:58:52',4,10,1,45),(42,12000,'en proceso','CLTBK20220104225818','2022-01-04 17:58:52','2022-01-04 17:58:52',4,10,1,46),(43,12000,'en proceso','CLTBK20220104225818','2022-01-04 17:58:52','2022-01-04 17:58:52',4,10,1,47),(44,12000,'en proceso','CLTBK20220104225818','2022-01-04 17:58:54','2022-01-04 17:58:54',4,10,1,48),(45,12000,'en proceso','CLTBK20220104225956','2022-01-04 18:00:18','2022-01-04 18:00:17',4,10,1,49),(46,12000,'en proceso','CLTBK20220104225956','2022-01-04 18:00:18','2022-01-04 18:00:17',4,10,1,50),(47,12000,'en proceso','CLTBK20220104225956','2022-01-04 18:00:18','2022-01-04 18:00:17',4,10,1,51),(48,12000,'en proceso','CLTBK20220104225956','2022-01-04 18:00:18','2022-01-04 18:00:17',4,10,1,53),(49,12000,'en proceso','CLTBK20220104225956','2022-01-04 18:00:18','2022-01-04 18:00:17',4,10,1,52),(50,12000,'en proceso','CLTBK20220104225956','2022-01-04 18:00:20','2022-01-04 18:00:20',4,10,1,54),(51,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:39','2022-01-04 18:03:38',4,10,1,55),(52,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:39','2022-01-04 18:03:39',4,10,1,56),(53,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:39','2022-01-04 18:03:39',4,10,1,57),(54,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:39','2022-01-04 18:03:39',4,10,1,58),(55,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:39','2022-01-04 18:03:39',4,10,1,59),(56,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:41','2022-01-04 18:03:41',4,10,1,60),(57,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:42','2022-01-04 18:03:41',4,10,1,61),(58,12000,'en proceso','CLTBK20220104230213','2022-01-04 18:03:42','2022-01-04 18:03:42',4,10,1,62),(59,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:30','2022-01-04 18:11:30',4,10,1,63),(60,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:32','2022-01-04 18:11:31',4,10,1,64),(61,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:34','2022-01-04 18:11:34',4,10,1,65),(62,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:34','2022-01-04 18:11:34',4,10,1,66),(63,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:34','2022-01-04 18:11:34',4,10,1,67),(64,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:34','2022-01-04 18:11:34',4,10,1,68),(65,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:34','2022-01-04 18:11:34',4,10,1,69),(66,12000,'en proceso','CLTBK20220104231034','2022-01-04 18:11:34','2022-01-04 18:11:34',4,10,1,70),(67,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:30','2022-01-04 18:15:30',4,10,1,71),(68,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:30','2022-01-04 18:15:30',4,10,1,72),(69,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:32','2022-01-04 18:15:31',4,10,1,73),(70,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:32','2022-01-04 18:15:32',4,10,1,74),(71,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:33','2022-01-04 18:15:32',4,10,1,75),(72,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:33','2022-01-04 18:15:33',4,10,1,76),(73,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:33','2022-01-04 18:15:33',4,10,1,77),(74,12000,'en proceso','CLTBK20220104231459','2022-01-04 18:15:34','2022-01-04 18:15:33',4,10,1,78),(75,12000,'en proceso','CLTBK20220104202423','2022-01-04 18:27:53','2022-01-04 18:27:52',4,10,1,80),(76,20000,'en proceso','CLTBK20220108112859','2022-01-08 09:30:09','2022-01-08 09:30:08',6,14,10,81),(77,12000,'en proceso','CLM20220108163314','2022-01-08 16:33:14','2022-01-08 16:33:14',4,10,1,82),(78,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:03','2022-01-08 16:43:02',4,10,1,83),(79,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:03','2022-01-08 16:43:02',4,10,1,84),(80,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:03','2022-01-08 16:43:03',4,10,1,85),(81,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:03','2022-01-08 16:43:03',4,10,1,86),(82,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:03','2022-01-08 16:43:03',4,10,1,87),(83,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:04','2022-01-08 16:43:03',4,10,1,88),(84,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:04','2022-01-08 16:43:03',4,10,1,89),(85,12000,'en proceso','CLTBK20220108184241','2022-01-08 16:43:04','2022-01-08 16:43:03',4,10,1,90),(86,12000,'en proceso','CLTBK20220219182025','2022-02-19 18:21:28','2022-02-19 18:21:28',4,10,19,91),(87,12000,'en proceso','CLTBK20220219184240','2022-02-19 18:43:34','2022-02-19 18:43:33',4,10,19,92),(88,12000,'en proceso','CLTBK20220222144348','2022-02-22 14:45:07','2022-02-22 14:45:07',4,10,19,93);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_has_services`
--

DROP TABLE IF EXISTS `provider_has_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_has_services` (
  `provider_has_services_id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `workable` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `start` time NOT NULL,
  `end` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `providers_provider_id` int NOT NULL,
  `providers_users_user_id` int NOT NULL,
  `services_service_id` int NOT NULL,
  `services_categories_category_id` int NOT NULL,
  PRIMARY KEY (`provider_has_services_id`,`providers_provider_id`,`providers_users_user_id`,`services_service_id`,`services_categories_category_id`),
  UNIQUE KEY `provider_hast_services2_id_UNIQUE` (`provider_has_services_id`),
  KEY `fk_provider_hast_services2_providers1_idx` (`providers_provider_id`,`providers_users_user_id`),
  KEY `fk_provider_hast_services2_services1_idx` (`services_service_id`,`services_categories_category_id`),
  CONSTRAINT `fk_provider_hast_services2_providers1` FOREIGN KEY (`providers_provider_id`, `providers_users_user_id`) REFERENCES `providers` (`provider_id`, `users_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_provider_hast_services2_services1` FOREIGN KEY (`services_service_id`, `services_categories_category_id`) REFERENCES `services` (`service_id`, `categories_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_has_services`
--

LOCK TABLES `provider_has_services` WRITE;
/*!40000 ALTER TABLE `provider_has_services` DISABLE KEYS */;
INSERT INTO `provider_has_services` VALUES (1,'Unisex','lmxjvsd','active','10:30:00','19:00:00','2021-12-09 17:10:36','2021-12-09 17:10:36',3,5,1,1),(3,'Mujer','lmx','active','11:00:00','18:00:00','2021-12-09 17:13:45','2021-12-09 17:13:44',3,5,10,2),(7,'Unisex','lmxjvsd','active','00:00:00','23:00:00','2021-12-10 15:13:29','2022-01-14 18:40:36',4,6,10,2),(8,'Unisex','l','active','00:00:00','23:45:00','2021-12-13 16:28:40','2021-12-13 16:28:39',5,25,10,2),(9,'Unisex','lmxjvsd','active','00:00:00','23:45:00','2021-12-15 16:48:18','2021-12-15 18:01:42',7,51,1,1),(10,'Unisex','lmxjvsd','active','09:00:00','19:00:00','2021-12-29 17:19:08','2021-12-29 17:19:08',28,99,13,3),(11,'Unisex','lmxjvsd','active','09:00:00','21:00:00','2021-12-29 17:20:06','2021-12-29 17:35:16',9,88,13,3),(12,'Unisex','lmxjvsd','active','07:00:00','22:00:00','2021-12-29 18:09:11','2021-12-29 18:09:11',29,7,13,3),(13,'Unisex','lmxjv','active','09:00:00','13:00:00','2021-12-29 18:22:18','2022-01-08 09:17:50',6,26,14,3),(14,'Unisex','lmxjv','active','09:00:00','13:00:00','2021-12-29 18:22:19','2021-12-29 18:22:19',6,26,14,3),(15,'Hombre','lmxjvsd','active','10:00:00','20:00:00','2021-12-29 18:22:59','2021-12-29 18:26:24',28,99,10,2),(16,'Unisex','lmxjvsd','active','07:00:00','22:00:00','2021-12-29 18:24:42','2021-12-29 18:24:42',29,7,14,3),(17,'Unisex','lmxjvsd','active','09:00:00','20:00:00','2021-12-29 18:25:58','2022-01-08 09:16:42',6,26,1,1);
/*!40000 ALTER TABLE `provider_has_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `users_user_id` int NOT NULL,
  `state` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`provider_id`,`users_user_id`),
  UNIQUE KEY `provider_id_UNIQUE` (`provider_id`),
  UNIQUE KEY `users_user_id_UNIQUE` (`users_user_id`),
  KEY `fk_providers_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_providers_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,1,NULL,'2021-11-28 21:22:45'),(2,3,NULL,'2021-11-30 14:46:30'),(3,5,NULL,'2021-12-01 08:20:07'),(4,6,NULL,'2021-12-02 18:45:36'),(5,25,NULL,'2021-12-13 16:28:05'),(6,26,NULL,'2021-12-15 16:17:04'),(7,51,NULL,'2021-12-15 16:46:44'),(8,86,NULL,'2021-12-23 16:32:00'),(9,88,NULL,'2021-12-23 16:51:27'),(10,93,NULL,'2021-12-23 17:00:51'),(13,8,NULL,'2021-12-23 18:06:07'),(28,99,NULL,'2021-12-29 17:17:14'),(29,7,NULL,'2021-12-29 18:02:25'),(30,2,NULL,'2021-12-29 18:17:03'),(31,102,NULL,'2022-01-08 15:51:36'),(32,103,NULL,'2022-01-11 12:10:28');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers_permitted_services`
--

DROP TABLE IF EXISTS `providers_permitted_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers_permitted_services` (
  `services_service_id` int NOT NULL,
  `services_categories_category_id` int NOT NULL,
  `providers_provider_id` int NOT NULL,
  `providers_users_user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`services_service_id`,`services_categories_category_id`,`providers_provider_id`,`providers_users_user_id`),
  KEY `fk_services_has_providers_providers1_idx` (`providers_provider_id`,`providers_users_user_id`),
  KEY `fk_services_has_providers_services1_idx` (`services_service_id`,`services_categories_category_id`),
  CONSTRAINT `fk_services_has_providers_providers1` FOREIGN KEY (`providers_provider_id`, `providers_users_user_id`) REFERENCES `providers` (`provider_id`, `users_user_id`),
  CONSTRAINT `fk_services_has_providers_services1` FOREIGN KEY (`services_service_id`, `services_categories_category_id`) REFERENCES `services` (`service_id`, `categories_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers_permitted_services`
--

LOCK TABLES `providers_permitted_services` WRITE;
/*!40000 ALTER TABLE `providers_permitted_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers_permitted_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `icon` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `icon_type` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `users_user_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `record_id_UNIQUE` (`record_id`),
  KEY `fk_records_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_records_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requested_services`
--

DROP TABLE IF EXISTS `requested_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requested_services` (
  `requested_service_id` int NOT NULL AUTO_INCREMENT,
  `clients_client_id` int NOT NULL,
  `clients_users_user_id` int NOT NULL,
  `services_service_id` int NOT NULL,
  `services_categories_category_id` int NOT NULL,
  `start` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `end` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `date` datetime NOT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`requested_service_id`,`clients_client_id`,`clients_users_user_id`,`services_service_id`,`services_categories_category_id`),
  UNIQUE KEY `requested_service_id_UNIQUE` (`requested_service_id`),
  KEY `fk_requested_services_clients1_idx` (`clients_client_id`,`clients_users_user_id`),
  KEY `fk_requested_services_services1_idx` (`services_service_id`,`services_categories_category_id`),
  CONSTRAINT `fk_requested_services_clients1` FOREIGN KEY (`clients_client_id`, `clients_users_user_id`) REFERENCES `clients` (`client_id`, `users_user_id`),
  CONSTRAINT `fk_requested_services_services1` FOREIGN KEY (`services_service_id`, `services_categories_category_id`) REFERENCES `services` (`service_id`, `categories_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requested_services`
--

LOCK TABLES `requested_services` WRITE;
/*!40000 ALTER TABLE `requested_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `requested_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_services`
--

DROP TABLE IF EXISTS `scheduled_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_services` (
  `scheduled_services_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `start` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `clients_client_id` int NOT NULL,
  `clients_users_user_id` int NOT NULL,
  `addresses_address_id` int NOT NULL,
  `addresses_users_user_id` int NOT NULL,
  `provider_has_services_provider_has_services_id` int NOT NULL,
  `rank` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`scheduled_services_id`,`clients_client_id`,`clients_users_user_id`,`addresses_address_id`,`addresses_users_user_id`,`provider_has_services_provider_has_services_id`),
  UNIQUE KEY `scheduled_services_id_UNIQUE` (`scheduled_services_id`),
  KEY `fk_scheduled_services_clients1_idx` (`clients_client_id`,`clients_users_user_id`),
  KEY `fk_scheduled_services_addresses1_idx` (`addresses_address_id`,`addresses_users_user_id`),
  KEY `fk_scheduled_services_provider_has_services1_idx` (`provider_has_services_provider_has_services_id`),
  CONSTRAINT `fk_scheduled_services_addresses1` FOREIGN KEY (`addresses_address_id`, `addresses_users_user_id`) REFERENCES `addresses` (`address_id`, `users_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_scheduled_services_clients1` FOREIGN KEY (`clients_client_id`, `clients_users_user_id`) REFERENCES `clients` (`client_id`, `users_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_scheduled_services_provider_has_services1` FOREIGN KEY (`provider_has_services_provider_has_services_id`) REFERENCES `provider_has_services` (`provider_has_services_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_services`
--

LOCK TABLES `scheduled_services` WRITE;
/*!40000 ALTER TABLE `scheduled_services` DISABLE KEYS */;
INSERT INTO `scheduled_services` VALUES (1,'2021-12-10 00:00:00','15:15','agendado','2021-12-09 17:15:35',1,1,3,1,1,NULL,12000),(2,'2021-12-10 00:00:00','17:15','agendado','2021-12-09 17:17:17',8,17,4,17,1,NULL,12000),(3,'2021-12-11 00:00:00','18:00','agendado','2021-12-09 17:18:00',2,2,2,2,1,NULL,12000),(4,'2021-12-14 00:00:00','19:00','agendado','2021-12-13 17:21:08',1,1,5,1,7,NULL,12000),(5,'2021-12-14 00:00:00','21:30','agendado','2021-12-13 17:22:35',1,1,5,1,7,NULL,12000),(6,'2021-12-17 00:00:00','21:00','agendado','2021-12-16 19:54:33',1,1,5,1,7,NULL,12000),(7,'2021-12-17 00:00:00','20:00','agendado','2021-12-16 20:00:41',1,1,5,1,7,NULL,12000),(8,'2021-12-17 00:00:00','22:00','agendado','2021-12-16 20:02:07',1,1,5,1,7,NULL,12000),(9,'2021-12-31 00:00:00','09:00','agendado','2021-12-29 17:34:13',1,1,5,1,7,NULL,12000),(10,'2021-12-30 00:00:00','15:00','agendado','2021-12-29 17:43:16',1,1,3,1,10,NULL,15000),(11,'2021-12-30 00:00:00','16:00','cancelado','2021-12-29 17:47:29',10,23,6,23,10,NULL,15000),(12,'2021-12-30 00:00:00','17:00','agendado','2021-12-29 18:28:46',2,2,2,2,16,NULL,20000),(13,'2022-01-01 00:00:00','18:30','agendado','2022-01-01 14:30:59',1,1,5,1,7,NULL,12000),(14,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:56',1,1,5,1,7,NULL,12000),(15,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:56',1,1,5,1,7,NULL,12000),(16,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:56',1,1,5,1,7,NULL,12000),(17,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:56',1,1,5,1,7,NULL,12000),(18,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:56',1,1,5,1,7,NULL,12000),(19,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:57',1,1,5,1,7,NULL,12000),(20,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:57',1,1,5,1,7,NULL,12000),(21,'2022-01-04 00:00:00','21:30','agendado','2022-01-04 17:19:57',1,1,5,1,7,NULL,12000),(22,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:14',1,1,5,1,7,NULL,12000),(23,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:15',1,1,5,1,7,NULL,12000),(24,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:15',1,1,5,1,7,NULL,12000),(25,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:15',1,1,5,1,7,NULL,12000),(26,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:15',1,1,5,1,7,NULL,12000),(27,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:15',1,1,5,1,7,NULL,12000),(28,'2022-02-28 00:00:00','19:00','agendado','2022-01-04 17:21:15',1,1,5,1,7,NULL,12000),(29,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:23',1,1,5,1,7,NULL,12000),(30,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:23',1,1,5,1,7,NULL,12000),(31,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:23',1,1,5,1,7,NULL,12000),(32,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:24',1,1,5,1,7,NULL,12000),(33,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:25',1,1,5,1,7,NULL,12000),(34,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:25',1,1,5,1,7,NULL,12000),(35,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:25',1,1,5,1,7,NULL,12000),(36,'2022-01-04 00:00:00','21:45','agendado','2022-01-04 17:39:25',1,1,5,1,7,NULL,12000),(37,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:30',1,1,5,1,7,NULL,12000),(38,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:30',1,1,5,1,7,NULL,12000),(39,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:30',1,1,5,1,7,NULL,12000),(40,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:30',1,1,5,1,7,NULL,12000),(41,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:30',1,1,5,1,7,NULL,12000),(42,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:31',1,1,5,1,7,NULL,12000),(43,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:55:32',1,1,5,1,7,NULL,12000),(44,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:58:52',1,1,5,1,7,NULL,12000),(45,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:58:52',1,1,5,1,7,NULL,12000),(46,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:58:52',1,1,5,1,7,NULL,12000),(47,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:58:52',1,1,5,1,7,NULL,12000),(48,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 17:58:54',1,1,5,1,7,NULL,12000),(49,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 18:00:18',1,1,5,1,7,NULL,12000),(50,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 18:00:18',1,1,5,1,7,NULL,12000),(51,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 18:00:18',1,1,5,1,7,NULL,12000),(52,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 18:00:18',1,1,5,1,7,NULL,12000),(53,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 18:00:18',1,1,5,1,7,NULL,12000),(54,'2022-01-04 00:00:00','22:00','agendado','2022-01-04 18:00:20',1,1,5,1,7,NULL,12000),(55,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:39',1,1,5,1,7,NULL,12000),(56,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:39',1,1,5,1,7,NULL,12000),(57,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:39',1,1,5,1,7,NULL,12000),(58,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:39',1,1,5,1,7,NULL,12000),(59,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:39',1,1,5,1,7,NULL,12000),(60,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:41',1,1,5,1,7,NULL,12000),(61,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:42',1,1,5,1,7,NULL,12000),(62,'2022-01-04 00:00:00','17:00','agendado','2022-01-04 18:03:42',1,1,5,1,7,NULL,12000),(63,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:30',1,1,5,1,7,NULL,12000),(64,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:32',1,1,5,1,7,NULL,12000),(65,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:34',1,1,5,1,7,NULL,12000),(66,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:34',1,1,5,1,7,NULL,12000),(67,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:34',1,1,5,1,7,NULL,12000),(68,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:34',1,1,5,1,7,NULL,12000),(69,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:34',1,1,5,1,7,NULL,12000),(70,'2022-01-05 00:00:00','17:00','agendado','2022-01-04 18:11:34',1,1,5,1,7,NULL,12000),(71,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:30',1,1,5,1,7,NULL,12000),(72,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:30',1,1,5,1,7,NULL,12000),(73,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:32',1,1,5,1,7,NULL,12000),(74,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:32',1,1,5,1,7,NULL,12000),(75,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:33',1,1,5,1,7,NULL,12000),(76,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:33',1,1,5,1,7,NULL,12000),(77,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:33',1,1,5,1,7,NULL,12000),(78,'2022-01-04 00:00:00','19:00','agendado','2022-01-04 18:15:34',1,1,5,1,7,NULL,12000),(79,'2022-01-04 00:00:00','21:00','service canceled by timeout','2022-01-04 18:20:24',1,1,3,1,7,NULL,12000),(80,'2022-01-04 00:00:00','22:30','agendado','2022-01-04 18:27:53',1,1,5,1,7,NULL,12000),(81,'2022-01-11 00:00:00','10:00','agendado','2022-01-08 09:30:09',10,23,8,23,13,NULL,20000),(82,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:33:14',1,1,5,1,7,NULL,12000),(83,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:03',1,1,5,1,7,NULL,12000),(84,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:03',1,1,5,1,7,NULL,12000),(85,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:03',1,1,5,1,7,NULL,12000),(86,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:03',1,1,5,1,7,NULL,12000),(87,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:03',1,1,5,1,7,NULL,12000),(88,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:04',1,1,5,1,7,NULL,12000),(89,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:04',1,1,5,1,7,NULL,12000),(90,'2022-01-08 00:00:00','20:45','agendado','2022-01-08 16:43:04',1,1,5,1,7,NULL,12000),(91,'2022-02-20 00:00:00','18:00','agendado','2022-02-19 18:21:28',19,104,9,104,7,NULL,12000),(92,'2022-02-21 00:00:00','13:00','agendado','2022-02-19 18:43:34',19,104,9,104,7,NULL,12000),(93,'2022-02-23 00:00:00','17:00','agendado','2022-02-22 14:45:07',19,104,9,104,7,NULL,12000);
/*!40000 ALTER TABLE `scheduled_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `price` int NOT NULL,
  `isBasic` int NOT NULL DEFAULT '0',
  `img_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `categories_category_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'activo',
  `commission` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`,`categories_category_id`),
  UNIQUE KEY `service_id_UNIQUE` (`service_id`),
  KEY `fk_services_categories1_idx` (`categories_category_id`),
  CONSTRAINT `fk_services_categories1` FOREIGN KEY (`categories_category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Inyecciones','Una persona capacitada va a domicilio a colocar una inyección',12000,1,'api/public/images/services/Inyecciones.jpg',1,'2021-11-29 14:25:58','2021-11-29 14:25:58','activo',0),(10,'Peluquería','Servicio de corte de pelo a domicilio',12000,1,'api/public/images/services/Peluquería.jpg',2,'2021-11-29 14:43:00','2021-11-29 14:42:59','activo',0),(11,'Podología','Servicio de podología clínica para el cuidado de los pies',18000,1,'api/public/images/services/Podología.png',1,'2021-11-30 08:59:03','2021-11-30 08:59:02','activo',0),(12,'Cuidados express','Cuidador a domicilio por un tiempo de 4 horas',25000,1,'api/public/images/services/Cuidados_express.jpg',1,'2021-11-30 09:00:27','2021-11-30 09:00:26','activo',0),(13,'Paseo','Acompañamiento durante un paseo, duración 1 hora',15000,1,'api/public/images/services/Paseo.jpg',3,'2021-11-30 09:04:03','2021-11-30 09:04:02','activo',0),(14,'Acompañamiento hora médica','Servicio de acompañamiento al médico, para tomar nota y asistir al adulto mayor',20000,1,'api/public/images/services/Acompañamiento_hora_médica.jpg',3,'2021-11-30 09:05:12','2021-11-30 09:05:11','activo',0);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_categories`
--

DROP TABLE IF EXISTS `super_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `super_categories` (
  `super_category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`super_category_id`),
  UNIQUE KEY `super_category_id_UNIQUE` (`super_category_id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_categories`
--

LOCK TABLES `super_categories` WRITE;
/*!40000 ALTER TABLE `super_categories` DISABLE KEYS */;
INSERT INTO `super_categories` VALUES (1,'Servicios a domicilio','Servicios realizados en el domicilio del cliente','2021-11-29 14:19:48','2021-11-29 14:19:48'),(2,'Servicios de Acompañamiento','Servicios en los que un Oppa te acompaña a realizar una actividad','2021-11-29 14:20:16','2021-11-29 14:20:16');
/*!40000 ALTER TABLE `super_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `gender` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `rut` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `birthdate` datetime NOT NULL,
  `token` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `img_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email_verified` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `rut_UNIQUE` (`rut`),
  UNIQUE KEY `token_UNIQUE` (`token`(255)),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Javier','Muñoz','$2a$10$XtE8Qj826PSO8MrpE0QtHe3cPMTE7I.VZqWenk.msD6yJtMMR1sNu','hombre','18.463.690-5','x_jemd_x@hotmail.com','+56848811606','1993-08-17 23:18:28','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJKYXZpZXIiLCJlbWFpbCI6InhfamVtZF94QGhvdG1haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzODE1MjU2NX0.byJxAN-kc0WFdD7n61ZwlHVDaLHChqqIkv55LlpUGdE',NULL,'active','none','2021-11-28 21:22:45','2021-11-28 21:22:45','edti2b7uccj'),(2,'María José ','Berríos Arancibia ','$2a$10$Z4GjPgKmcwAHsESkjSAdieXOsPr5mAnzNj4gDuC6HVYPu1A7ZtwpK','mujer','15.367.241-5','cotebe@hotmail.com','+56994190534','1982-12-10 14:14:55','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJNYXLDrWEgSm9zw6kgIiwiZW1haWwiOiJjb3RlYmVAaG90bWFpbC5jb20iLCJ0b2tlblR5cGUiOiJzZXNzaW9uIiwiaWF0IjoxNjM4MjEzNDQ4fQ.Nn_iOloHsuhdEnYwjy9Jy8CQaibs3yYHRfvZgtp5RDQ',NULL,'active','none','2021-11-29 14:17:28','2021-11-29 14:17:28',NULL),(3,'fernanda','Arostica ','$2a$10$7FP07g7H9usjTLNVQyVipe8j.pz4j03wRG3A6qYOQr3X/gL6wNLK.','mujer','19.348.494-8','Farosticaolivares@gmail.com','+56977062176','1996-06-16 16:45:30','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJmZXJuYW5kYSIsImVtYWlsIjoiRmFyb3N0aWNhb2xpdmFyZXNAZ21haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzODMwMTU5MH0.wGgSlHzi5uV8q1848YtWQRD9L02V94u8i1PJ7ecy0eo',NULL,'active','none','2021-11-30 14:46:31','2021-11-30 14:46:30',NULL),(4,'mariana','scheihing ','$2a$10$8S647ULoAK0WnNT5fhRZQe5Gl8e6K7js66DKMA7K66EZ.aPu06/Xu','mujer','1893189318','marianascheihing5@gmail.com','90894435','1994-07-19 10:10:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJtYXJpYW5hIiwiZW1haWwiOiJtYXJpYW5hc2NoZWloaW5nNUBnbWFpbC5jb20iLCJ0b2tlblR5cGUiOiJzZXNzaW9uIiwiaWF0IjoxNjM4MzY0MzI2fQ.k8V5TMR-tuNKHF6-0BZLrsdBfh0eoTKaw_grvy8DSW8',NULL,'active','none','2021-12-01 08:12:07','2021-12-01 08:12:06',NULL),(5,'alejandra','ramos','$2a$10$WbtHA7yLOT4DNzwGP64cA.99pHobOo2RUkP2QWnVOUEu3jWjiESYG','mujer','17.931.813-7','mariana.naka@gmail.com','76081364','1990-12-01 08:17:35','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJhbGVqYW5kcmEiLCJlbWFpbCI6Im1hcmlhbmEubmFrYUBnbWFpbC5jb20iLCJ0b2tlblR5cGUiOiJzZXNzaW9uIiwiaWF0IjoxNjM4MzY0ODA3fQ.fdNw8vjo_L7ZPKfIpAkhO-FFCdIIu69A0ernKnNgZJM',NULL,'active','none','2021-12-01 08:20:07','2021-12-01 08:20:07',NULL),(6,'Test','Provider','$2a$10$caAkVR1lFn4cPofpzeqCD.T4e/TDv/YI/HFF/dwO7bbWJ3GLbY1Eq','mujer','2.736.462-8','t.provider@example.com','+567483722839','1951-12-02 19:45:12','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJUZXN0IiwiZW1haWwiOiJ0LnByb3ZpZGVyQGV4YW1wbGUuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzODQ4ODczNn0.FOsm1h6TblO4BSt87WXB4jTY0G8XI-Rj2pylTKKznS8',NULL,'active','none','2021-12-02 18:45:36','2021-12-02 18:45:36',NULL),(7,'Christian','higuera','$2a$10$K0LcL5Ifo9i9k2USupYxp.Jna78nOidSfP22SZrNOOFTaftNuF8Dy','hombre','13.376.989-7','ch.higuera@gmail.com','+56979993765','1977-12-04 19:00:00','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJDaHJpc3RpYW4iLCJlbWFpbCI6ImNoLmhpZ3VlcmFAZ21haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzODk4MDY4Mn0.VyjNtq7cNwnfcVGAFtqurXTI0bMrqrpkWC_aI4IbLXY',NULL,'active','none','2021-12-08 11:24:43','2021-12-08 11:27:51',NULL),(8,'Ronald','Suci','$2a$10$wfjKG230/fV32jq5XDaIbeUabgENopTIx2Aj/mgmcIfNckoX2u.kC','hombre','14.151.474-1','fatorron@hotmail.com','+56996172742','1981-05-18 13:25:21','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJSb25hbGQiLCJlbWFpbCI6ImZhdG9ycm9uQGhvdG1haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzODk4MDkxNn0.tEmT9WW5GgzW8TdCuNuNftOSOPYQvrHx-e7yagjHo50',NULL,'active','none','2021-12-08 11:28:37','2021-12-08 11:28:36',NULL),(17,'Ivan','Berríos ','$2a$10$rsHuOK4/U8l79/XhlEFR1u95h9ZV35KYcY16XoXMLHzRufOlVkfxa','hombre','5.834.342-0',NULL,'+56994190534','1949-01-11 12:33:01','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJJdmFuIiwiZW1haWwiOm51bGwsInRva2VuVHlwZSI6InNlc3Npb24iLCJpYXQiOjE2Mzg5ODEyNjJ9.k0UG1uwpvUde8EXItzIvlGSyWWm3USxv_fKOX2RDm2E',NULL,'active','none','2021-12-08 11:34:23','2021-12-08 11:34:22',NULL),(22,'Carlos ','Moreira','$2a$10$luyvyJYbzA1/jgOvmx3F2u.6LXN2Rtrs75AcfFlILeBtcjZq/pgsG','hombre','1.244.141-5','c.moreira@example.com','+56349764586','1946-12-09 08:21:38','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJDYXJsb3MgIiwiZW1haWwiOiJjLm1vcmVpcmFAZXhhbXBsZS5jb20iLCJ0b2tlblR5cGUiOiJzZXNzaW9uIiwiaWF0IjoxNjM5MDUyNTg1fQ.jwEOb2TRx-bZeIz4Om-_q8JDMEW9q6tagwqWopR0NYc',NULL,'active','none','2021-12-09 07:23:06','2021-12-09 07:23:05',NULL),(23,'Rosa ','Arancibia','$2a$10$laqgJWsUwpVJ1Vfo/b.eU.Cv0eiMjbqoNsikgqH1IAT.JIkxMPhPK','mujer','5.659.409-4',NULL,'+56994190534','1950-12-12 18:09:14','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJSb3NhICIsImVtYWlsIjpudWxsLCJ0b2tlblR5cGUiOiJzZXNzaW9uIiwiaWF0IjoxNjM5MDg3ODE5fQ.LqPs_8oMjmvFtHqaqO6qCqjgjn7hw0lmCt3fBig2xRA',NULL,'active','none','2021-12-09 17:10:19','2021-12-09 17:10:19',NULL),(24,'han','solo','$2a$10$V4r8PEALp72lt2WHhz0.WenbQWghlwDhZn3xdUCoFmtbPR02yS7Gq','hombre','7.777.777-7',NULL,'979993765','1960-12-09 18:18:22','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJoYW4iLCJlbWFpbCI6bnVsbCwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzOTA4ODM4NX0.xi9Piy9gUNP_cb6o7ncGuxuryUhWTn-ZVS_cmFrgKBI',NULL,'active','none','2021-12-09 17:19:46','2021-12-09 17:19:45',NULL),(25,'Test 2','Provider','$2a$10$K0LcL5Ifo9i9k2USupYxp.Jna78nOidSfP22SZrNOOFTaftNuF8Dy','hombre','2.222.222-2','t.provider2@example.com','+56853677264','1951-12-13 17:16:39','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJUZXN0IDIiLCJlbWFpbCI6InQucHJvdmlkZXIyQGV4YW1wbGUuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzOTQzMDg4NX0.cESY8z8vv-FTJ5M8f32GVo7LZoLT8NQDLfrPP6OZ0xg',NULL,'active','none','2021-12-13 16:28:06','2021-12-13 16:28:05',NULL),(26,'alex','blaauboer','$2a$10$7qRUnPvIjiWnh60AKyD4.u/HhEhxdVN3mIGRLVE7iq5fYMMP4SeWO','hombre','12.449.430-3','alexblaauboer@gmail.com','+56977785212','1973-08-01 18:15:38','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJhbGV4IiwiZW1haWwiOiJhbGV4YmxhYXVib2VyQGdtYWlsLmNvbSIsInRva2VuVHlwZSI6InNlc3Npb24iLCJpYXQiOjE2Mzk2MDMwMjR9.vpUnHPEGC91RUyQLQ3NYLJnLuGuJK6EZmyeE9ClsmJw',NULL,'active','none','2021-12-15 16:17:04','2021-12-15 16:17:04',NULL),(45,'maria','perez','$2a$10$f.bhDjvODy8L09KmbvLcM.2MefAppynC0UxduMG7bBuumwx7sZj7S','mujer','16.931.813-6','marimara@sch.cl','90894435','1984-12-15 16:30:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJtYXJpYSIsImVtYWlsIjoibWFyaW1hcmFAc2NoLmNsIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzOTYwMzkzN30.0TWT-oDLJi9CeCAqJxZxyR2k-RgUxYxkCFEqpOQxLmU',NULL,'active','none','2021-12-15 16:32:18','2021-12-15 16:32:17',NULL),(51,'Test 3','Provider','$2a$10$NJy9w35ToKuIjjITcfvh4eUdP948oPPjVhH66rkEEuFQ3nAlSrc8a','hombre','3.333.333-3','t.provider3@example.com','+56976531265','1987-12-15 16:45:46','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJUZXN0IDMiLCJlbWFpbCI6InQucHJvdmlkZXIzQGV4YW1wbGUuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTYzOTYwNDgwNH0.bHg8uvQXQ5dnL-Tm-nJfxJqEUJEjyADtcM0m23J13jo',NULL,'active','none','2021-12-15 16:46:45','2021-12-15 16:46:44',NULL),(86,'Test','Provider 4','$2a$10$GxxEs8ye7IEswEd.SuO5ueEvKOkuKXI4yMF6hH4KY1NbxOF/3Bww2','hombre','1.836.482-7','t.provider4@example.com','+5634616568','1973-12-23 16:31:08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJUZXN0IiwiZW1haWwiOiJ0LnByb3ZpZGVyNEBleGFtcGxlLmNvbSIsInRva2VuVHlwZSI6InNlc3Npb24iLCJpYXQiOjE2NDAyOTUxMjB9.6b27tOVTw-Q7E9dqnAb60WWHnwdfahFT5LRBQaQaptc',NULL,'active','none','2021-12-23 16:32:00','2021-12-23 16:32:00',NULL),(87,'Test','Client','$2a$10$BS5KTq8SxQHiKNnx13.BFOMFsVO2dqQP239S6iRik9lbK5YQUg98u','hombre','9.999.999-9','t.client@example.com','+56946135649','1989-12-23 16:48:52','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJUZXN0IiwiZW1haWwiOiJ0LmNsaWVudEBleGFtcGxlLmNvbSIsInRva2VuVHlwZSI6InNlc3Npb24iLCJpYXQiOjE2NDAyOTYyNDV9.-MyZN0ZO-yoY9cExsm3j3WL8X9fHTmp3cSO5F2R21VE',NULL,'active','none','2021-12-23 16:50:46','2021-12-23 16:50:45',NULL),(88,'Rodrigo','Trigo','$2a$10$FOT1AGbbIvkRZvmhOqUb6e1uA9GS7qiowI9c/UaTClqo6BXoyA6Oe','hombre','7.771.750-1','rtrigov@gmail.com','+56998426200','1972-08-10 18:49:56','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJSb2RyaWdvIiwiZW1haWwiOiJydHJpZ292QGdtYWlsLmNvbSIsInRva2VuVHlwZSI6InNlc3Npb24iLCJpYXQiOjE2NDAyOTYyODd9.GiToaCQ9svj2q5tZSxdog357XIifDKy-_PDUttr9DcQ',NULL,'active','none','2021-12-23 16:51:28','2021-12-23 16:51:27',NULL),(93,'Pato','Lucas','$2a$10$jXVxpYC4wwurf1clpDekvuAYjSKjAPArlhg32imVbBQw9r53Wh44u','otro','20.677.760-5','patolucaa@gmail.com','+56994190534','1981-05-18 18:59:30','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJQYXRvIiwiZW1haWwiOiJwYXRvbHVjYWFAZ21haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTY0MDI5Njg1MX0.eoA1PaLT1q3mU8jy1zsDx2fz26YU8W4gd23ek-4ojVA',NULL,'active','none','2021-12-23 17:00:52','2021-12-23 17:00:51',NULL),(99,'sofia','perez ','$2a$10$YOqmxLraBm1n7zpUzjeW0uHU1JS.9qS0Q049JS7M0/oalIKHUX5kW','mujer','14.931.813-4','sofia@gmail.com','990894433','1980-11-28 17:14:29','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJzb2ZpYSIsImVtYWlsIjoic29maWFAZ21haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTY0MDgxNjIzNH0.KnnpZpJWS3rds9THXx0ZMmnQAUQBzFkhzRoztYLXNbQ',NULL,'active','none','2021-12-29 17:17:15','2021-12-29 17:17:14',NULL),(101,'marcia','Lopez ','$2a$10$iEHmAuCM9/DzJdk78dVeVO/JmQ1588h4EudCNtKqzTuPKWYHaU95m','mujer','7.398.854-2','marcia@gmail.com','76081355','1987-01-08 09:23:39','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJtYXJjaWEiLCJlbWFpbCI6Im1hcmNpYUBnbWFpbC5jb20iLCJ0b2tlblR5cGUiOiJzZXNzaW9uIiwiaWF0IjoxNjQxNjUxOTE1fQ.Pu2r-RN5WZbF7hqop3G6GXfu4QGG2IkUJzKSLcPOSJM',NULL,'active','none','2022-01-08 09:25:15','2022-01-08 09:25:15',NULL),(102,'Test 6','Provider','$2a$10$3FjTenOs6gRp9IIzYpwYwe6ZhdDRE7H4s0SI78XihirjFo7uAILVK','hombre','8.374.837-8','t.provider6@example.com','+56976431649','1984-01-08 15:30:33','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJUZXN0IDYiLCJlbWFpbCI6InQucHJvdmlkZXI2QGV4YW1wbGUuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTY0MTY3NTA5Nn0.LKtq_KBX9jiF_4FwcE6i1-573E9KKAajsu4CNRJg-1Y',NULL,'active','none','2022-01-08 15:51:37','2022-01-08 15:51:36',NULL),(103,'Pabla','Gutiérrez Q.','$2a$10$MYBu9nmJdd4QZnJbOedONuRbGOy0nr3xWP3zvJRZ88x9BNTaVyNKu','mujer','19.310.196-8','p.gu.qui@gmail.com','+56997879616','1996-07-27 12:03:51','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJQYWJsYSIsImVtYWlsIjoicC5ndS5xdWlAZ21haWwuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTY0MTkxMzUzNn0.Qmn2YK4-SmSAA2OpYYdLPJO15qc9abVWUFs_yv8ZEdM',NULL,'active','none','2022-01-11 12:05:37','2022-01-11 12:05:37',NULL),(104,'camilo','molina','$2a$10$5gVUWpiogSizwDUwN5bZXuAGYeRiTy2uCiAF9iqjnC5pSaUiVMpAa','hombre','20.040.946-9','cmolinag1@correo.uss.cl','+56987702960','1995-03-03 21:00:00','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJjYW1pbG8iLCJlbWFpbCI6ImNtb2xpbmFnMUBjb3JyZW8udXNzLmNsIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTY0NTIwOTE4MX0.BMD5mBtrqShIlmJX32u3f8XActwjol4SZLwvp7codiw',NULL,'active','none','2022-02-18 15:33:01','2022-02-22 19:35:53',NULL),(105,'Perrito','Papurri','$2a$10$ceYv6gw0.o/D8R2itS6y/uAJgSTblDz3BI69wKWA/FLj4LL46Idy.','hombre','5.126.663-3','test@test.com','+56912345678','2000-01-20 17:01:14','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJQZXJyaXRvIiwiZW1haWwiOiJ0ZXN0QHRlc3QuY29tIiwidG9rZW5UeXBlIjoic2Vzc2lvbiIsImlhdCI6MTY0NTMwMTA5OX0.PxMcPtTyhpLZMJvDg09lKRkVxCaqLVZ6n0yFphoRpks',NULL,'active','none','2022-02-19 17:05:00','2022-02-19 17:04:59',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_chats`
--

DROP TABLE IF EXISTS `users_has_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_chats` (
  `users_user_id` int NOT NULL,
  `chats_chat_id` int NOT NULL,
  PRIMARY KEY (`users_user_id`,`chats_chat_id`),
  KEY `fk_users_has_chats_chats1_idx` (`chats_chat_id`),
  KEY `fk_users_has_chats_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_users_has_chats_chats1` FOREIGN KEY (`chats_chat_id`) REFERENCES `chats` (`chat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_chats_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_chats`
--

LOCK TABLES `users_has_chats` WRITE;
/*!40000 ALTER TABLE `users_has_chats` DISABLE KEYS */;
INSERT INTO `users_has_chats` VALUES (1,1),(6,1),(1,2),(6,2),(1,3),(6,3),(1,4),(6,4),(1,5),(6,5),(1,6),(99,6),(2,7),(23,7),(99,7),(2,8),(7,8),(1,9),(6,9),(1,10),(6,10),(1,11),(6,11),(1,12),(6,12),(1,13),(6,13),(1,14),(6,14),(1,15),(6,15),(1,16),(6,16),(1,17),(6,17),(1,18),(6,18),(1,19),(6,19),(1,20),(6,20),(1,21),(6,21),(1,22),(6,22),(1,23),(6,23),(1,24),(6,24),(1,25),(6,25),(1,26),(6,26),(1,27),(6,27),(1,28),(6,28),(1,29),(6,29),(1,30),(6,30),(1,31),(6,31),(1,32),(6,32),(1,33),(6,33),(1,34),(6,34),(1,35),(6,35),(1,36),(6,36),(1,37),(6,37),(1,38),(6,38),(1,39),(6,39),(1,40),(6,40),(1,41),(6,41),(1,42),(6,42),(1,43),(6,43),(1,44),(6,44),(1,45),(6,45),(1,46),(6,46),(1,47),(6,47),(1,48),(6,48),(1,49),(6,49),(1,50),(6,50),(1,51),(6,51),(1,52),(6,52),(1,53),(6,53),(1,54),(6,54),(1,55),(6,55),(1,56),(6,56),(1,57),(6,57),(1,58),(6,58),(1,59),(6,59),(1,60),(6,60),(1,61),(6,61),(1,62),(6,62),(1,63),(6,63),(1,64),(6,64),(1,65),(6,65),(1,66),(6,66),(1,67),(6,67),(1,68),(6,68),(1,69),(6,69),(1,70),(6,70),(1,71),(6,71),(1,72),(6,72),(1,73),(6,73),(1,74),(6,74),(1,75),(6,75),(2,76),(23,76),(26,76),(1,77),(6,77),(1,78),(6,78),(1,79),(6,79),(1,80),(6,80),(1,81),(6,81),(1,82),(6,82),(1,83),(6,83),(1,84),(6,84),(1,85),(6,85),(6,86),(104,86),(6,87),(104,87),(6,88),(104,88);
/*!40000 ALTER TABLE `users_has_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_movements`
--

DROP TABLE IF EXISTS `wallet_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_movements` (
  `wallet_movements_id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `total` int NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `users_user_id` int NOT NULL,
  PRIMARY KEY (`wallet_movements_id`,`users_user_id`),
  UNIQUE KEY `wallet_movements_id_UNIQUE` (`wallet_movements_id`),
  KEY `fk_wallet_movements_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_wallet_movements_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_movements`
--

LOCK TABLES `wallet_movements` WRITE;
/*!40000 ALTER TABLE `wallet_movements` DISABLE KEYS */;
INSERT INTO `wallet_movements` VALUES (1,20000,20000,'ingreso','2021-12-01 10:57:50',1),(2,20000,20000,'ingreso','2021-12-01 11:43:18',2),(3,100000,120000,'ingreso','2021-12-01 11:44:05',2),(4,10000,30000,'ingreso','2021-12-03 14:50:51',1),(5,5000,35000,'ingreso','2021-12-03 14:53:09',1),(6,20000,55000,'ingreso','2021-12-03 15:23:46',1),(7,5000,60000,'ingreso','2021-12-03 15:43:53',1),(8,55000,115000,'ingreso','2021-12-03 15:52:42',1),(9,9000,124000,'ingreso','2021-12-03 16:08:16',1),(10,20000,20000,'ingreso','2021-12-06 08:28:14',5),(11,12000,112000,'pago','2021-12-09 17:15:35',1),(12,12000,108000,'pago','2021-12-09 17:17:17',2),(13,12000,96000,'pago','2021-12-09 17:18:00',2),(14,100000,100000,'ingreso','2021-12-09 17:26:56',17),(15,10000,30000,'ingreso','2021-12-09 17:37:24',5),(16,12000,100000,'pago','2021-12-13 17:21:08',1),(17,12000,88000,'pago','2021-12-13 17:22:35',1),(18,20000,108000,'ingreso','2021-12-15 16:50:16',1),(19,50000,50000,'ingreso','2021-12-29 17:32:49',23),(20,12000,96000,'pago','2021-12-29 17:34:12',1),(21,15000,81000,'pago','2021-12-29 17:43:16',1),(22,15000,81000,'pago','2021-12-29 17:47:29',2),(23,20000,61000,'pago','2021-12-29 18:28:45',2),(24,12000,69000,'pago','2022-01-01 14:30:58',1),(25,20000,89000,'ingreso','2022-01-04 17:19:02',1),(26,20000,109000,'ingreso','2022-01-04 17:19:02',1),(27,20000,109000,'ingreso','2022-01-04 17:19:02',1),(28,20000,129000,'ingreso','2022-01-04 17:19:02',1),(29,20000,129000,'ingreso','2022-01-04 17:19:03',1),(30,20000,129000,'ingreso','2022-01-04 17:19:03',1),(31,20000,129000,'ingreso','2022-01-04 17:19:03',1),(32,20000,129000,'ingreso','2022-01-04 17:19:03',1),(33,50000,111000,'ingreso','2022-01-08 09:35:19',2),(34,12000,117000,'pago','2022-01-08 16:33:14',1),(35,20000,20000,'ingreso','2022-01-24 18:19:33',101);
/*!40000 ALTER TABLE `wallet_movements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-23 17:46:35
