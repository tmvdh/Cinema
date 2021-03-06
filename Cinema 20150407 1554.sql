-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cinema
--

CREATE DATABASE IF NOT EXISTS cinema;
USE cinema;

--
-- Definition of table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE `films` (
  `Film_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Year` year(4) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Runtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Film_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `films`
--

/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` (`Film_ID`,`Title`,`Year`,`Description`,`Runtime`) VALUES 
 (1,'Harry Potter and the Philosopher\'s Stone',2001,'Harry learns that he\'s a wizard!',159),
 (2,'Harry Potter and the Chamber of Secrets',2002,'Snakes!',174),
 (3,'Harry Potter and the Prisoner of Azkaban',2003,'Something wicked this way comes!',142);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;


--
-- Definition of table `screens`
--

DROP TABLE IF EXISTS `screens`;
CREATE TABLE `screens` (
  `Screen_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Seats` int(10) unsigned NOT NULL,
  `Width` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Screen_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screens`
--

/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` (`Screen_ID`,`Seats`,`Width`) VALUES 
 (1,180,15),
 (2,180,15),
 (3,225,15),
 (4,300,15),
 (5,270,15);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;


--
-- Definition of table `shows`
--

DROP TABLE IF EXISTS `shows`;
CREATE TABLE `shows` (
  `Show_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Film_ID` int(10) unsigned NOT NULL,
  `Screen_ID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`Show_ID`),
  KEY `FK_film` (`Film_ID`),
  KEY `FK_screen` (`Screen_ID`),
  CONSTRAINT `FK_film` FOREIGN KEY (`Film_ID`) REFERENCES `films` (`Film_ID`),
  CONSTRAINT `FK_screen` FOREIGN KEY (`Screen_ID`) REFERENCES `screens` (`Screen_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows`
--

/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` (`Show_ID`,`Film_ID`,`Screen_ID`,`Time`) VALUES 
 (1,2,1,'2015-04-08 20:00:00'),
 (2,1,3,'2015-04-08 20:00:00'),
 (3,3,2,'2015-04-08 20:00:00'),
 (4,3,1,'2015-04-08 20:00:00'),
 (5,3,2,'2015-04-08 20:00:00'),
 (6,1,2,'2015-04-07 19:45:00'),
 (7,2,1,'2015-04-07 14:00:00'),
 (8,2,1,'2015-04-07 15:15:00');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;


--
-- Definition of table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `Ticket_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` int(10) unsigned NOT NULL,
  `Show_ID` int(10) unsigned NOT NULL,
  `Seat` int(10) unsigned NOT NULL,
  `Barcode` varchar(20) NOT NULL,
  PRIMARY KEY (`Ticket_ID`),
  KEY `FK_show` (`Show_ID`),
  KEY `FK_user` (`User_ID`),
  CONSTRAINT `FK_show` FOREIGN KEY (`Show_ID`) REFERENCES `shows` (`Show_ID`),
  CONSTRAINT `FK_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`Ticket_ID`,`User_ID`,`Show_ID`,`Seat`,`Barcode`) VALUES 
 (1,1,2,50,''),
 (9,13,1,100,'63QY7FDWIYA53PCEH0T7'),
 (10,14,1,43,'OIFGGU9P9X5WFNPS77OG'),
 (11,15,1,37,'ZGC3EX3KY02DQ9T1K0Y0'),
 (12,16,1,83,'VO8IMSEVGS1FCCNJXI37'),
 (13,17,3,68,'0KPPPL3J9BJE2MM9RSHZ'),
 (14,18,1,80,'TSKNR4VGOGJXG3A7NPY2'),
 (15,19,2,70,'T1OWAKWFKPVATJPS3QD3'),
 (16,20,3,175,'JEM6YDNR1O8YDQRMK3F9'),
 (17,21,2,127,'03HT3K9Q5S0H6TJTAZZW'),
 (18,22,1,1,'TYKSOQ60KTD2I7MKU6RD'),
 (19,23,1,2,'15O969YL2FBAKE0PBSFH'),
 (20,24,1,3,'ZPV3470JXCZL7XC0E60A'),
 (21,25,1,4,'VJNSXWO0DKWL9S36UETW');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `User_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fname` varchar(45) NOT NULL,
  `Sname` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`User_ID`,`Fname`,`Sname`,`Email`) VALUES 
 (1,'Tom','Vanderheijden','tom@dftba.eu'),
 (13,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (14,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (15,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (16,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (17,'Tom','Vanderheijden','tom@dftba.eu'),
 (18,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (19,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (20,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (21,'Tom','Vanderheijden','tom@dftba.eu'),
 (22,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (23,'Tom','Vanderheijden','tomvanderheijden@gmail.com'),
 (24,'Tom','Vanderheijden','tom@dftba.eu'),
 (25,'Tom','Vanderheijden','tom@dftba.eu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
