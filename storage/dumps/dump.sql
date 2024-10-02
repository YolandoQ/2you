-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: 2you
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('a321e750e349abf7418c74bc618fce2c','i:1;',1727841240),('a321e750e349abf7418c74bc618fce2c:timer','i:1727841240;',1727841240),('a66ecaba076f0de8f165c8ac90d5562b','i:4;',1727779864),('a66ecaba076f0de8f165c8ac90d5562b:timer','i:1727779864;',1727779864),('test.user@user.user|172.21.0.1','i:4;',1727779864),('test.user@user.user|172.21.0.1:timer','i:1727779864;',1727779864);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'cumque','2024-10-01 15:28:26','2024-10-01 15:28:26'),(2,'et','2024-10-01 15:28:26','2024-10-01 15:28:26'),(3,'est','2024-10-01 15:28:26','2024-10-01 15:28:26'),(4,'porro','2024-10-01 15:28:26','2024-10-01 15:28:26'),(5,'expedita','2024-10-01 15:28:26','2024-10-01 15:28:26'),(6,'exercitationem','2024-10-01 15:28:26','2024-10-01 15:28:26'),(7,'delectus','2024-10-01 15:28:26','2024-10-01 15:28:26'),(8,'qui','2024-10-01 15:28:26','2024-10-01 15:28:26'),(9,'quae','2024-10-01 15:28:26','2024-10-01 15:28:26'),(10,'et','2024-10-01 15:28:26','2024-10-01 15:28:26'),(11,'sed','2024-10-01 15:28:26','2024-10-01 15:28:26'),(12,'quia','2024-10-01 15:28:26','2024-10-01 15:28:26'),(13,'magni','2024-10-01 15:28:26','2024-10-01 15:28:26'),(14,'quo','2024-10-01 15:28:26','2024-10-01 15:28:26'),(15,'quae','2024-10-01 15:28:26','2024-10-01 15:28:26'),(16,'ex','2024-10-01 15:28:26','2024-10-01 15:28:26'),(17,'incidunt','2024-10-01 15:28:26','2024-10-01 15:28:26'),(18,'fuga','2024-10-01 15:28:26','2024-10-01 15:28:26'),(19,'officia','2024-10-01 15:28:26','2024-10-01 15:28:26'),(20,'rerum','2024-10-01 15:28:26','2024-10-01 15:28:26'),(21,'quia','2024-10-01 15:28:26','2024-10-01 15:28:26'),(22,'sint','2024-10-01 15:28:26','2024-10-01 15:28:26'),(23,'dolore','2024-10-01 15:28:26','2024-10-01 15:28:26'),(24,'eos','2024-10-01 15:28:26','2024-10-01 15:28:26'),(25,'libero','2024-10-01 15:28:26','2024-10-01 15:28:26'),(26,'dolor','2024-10-01 15:28:26','2024-10-01 15:28:26'),(27,'ad','2024-10-01 15:28:26','2024-10-01 15:28:26'),(28,'exercitationem','2024-10-01 15:28:26','2024-10-01 15:28:26'),(29,'et','2024-10-01 15:28:26','2024-10-01 15:28:26'),(30,'blanditiis','2024-10-01 15:28:26','2024-10-01 15:28:26'),(31,'quia','2024-10-01 15:28:26','2024-10-01 15:28:26'),(32,'velit','2024-10-01 15:28:26','2024-10-01 15:28:26'),(33,'voluptatum','2024-10-01 15:28:26','2024-10-01 15:28:26'),(34,'ut','2024-10-01 15:28:26','2024-10-01 15:28:26'),(35,'modi','2024-10-01 15:28:26','2024-10-01 15:28:26'),(36,'repudiandae','2024-10-01 15:28:26','2024-10-01 15:28:26'),(37,'dolorem','2024-10-01 15:28:26','2024-10-01 15:28:26'),(38,'nihil','2024-10-01 15:28:26','2024-10-01 15:28:26'),(39,'optio','2024-10-01 15:28:26','2024-10-01 15:28:26'),(40,'voluptates','2024-10-01 15:28:26','2024-10-01 15:28:26'),(41,'est','2024-10-01 15:28:26','2024-10-01 15:28:26'),(42,'et','2024-10-01 15:28:26','2024-10-01 15:28:26'),(43,'molestias','2024-10-01 15:28:26','2024-10-01 15:28:26'),(44,'delectus','2024-10-01 15:28:26','2024-10-01 15:28:26'),(45,'ducimus','2024-10-01 15:28:26','2024-10-01 15:28:26'),(46,'in','2024-10-01 15:28:26','2024-10-01 15:28:26'),(47,'voluptates','2024-10-01 15:28:26','2024-10-01 15:28:26'),(48,'et','2024-10-01 15:28:26','2024-10-01 15:28:26'),(49,'nihil','2024-10-01 15:28:26','2024-10-01 15:28:26'),(50,'similique','2024-10-01 15:28:26','2024-10-01 15:28:26'),(51,'modi','2024-10-01 15:28:26','2024-10-01 15:28:26'),(52,'pariatur','2024-10-01 15:28:26','2024-10-01 15:28:26'),(53,'voluptatem','2024-10-01 15:28:26','2024-10-01 15:28:26'),(54,'reprehenderit','2024-10-01 15:28:26','2024-10-01 15:28:26'),(55,'qui','2024-10-01 15:28:26','2024-10-01 15:28:26'),(56,'magnam','2024-10-01 15:28:26','2024-10-01 15:28:26'),(57,'inventore','2024-10-01 15:28:26','2024-10-01 15:28:26'),(58,'sint','2024-10-01 15:28:26','2024-10-01 15:28:26'),(59,'autem','2024-10-01 15:28:26','2024-10-01 15:28:26'),(60,'quis','2024-10-01 15:28:26','2024-10-01 15:28:26');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_09_30_200850_add_two_factor_columns_to_users_table',1),(5,'2024_09_30_200904_create_personal_access_tokens_table',1),(6,'2024_09_30_202646_create_categories_table',2),(7,'2024_09_30_202655_create_vehicles_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (4,'App\\Models\\User',1,'web_browser','e9b226174ba4bf16fbb10d29fb308a59b8043ed4cf80eb6f98dd087baf493e88','[\"*\"]','2024-10-02 03:45:51',NULL,'2024-10-01 10:56:53','2024-10-02 03:45:51'),(5,'App\\Models\\User',1,'web_browser','a92cf8c7c7e666f33bd29cdb4b35e2c0dd931356913c1c15222a7aa7f0eabcf2','[\"*\"]','2024-10-02 03:48:47',NULL,'2024-10-02 03:46:30','2024-10-02 03:48:47'),(6,'App\\Models\\User',1,'web_browser','2cd14ef281c32c79d3c812cc03dd342f8f9af332dd38773062be06648f1892cf','[\"*\"]','2024-10-02 03:53:00',NULL,'2024-10-02 03:48:47','2024-10-02 03:53:00'),(7,'App\\Models\\User',1,'web_browser','3df8302fd0f65cd346fbad781262dacf862697ab2e3d6043700ecdb1afef371c','[\"*\"]',NULL,NULL,'2024-10-02 03:53:01','2024-10-02 03:53:01');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('APWtih9jHUt0JfzcOc3K7MnPqN42T6dFJTkeajTQ',1,'172.21.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQTFQVmszbGRabjJDTUxUMHkxR2pYTkdEWWhjWmpYbkJWcHpocEVGVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiR3ZnhyUDMzWGRsOUY3ZUVHZGp4cENPRVEvSFhRbVFOa2s0YXFSTXVLVVFtTUVIVnR1OGZtQyI7fQ==',1727841180);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test user','test.user@test.test',NULL,'$2y$12$wfxrP33Xdl9F7eEGdjxpCOEQ/HXQmQNkk4aqRMuKUQmMEHVtu8fmC',NULL,NULL,NULL,'ubBdNOF6DNLvgQYD0AjGqHIsRGtJV9HIVUNlgzx4rYY8SEnydYMSgY8udaMI',NULL,NULL,'2024-09-30 20:20:27','2024-09-30 20:20:27'),(2,'Test User','test@example.com','2024-10-01 15:28:26','$2y$12$7/eZalUwMLcqYTb3rM/6aeN/gnilDO.udWkID53IB6wS/aJqg/01q',NULL,NULL,NULL,'XOZDXTNAzJ',NULL,NULL,'2024-10-01 15:28:26','2024-10-01 15:28:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` year NOT NULL,
  `weight` double NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicles_category_id_foreign` (`category_id`),
  CONSTRAINT `vehicles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,11,'Hyatt-Sawayn','natus',2019,1728,'green',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(2,12,'Beer LLC','qui',1999,2398,'green',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(3,13,'McCullough, McGlynn and Strosin','non',1998,2183,'black',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(4,14,'Lang, Hagenes and Goyette','et',1979,2426,'yellow',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(5,15,'Bailey Inc','dignissimos',1996,1181,'yellow',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(6,16,'Ritchie, Raynor and Bayer','cumque',2010,1770,'lime',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(7,17,'Hamill-Frami','unde',1982,1784,'gray',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(8,18,'Lindgren, Bruen and Towne','alias',1987,2969,'teal',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(9,19,'Barton, Bartoletti and Schumm','aperiam',2023,1966,'blue',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(10,20,'Greenholt LLC','id',1973,1007,'green',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(11,21,'Ryan-West','facere',2017,2714,'navy',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(12,22,'Pagac-Glover','cum',1988,1627,'navy',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(13,23,'Brekke Ltd','voluptatem',1999,2032,'teal',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(14,24,'Baumbach, Jast and Veum','error',1972,1785,'purple',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(15,25,'Hammes and Sons','consequatur',1974,1679,'white',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(16,26,'Auer, Balistreri and Kerluke','quia',1974,2894,'green',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(17,27,'Hessel-Schumm','consequatur',2011,2781,'aqua',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(18,28,'Huel PLC','occaecati',1973,2863,'maroon',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(19,29,'Schuster LLC','quibusdam',1976,1965,'purple',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(20,30,'Stiedemann PLC','fugiat',2013,1362,'teal',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(21,31,'Will, Abshire and Morar','laboriosam',2024,1575,'maroon',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(22,32,'Predovic-Kuvalis','mollitia',1994,2943,'maroon',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(23,33,'Bernhard, Johnston and Raynor','in',1991,1938,'yellow',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(24,34,'Mohr and Sons','quia',1989,2965,'blue',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(25,35,'Lebsack-Ritchie','harum',1986,1354,'green',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(26,36,'Ward Ltd','enim',1980,2394,'aqua',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(27,37,'Schiller LLC','adipisci',1986,1095,'silver',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(28,38,'Leannon, Anderson and Adams','impedit',2003,2203,'silver',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(29,39,'West, Kautzer and Adams','est',1988,2080,'aqua',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(30,40,'Johnson Ltd','dicta',2015,2190,'gray',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(31,41,'Cole-Haag','repellat',1978,1810,'black',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(32,42,'Kling PLC','quo',1971,1829,'gray',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(33,43,'Wunsch Inc','rerum',1979,2209,'fuchsia',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(34,44,'Farrell PLC','perspiciatis',1978,1061,'silver',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(35,45,'Rath Inc','fugiat',2005,2130,'aqua',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(36,46,'Eichmann-Davis','in',1972,1210,'white',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(37,47,'Reichel-McDermott','est',1999,1706,'lime',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(38,48,'Ryan-Wiegand','ut',1992,1354,'aqua',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(39,49,'Glover Inc','aut',2019,2887,'maroon',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(40,50,'Carter, Kessler and Barton','corrupti',1996,1105,'olive',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(41,51,'Jacobi-Becker','qui',2011,1998,'purple',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(42,52,'Lehner Inc','ut',1976,1482,'purple',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(43,53,'Schaefer, Wilderman and Prosacco','ex',2022,2735,'blue',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(44,54,'Heathcote-Stamm','harum',2013,1517,'silver',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(45,55,'Wunsch Ltd','commodi',1986,1830,'teal',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(46,56,'Reinger Inc','ex',2021,2139,'purple',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(47,57,'Adams-Kutch','repellendus',1987,2287,'black',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(48,58,'Tillman LLC','nam',1988,2780,'blue',0,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(49,59,'Walsh and Sons','debitis',2017,1270,'fuchsia',1,'2024-10-01 15:28:26','2024-10-01 15:28:26'),(50,60,'Hansen LLC','quia',2017,1642,'olive',1,'2024-10-01 15:28:26','2024-10-01 15:28:26');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02  4:01:43
