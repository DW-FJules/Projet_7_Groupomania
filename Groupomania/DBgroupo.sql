-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `authorId` int NOT NULL,
  `postId` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authorId_idx` (`authorId`),
  KEY `postId_idx` (`postId`),
  CONSTRAINT `author` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `postId` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (222,'Bonjour et merci',33,26,'Tom Tom'),(224,'Yeah thanks',27,26,'Bak Bak'),(225,'Hello',27,27,'Bak Bak'),(226,'J ai tenté de vous joindre',30,26,'Elo Samouille'),(227,'Bienvenue à toi !',30,28,'Elo Samouille'),(228,'Moi c est Sam des RH, enchanté',28,29,'Sam Olo'),(229,'Bonjour et bienvenue',28,27,'Sam Olo'),(230,'Merci pour l accueil',28,26,'Sam Olo'),(231,'Heho ! me voilà',31,30,'Kim Ono'),(232,'Je suis au SAV ! Ravie',31,29,'Kim Ono'),(233,'Bonjour, je suis Tom,  toujours un plaisir de voir cette commu évoluer, bienvenue',33,31,'Tom Tom'),(234,'Welcome',33,28,'Tom Tom'),(243,'Bienvenue parmis nous',29,30,'Manu Scrit');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_log` datetime DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

LOCK TABLES `connection` WRITE;
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
INSERT INTO `connection` VALUES (1,'2022-04-11 11:51:22','18'),(2,'2022-04-11 11:54:55','19'),(3,'2022-04-11 11:56:23','20'),(4,'2022-04-11 11:57:08','20'),(5,'2022-04-11 11:57:55','20'),(6,'2022-04-11 12:09:13','21'),(7,'2022-04-11 12:12:51','22'),(8,'2022-04-11 12:13:25','23'),(9,'2022-04-11 13:11:50','10'),(10,'2022-04-11 13:18:09','23'),(11,'2022-04-11 13:30:57','25'),(12,'2022-04-11 13:32:32','18'),(13,'2022-04-11 13:33:13','25'),(14,'2022-04-11 13:35:10','25'),(15,'2022-04-11 13:40:52','26'),(16,'2022-04-11 13:41:38','27'),(17,'2022-04-11 13:43:16','28'),(18,'2022-04-11 13:44:40','29'),(19,'2022-04-11 13:45:46','26'),(20,'2022-04-11 13:54:41','27'),(21,'2022-04-11 13:55:58','26'),(22,'2022-04-11 13:59:09','28'),(23,'2022-04-11 14:03:23','29'),(24,'2022-04-11 14:04:38','26'),(25,'2022-04-11 14:07:18','29'),(26,'2022-04-11 14:11:32','29'),(27,'2022-04-11 14:12:25','28'),(28,'2022-04-11 14:13:13','29'),(29,'2022-04-11 14:17:38','26'),(30,'2022-04-11 14:18:23','27'),(31,'2022-04-11 14:23:28','30'),(32,'2022-04-11 14:25:35','31'),(33,'2022-04-11 14:28:46','32'),(34,'2022-04-11 14:30:46','26'),(35,'2022-04-11 16:37:28','27'),(36,'2022-04-11 19:32:27','33'),(37,'2022-04-11 20:22:17','29'),(38,'2022-04-11 20:25:17','33'),(39,'2022-04-11 20:26:53','29'),(40,'2022-04-11 20:29:59','33'),(41,'2022-04-11 20:32:23','27'),(42,'2022-04-11 20:35:09','30'),(43,'2022-04-11 20:38:41','28'),(44,'2022-04-11 20:43:39','31'),(45,'2022-04-11 20:49:28','33'),(46,'2022-04-12 18:23:05','34'),(47,'2022-04-12 18:26:09','35'),(48,'2022-04-12 18:27:15','34'),(49,'2022-04-12 20:59:06','36'),(50,'2022-04-12 21:00:54','29'),(51,'2022-04-14 00:27:44','37'),(52,'2022-04-14 00:52:16','37'),(53,'2022-04-14 00:54:39','38'),(54,'2022-04-14 00:56:10','39'),(55,'2022-04-14 00:57:47','39'),(56,'2022-04-14 00:59:00','39'),(57,'2022-04-14 01:03:25','31'),(58,'2022-04-14 02:18:35','40'),(59,'2022-04-14 07:37:43','41'),(60,'2022-04-14 07:39:37','40'),(61,'2022-04-14 07:40:48','39'),(62,'2022-04-16 01:57:42','34'),(63,'2022-04-16 01:58:12','43'),(64,'2022-04-16 02:03:36','29'),(65,'2022-04-16 02:32:01','30'),(66,'2022-04-16 02:36:14','43'),(67,'2022-04-16 02:48:31','43'),(68,'2022-04-17 11:46:09','43');
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL,
  `imageUrl` varchar(300) DEFAULT NULL,
  `authorId` int DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (26,'Hello ! Bienvenue sur Groupomania, je fais parti des admin de cette page, si besoin veuillez me contacter','http://localhost:3001/images/askadmin.gif1649701761703.gif',29,'2022-04-11 20:29:21'),(27,'Salut la compagnie','http://localhost:3001/images/hello.gif1649701871745.gif',33,'2022-04-11 20:31:11'),(28,'Ola ! Un petit nouveau parmis vous','http://localhost:3001/images/spinner.gif1649702059617.gif',27,'2022-04-11 20:34:19'),(29,'Hey ! Je suis Elo du service client','http://localhost:3001/images/hey.gif1649702261171.gif',30,'2022-04-11 20:37:41'),(30,'Ça a l air sympa ici !','http://localhost:3001/images/hello.gif1649702433994.gif',28,'2022-04-11 20:40:33'),(31,'Salutations ! Sam m a parlé de cette commu, donc me voilà maintenant des vôtres','http://localhost:3001/images/spinner.gif1649702845328.gif',31,'2022-04-11 20:47:25');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(355) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `role` varchar(70) DEFAULT 'employé',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (27,'Bak','$2b$10$lCRPwC2V0UDzuQa3ycF3gObcQVGqxtDhMV8FrVxhohqsnXZpaR/4u','bakbak@live.fr','Bak','employé'),(28,'Sam','$2b$10$kD/yL6MuoZ.wdEtrt9woveOyh0x8BVLsFg2.os0Wf6eCZgySB69ny','sam@live.fr','Olo','employé'),(29,'Manu','$2b$10$9UFct65Q7UfsD2SohSephO63alAnAHLES2MIk0fexoDsixPcEyhfC','admin_1@live.fr','Scrit','admin'),(30,'Elo','$2b$10$./uojZj4JVPtSTc/GWSTp.y4TpxNqKr9gtYGk4G1WnYG9dASMm8Na','elo@live.fr','Samouille','employé'),(31,'Kim','$2b$10$rimF7LjBIoEnsm/yM2DOLuRJDBqQ9mzEl8KdxR0Vk31whgifMCn1.','kim@live.fr','Ono','employé'),(33,'Tom','$2b$10$onWXttqZJcNOkJdc.U25d.ZMrWwtPwmf6EpsSovjm/iiKA9OIZji.','tom@live.fr','Tom','employé'),(38,'momo','$2b$10$kZU2FtlZ18Wy64Fl7RUTROqw9pJiJBIx7CY35EiWhgu2n/Us88us6','momo@live.fr','mo','employé'),(39,'az','$2b$10$qYBdODvfF7SxJbs4uIeQzOwoi0c97loL7zE1ux/U/J/r0XDLxjY/.','laziz@live.fr','ziz','employé'),(40,'maurice','$2b$10$b/Zbmaz7x84.IXUUReWP7Oq43f25HS1qAPZsqO.RzLtKa4t/Op48a','maurice@live.fr','phillip','employé'),(41,'','$2b$10$Yjal4NMmW7EJ.0Qgqn8k6.aIjvZAhhsyFyuSE.K3Sb51q4.6ckyfS','','','employé'),(43,'Zaza','$2b$10$6efciLBDbZfazlCW8iPrmewM09uRajGkRSg2h.okguFvdu5E46OO.','zaza@live.fr','Rive','employé');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 12:00:24
