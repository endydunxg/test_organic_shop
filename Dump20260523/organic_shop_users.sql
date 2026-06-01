-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: organic_shop
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `provider` enum('LOCAL','GOOGLE','FACEBOOK') DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `role` enum('ROLE_USER','ROLE_ADMIN') DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `locked` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'admin@organicshop.com','Admin Organic Shop','$2a$10$demo_hash_admin','0123456789','LOCAL',NULL,'ROLE_ADMIN',NULL,_binary '\0'),(2,NULL,'user1@gmail.com','Nguyễn Văn A','$2a$10$demo_hash_user','0987654321','LOCAL',NULL,'ROLE_USER',NULL,_binary '\0'),(3,NULL,'user2@gmail.com','Trần Thị B','$2a$10$demo_hash_user','0987654322','GOOGLE','google_user2_123','ROLE_USER',NULL,_binary '\0'),(4,NULL,'user3@gmail.com','Lê Văn C','$2a$10$demo_hash_user','0987654323','LOCAL',NULL,'ROLE_USER',NULL,_binary '\0'),(5,'2026-04-23 02:33:53.247216','dungdeptrai@gmail.com','Dũng Đẹp Trai','$2a$10$9F2cRieK.7B6j14V8q7RxuY8SqszVZPckm8nTPcNRCtZNAONU7YPK','0123456789','LOCAL',NULL,'ROLE_USER','2026-04-23 02:33:53.247216',_binary '\0'),(6,'2026-04-23 14:27:29.847749','user@organicshop.com','Organic Shop User','$2a$10$vCdjY5pgWxzEZJd0aekjm.f4qczSl2boZNAuUMkuig/PeQ7ebFOAK','0987654321','LOCAL',NULL,'ROLE_USER','2026-04-23 14:27:29.847749',_binary '\0'),(7,'2026-04-23 15:20:07.696428','enesdyzero@gmail.com','Đức Dũng',NULL,NULL,'GOOGLE','100098267014359435778','ROLE_USER','2026-04-23 15:20:07.696428',_binary '\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-23 21:02:37
