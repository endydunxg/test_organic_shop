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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `stock` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,'Rau muống sạch 100% hữu cơ','/images/rau_muong.jpg',_binary '\0','Rau Muống Organic 500g',25000.00,96,'2026-04-27 18:38:53.127420',1),(2,NULL,'Cải thảo tươi từ Đà Lạt','/images/cai_thao.jpg',_binary '\0','Cải Thảo Xanh 1kg',35000.00,80,NULL,1),(3,NULL,'Táo organic nhập khẩu','/images/tao_fuji.jpg',_binary '\0','Táo Fuji Nhật 1kg',120000.00,50,NULL,2),(4,NULL,'Chuối sứ ngọt lịm','/images/chuoi_su.jpg',_binary '\0','Chuối Sứ 1kg',25000.00,120,NULL,2),(5,NULL,'Gà thả vườn sạch','/images/ga_ta.jpg',_binary '\0','Thịt Gà Ta 1kg',180000.00,20,NULL,3),(6,NULL,'Cá lóc tự nhiên ao hồ','/images/ca_loc.jpg',_binary '\0','Cá Lóc Đồng 1kg',150000.00,30,NULL,3),(7,NULL,'Gạo 1 sao thế giới organic','/images/gao_st25.jpg',_binary '\0','Gạo ST25 5kg',250000.00,200,NULL,4),(8,NULL,'Tiêu đen hữu cơ xay sẵn','/images/tieu_den.jpg',_binary '\0','Hạt Tiêu Đen 100g',45000.00,150,NULL,5),(9,NULL,'Bắp cải tím giàu chất xơ','/images/bap_cai.jpg',_binary '\0','Bắp Cải Tím 1kg',40000.00,60,NULL,1),(10,NULL,'Cam miền Tây ngọt gắt','/images/cam_sanh.jpg',_binary '\0','Cam Sành 1kg',35000.00,90,NULL,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-23 21:02:36
