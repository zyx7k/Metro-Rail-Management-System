-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: metro
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ASSIGNED_TO`
--

DROP TABLE IF EXISTS `ASSIGNED_TO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSIGNED_TO` (
  `MetroCard` int(11) NOT NULL,
  `Passenger` int(11) NOT NULL,
  `StationOfIssue` int(11) NOT NULL,
  `DateOfIssue` date DEFAULT NULL,
  PRIMARY KEY (`MetroCard`,`StationOfIssue`,`Passenger`),
  KEY `StationOfIssue` (`StationOfIssue`),
  KEY `Passenger` (`Passenger`),
  CONSTRAINT `ASSIGNED_TO_ibfk_1` FOREIGN KEY (`MetroCard`) REFERENCES `METRO_CARD` (`CardNumber`),
  CONSTRAINT `ASSIGNED_TO_ibfk_2` FOREIGN KEY (`StationOfIssue`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE,
  CONSTRAINT `ASSIGNED_TO_ibfk_3` FOREIGN KEY (`Passenger`) REFERENCES `PASSENGER` (`PassengerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGNED_TO`
--

LOCK TABLES `ASSIGNED_TO` WRITE;
/*!40000 ALTER TABLE `ASSIGNED_TO` DISABLE KEYS */;
INSERT INTO `ASSIGNED_TO` VALUES
(1234567890,18,2,'2021-07-06'),
(1234567891,1,1,'2022-01-18'),
(1234567892,19,4,'2024-01-05');
/*!40000 ALTER TABLE `ASSIGNED_TO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREATE_TXN`
--

DROP TABLE IF EXISTS `CREATE_TXN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREATE_TXN` (
  `Passenger` int(11) NOT NULL,
  `MetroCard` int(11) NOT NULL,
  `Station` int(11) NOT NULL,
  `Transaction` int(11) NOT NULL,
  PRIMARY KEY (`Passenger`,`MetroCard`,`Station`,`Transaction`),
  KEY `MetroCard` (`MetroCard`),
  KEY `Station` (`Station`),
  KEY `Transaction` (`Transaction`),
  CONSTRAINT `CREATE_TXN_ibfk_1` FOREIGN KEY (`Passenger`) REFERENCES `PASSENGER` (`PassengerID`) ON DELETE CASCADE,
  CONSTRAINT `CREATE_TXN_ibfk_2` FOREIGN KEY (`MetroCard`) REFERENCES `METRO_CARD` (`CardNumber`) ON DELETE CASCADE,
  CONSTRAINT `CREATE_TXN_ibfk_3` FOREIGN KEY (`Station`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE,
  CONSTRAINT `CREATE_TXN_ibfk_4` FOREIGN KEY (`Transaction`) REFERENCES `TRANSACTION` (`TxnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREATE_TXN`
--

LOCK TABLES `CREATE_TXN` WRITE;
/*!40000 ALTER TABLE `CREATE_TXN` DISABLE KEYS */;
INSERT INTO `CREATE_TXN` VALUES
(18,1234567890,1,50005),
(18,1234567890,1,50006),
(18,1234567890,2,50003),
(18,1234567890,2,50004),
(18,1234567890,2,50009),
(18,1234567890,4,50000),
(18,1234567890,5,50001),
(18,1234567890,5,50002),
(18,1234567890,9,50007),
(18,1234567890,9,50008),
(1,1234567891,1,50011),
(1,1234567891,1,50012),
(1,1234567891,2,50010),
(1,1234567891,2,50015),
(1,1234567891,9,50013),
(1,1234567891,9,50014);
/*!40000 ALTER TABLE `CREATE_TXN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EATERY`
--

DROP TABLE IF EXISTS `EATERY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EATERY` (
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `StationID` int(11) NOT NULL,
  `AveragePrice` decimal(10,2) DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `NonVegOptions` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Name`,`Location`,`StationID`),
  KEY `StationID` (`StationID`),
  CONSTRAINT `EATERY_ibfk_1` FOREIGN KEY (`StationID`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`Rating` >= 0 and `Rating` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EATERY`
--

LOCK TABLES `EATERY` WRITE;
/*!40000 ALTER TABLE `EATERY` DISABLE KEYS */;
INSERT INTO `EATERY` VALUES
('BurgerKing','MainEntrance',9,350.00,2.80,0),
('BurgerKing','TicketCounter',6,377.77,2.14,1),
('Dominos','MainEntrance',8,102.83,3.49,0),
('Dominos','Underpass',8,352.31,2.95,0),
('Haldirams','MainEntrance',1,320.23,4.12,1),
('Haldirams','MainEntrance',8,150.91,3.67,1),
('Haldirams','MainExit',7,269.51,3.70,1),
('Haldirams','WaitingLounge',5,190.58,2.90,1),
('KarachiBakery','MainEntrance',5,168.10,2.89,0),
('KarachiBakery','TicketCounter',3,104.68,2.18,1),
('KarachiBakery','Underpass',11,295.77,5.00,1),
('KFC','MainEntrance',5,398.79,3.52,0),
('KFC','WaitingLounge',1,388.77,4.29,0),
('KSBakers','Rooftop',1,295.20,3.94,1),
('KSBakers','Underpass',4,359.43,4.70,1),
('McDonalds','MainEntrance',12,261.80,2.58,1),
('MojoPizza','Underpass',1,192.67,4.13,0),
('OvenStory','TicketCounter',2,149.10,4.26,1),
('OvenStory','TicketCounter',6,350.00,2.30,1),
('PizzaHut','MainExit',4,101.81,2.60,1),
('PizzaHut','Underpass',1,307.86,4.72,1),
('PizzaHut','WaitingLounge',6,112.87,3.07,0),
('Wendys','TicketCounter',10,353.83,3.31,0),
('Wendys','WaitingLounge',12,311.44,3.12,1);
/*!40000 ALTER TABLE `EATERY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EATERY_ITEMS`
--

DROP TABLE IF EXISTS `EATERY_ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EATERY_ITEMS` (
  `ItemName` varchar(255) NOT NULL,
  `EateryName` varchar(255) NOT NULL,
  `EateryLocation` int(11) NOT NULL,
  PRIMARY KEY (`ItemName`,`EateryName`,`EateryLocation`),
  KEY `EateryName` (`EateryName`),
  KEY `EateryLocation` (`EateryLocation`),
  CONSTRAINT `EATERY_ITEMS_ibfk_1` FOREIGN KEY (`EateryName`) REFERENCES `EATERY` (`Name`),
  CONSTRAINT `EATERY_ITEMS_ibfk_2` FOREIGN KEY (`EateryLocation`) REFERENCES `EATERY` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EATERY_ITEMS`
--

LOCK TABLES `EATERY_ITEMS` WRITE;
/*!40000 ALTER TABLE `EATERY_ITEMS` DISABLE KEYS */;
INSERT INTO `EATERY_ITEMS` VALUES
('Chocolate cake','MojoPizza',1),
('Panna cotta','Haldirams',1),
('Pizza','KFC',1),
('Potato chips','PizzaHut',1),
('Tea','Haldirams',1),
('Muffins','KarachiBakery',5),
('Tea','KarachiBakery',5),
('Bread rolls','PizzaHut',6),
('French toast','OvenStory',6),
('Vodka','BurgerKing',6),
('Whiskey','OvenStory',6),
('Croissants','Dominos',8),
('Vodka','BurgerKing',9),
('Pizza','McDonalds',12),
('Trail mix','McDonalds',12),
('Wine','McDonalds',12);
/*!40000 ALTER TABLE `EATERY_ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOLLOWS`
--

DROP TABLE IF EXISTS `FOLLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FOLLOWS` (
  `Train` int(11) NOT NULL,
  `LineID` int(11) NOT NULL,
  `Timetable` int(11) NOT NULL,
  PRIMARY KEY (`Train`,`LineID`,`Timetable`),
  KEY `LineID` (`LineID`),
  KEY `Timetable` (`Timetable`),
  CONSTRAINT `FOLLOWS_ibfk_1` FOREIGN KEY (`Train`) REFERENCES `TRAIN` (`TrainID`) ON DELETE CASCADE,
  CONSTRAINT `FOLLOWS_ibfk_2` FOREIGN KEY (`LineID`) REFERENCES `LINE` (`LineID`),
  CONSTRAINT `FOLLOWS_ibfk_3` FOREIGN KEY (`Timetable`) REFERENCES `TIMETABLE` (`EntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOLLOWS`
--

LOCK TABLES `FOLLOWS` WRITE;
/*!40000 ALTER TABLE `FOLLOWS` DISABLE KEYS */;
INSERT INTO `FOLLOWS` VALUES
(1,1,2),
(1,1,8),
(1,1,11),
(1,1,31),
(1,1,34),
(1,1,40),
(1,1,46),
(1,1,48),
(1,1,50),
(1,1,58),
(1,1,59),
(1,1,60),
(1,1,61),
(1,1,80),
(2,1,42),
(2,1,46),
(3,1,5),
(3,1,17),
(3,1,23),
(3,1,26),
(3,1,44),
(3,1,54),
(3,1,66),
(4,1,14),
(4,1,17),
(5,1,31),
(5,1,36),
(5,1,47),
(5,1,48),
(5,1,68),
(5,1,79),
(6,1,9),
(6,1,26),
(6,1,32),
(6,1,61),
(6,1,74),
(7,1,10),
(7,1,22),
(7,1,31),
(7,1,40),
(7,1,45),
(7,1,53),
(7,1,78),
(8,1,13),
(8,1,35),
(8,1,41),
(8,1,63),
(9,1,1),
(9,1,13),
(9,1,47),
(9,1,59),
(9,1,80),
(1,2,22),
(1,2,34),
(1,2,60),
(2,2,69),
(3,2,3),
(3,2,22),
(3,2,33),
(4,2,7),
(4,2,25),
(4,2,37),
(5,2,4),
(5,2,79),
(6,2,46),
(7,2,6),
(7,2,17),
(7,2,31),
(7,2,64),
(7,2,76),
(8,2,14),
(8,2,21),
(8,2,62),
(9,2,52),
(1,3,14),
(1,3,49),
(2,3,8),
(2,3,59),
(2,3,62),
(3,3,74),
(4,3,13),
(4,3,43),
(4,3,50),
(4,3,51),
(4,3,70),
(5,3,10),
(5,3,41),
(5,3,76),
(6,3,13),
(6,3,67),
(7,3,48),
(8,3,25),
(8,3,49),
(8,3,80),
(9,3,17);
/*!40000 ALTER TABLE `FOLLOWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINE`
--

DROP TABLE IF EXISTS `LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LINE` (
  `LineID` int(11) NOT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `TotalTravelTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`LineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINE`
--

LOCK TABLES `LINE` WRITE;
/*!40000 ALTER TABLE `LINE` DISABLE KEYS */;
INSERT INTO `LINE` VALUES
(1,'red','Hyderabad',77),
(2,'green','Hyderabad',84),
(3,'blue','Hyderabad',69);
/*!40000 ALTER TABLE `LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `METRO_CARD`
--

DROP TABLE IF EXISTS `METRO_CARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `METRO_CARD` (
  `CardNumber` int(11) NOT NULL AUTO_INCREMENT,
  `AvailableBalance` decimal(10,2) DEFAULT NULL,
  `Validity` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CardNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=1234567902 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `METRO_CARD`
--

LOCK TABLES `METRO_CARD` WRITE;
/*!40000 ALTER TABLE `METRO_CARD` DISABLE KEYS */;
INSERT INTO `METRO_CARD` VALUES
(1234567890,2520.71,'2023-03-21','Expired'),
(1234567891,2399.81,'2022-07-09','Expired'),
(1234567892,539.08,'2024-09-16','Expired'),
(1234567893,1671.37,'2024-03-31','Expired'),
(1234567894,2181.50,'2022-01-14','Expired'),
(1234567895,846.83,'2022-08-09','Expired'),
(1234567896,639.63,'2024-06-24','Active'),
(1234567897,229.29,'2025-11-11','Blocked'),
(1234567898,331.26,'2025-02-16','Blocked'),
(1234567899,1563.92,'2023-07-15','Expired'),
(1234567900,1463.12,'2023-06-07','Expired'),
(1234567901,2384.70,'2024-11-07','Active');
/*!40000 ALTER TABLE `METRO_CARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASSENGER`
--

DROP TABLE IF EXISTS `PASSENGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASSENGER` (
  `PassengerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNo` bigint(20) DEFAULT NULL,
  `Privilege` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSENGER`
--

LOCK TABLES `PASSENGER` WRITE;
/*!40000 ALTER TABLE `PASSENGER` DISABLE KEYS */;
INSERT INTO `PASSENGER` VALUES
(1,'Dhriti','N','Seth','1946-08-24',9991605193,'SeniorCitizen'),
(2,'Arav','H','Pratap','1916-09-17',7593128504,'Student'),
(3,'Mallikarjun','N','Tiwari','1937-01-15',9731879457,'Regular'),
(4,'Jiabur','I','Gupta','1995-08-30',6766764652,'Student'),
(5,'Price','W','Gupta','1914-12-14',8285623395,'Premium'),
(6,'Uday','S','Bhan','2019-12-10',7027735377,'Student'),
(7,'Murali','P','Krishna','2000-10-08',8963877087,'Regular'),
(8,'Swamy','Y','Kumari','1933-08-13',9410456398,'Premium'),
(9,'Classic','M','Divedi','1952-05-11',9541702296,'Student'),
(10,'Visram','M','Seth','1929-08-02',9913266710,'SeniorCitizen'),
(11,'Zahid','Q','Yadav','1940-08-05',6718765648,'Premium'),
(12,'Sakaram','L','Sonkar','1955-04-14',8078690081,'SeniorCitizen'),
(13,'Vasudevan','I','Singh','1962-09-23',9575431066,'Premium'),
(14,'Bharvad','N','Rao','1939-04-22',6684525282,'SeniorCitizen'),
(15,'Lakesh','E','Divedi','1924-09-08',6315797222,'Premium'),
(16,'Malkit','T','Divedi','1954-12-22',9268326289,'Student'),
(17,'Magar','T','Tiwari','1977-07-06',8213117214,'Premium'),
(18,'Nawaj','W','Pandit','2004-06-17',7271194318,'Regular'),
(19,'Shahnoor','G','Kumar','1957-04-23',7857104188,'Regular');
/*!40000 ALTER TABLE `PASSENGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATION`
--

DROP TABLE IF EXISTS `STATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATION` (
  `StationID` int(11) NOT NULL AUTO_INCREMENT,
  `Area` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `PlatformCount` int(11) DEFAULT NULL,
  `DateOfEstablishment` date DEFAULT NULL,
  `Administrator` int(11) DEFAULT NULL,
  PRIMARY KEY (`StationID`),
  KEY `Administrator` (`Administrator`),
  CONSTRAINT `STATION_ibfk_1` FOREIGN KEY (`Administrator`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATION`
--

LOCK TABLES `STATION` WRITE;
/*!40000 ALTER TABLE `STATION` DISABLE KEYS */;
INSERT INTO `STATION` VALUES
(1,'LBNagar','Hyderabad','Telangana',2,'2011-10-27',1),
(2,'MGBusStation','Hyderabad','Telangana',4,'2007-04-14',1),
(3,'Ameerpet','Hyderabad','Telangana',2,'2021-09-20',1),
(4,'Miyapur','Hyderabad','Telangana',6,'2019-02-22',1),
(5,'Falakuma','Hyderabad','Telangana',7,'2020-08-07',4),
(6,'ParadeGround','Hyderabad','Telangana',8,'2018-04-07',4),
(7,'Charminar','Hyderabad','Telangana',7,'2019-05-17',1),
(8,'Kukatpally','Hyderabad','Telangana',6,'2020-02-05',3),
(9,'Nagole','Hyderabad','Telangana',7,'2019-01-11',3),
(10,'Begumpet','Hyderabad','Telangana',4,'2004-10-11',4),
(11,'HITechCity','Hyderabad','Telangana',2,'2018-04-21',3),
(12,'RaiDurg','Hyderabad','Telangana',8,'2015-08-12',1),
(13,'Gachibowli','Hyderabad','Telangana',2,'2023-12-01',1);
/*!40000 ALTER TABLE `STATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATION_MASTER`
--

DROP TABLE IF EXISTS `STATION_MASTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATION_MASTER` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNo` bigint(20) DEFAULT NULL,
  `WorksIn` int(11) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `WorksIn` (`WorksIn`),
  CONSTRAINT `STATION_MASTER_ibfk_1` FOREIGN KEY (`WorksIn`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATION_MASTER`
--

LOCK TABLES `STATION_MASTER` WRITE;
/*!40000 ALTER TABLE `STATION_MASTER` DISABLE KEYS */;
INSERT INTO `STATION_MASTER` VALUES
(1,'Chitrasen','S','Srivastav','2007-12-29',7108963489,4,'2023-10-09'),
(2,'Suseel','D','Yadav','1978-03-06',7797505270,10,'2018-04-25'),
(3,'Vivek','J','Rai','1986-07-16',9631196740,5,'2018-07-19'),
(4,'Babali','I','Vishwakarma','2023-06-26',8802485781,1,'2013-11-26'),
(5,'Sahajad','H','Yadav','2006-06-23',9264851073,3,'2010-01-05'),
(6,'Jamini','Q','Singh','2002-11-27',9381403522,4,'2023-08-11'),
(7,'Kapila','N','Pandey','2002-04-19',8656417307,2,'2010-12-24'),
(8,'Hrithik','V','Sonkar','1931-08-05',7105864370,6,'2020-05-06'),
(9,'Kameswar','D','Thakur','1976-10-17',8727260075,8,'2018-12-07'),
(10,'Aas','I','Gupta','1970-10-26',9941087355,9,'2020-03-31');
/*!40000 ALTER TABLE `STATION_MASTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STOPS_AT`
--

DROP TABLE IF EXISTS `STOPS_AT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOPS_AT` (
  `Train` int(11) NOT NULL,
  `Station` int(11) NOT NULL,
  PRIMARY KEY (`Train`,`Station`),
  KEY `Station` (`Station`),
  CONSTRAINT `STOPS_AT_ibfk_1` FOREIGN KEY (`Train`) REFERENCES `TRAIN` (`TrainID`) ON DELETE CASCADE,
  CONSTRAINT `STOPS_AT_ibfk_2` FOREIGN KEY (`Station`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STOPS_AT`
--

LOCK TABLES `STOPS_AT` WRITE;
/*!40000 ALTER TABLE `STOPS_AT` DISABLE KEYS */;
INSERT INTO `STOPS_AT` VALUES
(7,1),
(2,2),
(7,2),
(7,3),
(7,4),
(2,5),
(2,6),
(4,6),
(7,8),
(4,9),
(4,10);
/*!40000 ALTER TABLE `STOPS_AT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKET` (
  `TicketID` int(11) NOT NULL AUTO_INCREMENT,
  `Source` int(11) DEFAULT NULL,
  `Destination` int(11) DEFAULT NULL,
  `TimeOfPurchase` datetime DEFAULT NULL,
  `PassengerID` int(11) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `Source` (`Source`),
  KEY `Destination` (`Destination`),
  CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `PASSENGER` (`PassengerID`) ON DELETE CASCADE,
  CONSTRAINT `TICKET_ibfk_2` FOREIGN KEY (`Source`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE,
  CONSTRAINT `TICKET_ibfk_3` FOREIGN KEY (`Destination`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES
(1000,4,10,'2020-09-19 18:16:54',5,10.00),
(1001,5,6,'2020-08-01 21:16:56',8,20.00),
(1002,6,2,'2023-04-26 08:46:08',7,30.00),
(1003,6,1,'2020-12-06 23:15:14',6,40.00),
(1004,8,2,'2018-02-22 22:05:33',16,60.00),
(1005,6,3,'2018-05-17 00:00:11',6,20.00),
(1006,1,9,'2015-04-07 00:15:34',19,40.00),
(1007,2,4,'2022-07-23 18:35:38',19,10.00),
(1008,8,12,'2018-11-20 00:04:49',10,70.00),
(1009,11,6,'2022-05-09 14:24:54',3,50.00),
(1010,11,10,'2017-11-21 21:47:00',19,30.00),
(1011,4,10,'2022-09-12 01:53:41',13,40.00),
(1012,3,11,'2023-09-24 12:02:53',2,20.00),
(1013,8,1,'2015-01-27 11:40:00',6,10.00),
(1014,1,7,'2021-11-21 08:56:53',5,20.00),
(1015,9,10,'2017-10-15 03:34:44',1,50.00),
(1016,7,4,'2016-03-03 12:12:52',19,60.00),
(1017,6,1,'2016-07-15 15:45:41',13,60.00),
(1018,3,10,'2016-06-12 01:44:38',5,40.00),
(1019,5,4,'2019-11-07 01:09:39',1,30.00),
(1020,1,4,'2023-12-04 05:00:00',2,NULL);
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIMETABLE`
--

DROP TABLE IF EXISTS `TIMETABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIMETABLE` (
  `EntryID` int(11) NOT NULL AUTO_INCREMENT,
  `Station` int(11) DEFAULT NULL,
  `TimeOfArrival` time DEFAULT NULL,
  `TimeOfDeparture` time DEFAULT NULL,
  PRIMARY KEY (`EntryID`),
  KEY `Station` (`Station`),
  CONSTRAINT `TIMETABLE_ibfk_1` FOREIGN KEY (`Station`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIMETABLE`
--

LOCK TABLES `TIMETABLE` WRITE;
/*!40000 ALTER TABLE `TIMETABLE` DISABLE KEYS */;
INSERT INTO `TIMETABLE` VALUES
(1,2,'18:39:13','18:40:13'),
(2,6,'03:28:48','03:31:48'),
(3,4,'13:49:07','13:52:07'),
(4,11,'06:30:04','06:32:04'),
(5,12,'23:13:35','23:16:35'),
(6,5,'22:16:24','22:18:24'),
(7,7,'06:00:01','06:01:01'),
(8,8,'05:11:06','05:14:06'),
(9,5,'17:58:18','18:01:18'),
(10,8,'05:52:17','05:55:17'),
(11,7,'02:51:08','02:52:08'),
(12,1,'02:42:13','02:45:13'),
(13,10,'17:18:20','17:19:20'),
(14,5,'02:06:10','02:08:10'),
(15,6,'23:10:33','23:11:33'),
(16,5,'08:52:24','08:53:24'),
(17,7,'13:15:45','13:16:45'),
(18,7,'07:09:30','07:11:30'),
(19,2,'13:19:59','13:22:59'),
(20,8,'06:48:47','06:51:47'),
(21,1,'15:33:50','15:34:50'),
(22,4,'11:06:20','11:09:20'),
(23,7,'08:09:37','08:12:37'),
(24,1,'02:59:46','03:02:46'),
(25,7,'15:09:41','15:11:41'),
(26,3,'11:56:44','11:58:44'),
(27,6,'00:45:04','00:48:04'),
(28,6,'12:56:50','12:59:50'),
(29,12,'19:51:04','19:52:04'),
(30,3,'02:52:17','02:53:17'),
(31,5,'00:08:08','00:10:08'),
(32,10,'01:36:55','01:38:55'),
(33,4,'09:03:44','09:05:44'),
(34,9,'22:23:44','22:25:44'),
(35,4,'17:44:19','17:47:19'),
(36,5,'19:10:09','19:12:09'),
(37,7,'10:39:24','10:41:24'),
(38,3,'13:42:40','13:43:40'),
(39,7,'22:14:58','22:15:58'),
(40,3,'07:27:50','07:28:50'),
(41,9,'15:54:04','15:55:04'),
(42,8,'10:10:48','10:11:48'),
(43,6,'07:04:40','07:06:40'),
(44,11,'15:55:21','15:58:21'),
(45,8,'22:29:57','22:30:57'),
(46,8,'09:38:54','09:39:54'),
(47,4,'10:20:04','10:23:04'),
(48,7,'04:55:22','04:56:22'),
(49,10,'14:04:57','14:07:57'),
(50,1,'00:45:56','00:46:56'),
(51,5,'09:31:09','09:33:09'),
(52,2,'20:05:11','20:07:11'),
(53,9,'03:15:50','03:17:50'),
(54,11,'15:32:30','15:35:30'),
(55,7,'21:42:10','21:43:10'),
(56,11,'17:59:24','18:00:24'),
(57,3,'06:13:21','06:14:21'),
(58,2,'21:39:00','21:42:00'),
(59,12,'13:07:10','13:09:10'),
(60,10,'03:38:12','03:39:12'),
(61,5,'21:36:11','21:39:11'),
(62,9,'03:41:59','03:44:59'),
(63,11,'17:58:39','18:00:39'),
(64,8,'08:27:33','08:29:33'),
(65,11,'05:00:35','05:03:35'),
(66,6,'10:05:23','10:06:23'),
(67,10,'03:03:35','03:05:35'),
(68,6,'21:37:24','21:38:24'),
(69,7,'18:12:17','18:14:17'),
(70,10,'21:12:59','21:13:59'),
(71,12,'03:36:59','03:38:59'),
(72,3,'00:09:01','00:10:01'),
(73,1,'02:35:53','02:37:53'),
(74,3,'22:43:25','22:46:25'),
(75,10,'12:49:49','12:51:49'),
(76,11,'03:37:27','03:39:27'),
(77,9,'09:33:51','09:34:51'),
(78,7,'21:15:45','21:17:45'),
(79,11,'05:44:42','05:46:42'),
(80,12,'13:14:11','13:17:11');
/*!40000 ALTER TABLE `TIMETABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAIN`
--

DROP TABLE IF EXISTS `TRAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAIN` (
  `TrainID` int(11) NOT NULL AUTO_INCREMENT,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `EngineModel` varchar(255) DEFAULT NULL,
  `CoachCount` int(11) DEFAULT NULL,
  `ServiceYears` int(11) DEFAULT NULL,
  PRIMARY KEY (`TrainID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAIN`
--

LOCK TABLES `TRAIN` WRITE;
/*!40000 ALTER TABLE `TRAIN` DISABLE KEYS */;
INSERT INTO `TRAIN` VALUES
(1,348,'PX48A9',15,10),
(2,327,'C7233TYK',7,1),
(3,123,'U0GHIGZP',13,9),
(4,335,'GIT5X',6,4),
(5,211,'SH312OLU',5,7),
(6,362,'DP3BZCDY',9,6),
(7,420,'HSC466TS',13,1),
(8,222,'CNJVS1W',6,4),
(9,174,'KY1BYFG',7,7);
/*!40000 ALTER TABLE `TRAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAIN_DRIVER`
--

DROP TABLE IF EXISTS `TRAIN_DRIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAIN_DRIVER` (
  `DriverID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNo` bigint(20) DEFAULT NULL,
  `TrainID` int(11) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  PRIMARY KEY (`DriverID`),
  KEY `TrainID` (`TrainID`),
  CONSTRAINT `TRAIN_DRIVER_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `TRAIN` (`TrainID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAIN_DRIVER`
--

LOCK TABLES `TRAIN_DRIVER` WRITE;
/*!40000 ALTER TABLE `TRAIN_DRIVER` DISABLE KEYS */;
INSERT INTO `TRAIN_DRIVER` VALUES
(1,'Nagendra','Q','Singh','2009-11-14',6970423230,9,'2010-04-07'),
(2,'Kinu','A','Mishra','1990-03-15',9602552501,1,'2011-04-08'),
(3,'Bhumihar','Z','Yadav','1913-11-06',8163825318,8,'2017-01-25'),
(4,'Umanath','I','Gupta','1952-01-25',6017922459,4,'2018-02-01'),
(5,'Bindash','L','Mishra','1945-08-04',9417675846,2,'2014-12-01'),
(6,'Virander','L','Rao','2016-04-21',9552082602,7,'2011-09-21'),
(7,'Sankar','M','Srivastav','1979-02-26',7596273016,3,'2021-04-30'),
(8,'Rajnish','R','Kumar','2018-12-06',9389418880,5,'2023-01-08');
/*!40000 ALTER TABLE `TRAIN_DRIVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAIN_STOPS`
--

DROP TABLE IF EXISTS `TRAIN_STOPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAIN_STOPS` (
  `LineID` int(11) NOT NULL,
  `StopName` int(11) NOT NULL,
  `StopNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`LineID`,`StopName`),
  KEY `StopName` (`StopName`),
  CONSTRAINT `TRAIN_STOPS_ibfk_1` FOREIGN KEY (`LineID`) REFERENCES `LINE` (`LineID`),
  CONSTRAINT `TRAIN_STOPS_ibfk_2` FOREIGN KEY (`StopName`) REFERENCES `STATION` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAIN_STOPS`
--

LOCK TABLES `TRAIN_STOPS` WRITE;
/*!40000 ALTER TABLE `TRAIN_STOPS` DISABLE KEYS */;
INSERT INTO `TRAIN_STOPS` VALUES
(1,1,0),
(1,2,1),
(1,3,2),
(1,8,3),
(2,2,1),
(2,5,0),
(2,6,2),
(3,3,3),
(3,6,1),
(3,9,0),
(3,10,2),
(3,11,4),
(3,12,5);
/*!40000 ALTER TABLE `TRAIN_STOPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTION`
--

DROP TABLE IF EXISTS `TRANSACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACTION` (
  `TxnID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeOfEntry` datetime DEFAULT NULL,
  `SwipeType` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`TxnID`)
) ENGINE=InnoDB AUTO_INCREMENT=50049 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTION`
--

LOCK TABLES `TRANSACTION` WRITE;
/*!40000 ALTER TABLE `TRANSACTION` DISABLE KEYS */;
INSERT INTO `TRANSACTION` VALUES
(50000,'2022-01-11 21:16:20',0),
(50001,'2022-01-11 21:28:22',1),
(50002,'2022-01-09 20:31:56',1),
(50003,'2022-01-09 20:53:03',0),
(50004,'2022-07-04 18:45:24',0),
(50005,'2022-07-04 19:25:24',1),
(50006,'2021-05-22 02:30:56',1),
(50007,'2021-05-22 03:17:17',0),
(50008,'2022-04-26 16:03:37',1),
(50009,'2020-05-19 16:05:32',1),
(50010,'2020-05-19 16:23:15',0),
(50011,'2022-09-21 16:39:26',0),
(50012,'2022-09-21 17:29:46',1),
(50013,'2021-01-16 10:12:06',0),
(50014,'2020-12-10 02:44:59',0),
(50015,'2021-10-18 00:01:50',1),
(50016,'2021-10-18 00:44:27',0),
(50017,'2022-05-04 03:34:55',0),
(50018,'2023-08-01 04:18:10',0),
(50019,'2023-08-01 04:40:49',1),
(50020,'2023-02-21 03:51:46',0),
(50021,'2023-02-21 04:03:57',1),
(50022,'2022-01-08 12:46:33',0),
(50023,'2021-06-03 19:27:06',0),
(50024,'2020-01-16 18:52:35',0),
(50025,'2020-01-16 19:19:38',1),
(50026,'2023-05-01 18:34:06',1),
(50027,'2020-07-05 09:30:15',0),
(50028,'2020-07-05 10:03:25',1),
(50029,'2020-04-15 08:41:57',0),
(50030,'2020-04-15 09:14:10',1),
(50031,'2020-06-03 21:18:04',0),
(50032,'2020-11-20 10:52:06',0),
(50033,'2023-07-09 22:12:13',0),
(50034,'2023-07-09 22:30:57',1),
(50035,'2022-04-09 16:20:07',0),
(50036,'2022-04-09 17:05:57',1),
(50037,'2020-10-16 03:05:18',1),
(50038,'2020-10-16 03:31:56',0),
(50039,'2023-03-19 06:04:47',0),
(50040,'2022-06-29 21:12:54',0),
(50041,'2022-06-29 21:55:16',1),
(50042,'2020-11-23 22:23:26',0),
(50043,'2020-11-23 22:55:38',1),
(50044,'2022-04-24 22:56:04',1),
(50045,'2022-04-24 23:36:36',0),
(50046,'2021-10-06 22:07:25',1),
(50047,'2021-10-06 22:41:09',0),
(50048,'2022-02-24 07:23:27',1);
/*!40000 ALTER TABLE `TRANSACTION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03  5:07:05
