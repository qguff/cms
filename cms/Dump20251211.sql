-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cms
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idcategory` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `position` int DEFAULT '0',
  PRIMARY KEY (`idcategory`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Новости','novosti',NULL,1),(2,'Статьи','stati',NULL,2),(3,'Блоги','blogs',NULL,3),(4,'Политика','politika',1,1),(5,'Экономика','ekonomika',1,2),(6,'Технологии','technologies',2,1),(7,'Путешествия','travel',3,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `idcontent` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `text` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(45) DEFAULT NULL,
  `meta_decription` varchar(45) DEFAULT NULL,
  `comment_status` varchar(45) DEFAULT NULL,
  `user_iduser` int NOT NULL,
  `category_idcategory` int NOT NULL,
  PRIMARY KEY (`idcontent`),
  KEY `fk_content_user1_idx` (`user_iduser`),
  KEY `fk_content_category1_idx` (`category_idcategory`),
  CONSTRAINT `fk_content_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`),
  CONSTRAINT `fk_content_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'Политическая новость','politics-news','Текст новости о политике...','published','news',NULL,NULL,NULL,NULL,NULL,1,1),(2,'Экономический обзор','economy-review','Анализ экономики...','draft','article',NULL,NULL,NULL,NULL,NULL,2,2),(3,'Новые технологии 2025','tech-2025','Обзор технологий...','published','article',NULL,NULL,NULL,NULL,NULL,3,3),(4,'Лучшие места для путешествий','travel-spots','Топ-10 стран для отдыха...','draft','blog',NULL,NULL,NULL,NULL,NULL,4,4);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `idpermission` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpermission`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'create_posts','Создание новых записей'),(2,'edit_posts','Редактирование записей'),(3,'delete_posts','Удаление записей'),(4,'publish_posts','Публикация записей'),(5,'manage_users','Управление пользователями'),(6,'manage_comments','Управление комментариями'),(7,'upload_files','Загрузка файлов'),(8,'edit_settings','Изменение настроек'),(9,'view_statistics','Просмотр статистики'),(10,'manage_menus','Управление меню');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idroles` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор'),(2,'Редактор'),(3,'Пользователь');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_has_permission`
--

DROP TABLE IF EXISTS `roles_has_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_permission` (
  `roles_idroles` int NOT NULL,
  `permission_idpermission` int NOT NULL,
  PRIMARY KEY (`roles_idroles`,`permission_idpermission`),
  KEY `fk_roles_has_permission_permission1_idx` (`permission_idpermission`),
  KEY `fk_roles_has_permission_roles1_idx` (`roles_idroles`),
  CONSTRAINT `fk_roles_has_permission_permission1` FOREIGN KEY (`permission_idpermission`) REFERENCES `permission` (`idpermission`),
  CONSTRAINT `fk_roles_has_permission_roles1` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_has_permission`
--

LOCK TABLES `roles_has_permission` WRITE;
/*!40000 ALTER TABLE `roles_has_permission` DISABLE KEYS */;
INSERT INTO `roles_has_permission` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(1,4),(2,4),(1,5),(1,6),(2,6),(1,7),(2,7),(3,7),(1,8),(1,9),(2,9),(1,10),(2,10);
/*!40000 ALTER TABLE `roles_has_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_has_user`
--

DROP TABLE IF EXISTS `roles_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_has_user` (
  `roles_idroles` int NOT NULL,
  `user_iduser` int NOT NULL,
  PRIMARY KEY (`roles_idroles`,`user_iduser`),
  KEY `fk_roles_has_user_user1_idx` (`user_iduser`),
  KEY `fk_roles_has_user_roles_idx` (`roles_idroles`),
  CONSTRAINT `fk_roles_has_user_roles` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`),
  CONSTRAINT `fk_roles_has_user_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_has_user`
--

LOCK TABLES `roles_has_user` WRITE;
/*!40000 ALTER TABLE `roles_has_user` DISABLE KEYS */;
INSERT INTO `roles_has_user` VALUES (1,1),(2,2),(2,3),(3,4),(3,5);
/*!40000 ALTER TABLE `roles_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `idtags` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`idtags`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Политика','politics'),(2,'Экономика','economy'),(3,'Технологии','technology'),(4,'Путешествия','travel'),(5,'Новости','news');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_has_content`
--

DROP TABLE IF EXISTS `tags_has_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_has_content` (
  `tags_idtags` int NOT NULL,
  `content_idcontent` int NOT NULL,
  PRIMARY KEY (`tags_idtags`,`content_idcontent`),
  KEY `fk_tags_has_content_content1_idx` (`content_idcontent`),
  KEY `fk_tags_has_content_tags1_idx` (`tags_idtags`),
  CONSTRAINT `fk_tags_has_content_content1` FOREIGN KEY (`content_idcontent`) REFERENCES `content` (`idcontent`),
  CONSTRAINT `fk_tags_has_content_tags1` FOREIGN KEY (`tags_idtags`) REFERENCES `tags` (`idtags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_has_content`
--

LOCK TABLES `tags_has_content` WRITE;
/*!40000 ALTER TABLE `tags_has_content` DISABLE KEYS */;
INSERT INTO `tags_has_content` VALUES (1,1),(5,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `tags_has_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `registration_date` date NOT NULL,
  `phone` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_active` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ivan@example.com','pass123','2024-01-15','+79161234567','Иван','Иванов','2024-12-08 14:30:00','1'),(2,'maria@example.com','qwerty','2024-02-20','+79162345678','Мария','Петрова','2024-12-05 10:15:00','1'),(3,'alex@example.com','alex123','2024-03-10','+79163456789','Алексей','Смирнов','2024-11-28 16:45:00','1'),(4,'elena.like@example.com','lenochka','2024-04-05','+79164567890','Елена','Козлова','2024-11-15 09:20:00','1'),(5,'dmitry@example.com','wolf123','2023-05-12','+79165678901','Дмитрий','Волков',NULL,'0');
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

-- Dump completed on 2025-12-11  9:55:45
