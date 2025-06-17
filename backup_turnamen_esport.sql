-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: turnamen_esport
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id_game` int(11) NOT NULL AUTO_INCREMENT,
  `nama_game` varchar(100) NOT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'Mobile Legends'),(2,'Valorant'),(3,'PUBG Mobile'),(4,'Mobile Legends'),(5,'Valorant'),(6,'PUBG Mobile'),(7,'DOTA 2'),(8,'Free Fire'),(9,'Apex Legends');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hadiah`
--

DROP TABLE IF EXISTS `hadiah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hadiah` (
  `id_hadiah` int(11) NOT NULL AUTO_INCREMENT,
  `id_turnamen` int(11) DEFAULT NULL,
  `posisi` int(11) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hadiah`),
  KEY `id_turnamen` (`id_turnamen`),
  CONSTRAINT `hadiah_ibfk_1` FOREIGN KEY (`id_turnamen`) REFERENCES `turnamen` (`id_turnamen`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hadiah`
--

LOCK TABLES `hadiah` WRITE;
/*!40000 ALTER TABLE `hadiah` DISABLE KEYS */;
INSERT INTO `hadiah` VALUES (1,1,1,'Rp5.000.000 + Trophy'),(2,1,2,'Rp3.000.000'),(3,2,1,'Rp4.000.000 + Medali'),(4,3,1,'Rp6.000.000 + Sertifikat'),(16,1,1,'Rp5.000.000 + Trophy'),(17,1,2,'Rp3.000.000'),(18,2,1,'Rp4.000.000 + Medali'),(19,3,1,'Rp6.000.000 + Sertifikat'),(20,4,1,'Rp4.500.000'),(21,5,1,'Rp3.000.000'),(22,6,1,'Rp2.500.000');
/*!40000 ALTER TABLE `hadiah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemain`
--

DROP TABLE IF EXISTS `pemain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pemain` (
  `id_pemain` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pemain` varchar(100) NOT NULL,
  `id_tim` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pemain`),
  KEY `id_tim` (`id_tim`),
  CONSTRAINT `pemain_ibfk_1` FOREIGN KEY (`id_tim`) REFERENCES `tim` (`id_tim`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemain`
--

LOCK TABLES `pemain` WRITE;
/*!40000 ALTER TABLE `pemain` DISABLE KEYS */;
INSERT INTO `pemain` VALUES (1,'Rafi',1),(2,'Andi',1),(3,'Salsa',2),(4,'Budi',2),(5,'Nina',3),(6,'Zaki',3),(7,'Tari',4),(8,'Kevin',4),(9,'Dina',5),(10,'Riko',5);
/*!40000 ALTER TABLE `pemain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peserta_turnamen`
--

DROP TABLE IF EXISTS `peserta_turnamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peserta_turnamen` (
  `id_turnamen` int(11) NOT NULL,
  `id_tim` int(11) NOT NULL,
  PRIMARY KEY (`id_turnamen`,`id_tim`),
  KEY `id_tim` (`id_tim`),
  CONSTRAINT `peserta_turnamen_ibfk_1` FOREIGN KEY (`id_turnamen`) REFERENCES `turnamen` (`id_turnamen`),
  CONSTRAINT `peserta_turnamen_ibfk_2` FOREIGN KEY (`id_tim`) REFERENCES `tim` (`id_tim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peserta_turnamen`
--

LOCK TABLES `peserta_turnamen` WRITE;
/*!40000 ALTER TABLE `peserta_turnamen` DISABLE KEYS */;
INSERT INTO `peserta_turnamen` VALUES (1,1),(1,2),(2,2),(2,3),(3,1),(3,3),(4,4),(4,5),(5,1),(5,5),(6,2),(6,3);
/*!40000 ALTER TABLE `peserta_turnamen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id_sponsor` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sponsor` varchar(100) NOT NULL,
  `dana_diberikan` decimal(15,2) DEFAULT NULL,
  `id_turnamen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sponsor`),
  KEY `id_turnamen` (`id_turnamen`),
  CONSTRAINT `sponsor_ibfk_1` FOREIGN KEY (`id_turnamen`) REFERENCES `turnamen` (`id_turnamen`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (1,'IndoEsports',5000000.00,1),(2,'GameZone',3000000.00,2),(3,'KampusTech',6000000.00,3),(4,'DigiPlay',4500000.00,4),(5,'Esportindo',3500000.00,5),(6,'EpicNet',2500000.00,6);
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tim`
--

DROP TABLE IF EXISTS `tim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tim` (
  `id_tim` int(11) NOT NULL AUTO_INCREMENT,
  `nama_tim` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tim`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tim`
--

LOCK TABLES `tim` WRITE;
/*!40000 ALTER TABLE `tim` DISABLE KEYS */;
INSERT INTO `tim` VALUES (1,'Team Alpha'),(2,'Beta Squad'),(3,'Gamma Force'),(4,'Team Alpha'),(5,'Beta Squad'),(6,'Gamma Force'),(7,'Omega Legends'),(8,'Delta Warriors');
/*!40000 ALTER TABLE `tim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnamen`
--

DROP TABLE IF EXISTS `turnamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turnamen` (
  `id_turnamen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_turnamen` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `id_game` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_turnamen`),
  KEY `id_game` (`id_game`),
  CONSTRAINT `turnamen_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnamen`
--

LOCK TABLES `turnamen` WRITE;
/*!40000 ALTER TABLE `turnamen` DISABLE KEYS */;
INSERT INTO `turnamen` VALUES (1,'Turnamen ML Kampus Cup 2025','2025-06-15',1),(2,'Valorant Clash 2025','2025-07-10',2),(3,'PUBG Mahasiswa Battle','2025-08-05',3),(4,'MLBB Kampus Cup 2025','2025-06-15',1),(5,'Valorant Clash Mahasiswa','2025-07-10',2),(6,'PUBG Mobile Showdown','2025-08-05',3),(7,'DOTA 2 Battle Arena','2025-08-20',7),(8,'Free Fire Campus Battle','2025-09-01',8),(9,'Apex Legends Survivor Cup','2025-09-25',9);
/*!40000 ALTER TABLE `turnamen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-16 17:52:58
