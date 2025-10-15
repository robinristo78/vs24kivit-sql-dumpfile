/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: vs24kivit_varunda
-- ------------------------------------------------------
-- Server version	11.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `AINE`
--

DROP TABLE IF EXISTS `AINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AINE` (
  `a_kood` int(4) NOT NULL AUTO_INCREMENT,
  `nimetus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`a_kood`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AINE`
--

LOCK TABLES `AINE` WRITE;
/*!40000 ALTER TABLE `AINE` DISABLE KEYS */;
INSERT INTO `AINE` VALUES
(1,'Kutsealane inglise keel'),
(2,'Adobe Illustratori kasutamine'),
(3,'Adobe Photoshopi kasutamine'),
(4,'Aedvilja ttlemise tehn.'),
(5,'Aedvilja ttlemise tehnoloogia'),
(6,'Ajalugu'),
(7,'Alternatiivsed kontoritpaketid'),
(8,'Andmebaasid'),
(9,'Andmebaaside alused'),
(10,'Andmebaaside projekteerimine'),
(11,'Andmebaaside projekteerimine ja haldus'),
(12,'Andmeturbe alused'),
(13,'Andmeturve'),
(14,'Andmettlus ja statistika'),
(15,'Arhiivinduse alused'),
(16,'Arvutipetus'),
(17,'Asjaajamine'),
(18,'Asjaajamisse alused'),
(19,'Avalik esinemine'),
(20,'Baarit'),
(21,'Betoonitd'),
(22,'Bioloogia'),
(23,'Catering'),
(24,'CCNA1-arvutivrkude alused'),
(25,'CCNA2-ruuterite ja marsruutimise alused'),
(26,'CCNA3-Kommunikatsiooni alused ja marsruutimine'),
(27,'CCNA4-Laivrgu tehnoloogiad'),
(28,'Dekoratiivviimistlus-tehnikad'),
(29,'Dieettoitlustamine'),
(30,'Dokumendi- ja arhiivihaldus'),
(31,'Dokumendihalduspraktika'),
(32,'Eelarveline raamatupidamine'),
(33,'Eesti keel'),
(34,'Eesti maastikud'),
(35,'Eesti rekreatsioonigeograafia'),
(36,'Eesti turismigeograafia'),
(37,'Eesti kossteemid'),
(38,'Eetika alused'),
(39,'Ehitamise alused'),
(40,'Ehitamise phialused'),
(41,'Ehitiste konstruktsioonid'),
(42,'Ehituse alused'),
(43,'Ehituskonstruktsioonid'),
(44,'Ehitusmdistamine'),
(45,'Ehitusmdistamine ja mrkimine'),
(46,'Ehitusrenoveerimise alused'),
(47,'Ehitustriistad ja pinnattlus'),
(48,'e-kaubandus'),
(49,'Eksam'),
(50,'Eksamid, kursusetd'),
(51,'EL majandus ja tturg'),
(52,'Elektripetus'),
(53,'Elektroonika alused'),
(54,'Elektrotehnika'),
(55,'Elektrotehnika ja automaatika elemendid'),
(56,'Enesearengu kursus'),
(57,'Enesevljendus'),
(58,'Eriala toetav eesti keel'),
(59,'Eriala toetav inglise keel'),
(60,'Eriala toetav keh.kasv'),
(61,'Eriala toetav saksa keel'),
(62,'Eritoitumine'),
(63,'Esitluse loomine'),
(64,'Esitlusgraafika ja multimeedia'),
(65,'Esmaabi'),
(66,'e-teenused'),
(67,'Etikett'),
(68,'Ettevtlus ja turundus'),
(69,'Ettevtluse alused'),
(70,'Ettevttepraktika'),
(71,'EUCIPi eksamiks valmistumine'),
(72,'Euroopa turismigeograafia'),
(73,'Failihaldus'),
(74,'Finantsanals'),
(75,'Finantsraamatupidamine'),
(76,'Finantsraamatupidamine arvutil'),
(77,'Finantsvahendus'),
(78,'Fsika');
/*!40000 ALTER TABLE `AINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AINE_OPILANE`
--

DROP TABLE IF EXISTS `AINE_OPILANE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AINE_OPILANE` (
  `aine_kood` int(4) DEFAULT NULL,
  `o_isikukood` char(11) DEFAULT NULL,
  `opetaja_kood` char(11) DEFAULT NULL,
  `hinne` varchar(1) DEFAULT NULL,
  `kuupaev` date DEFAULT NULL,
  KEY `aine_kood` (`aine_kood`),
  KEY `o_isikukood` (`o_isikukood`),
  KEY `opetaja_kood` (`opetaja_kood`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AINE_OPILANE`
--

LOCK TABLES `AINE_OPILANE` WRITE;
/*!40000 ALTER TABLE `AINE_OPILANE` DISABLE KEYS */;
INSERT INTO `AINE_OPILANE` VALUES
(4,'48810242787','47004122783','3','2007-03-05'),
(5,'38810222497','37909122763','4','2007-03-05'),
(6,'38712062497','47001222783','4','2007-03-05'),
(7,'38911212491','47304122782','5','2007-03-05'),
(8,'38806062494','46604122785','5','2007-03-05'),
(9,'39006022497','35612122733','5','2007-03-05'),
(10,'49010262577','37709092783','5','2007-03-05'),
(11,'48910222497','47810122783','5','2007-03-05'),
(12,'49112162497','47309092783','3','2007-03-05'),
(13,'49012292493','46103122783','3','2007-03-05'),
(14,'48910212197','45903032783','3','2007-01-16'),
(15,'38811202495','37112042785','3','2007-01-16'),
(16,'38710022497','38011082783','5','2007-01-16'),
(17,'39212262427','47001012783','5','2007-01-16'),
(18,'38904292497','45008122783','5','2007-01-16'),
(19,'49111162497','47002122783','3','2007-01-16'),
(20,'38809262497','36902022783','4','2007-01-16'),
(21,'49107232497','47004122737','4','2007-01-16'),
(22,'38911222492','37405122789','4','2007-01-16'),
(23,'49009162497','45510042783','4','2007-01-16'),
(24,'39112312497','47012042686','5','2007-01-16'),
(25,'48901312397','35104042783','4','2007-01-16'),
(26,'38910262497','45806112783','3','2007-01-16'),
(27,'49011292497','47111122781','4','2007-01-16');
/*!40000 ALTER TABLE `AINE_OPILANE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPETAJA`
--

DROP TABLE IF EXISTS `OPETAJA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OPETAJA` (
  `opetaja_isikuk` char(11) NOT NULL DEFAULT '',
  `eesnimi` varchar(100) DEFAULT NULL,
  `perenimi` varchar(100) DEFAULT NULL,
  `juhend_grupp` int(4) DEFAULT NULL,
  PRIMARY KEY (`opetaja_isikuk`),
  KEY `juhend_grupp` (`juhend_grupp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPETAJA`
--

LOCK TABLES `OPETAJA` WRITE;
/*!40000 ALTER TABLE `OPETAJA` DISABLE KEYS */;
INSERT INTO `OPETAJA` VALUES
('47004122783','Olga','Kask',NULL),
('37909122763','Oliver','Kuusk',NULL),
('47001222783','Pille','Katus',NULL),
('47304122782','Piret','Siil',NULL),
('46604122785','Piret','Karu',NULL),
('35612122733','Priit','Rebane',NULL),
('37709092783','Priit','Jnes',NULL),
('47810122783','Sirje','Koer',NULL),
('47309092783','Sirje','Kass',NULL),
('46103122783','Sirje','Rebane',NULL),
('37112042785','Tarmo','Saar',NULL),
('38011082783','Tauno','Kuusik',NULL),
('45008122783','Thea','Tammik',NULL),
('47002122783','Tiina','Lilleaed',NULL),
('36902022783','Tiit','Lilleaed',NULL),
('37405122789','Toomas','Leht',NULL),
('45510042783','Triin','Oks',NULL),
('47012042686','Tuuliki','Kadaks',NULL),
('35104042783','Urmas','Okas',NULL),
('45806112783','Viia','Mgi',NULL),
('47111122781','Vilve','Org',NULL),
('45501042783','lle','Jgi',NULL),
('47304102783','Aime','Niit',NULL),
('47701042283','Aina','Jrv',NULL),
('46511252783','Aino','Oja',NULL),
('45109182783','Aita','Vihm',NULL),
('36308232783','Aivar','Tuul',NULL),
('37305122789','Aivar','Rand',NULL),
('37504302683','Aivar','Kastan',NULL),
('47612312783','Aivi','Prn',NULL),
('47011112278','Anne','Kuusik',NULL),
('36506242583','Ilmar','Kuusemets',NULL),
('37204022787','Imre','Juhe',NULL),
('37909122583','Indrek','Traat',NULL),
('37308142783','Juhan','Juurikas',NULL),
('45903032783','Sirje','Mnd',1),
('47001012783','Terje','Tamm',2),
('47004122737','Tiiu','Rohi',3),
('47210282884','Aile','Aas',4),
('37107072773','Andrus','Kaasik',5);
/*!40000 ALTER TABLE `OPETAJA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPILANE`
--

DROP TABLE IF EXISTS `OPILANE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OPILANE` (
  `isikukood` char(11) NOT NULL DEFAULT '',
  `eesnimi` varchar(100) DEFAULT NULL,
  `perenimi` varchar(100) DEFAULT NULL,
  `sugu` varchar(1) DEFAULT NULL,
  `o_aadress` varchar(100) DEFAULT NULL,
  `k_aadress` varchar(100) DEFAULT NULL,
  `telefon` int(20) DEFAULT NULL,
  `g_kood` int(4) DEFAULT NULL,
  PRIMARY KEY (`isikukood`),
  KEY `g_kood` (`g_kood`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPILANE`
--

LOCK TABLES `OPILANE` WRITE;
/*!40000 ALTER TABLE `OPILANE` DISABLE KEYS */;
INSERT INTO `OPILANE` VALUES
('38910262497','Kalle','Kohin','m','Tartu','Tartu',50789456,1),
('49011292497','Tiia','Tuisk','n','Tartu','Tallinn',0,2),
('49110362488','Pille','Pill','n','Tartu','Prnu',0,3),
('49010162558','Kati','Kask','n','Tartu','Vru',0,4),
('48910012697','Malle','Moos','n','Tartu','Otep',0,5),
('48810242787','Mari','Maasikas','n','Tartu','Rngu',0,1),
('38810222497','Joosep','Jalakas','m','Tartu','Tartu',0,2),
('38712062497','Tiit','Tikk','m','Tartu','Plva',0,3),
('38911212491','Ragnar','Roos','m','Tartu','Prnu',0,4),
('38806062494','Robert','Rohi','m','Tartu','Vru',0,5),
('39006022497','Kevin','Kivi','m','Tartu','Otep',0,1),
('49010262577','Sille','Siil','n','Tartu','Rngu',0,2),
('48910222497','Lilli','Lill','n','Tartu','Tartu',0,2),
('49112162497','Luisa','Tuul','n','Tartu','Valga',0,3),
('49012292493','Sandra','Saar','n','Tartu','Prnu',0,3),
('48910212197','Kadri','Kade','n','Tartu','Vru',0,4),
('38811202495','Vaiko','Kook','m','Tartu','Otep',0,5),
('38710022497','Veiko','Vesi','m','Tartu','Rngu',0,1),
('39212262427','Hannes','Hein','m','Tartu','Tartu',0,1),
('38904292497','Leo','Loots','m','Tartu','Plva',0,5),
('49111162497','Liia','Lips','n','Tartu','Prnu',0,2),
('38809262497','Kalev','Komm','m','Tartu','Vru',0,2),
('49107232497','Rita','Rehv','n','Tartu','Otep',0,2),
('38911222492','Janek','Jooksik','m','Tartu','Rngu',0,3),
('49009162497','Jane','Jnes','n','Tartu','Tartu',0,4),
('39112312497','Mart','Karu','m','Tartu','Plva',0,5),
('48901312397','Kati','Karummm','n','Tartu','Prnu',0,3),
('','Robin Risto','Kivit',NULL,NULL,NULL,NULL,6);
/*!40000 ALTER TABLE `OPILANE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OSAKOND`
--

DROP TABLE IF EXISTS `OSAKOND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OSAKOND` (
  `o_kood` int(3) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(100) DEFAULT NULL,
  `juhataja` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`o_kood`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OSAKOND`
--

LOCK TABLES `OSAKOND` WRITE;
/*!40000 ALTER TABLE `OSAKOND` DISABLE KEYS */;
INSERT INTO `OSAKOND` VALUES
(1,'IKT','Reet Arvuti'),
(2,'Toitlustamine','Juta Kk'),
(3,'Hotellimajandus','Tiia Maja'),
(4,'Puit','Kalle Kapp');
/*!40000 ALTER TABLE `OSAKOND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `O_GRUPP`
--

DROP TABLE IF EXISTS `O_GRUPP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `O_GRUPP` (
  `o_gr_kood` int(4) NOT NULL AUTO_INCREMENT,
  `o_gr_nimi` varchar(20) DEFAULT NULL,
  `nimi` varchar(100) DEFAULT NULL,
  `eriala` varchar(100) DEFAULT NULL,
  `o_kood` int(3) DEFAULT NULL,
  PRIMARY KEY (`o_gr_kood`),
  KEY `o_kood` (`o_kood`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `O_GRUPP`
--

LOCK TABLES `O_GRUPP` WRITE;
/*!40000 ALTER TABLE `O_GRUPP` DISABLE KEYS */;
INSERT INTO `O_GRUPP` VALUES
(1,'ARV07','Arvutiteenindus','IKT',1),
(2,'KKK06','Kokk','KOK',2),
(3,'RMT07','Raamatupidamine','IKT',1),
(4,'HTL05','Hotellindus','HOT',3),
(5,'TSL05','Tisler','PUIT',4),
(6,'VS24',NULL,NULL,1);
/*!40000 ALTER TABLE `O_GRUPP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-15 10:49:10
