/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 5.7.26 : Database - astrology
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`astrology` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `astrology`;

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `timezone` int(2) DEFAULT NULL,
  `longF` int(3) DEFAULT NULL,
  `weif` int(1) DEFAULT NULL,
  `longS` int(3) DEFAULT NULL,
  `latF` int(3) DEFAULT NULL,
  `nsif` int(1) DEFAULT NULL,
  `latS` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

insert  into `city`(`id`,`name`,`timezone`,`longF`,`weif`,`longS`,`latF`,`nsif`,`latS`) values 
(1,'Bangkok',26,100,1,31,13,0,44),
(2,'Chicago',10,87,0,37,42,0,52),
(3,'Beijing',28,116,1,23,39,0,55),
(5,'Florida',10,95,0,22,29,0,46),
(4,'Mexico',10,99,0,7,19,0,26);

/*Table structure for table `list` */

DROP TABLE IF EXISTS `list`;

CREATE TABLE `list` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `city` int(5) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthtime` time DEFAULT NULL,
  `progressday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `list` */

insert  into `list`(`id`,`name`,`city`,`birthday`,`birthtime`,`progressday`) values 
(1,'Kiti Pan',1,'1968-09-13','12:03:00','2019-09-10'),
(2,'Lady Gaga',2,'1986-03-28','22:55:24','2019-09-11');

/*Table structure for table `zone` */

DROP TABLE IF EXISTS `zone`;

CREATE TABLE `zone` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `zone` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `zone` */

insert  into `zone`(`id`,`name`,`zone`) values 
(1,'GMT -12:00 hrs - IDLW',-720),
(2,'GMT -11:00 hrs - BET or NT',-660),
(3,'GMT -10:30 hrs - HST',-690),
(4,'GMT -10:00 hrs - AHST',-600),
(5,'GMT -09:30 hrs - HDT or HWT',-570),
(6,'GMT -09:00 hrs - YST or AHDT or AHWT',-540),
(7,'GMT -08:00 hrs - PST or YDT or YWT',-480),
(8,'GMT -07:00 hrs - MST or PDT or PWT',-420),
(9,'GMT -06:00 hrs - CST or MDT or MWT',-360),
(10,'GMT -05:00 hrs - EST or CDT or CWT',-300),
(11,'GMT -04:00 hrs - AST or EDT or EWT',-240),
(12,'GMT -03:30 hrs - NST',-210),
(13,'GMT -03:00 hrs - BZT2 or AWT',-180),
(14,'GMT -02:00 hrs - AT',-120),
(15,'GMT -01:00 hrs - WAT',-60),
(16,'Greenwich Mean Time - GMT or UT',0),
(17,'GMT +01:00 hrs - CET or MET or BST',60),
(18,'GMT +02:00 hrs - EET or CED or MED or BDST or BWT',120),
(19,'GMT +03:00 hrs - BAT or EED',180),
(20,'GMT +03:30 hrs - IT',210),
(21,'GMT +04:00 hrs - USZ3',240),
(22,'GMT +05:00 hrs - USZ4',300),
(23,'GMT +05:30 hrs - IST',330),
(24,'GMT +06:00 hrs - USZ5',360),
(25,'GMT +06:30 hrs - NST',390),
(26,'GMT +07:00 hrs - SST or USZ6',420),
(27,'GMT +07:30 hrs - JT',450),
(28,'GMT +08:00 hrs - AWST or CCT',480),
(29,'GMT +08:30 hrs - MT',510),
(30,'GMT +09:00 hrs - JST or AWDT',540),
(31,'GMT +09:30 hrs - ACST or SAT or SAST',570),
(32,'GMT +10:00 hrs - AEST or GST',600),
(33,'GMT +10:30 hrs - ACDT or SDT or SAD',630),
(34,'GMT +11:00 hrs - UZ10 or AEDT',660),
(35,'GMT +11:30 hrs - NZ',690),
(36,'GMT +12:00 hrs - NZT or IDLE',720),
(37,'GMT +12:30 hrs - NZS',750),
(38,'GMT +13:00 hrs - NZST',780);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
