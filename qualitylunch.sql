-- MySQL dump 10.14  Distrib 5.5.40-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: qualitylunch
-- ------------------------------------------------------
-- Server version	5.5.40-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `visited` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'2016-04-18',110),(2,'2016-04-19',124),(3,'2016-04-20',118),(4,'2016-04-21',116),(5,'2016-04-21',120),(6,'2016-04-22',103),(7,'2016-04-25',143),(8,'2016-04-26',112),(9,'2016-04-27',115),(10,'2016-04-28',128),(11,'2016-04-28',116),(12,'2016-05-03',101),(13,'2016-05-04',109),(14,'2016-05-05',128),(15,'2016-05-05',149),(16,'2016-05-09',150),(17,'2016-05-11',151),(19,'2016-05-16',104),(20,'2016-05-17',159),(18,'2016-05-13',138),(21,'2016-05-24',156),(22,'2016-05-25',127),(23,'2016-05-26',125),(24,'2016-05-27',139),(25,'2016-05-27',103),(26,'2016-05-30',128),(27,'2016-05-31',147),(28,'2016-06-01',145),(29,'2016-06-02',160),(30,'2016-06-03',163),(31,'2016-06-06',165),(32,'2016-06-07',149),(33,'2016-06-08',132),(34,'2016-06-10',130),(35,'2016-06-13',107),(36,'2016-06-14',143),(37,'2016-06-15',149),(38,'2016-06-17',125),(39,'2016-06-20',172),(40,'2016-06-21',141),(43,'2016-06-18',127),(42,'2016-06-23',168),(44,'2016-06-19',109),(45,'2016-06-21',114),(46,'2016-08-09',103),(47,'2016-08-10',126),(48,'2016-08-11',128),(49,'2016-08-15',117);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `distance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (101,'Fashion Walk',350),(102,'L Square',200),(103,'Times Square',450),(104,'Hysan Place',450),(105,'Jaffe Road',100),(106,'Lockhart Road',100),(107,'Tang Lung Street',550),(108,'Lee Theatre',600),(109,'Sogo',350),(110,'Windsor House',450),(111,'World Trade Center',450),(112,'Sino Plaza',0),(113,'JP Cinema',400),(114,'Island Beverley',350),(115,'CWB Center',100),(116,'Plaza 2000',400),(117,'Macau Yat Yuen',250),(118,'Yee Wo Street',400),(119,'Lan Fong Road',800);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` varchar(45) CHARACTER SET latin1 NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` char(1) CHARACTER SET latin1 NOT NULL DEFAULT 'C',
  `active` char(1) DEFAULT '1',
  `avgprice` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES ('101','Barn2','1','1',70,105),('102','潮菜廳','C','1',80,105),('103','點心(譽宴)','4','1',80,112),('104','北京老家','C','1',60,114),('105','住家菜','C','1',60,105),('106','橋底辣蟹','C','1',60,105),('107','辦館','C','1',80,105),('108','譚仔','C','1',50,105),('109','南記','C','1',50,118),('110','小王','0','1',80,111),('111','Teawood','A','1',80,115),('112','Curry Bee','J','1',80,105),('113','Princess Cafe','W','1',100,112),('114','UCC (Global Work)','3','1',90,111),('115','一風堂','J','1',90,103),('116','千兩','J','1',110,101),('117','Wired Cafe','J','1',90,104),('118','Burger Room','W','1',90,101),('119','Minh & Kok','A','1',80,101),('120','美味廚','C','1',70,101),('121','MUJI cafe','J','1',90,108),('122','豚王','J','1',100,107),('123','牛刷鍋','J','1',70,111),('124','School Food','A','1',80,103),('125','韓雅林','A','1',90,115),('126','韓式炸雞 BBQ Chicken','A','1',80,105),('127','Simply Life','W','1',100,101),('128','Ruby Tuesday','W','1',100,111),('129','小甜谷','W','1',110,105),('130','Babbo Trattoria','W','1',80,116),('131','LA Creperie','W','1',100,102),('132','The Grill Room','W','1',100,102),('133','名提','2','1',70,105),('134','Thai Simple','A','1',70,105),('135','Coedo Taproom','A','1',90,101),('136','PappaRich','A','1',90,102),('137','Siam 28','A','1',80,117),('138','小平津','J','1',70,107),('139','Mad for Garlic','W','1',90,103),('140','大阪李朝園','A','1',80,106),('141','Greenhouse','W','1',80,103),('142','拳王泰國餐廳','A','1',80,105),('143','Green Waffle','W','1',80,104),('144','別府駅前料理','J','1',80,113),('145','温野菜','J','1',80,116),('146','YPasta','W','1',80,102),('147','八寸','J','1',80,106),('148','Wildfire','W','1',110,101),('149','The Fat Pig','C','1',90,103),('150','Toast Box','A','1',60,103),('151','魚米粥館','C','1',60,105),('152','南小館','C','1',80,104),('153','Lemongrass','A','1',80,104),('154','名館','C','1',80,104),('155','The Herbivores','W','1',80,104),('156','羅麥記','C','1',80,104),('157','何洪記','C','1',80,104),('158','三田製麵所','J','1',100,107),('159','JK Kitchen','A','1',80,107),('160','The Point','W','1',100,107),('161','Eight Grand','W','1',100,104),('162','麻辣派對','C','1',60,114),('163','芽莊','A','1',90,103),('164','HABITŪ table','W','1',90,104),('165','滿記De Avenue','W','1',90,104),('166','Hysan Foodcourt','A','1',70,104),('167','樂天皇朝','C','1',100,108),('168','Noodleholic','C','1',70,105),('169','霸嗎拉麵','J','1',90,107),('170','金不換','A','1',80,108),('171','西餐大排檔','W','1',100,118),('172','Saigon Saigon','A','1',60,114),('173','金田家','J','1',90,107),('174','Eat.it Italy','W','1',110,101),('175','Ludwig Beerhall','W','1',90,101),('176','Master Kama','W','1',80,105),('177','DMA Cafe','W','1',70,105),('178','盈福小廚','C','1',70,119),('179','金雀餐廳','C','1',70,119),('180','台南阿豆仔','C','1',70,119),('181','Kikusan','J','1',90,104),('182','Pizza Maru','A','1',90,104),('183','Pizza Express','W','1',90,103),('184','勝八','J','1',120,107),('185','三田製麵所','J','1',90,107),('186','Goobne Chicken','A','1',90,107),('187','麵館皇','C','1',60,107),('188','王家沙','C','1',80,107),('189','伽倻 Kaya','A','1',90,107),('190','Greyhound Café','W','1',90,107),('191','大戶屋','J','1',110,107),('192','牛角','J','1',80,110),('193','Soi 18巷','A','1',100,111),('194','No5 Italian','W','1',100,111),('195','RBTea','W','1',70,114),('196','屋喔','W','1',90,114),('197','阿拉丁咖喱屋','A','1',80,108),('198','Mirch Masala','A','1',80,114),('199','加東','A','1',90,117),('200','Sawali Club','A','1',90,118);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-19 15:00:34
