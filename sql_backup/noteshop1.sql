-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: noteshop
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `goods_code` char(4) NOT NULL,
  `count` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `FK_buy_user_user_id` (`user_id`),
  KEY `FK_buy_goods_goods_code` (`goods_code`),
  CONSTRAINT `FK_buy_goods_goods_code` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON UPDATE CASCADE,
  CONSTRAINT `FK_buy_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (11,'BBK','N2',1,1268000),(12,'EJW','N5',1,1160000),(13,'EJW','N4',1,1564000),(14,'KBS','N1',2,3260000),(15,'KBS','N1',2,3260000),(16,'kkH','N2',1,1268000),(17,'KKW','N1',1,1630000),(18,'LSG','N1',1,1630000),(26,'KKH','N1',2,3260000);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_code` char(4) NOT NULL,
  `manuf` varchar(10) NOT NULL,
  `model` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goods_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('N1','samsung','NT950XCJ',1630000,NULL),('N2','lg','14ZD90N',1268000,NULL),('N3','apple','MV962KH',1847000,NULL),('N4','hp','cd0048TX',1564000,NULL),('N5','asus','X571TGT',1160000,NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(30) NOT NULL,
  `name` varchar(15) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `sex` char(2) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mdate` date NOT NULL,
  `addr` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('BBK','바비킴','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('EJW','은지원','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('JKW','조관우','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('KBS','조용필','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('KKH','김범수','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('KKK','김경호','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('KKW','기기기','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('LJB','이하니','1234','여','010-1234-1234','0000-00-00','서울시 종로구'),('LSG','이승기','1234','남','010-1234-1234','0000-00-00','서울시 종로구'),('SSK','성시경','1234','남','010-1234-1234','0000-00-00','서울시 종로구');
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

-- Dump completed on 2020-04-23 17:39:15
