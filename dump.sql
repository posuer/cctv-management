# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: (MySQL 5.7.19-0ubuntu0.16.04.1)
# Database: yuhesa
# Generation Time: 2017-12-07 09:02:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone_number`)
VALUES
	(1,'yuhesa00',1,'yuhesa','Admin','Mr/Ms','01012345678'),
	(6,'melissa00',0,'melissa','Melissa','Kee','01065479520'),
	(7,'wanggengyu00',0,'wanggengyu','Gengyu','Wang','01099019409'),
	(12,'michelle00',0,'michelle','Mich','Pang','01000000000'),
	(13,'yihui00',0,'yihui','Michelle','Pang','01012345678'),
	(16,'mel00',0,'mel','Mel','Ms','010987679');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_cctv
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_cctv`;

CREATE TABLE `management_cctv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(30) NOT NULL DEFAULT '',
  `install_date` date NOT NULL,
  `in_charge_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `management_cctv_in_charge_user_id_12afbc5b_fk_auth_user_id` (`in_charge_user_id`),
  CONSTRAINT `management_cctv_in_charge_user_id_12afbc5b_fk_auth_user_id` FOREIGN KEY (`in_charge_user_id`) REFERENCES `auth_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `management_cctv` WRITE;
/*!40000 ALTER TABLE `management_cctv` DISABLE KEYS */;

INSERT INTO `management_cctv` (`id`, `model_name`, `install_date`, `in_charge_user_id`)
VALUES
	(1,'Samsung','2014-01-01',1),
	(2,'SONY','2017-11-08',6),
	(3,'Hyundai','2017-11-15',1),
	(5,'Panasonic','2016-11-20',7),
	(7,'CP Plus','2014-10-08',6),
	(8,'Netatmo','2001-12-13',7);

/*!40000 ALTER TABLE `management_cctv` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_manager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_manager`;

CREATE TABLE `management_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `management_manager_user_id_5f6a4632_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `management_manager` WRITE;
/*!40000 ALTER TABLE `management_manager` DISABLE KEYS */;

INSERT INTO `management_manager` (`id`, `phone_number`, `user_id`)
VALUES
	(1,'01099019409',1),
	(2,'01012345678',7),
	(3,'01023456789',6);

/*!40000 ALTER TABLE `management_manager` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_metalog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_metalog`;

CREATE TABLE `management_metalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `x_position` double NOT NULL,
  `y_position` double NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `size` double NOT NULL,
  `velocity` double NOT NULL,
  `color` double NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `management_metalog_video_id_f60b70c3_fk_management_video_id` (`video_id`),
  CONSTRAINT `management_metalog_video_id_f60b70c3_fk_management_video_id` FOREIGN KEY (`video_id`) REFERENCES `management_video` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

LOCK TABLES `management_metalog` WRITE;
/*!40000 ALTER TABLE `management_metalog` DISABLE KEYS */;

INSERT INTO `management_metalog` (`id`, `video_id`, `x_position`, `y_position`, `timestamp`, `size`, `velocity`, `color`, `object_id`)
VALUES
	(1,1,19,4,'2017-12-02 21:55:31.000000',23,78,18540,1),
	(2,1,46,79,'2017-12-02 21:38:51.000000',12,12,53926,2),
	(3,1,99,45,'2017-12-02 21:22:11.000000',60,24,199,3),
	(4,1,66,20,'2017-12-02 21:05:31.000000',96,79,78391,4),
	(5,1,79,29,'2017-12-02 20:48:51.000000',28,36,44688,5),
	(6,1,26,55,'2017-12-02 20:32:11.000000',27,96,93533,6),
	(7,1,91,59,'2017-12-02 20:15:31.000000',2,19,11864,7),
	(8,1,80,74,'2017-12-02 19:58:51.000000',69,83,81085,8),
	(9,1,13,72,'2017-12-02 19:42:11.000000',76,37,28621,9),
	(10,1,53,45,'2017-12-02 19:25:31.000000',29,97,11061,10),
	(11,1,89,57,'2017-12-02 19:08:51.000000',63,89,44196,11),
	(12,1,33,20,'2017-12-02 18:52:11.000000',99,13,89538,12),
	(13,1,53,83,'2017-12-02 18:35:31.000000',23,86,37773,13),
	(14,1,30,30,'2017-12-02 18:18:51.000000',13,72,59430,14),
	(15,1,93,1,'2017-12-02 18:02:11.000000',61,59,15747,15),
	(16,1,67,4,'2017-12-02 17:45:31.000000',22,52,31811,16),
	(17,1,23,65,'2017-12-02 17:28:51.000000',16,16,37809,17),
	(18,1,52,29,'2017-12-02 17:12:11.000000',71,83,75598,18),
	(19,1,37,81,'2017-12-02 16:55:31.000000',81,32,83544,19),
	(20,1,16,41,'2017-12-02 16:38:51.000000',24,82,50532,20),
	(21,1,20,51,'2017-12-02 16:22:11.000000',72,44,78694,21),
	(22,1,76,22,'2017-12-02 16:05:31.000000',100,10,98395,22),
	(23,1,70,38,'2017-12-02 15:48:51.000000',44,61,16234,23),
	(24,1,10,18,'2017-12-02 15:32:11.000000',63,30,49798,24),
	(25,1,80,61,'2017-12-02 15:15:31.000000',22,32,6996,25),
	(26,1,15,17,'2017-12-02 14:58:51.000000',95,98,5516,26),
	(27,1,29,11,'2017-12-02 14:42:11.000000',83,24,10160,27),
	(28,1,83,22,'2017-12-02 14:25:31.000000',96,60,33496,28),
	(29,1,51,98,'2017-12-02 14:08:51.000000',59,73,75240,29),
	(30,1,46,22,'2017-12-02 13:52:11.000000',35,58,3224,30),
	(31,1,34,76,'2017-12-02 13:35:31.000000',100,40,78228,31),
	(32,1,90,13,'2017-12-02 13:18:51.000000',86,85,94956,32),
	(33,1,62,95,'2017-12-02 13:02:11.000000',42,38,83930,33),
	(34,1,73,63,'2017-12-02 12:45:31.000000',40,62,22617,34),
	(35,1,79,35,'2017-12-02 12:28:51.000000',59,21,78879,35),
	(36,1,52,54,'2017-12-02 12:12:11.000000',19,27,42585,36),
	(37,1,67,87,'2017-12-02 11:55:31.000000',10,66,63432,37),
	(38,1,70,9,'2017-12-02 11:38:51.000000',4,80,88313,38),
	(39,1,71,73,'2017-12-02 11:22:11.000000',45,8,17724,39),
	(40,1,32,83,'2017-12-02 11:05:31.000000',35,71,69032,40),
	(41,1,93,87,'2017-12-02 10:48:51.000000',66,81,89207,41),
	(42,1,27,61,'2017-12-02 10:32:11.000000',67,86,68286,42),
	(43,1,51,17,'2017-12-02 10:15:31.000000',91,13,86733,43),
	(44,1,76,13,'2017-12-02 09:58:51.000000',34,46,23494,44),
	(45,1,41,81,'2017-12-02 09:42:11.000000',90,19,23510,45),
	(46,1,65,3,'2017-12-02 09:25:31.000000',41,28,73623,46),
	(47,1,50,26,'2017-12-02 09:08:51.000000',29,6,17207,47),
	(48,1,31,36,'2017-12-02 08:52:11.000000',56,67,95464,48),
	(49,1,16,49,'2017-12-02 08:35:31.000000',39,25,70161,49),
	(50,2,31,44,'2017-12-02 21:55:31.000000',68,24,73496,1),
	(51,2,33,6,'2017-12-02 21:38:51.000000',52,9,41576,2),
	(52,2,77,62,'2017-12-02 21:22:11.000000',34,57,84372,3),
	(53,2,22,23,'2017-12-02 21:05:31.000000',49,7,60331,4),
	(54,2,87,73,'2017-12-02 20:48:51.000000',79,4,6791,5),
	(55,2,94,50,'2017-12-02 20:32:11.000000',93,26,25947,6),
	(56,2,9,86,'2017-12-02 20:15:31.000000',58,89,4006,7),
	(57,2,39,24,'2017-12-02 19:58:51.000000',39,33,71172,8),
	(58,2,76,38,'2017-12-02 19:42:11.000000',56,92,89647,9),
	(59,2,32,60,'2017-12-02 19:25:31.000000',37,11,62510,10),
	(60,2,82,8,'2017-12-02 19:08:51.000000',6,5,40750,11),
	(61,2,30,34,'2017-12-02 18:52:11.000000',61,64,7757,12),
	(62,2,40,16,'2017-12-02 18:35:31.000000',94,23,39622,13),
	(63,2,94,45,'2017-12-02 18:18:51.000000',89,21,22520,14),
	(64,2,100,40,'2017-12-02 18:02:11.000000',63,22,49294,15),
	(65,2,98,32,'2017-12-02 17:45:31.000000',3,32,82753,16),
	(66,2,51,83,'2017-12-02 17:28:51.000000',79,92,42646,17),
	(67,2,74,35,'2017-12-02 17:12:11.000000',45,81,26510,18),
	(68,2,100,75,'2017-12-02 16:55:31.000000',82,42,40728,19),
	(69,2,1,3,'2017-12-02 16:38:51.000000',97,55,57691,20),
	(70,2,52,40,'2017-12-02 16:22:11.000000',15,23,16102,21),
	(71,2,83,12,'2017-12-02 16:05:31.000000',56,7,8089,22),
	(72,2,90,7,'2017-12-02 15:48:51.000000',35,17,17104,23),
	(73,2,83,50,'2017-12-02 15:32:11.000000',24,24,40484,24),
	(74,2,23,22,'2017-12-02 15:15:31.000000',43,18,83958,25),
	(75,2,44,43,'2017-12-02 14:58:51.000000',96,54,84229,26),
	(76,2,37,69,'2017-12-02 14:42:11.000000',57,91,72692,27),
	(77,2,98,7,'2017-12-02 14:25:31.000000',48,44,71740,28),
	(78,2,24,15,'2017-12-02 14:08:51.000000',27,69,16293,29),
	(79,2,36,30,'2017-12-02 13:52:11.000000',45,77,12595,30),
	(80,2,54,28,'2017-12-02 13:35:31.000000',48,54,15691,31),
	(81,2,68,12,'2017-12-02 13:18:51.000000',34,10,92233,32),
	(82,2,39,64,'2017-12-02 13:02:11.000000',41,11,12731,33),
	(83,2,35,50,'2017-12-02 12:45:31.000000',8,1,62818,34),
	(84,2,46,30,'2017-12-02 12:28:51.000000',8,8,12476,35),
	(85,2,47,42,'2017-12-02 12:12:11.000000',2,77,31582,36),
	(86,2,81,56,'2017-12-02 11:55:31.000000',5,42,76473,37),
	(87,2,98,75,'2017-12-02 11:38:51.000000',89,29,98534,38),
	(88,2,63,5,'2017-12-02 11:22:11.000000',76,78,3680,39),
	(89,2,63,97,'2017-12-02 11:05:31.000000',44,99,81000,40),
	(90,2,73,53,'2017-12-02 10:48:51.000000',36,9,42500,41),
	(91,2,6,11,'2017-12-02 10:32:11.000000',32,100,58112,42),
	(92,2,32,4,'2017-12-02 10:15:31.000000',7,82,87382,43),
	(93,2,68,86,'2017-12-02 09:58:51.000000',63,86,21820,44),
	(94,2,34,57,'2017-12-02 09:42:11.000000',43,31,49114,45),
	(95,2,49,88,'2017-12-02 09:25:31.000000',1,46,79573,46),
	(96,2,80,99,'2017-12-02 09:08:51.000000',97,97,11728,47),
	(97,2,75,34,'2017-12-02 08:52:11.000000',7,28,49192,48),
	(98,2,55,46,'2017-12-02 08:35:31.000000',38,85,77584,49),
	(99,3,89,96,'2017-12-02 21:55:31.000000',48,41,37635,1),
	(100,3,17,80,'2017-12-02 21:38:51.000000',40,89,26343,2),
	(101,3,99,79,'2017-12-02 21:22:11.000000',83,59,99511,3),
	(102,3,32,31,'2017-12-02 21:05:31.000000',22,62,83220,4),
	(103,3,42,63,'2017-12-02 20:48:51.000000',99,91,32755,5),
	(104,3,75,75,'2017-12-02 20:32:11.000000',85,64,45525,6),
	(105,3,90,88,'2017-12-02 20:15:31.000000',24,59,51990,7),
	(106,3,28,20,'2017-12-02 19:58:51.000000',38,75,20404,8),
	(107,3,48,40,'2017-12-02 19:42:11.000000',88,82,60243,9),
	(108,3,47,98,'2017-12-02 19:25:31.000000',24,57,53915,10),
	(109,3,76,3,'2017-12-02 19:08:51.000000',67,31,9658,11),
	(110,3,24,81,'2017-12-02 18:52:11.000000',41,19,980,12),
	(111,3,82,16,'2017-12-02 18:35:31.000000',33,58,1410,13),
	(112,3,13,74,'2017-12-02 18:18:51.000000',94,87,52885,14),
	(113,3,66,4,'2017-12-02 18:02:11.000000',50,67,32398,15),
	(114,3,21,24,'2017-12-02 17:45:31.000000',87,11,16293,16),
	(115,3,39,84,'2017-12-02 17:28:51.000000',88,1,88786,17),
	(116,3,33,25,'2017-12-02 17:12:11.000000',47,5,48107,18),
	(117,3,42,62,'2017-12-02 16:55:31.000000',93,82,88222,19),
	(118,3,70,42,'2017-12-02 16:38:51.000000',96,34,13104,20),
	(119,3,8,47,'2017-12-02 16:22:11.000000',39,56,3575,21),
	(120,3,32,49,'2017-12-02 16:05:31.000000',67,15,2567,22),
	(121,3,29,30,'2017-12-02 15:48:51.000000',39,14,91111,23),
	(122,3,70,75,'2017-12-02 15:32:11.000000',59,22,96973,24),
	(123,3,71,22,'2017-12-02 15:15:31.000000',50,98,69370,25),
	(124,3,1,62,'2017-12-02 14:58:51.000000',17,81,89818,26),
	(125,3,73,94,'2017-12-02 14:42:11.000000',51,56,23495,27),
	(126,3,50,54,'2017-12-02 14:25:31.000000',83,96,59955,28),
	(127,3,16,32,'2017-12-02 14:08:51.000000',79,98,19581,29),
	(128,3,60,51,'2017-12-02 13:52:11.000000',32,17,96024,30),
	(129,3,63,1,'2017-12-02 13:35:31.000000',81,52,14069,31),
	(130,3,61,67,'2017-12-02 13:18:51.000000',18,79,77439,32),
	(131,3,79,58,'2017-12-02 13:02:11.000000',93,28,78631,33),
	(132,3,53,74,'2017-12-02 12:45:31.000000',59,16,27901,34),
	(133,3,96,57,'2017-12-02 12:28:51.000000',47,47,38333,35),
	(134,3,50,46,'2017-12-02 12:12:11.000000',92,31,43085,36),
	(135,3,53,62,'2017-12-02 11:55:31.000000',79,91,26191,37),
	(136,3,93,28,'2017-12-02 11:38:51.000000',87,32,42961,38),
	(137,3,28,53,'2017-12-02 11:22:11.000000',96,39,399,39),
	(138,3,29,76,'2017-12-02 11:05:31.000000',48,78,58527,40),
	(139,3,2,21,'2017-12-02 10:48:51.000000',85,30,76933,41),
	(140,3,8,97,'2017-12-02 10:32:11.000000',37,50,86032,42),
	(141,3,77,81,'2017-12-02 10:15:31.000000',99,54,54353,43),
	(142,3,15,51,'2017-12-02 09:58:51.000000',64,77,54367,44),
	(143,3,20,37,'2017-12-02 09:42:11.000000',60,72,11059,45),
	(144,3,95,30,'2017-12-02 09:25:31.000000',99,35,67240,46),
	(145,3,100,20,'2017-12-02 09:08:51.000000',58,14,61071,47),
	(146,3,70,41,'2017-12-02 08:52:11.000000',63,65,35411,48),
	(147,3,21,36,'2017-12-02 08:35:31.000000',3,74,67455,49),
	(148,4,44,44,'2017-12-02 08:35:31.000000',97,53,26939,1),
	(149,4,57,34,'2017-12-02 08:52:11.000000',81,90,98926,2),
	(150,4,73,27,'2017-12-02 09:08:51.000000',42,88,55407,3),
	(151,4,91,30,'2017-12-02 09:25:31.000000',56,1,67192,4),
	(152,4,73,10,'2017-12-02 09:42:11.000000',41,92,77986,5),
	(153,4,28,76,'2017-12-02 09:58:51.000000',92,32,30384,6),
	(154,4,48,79,'2017-12-02 10:15:31.000000',59,24,62862,7),
	(155,4,38,58,'2017-12-02 10:32:11.000000',42,18,37499,8),
	(156,4,85,6,'2017-12-02 10:48:51.000000',72,42,50621,9),
	(157,4,16,69,'2017-12-02 11:05:31.000000',7,63,27454,10),
	(158,4,74,49,'2017-12-02 11:22:11.000000',84,53,22812,11),
	(159,4,91,58,'2017-12-02 11:38:51.000000',16,26,41370,12),
	(160,4,4,80,'2017-12-02 11:55:31.000000',1,49,80009,13),
	(161,4,94,31,'2017-12-02 12:12:11.000000',91,55,37491,14),
	(162,4,76,49,'2017-12-02 12:28:51.000000',65,46,24597,15),
	(163,4,96,5,'2017-12-02 12:45:31.000000',3,84,23342,16),
	(164,4,5,76,'2017-12-02 13:02:11.000000',75,22,74039,17),
	(165,4,61,55,'2017-12-02 13:18:51.000000',83,14,69400,18),
	(166,4,22,14,'2017-12-02 13:35:31.000000',9,68,70245,19),
	(167,4,65,75,'2017-12-02 13:52:11.000000',1,87,74474,1),
	(168,4,95,76,'2017-12-02 14:08:51.000000',66,93,64577,2),
	(169,4,64,47,'2017-12-02 14:25:31.000000',94,11,25289,3),
	(170,4,12,26,'2017-12-02 14:42:11.000000',66,22,10050,4),
	(171,4,56,21,'2017-12-02 14:58:51.000000',83,84,65952,5),
	(172,4,100,64,'2017-12-02 15:15:31.000000',66,14,75051,6),
	(173,4,36,54,'2017-12-02 15:32:11.000000',48,28,19494,7),
	(174,4,27,33,'2017-12-02 15:48:51.000000',60,26,13790,8),
	(175,4,61,74,'2017-12-02 16:05:31.000000',55,38,49260,9),
	(176,4,85,87,'2017-12-02 16:22:11.000000',38,91,50248,10),
	(177,4,12,82,'2017-12-02 16:38:51.000000',10,3,44170,11),
	(178,4,92,68,'2017-12-02 16:55:31.000000',14,71,52569,12),
	(179,4,30,3,'2017-12-02 17:12:11.000000',83,11,24076,13),
	(180,4,50,69,'2017-12-02 17:28:51.000000',64,38,64740,14),
	(181,4,7,64,'2017-12-02 17:45:31.000000',92,44,83317,15),
	(182,4,96,53,'2017-12-02 18:02:11.000000',40,14,52093,16),
	(183,4,52,80,'2017-12-02 18:18:51.000000',43,59,40532,17),
	(184,4,61,90,'2017-12-02 18:35:31.000000',48,73,84689,18),
	(185,4,34,49,'2017-12-02 18:52:11.000000',54,40,46641,19),
	(186,4,37,64,'2017-12-02 19:08:51.000000',65,63,64876,1),
	(187,4,47,85,'2017-12-02 19:25:31.000000',71,35,13089,2),
	(188,4,46,85,'2017-12-02 19:42:11.000000',43,69,84273,3),
	(189,4,50,61,'2017-12-02 19:58:51.000000',100,61,39650,4),
	(190,4,58,9,'2017-12-02 20:15:31.000000',32,20,79351,5),
	(191,4,84,73,'2017-12-02 20:32:11.000000',60,43,86252,6),
	(192,4,37,66,'2017-12-02 20:48:51.000000',70,44,64193,7),
	(193,4,32,23,'2017-12-02 21:05:31.000000',99,48,26200,8),
	(194,4,28,83,'2017-12-02 21:22:11.000000',78,2,52331,9),
	(195,4,92,68,'2017-12-02 21:38:51.000000',40,42,50890,10),
	(196,4,73,50,'2017-12-02 21:55:31.000000',82,61,11099,11),
	(197,5,28,60,'2017-12-02 08:35:31.000000',10,6,81747,1),
	(198,5,61,68,'2017-12-02 08:52:11.000000',50,78,91847,2),
	(199,5,81,4,'2017-12-02 09:08:51.000000',64,84,51698,3),
	(200,5,62,47,'2017-12-02 09:25:31.000000',23,87,71196,4),
	(201,5,6,35,'2017-12-02 09:42:11.000000',77,52,37403,5),
	(202,5,92,23,'2017-12-02 09:58:51.000000',94,5,64418,6),
	(203,5,88,13,'2017-12-02 10:15:31.000000',42,84,79615,7),
	(204,5,66,49,'2017-12-02 10:32:11.000000',36,54,19097,8),
	(205,5,21,65,'2017-12-02 10:48:51.000000',90,4,28464,9),
	(206,5,39,56,'2017-12-02 11:05:31.000000',70,10,96828,10),
	(207,5,53,66,'2017-12-02 11:22:11.000000',23,3,29320,11),
	(208,5,35,14,'2017-12-02 11:38:51.000000',30,95,20051,12),
	(209,5,58,17,'2017-12-02 11:55:31.000000',73,86,72470,13),
	(210,5,31,5,'2017-12-02 12:12:11.000000',89,3,55667,14),
	(211,5,35,22,'2017-12-02 12:28:51.000000',79,56,24108,15),
	(212,5,30,69,'2017-12-02 12:45:31.000000',73,76,24580,16),
	(213,5,46,33,'2017-12-02 13:02:11.000000',38,98,19915,17),
	(214,5,54,47,'2017-12-02 13:18:51.000000',6,61,45444,18),
	(215,5,40,3,'2017-12-02 13:35:31.000000',59,52,40937,19),
	(216,5,41,86,'2017-12-02 13:52:11.000000',90,77,43592,1),
	(217,5,24,22,'2017-12-02 14:08:51.000000',30,47,73149,2),
	(218,5,31,49,'2017-12-02 14:25:31.000000',64,18,18449,3),
	(219,5,45,13,'2017-12-02 14:42:11.000000',73,96,61497,4),
	(220,5,92,35,'2017-12-02 14:58:51.000000',95,5,73108,5),
	(221,5,71,67,'2017-12-02 15:15:31.000000',90,47,53023,6),
	(222,5,70,27,'2017-12-02 15:32:11.000000',47,43,26139,7),
	(223,5,68,37,'2017-12-02 15:48:51.000000',31,93,28745,8),
	(224,5,77,52,'2017-12-02 16:05:31.000000',31,91,35009,9),
	(225,5,6,28,'2017-12-02 16:22:11.000000',98,65,11911,10),
	(226,5,21,22,'2017-12-02 16:38:51.000000',62,84,67631,11),
	(227,5,73,66,'2017-12-02 16:55:31.000000',19,67,62669,12),
	(228,5,43,69,'2017-12-02 17:12:11.000000',52,28,85031,13),
	(229,5,58,30,'2017-12-02 17:28:51.000000',28,56,69326,14),
	(230,5,40,83,'2017-12-02 17:45:31.000000',72,64,37330,15),
	(231,5,68,87,'2017-12-02 18:02:11.000000',42,9,16220,16),
	(232,5,18,6,'2017-12-02 18:18:51.000000',13,6,11386,17),
	(233,5,66,33,'2017-12-02 18:35:31.000000',18,50,96318,18),
	(234,5,35,61,'2017-12-02 18:52:11.000000',68,25,90418,19),
	(235,5,79,50,'2017-12-02 19:08:51.000000',21,54,30491,1),
	(236,5,32,90,'2017-12-02 19:25:31.000000',71,30,42188,2),
	(237,5,4,45,'2017-12-02 19:42:11.000000',24,93,84595,3),
	(238,5,72,5,'2017-12-02 19:58:51.000000',98,60,54561,4),
	(239,5,96,76,'2017-12-02 20:15:31.000000',26,100,95634,5),
	(240,5,83,65,'2017-12-02 20:32:11.000000',99,58,22208,6),
	(241,5,96,5,'2017-12-02 20:48:51.000000',79,91,19653,7),
	(242,5,64,38,'2017-12-02 21:05:31.000000',60,66,46685,8),
	(243,5,26,87,'2017-12-02 21:22:11.000000',89,36,90573,9),
	(244,5,71,24,'2017-12-02 21:38:51.000000',9,51,40143,10),
	(245,5,17,45,'2017-12-02 21:55:31.000000',48,72,22917,11),
	(246,6,63,17,'2017-12-02 08:35:31.000000',9,97,73984,1),
	(247,6,52,19,'2017-12-02 08:52:11.000000',51,29,27199,2),
	(248,6,67,11,'2017-12-02 09:08:51.000000',54,32,79470,3),
	(249,6,35,40,'2017-12-02 09:25:31.000000',52,23,16580,4),
	(250,6,55,4,'2017-12-02 09:42:11.000000',26,25,48925,5),
	(251,6,64,61,'2017-12-02 09:58:51.000000',42,78,90423,6),
	(252,6,70,21,'2017-12-02 10:15:31.000000',20,76,24312,7),
	(253,6,60,60,'2017-12-02 10:32:11.000000',55,42,41037,8),
	(254,6,56,20,'2017-12-02 10:48:51.000000',11,43,18923,9),
	(255,6,75,43,'2017-12-02 11:05:31.000000',72,35,95691,10),
	(256,6,60,42,'2017-12-02 11:22:11.000000',36,31,71454,11),
	(257,6,74,51,'2017-12-02 11:38:51.000000',51,22,56355,12),
	(258,6,99,25,'2017-12-02 11:55:31.000000',66,62,51202,13),
	(259,6,71,2,'2017-12-02 12:12:11.000000',79,53,43904,14),
	(260,6,52,78,'2017-12-02 12:28:51.000000',87,83,90370,15),
	(261,6,23,58,'2017-12-02 12:45:31.000000',96,5,17673,16),
	(262,6,80,72,'2017-12-02 13:02:11.000000',7,70,95483,17),
	(263,6,80,63,'2017-12-02 13:18:51.000000',41,48,81703,18),
	(264,6,81,75,'2017-12-02 13:35:31.000000',14,25,55783,19),
	(265,6,69,84,'2017-12-02 13:52:11.000000',15,91,31502,1),
	(266,6,55,35,'2017-12-02 14:08:51.000000',97,33,49471,2),
	(267,6,63,83,'2017-12-02 14:25:31.000000',72,76,13536,3),
	(268,6,35,61,'2017-12-02 14:42:11.000000',32,18,71007,4),
	(269,6,76,4,'2017-12-02 14:58:51.000000',35,11,11004,5),
	(270,6,45,62,'2017-12-02 15:15:31.000000',70,5,21775,6),
	(271,6,80,81,'2017-12-02 15:32:11.000000',41,39,33258,7),
	(272,6,57,46,'2017-12-02 15:48:51.000000',71,23,51397,8),
	(273,6,85,18,'2017-12-02 16:05:31.000000',20,84,20652,9),
	(274,6,80,53,'2017-12-02 16:22:11.000000',50,67,54004,10),
	(275,6,15,23,'2017-12-02 16:38:51.000000',7,19,72917,11),
	(276,6,89,30,'2017-12-02 16:55:31.000000',76,28,73433,12),
	(277,6,19,19,'2017-12-02 17:12:11.000000',90,96,75184,13),
	(278,6,1,79,'2017-12-02 17:28:51.000000',29,54,71101,14),
	(279,6,87,45,'2017-12-02 17:45:31.000000',65,19,20032,15),
	(280,6,69,18,'2017-12-02 18:02:11.000000',93,99,64151,16),
	(281,6,82,22,'2017-12-02 18:18:51.000000',67,13,61904,17),
	(282,6,4,18,'2017-12-02 18:35:31.000000',38,20,86623,18),
	(283,6,46,21,'2017-12-02 18:52:11.000000',2,47,84667,19),
	(284,6,4,47,'2017-12-02 19:08:51.000000',90,21,95673,1),
	(285,6,2,4,'2017-12-02 19:25:31.000000',75,53,65983,2),
	(286,6,40,33,'2017-12-02 19:42:11.000000',22,46,11654,3),
	(287,6,8,64,'2017-12-02 19:58:51.000000',86,21,79954,4),
	(288,6,38,64,'2017-12-02 20:15:31.000000',3,86,53065,5),
	(289,6,50,67,'2017-12-02 20:32:11.000000',63,8,66645,6),
	(290,6,71,22,'2017-12-02 20:48:51.000000',30,65,79590,7),
	(291,6,79,33,'2017-12-02 21:05:31.000000',52,12,27459,8),
	(292,6,67,35,'2017-12-02 21:22:11.000000',41,11,61258,9),
	(293,6,55,2,'2017-12-02 21:38:51.000000',95,98,95905,10),
	(294,6,14,45,'2017-12-02 21:55:31.000000',55,72,39021,11);

/*!40000 ALTER TABLE `management_metalog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_neighbor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_neighbor`;

CREATE TABLE `management_neighbor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(100) NOT NULL,
  `route_position` varchar(100) NOT NULL,
  `space_1_id` int(11) NOT NULL,
  `space_2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_name` (`route_name`),
  KEY `management_neighbor_space_1_id_286539a2_fk_management_space_id` (`space_1_id`),
  KEY `management_neighbor_space_2_id_87e4d4a4_fk_management_space_id` (`space_2_id`),
  CONSTRAINT `management_neighbor_space_1_id_286539a2_fk_management_space_id` FOREIGN KEY (`space_1_id`) REFERENCES `management_space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `management_neighbor_space_2_id_87e4d4a4_fk_management_space_id` FOREIGN KEY (`space_2_id`) REFERENCES `management_space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

LOCK TABLES `management_neighbor` WRITE;
/*!40000 ALTER TABLE `management_neighbor` DISABLE KEYS */;

INSERT INTO `management_neighbor` (`id`, `route_name`, `route_position`, `space_1_id`, `space_2_id`)
VALUES
	(15,'Stairs','Rock stairs',1,2),
	(16,'HallwayB','Sport Center',2,3),
	(17,'Sport Hallway','Gymnasium',3,4),
	(18,'Main Hallway','First Floor',4,1),
	(19,'First Floor','In front of Convenience Store',1,2);

/*!40000 ALTER TABLE `management_neighbor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_sequence
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_sequence`;

CREATE TABLE `management_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `neighbor_1_id` int(11) NOT NULL,
  `neighbor_2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NONCLUSTERED` (`neighbor_1_id`,`neighbor_2_id`),
  KEY `management_sequence_neighbor_1_id_ca6369bb_fk_managemen` (`neighbor_1_id`),
  KEY `management_sequence_neighbor_2_id_b81f8414_fk_managemen` (`neighbor_2_id`),
  CONSTRAINT `management_sequence_neighbor_1_id_ca6369bb_fk_managemen` FOREIGN KEY (`neighbor_1_id`) REFERENCES `management_neighbor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `management_sequence_neighbor_2_id_b81f8414_fk_managemen` FOREIGN KEY (`neighbor_2_id`) REFERENCES `management_neighbor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

LOCK TABLES `management_sequence` WRITE;
/*!40000 ALTER TABLE `management_sequence` DISABLE KEYS */;

INSERT INTO `management_sequence` (`id`, `neighbor_1_id`, `neighbor_2_id`)
VALUES
	(14,15,16),
	(15,16,17),
	(16,18,15);

/*!40000 ALTER TABLE `management_sequence` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_space
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_space`;

CREATE TABLE `management_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `building_name` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `inroom_position` varchar(30) NOT NULL,
  `cctv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `management_space_cctv_id_51f69764_fk_management_cctv_id` (`cctv_id`),
  CONSTRAINT `management_space_cctv_id_51f69764_fk_management_cctv_id` FOREIGN KEY (`cctv_id`) REFERENCES `management_cctv` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `management_space` WRITE;
/*!40000 ALTER TABLE `management_space` DISABLE KEYS */;

INSERT INTO `management_space` (`id`, `address`, `building_name`, `floor`, `inroom_position`, `cctv_id`)
VALUES
	(1,'Yonsei University','Eng Building A',5,'Besides Room 501',1),
	(2,'Yonsei University','Eng Building B',5,'Besides Room 503',2),
	(3,'Yonsei University ','Main Library',4,'Besides Stairs',1),
	(4,'Yonsei University','Eng Building D',5,'Besides Room 531',1),
	(9,'blablbla','Business Building ',8,'Room 652',7),
	(10,'50 Yonsei-ro','Library',2,'In front of Elevator',3),
	(11,'50 Yonsei-ro','Education Building ',2,'In front of cafeteria',5);

/*!40000 ALTER TABLE `management_space` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table management_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `management_video`;

CREATE TABLE `management_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_file` varchar(500) DEFAULT NULL,
  `log_file` varchar(500) DEFAULT NULL,
  `records_number` int(11) DEFAULT NULL,
  `obj_number` int(11) DEFAULT NULL,
  `avg_velocity` double DEFAULT NULL,
  `avg_size` double DEFAULT NULL,
  `avg_color` double DEFAULT NULL,
  `cctv_id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `management_video_cctv_id_2756e50d_fk_management_cctv_id` (`cctv_id`),
  KEY `management_video_space_id_f2326279_fk_management_space_id` (`space_id`),
  CONSTRAINT `management_video_cctv_id_2756e50d_fk_management_cctv_id` FOREIGN KEY (`cctv_id`) REFERENCES `management_cctv` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `management_video_space_id_f2326279_fk_management_space_id` FOREIGN KEY (`space_id`) REFERENCES `management_space` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `management_video` WRITE;
/*!40000 ALTER TABLE `management_video` DISABLE KEYS */;

INSERT INTO `management_video` (`id`, `video_file`, `log_file`, `records_number`, `obj_number`, `avg_velocity`, `avg_size`, `avg_color`, `cctv_id`, `space_id`, `end_time`, `start_time`, `duration`)
VALUES
	(1,'/media/video/1/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A5test1.txt','/media/log/1/log1.csv',49,49,51.1020408163265,51.3673469387755,51286.1224489796,1,1,'2017-01-01 02:00:00.000000','2017-01-01 01:00:00.000000','3600'),
	(2,'/media/video/2/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A5test2.txt','/media/log/2/log2.csv',49,49,44.6122448979592,47.1224489795918,47298.5306122449,2,2,'2017-01-02 14:00:00.000000','2017-01-02 13:00:00.000000','3600'),
	(3,'/media/video/3/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A5test3.txt','/media/log/3/log3.csv',49,49,52.8775510204082,61.8571428571429,47700.2040816327,3,3,'2017-01-03 03:00:00.000000','2017-01-03 02:00:00.000000','3600'),
	(4,'/media/video/4/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A5test4.txt','/media/log/4/log4.csv',49,19,46.0204081632653,56.7551020408163,50852.8775510204,5,4,'2017-01-04 02:00:00.000000','2017-01-04 01:00:00.000000','3600'),
	(5,'/media/video/9/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A5test5.txt','/media/log/9/log5.csv',49,19,54.6122448979592,54.5510204081633,50314.3673469388,7,9,'2017-01-05 14:01:00.000000','2017-01-05 13:01:00.000000','3600'),
	(6,'/media/video/10/%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%AE%E1%86%A8%E1%84%8B%E1%85%A5test6.mp4','/media/log/10/log6.csv',49,19,45.1836734693878,50.0204081632653,55597.8775510204,7,10,'2017-01-06 02:03:00.000000','2017-01-06 01:03:00.000000','3600');

/*!40000 ALTER TABLE `management_video` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;