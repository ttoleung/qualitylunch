-- MySQL dump 10.14  Distrib 5.5.40-MariaDB, for Linux (x86_64)
--
-- Host: hkqa01    Database: qualitylunch
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES ('101','Barn2','1','1',70),('102','喜喜','C','0',60),('103','點心(譽宴)','4','1',80),('104','北京老家','C','1',60),('105','住家菜','C','1',60),('106','橋底辣蟹','C','1',60),('107','麵檔','C','0',50),('108','譚仔','C','1',50),('109','南記','C','1',50),('110','小王','0','1',80),('111','Teawood','T','1',80),('112','Dazzling Cafe','T','0',150),('113','Princess Cafe','T','1',100),('114','UCC (Global Work)','3','1',90),('115','一風堂','J','1',90),('116','千兩','J','1',110),('117','Wired Cafe','J','1',90),('118','鳴門','J','0',80),('119','和幸','J','0',70),('120','Coco','J','0',80),('121','MUJI cafe','J','1',90),('122','豚王','J','1',100),('123','牛刷鍋','J','1',70),('124','School Food','T','1',80),('125','韓雅林','T','1',90),('126','韓式炸雞 BBQ Chicken','T','1',80),('127','Simply Life','W','1',100),('128','Ruby Tuesday','W','1',100),('129','小甜谷','W','1',110),('130','Babbo Di Trattoria','W','1',80),('131','LA Creperie','N','1',100),('132','The Grill Room','W','1',100),('133','名提','2','1',70),('134','Thai Simple','W','1',70),('135','Nga Trang','W','0',70),('136','18 巷','N','0',110),('137','Siam 28','N','1',80),('138','小平津','J','1',70),('139','He She Eat Cafe','T','0',100),('140','大阪李朝園','T','1',80),('141','洋蔥 Onion','W','1',80),('142','拳王泰國餐廳','W','1',80),('143','Green Waffle','W','1',80),('144','別府駅前料理','J','1',80),('145','温野菜','N','1',80),('146','YPasta','W','1',80),('147','八寸','N','1',80),('148','Wildfire','W','1',110),('149','金記冰室','C','0',60),('150','TOI Rice Pizza','J','0',60),('151','魚米粥館','C','1',60),('152','南小館','C','1',80),('153','Lemongrass','W','1',80),('154','名館','C','1',80),('155','The Herbivores','W','1',80),('156','羅麥記','C','1',80),('157','Jamie Italian','W','0',160),('158','三田製麵所','J','1',100),('159','JK Kitchen','T','1',80),('160','The Point','N','1',100),('161','BBQ 7080','N','1',90),('162','麻辣派對','C','1',60),('163','芽莊','W','1',90),('164','喜來希肉','W','0',90),('165','左麟右李','C','0',60),('166','鉄人旨花','J','0',150),('167','樂天皇朝','C','1',100),('168','莆田 ','C','0',150),('169','翠亨邨','C','0',80),('170','金不換','W','1',80),('171','西餐大排檔','W','1',100),('172','Saigon Saigon','W','1',60),('173','盛八食堂','J','1',90),('174','Eat.it Italy','W','1',110),('175','Ludwig Beerhall','W','1',90),('176','Master Kama','W','1',80),('177','DMA Cafe','W','1',70),('178','盈福小廚','C','1',70),('179','金雀餐廳','C','1',70),('180','台南阿豆仔','T','1',70),('181','Kikusan','J','1',90),('182','Pizza Maru','K','1',90);
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

-- Dump completed on 2016-11-01 13:41:54
