-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: sqldb
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
  `user_id` char(8) NOT NULL,
  `prod_name` char(6) NOT NULL,
  `group_name` char(4) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `amount` smallint(6) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (17,'KBS','운동화','null',1000,2),(18,'KBS','노트북','전기',1000,1),(19,'JYP','모니터','전기',1000,1),(20,'BBK','모니터','전기',1000,5),(21,'KBS','청바지','의류',1000,3),(22,'BBK','메모리','전기',1000,10),(23,'SSK','책','서적',1000,5),(24,'EJW','책','서적',1000,2),(25,'EJW','청바지','의류',1000,1),(26,'BBK','운동화','null',1000,2),(27,'EJW','책','서적',1000,1),(28,'BBK','운동화','null',1000,2),(32,'BBK','노트북',NULL,1000,1),(33,'BBK','아이폰','',1000,2);
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emptbl`
--

DROP TABLE IF EXISTS `emptbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emptbl` (
  `emp` char(3) DEFAULT NULL,
  `manager` char(3) DEFAULT NULL,
  `emptel` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptbl`
--

LOCK TABLES `emptbl` WRITE;
/*!40000 ALTER TABLE `emptbl` DISABLE KEYS */;
INSERT INTO `emptbl` VALUES ('나사장',NULL,'0000'),('김재무','나사장','2222'),('김부장','김재무','2222-1'),('이부장','김재무','2222-2'),('우대리','이부장','2222-2-1'),('지사원','이부장','2222-2-2'),('이영업','나사장','1111'),('한과장','이영업','1111-1'),('최정보','나사장','3333'),('윤차장','최정보','3333-1'),('이주임','윤차장','3333-1-1');
/*!40000 ALTER TABLE `emptbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1` (
  `user_id` char(8) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1`
--

LOCK TABLES `t1` WRITE;
/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
INSERT INTO `t1` VALUES ('BBK','바비킴'),('EJW','은지원'),('JKW','조관우'),('JYP','조용필'),('KBS','김범수'),('KKH','김경호'),('LJB','임재범'),('LSG','이승기'),('SSK','성시경'),('YJS','윤종신');
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` char(8) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birthyear` int(11) NOT NULL,
  `addr` char(2) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mdate` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('BBK','바비킴',1973,'서울','010','00000000',176,'2013-05-05'),('EJW','은지원',1969,'경북','011','21415224',174,'2014-03-03'),('JKW','조관우',1972,'경기','018','21515215',172,'2010-10-10'),('JYP','조용필',1955,'경기','011','43252632',166,'2009-04-04'),('KBS','김범수',1927,'경기','011','22224444',173,'2012-04-04'),('KKH','김경호',1971,'경남','019','32132421',177,'2012-07-07'),('KKK','기기기',1991,'경북','019','10245679',178,'2020-04-22'),('KKW','이하니',1988,'제주','111','12341234',164,'2015-05-04'),('LJB','임재범',1979,'서울','061','66666666',182,'2009-09-09'),('LSG','이승기',1987,'서울','011','11111234',182,'2008-08-08'),('SSK','성시경',1979,'서울',NULL,'',166,'2013-12-12'),('YJS','윤종신',1963,'경남','','',170,'2005-05-05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user2`
--

DROP TABLE IF EXISTS `user2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2` (
  `user_id` char(8) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birthyear` int(11) NOT NULL,
  `addr` char(2) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user2`
--

LOCK TABLES `user2` WRITE;
/*!40000 ALTER TABLE `user2` DISABLE KEYS */;
INSERT INTO `user2` VALUES ('BBK','바비킴',1973,'서울','010','00000000',176,'2013-05-05'),('EJW','은지원',1969,'경북','011','21415224',174,'2014-03-03'),('JKW','조관우',1972,'경기','018','21515215',172,'2010-10-10'),('JYP','조용필',1950,'경기','011','43252632',166,'2009-04-04'),('KBS','김범수',1927,'경기','011','22224444',173,'2012-04-04'),('KKH','김경호',1971,'경남','019','32132421',177,'2012-07-07'),('LJB','임재범',1979,'서울','061','66666666',182,'2009-09-09'),('LSG','이승기',1987,'서울','011','11111234',182,'2008-08-08'),('SSK','성시경',1979,'서울',NULL,'',166,'2013-12-12'),('YJS','윤종신',1963,'경남','','',170,'2005-05-05');
/*!40000 ALTER TABLE `user2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 16:54:29
