﻿# Host: localhost  (Version: 5.5.53)
# Date: 2018-11-07 09:09:50
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;


CREATE DATABASE IF NOT EXISTS zuopin102;
USE zuopin102;

#
# Structure for table "borrow"
#


CREATE TABLE `borrow` (
  `borrowid` varchar(11) NOT NULL COMMENT '借阅编号',
  `userid` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `bookid` varchar(20) DEFAULT NULL COMMENT '书籍编号',
  `stime` char(10) DEFAULT NULL COMMENT '借阅时间',
  `etime` char(10) DEFAULT NULL COMMENT '还书时间',
  `borrowremark` varchar(255) DEFAULT NULL COMMENT '书籍状态，1为已还，0为未还',
  PRIMARY KEY (`borrowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "borrow"
#

INSERT INTO `borrow` VALUES ('1010','1101','1','2018.11.2','2018.11.12','0'),('1011','1102','1','2018.11.2','2018.11.11','1'),('1012','1103','2','2018.11.2','2018.11.11','0'),('1013','1104','1','2018.11.2','2018.11.11','0'),('1014','1105','3','2018.11.1','2018.11.11','0'),('1015','1106','3','2018.11.2','2018.11.12','0'),('1016','1107','2','2018.11.2','2018.11.11','0'),('1017','1108','3','2018.11.2','2018.11.11','0'),('1018','1109','3','2018.11.2','2018.11.11','0'),('1019','1110','3','2018.11.2','2018.11.11','0'),('1029','32165','2','2018.11.2','2018.11.16','1');

#
# Structure for table "borrowkind"
#

CREATE TABLE `borrowkind` (
  `kind_id` varchar(10) NOT NULL COMMENT '借阅书籍编号',
  `kind_name` varchar(255) DEFAULT NULL COMMENT '书籍种类',
  `kind_remark` varchar(255) DEFAULT NULL COMMENT '书籍简介',
  PRIMARY KEY (`kind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "borrowkind"
#

INSERT INTO `borrowkind` VALUES ('1','玄幻','书籍简介'),('2','爱情','书籍简介'),('3','真理','书籍简介');

#
# Structure for table "loginfo"
#

CREATE TABLE `loginfo` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `logintime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

#
# Data for table "loginfo"
#

INSERT INTO `loginfo` VALUES (1,'1','2015-11-18 18:11:06'),(37,'1','2017-10-14 11:39:27'),(38,'1','2017-10-14 14:30:54'),(39,'1','2017-10-14 15:00:07'),(40,'1','2018-10-27 09:32:58'),(41,'1','2018-10-27 09:59:23'),(42,'1','2018-10-27 10:15:16'),(43,'1','2018-10-27 10:17:27'),(44,'1','2018-10-27 10:21:08'),(45,'1','2018-10-27 10:27:48'),(46,'1','2018-10-27 10:31:05'),(47,'1','2018-10-27 10:40:43'),(48,'1','2018-10-27 11:03:23'),(49,'1','2018-10-27 11:13:17'),(50,'1','2018-10-27 11:33:43'),(51,'1','2018-10-27 11:48:54'),(52,'1','2018-10-27 14:43:03'),(53,'1','2018-10-27 15:03:30'),(54,'1','2018-10-27 15:08:55'),(55,'1','2018-10-27 15:12:31'),(56,'1','2018-10-27 15:21:31'),(57,'1','2018-10-27 15:22:44'),(58,'1','2018-10-27 15:26:06'),(59,'1','2018-10-27 15:32:30'),(60,'1','2018-10-27 15:36:44'),(61,'1','2018-10-27 15:52:02'),(62,'1','2018-10-27 16:06:50'),(63,'1','2018-10-27 16:09:22'),(64,'1','2018-10-27 16:09:31'),(65,'1','2018-10-27 16:12:58'),(66,'1','2018-10-27 16:19:36'),(67,'1','2018-10-27 16:24:19'),(68,'1','2018-10-27 16:30:12'),(69,'1','2018-10-27 16:30:27'),(70,'1','2018-10-27 16:39:00'),(71,'1','2018-10-27 16:39:09'),(72,'1','2018-10-27 16:44:47'),(73,'1','2018-10-27 16:47:34'),(74,'1','2018-10-27 18:53:53'),(75,'1','2018-10-27 18:54:12'),(76,'1','2018-10-27 19:01:15'),(77,'1','2018-10-27 19:05:21'),(78,'1','2018-10-27 19:06:17'),(79,'1','2018-10-27 19:12:36'),(80,'1','2018-10-27 19:19:13'),(81,'1','2018-10-27 19:20:26'),(82,'1','2018-10-27 19:21:49'),(83,'1','2018-10-27 19:25:19'),(84,'1','2018-10-27 19:32:32'),(85,'1','2018-10-27 19:35:12'),(86,'1','2018-10-27 19:42:36'),(87,'1','2018-10-27 19:44:48'),(88,'1','2018-10-27 19:57:46'),(89,'1','2018-10-27 20:33:33'),(90,'1','2018-10-27 20:34:14'),(91,'1','2018-10-27 20:39:23'),(92,'1','2018-10-27 20:40:07'),(93,'1','2018-10-27 20:40:17'),(94,'1','2018-11-03 12:23:22'),(95,'1','2018-11-03 12:29:40'),(96,'1','2018-11-03 14:50:59'),(97,'1','2018-11-03 15:25:36'),(98,'1','2018-11-03 15:28:21'),(99,'1','2018-11-03 15:39:55'),(100,'1','2018-11-03 15:58:09'),(101,'1','2018-11-03 16:38:51'),(102,'1','2018-11-03 16:59:48'),(103,'1','2018-11-03 17:15:57'),(104,'1','2018-11-03 17:18:05'),(105,'1','2018-11-03 19:01:20'),(106,'1','2018-11-06 21:35:19'),(107,'1','2018-11-06 21:53:09'),(108,'1','2018-11-07 08:39:25'),(109,'1','2018-11-07 08:50:32'),(110,'1','2018-11-07 08:54:12');

#
# Structure for table "user"
#

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `roleId` int(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'admin','1','2017-5-5 11:48:27',1,'upload/e2f77e06-0342-433f-bff7-ab7b8a10dca1.jpg'),(5,'liulijie','1','2017-5-5 11:48:27',2,NULL),(6,'taijianhua','1','2017-5-5 11:51:31',2,NULL),(8,'20134071101','1','2017-5-5 12:14:02',3,NULL),(9,'20134071102','1','2017-5-5 12:14:39',3,NULL),(10,'20134071103','1','2017-5-5 12:14:54',3,NULL),(11,'20134071104','1','2017-5-5 12:15:12',3,NULL),(12,'20134071105','1','2017-5-5 12:15:31',3,NULL),(13,'20134071106','1','2017-5-5 12:15:46',3,NULL),(14,'20134071107','1','2017-5-5 12:16:38',3,NULL),(15,'20134071108','1','2017-5-5 12:16:57',3,NULL),(16,'20134071113','1','2017-5-5 12:17:39',3,NULL),(17,'20134071115','1','2017-5-5 12:18:14',3,NULL),(18,'20134071116','1','2017-5-5 12:18:41',3,NULL),(19,'20134071117','1','2017-5-5 12:19:21',3,NULL),(20,'20134071118','1','2017-5-5 12:19:36',3,NULL),(21,'zhujingfu','1','2017-5-8 16:51:29',2,NULL);
