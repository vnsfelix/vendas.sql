-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projeto_vendas
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comclien`
--

DROP TABLE IF EXISTS `comclien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comclien` (
  `n_numeclien` int NOT NULL AUTO_INCREMENT,
  `c_nomeclien` varchar(100) DEFAULT NULL,
  `c_razaclien` varchar(100) DEFAULT NULL,
  `d_dataclien` date DEFAULT NULL,
  `c_cpfclien` varchar(20) DEFAULT NULL,
  `c_foneclien` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`n_numeclien`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comclien`
--

LOCK TABLES `comclien` WRITE;
/*!40000 ALTER TABLE `comclien` DISABLE KEYS */;
INSERT INTO `comclien` VALUES (1,'João da Silva','João da Silva ME','1985-03-15','123.456.789-01','(11) 99999-1001'),(2,'Maria Oliveira','Maria Oliveira LTDA','1990-07-22','234.567.890-02','(11) 99999-1002'),(3,'Carlos Santos','Carlos Santos Comércio','1982-11-10','345.678.901-03','(11) 99999-1003'),(4,'Ana Souza','Ana Souza Serviços','1995-01-30','456.789.012-04','(11) 99999-1004'),(5,'Pedro Almeida','Pedro Almeida ME','1988-09-18','567.890.123-05','(11) 99999-1005');
/*!40000 ALTER TABLE `comclien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comforne`
--

DROP TABLE IF EXISTS `comforne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comforne` (
  `n_numeforne` int NOT NULL AUTO_INCREMENT,
  `c_codiforne` varchar(10) DEFAULT NULL,
  `c_nomeforne` varchar(100) DEFAULT NULL,
  `c_razaforne` varchar(100) DEFAULT NULL,
  `c_foneforne` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`n_numeforne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comforne`
--

LOCK TABLES `comforne` WRITE;
/*!40000 ALTER TABLE `comforne` DISABLE KEYS */;
INSERT INTO `comforne` VALUES (1,'FOR001','Dell','Dell Computadores Brasil','(11) 4002-8922'),(2,'FOR002','HP','HP Brasil Tecnologia','(11) 4003-3030'),(3,'FOR003','Lenovo','Lenovo Tecnologia Brasil','(11) 4004-4040'),(4,'FOR004','Intel','Intel Tecnologia Brasil','(11) 4005-5050'),(5,'FOR005','Microsoft','Microsoft Brasil','(11) 4006-6060');
/*!40000 ALTER TABLE `comforne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comitemvenda`
--

DROP TABLE IF EXISTS `comitemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comitemvenda` (
  `n_numeitem` int NOT NULL AUTO_INCREMENT,
  `n_numevenda` int NOT NULL,
  `n_numeprodu` int NOT NULL,
  `n_valovenda` decimal(10,2) DEFAULT NULL,
  `n_qtdevenda` int DEFAULT NULL,
  `n_descvenda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numeitem`),
  KEY `fk_item_venda` (`n_numevenda`),
  KEY `fk_item_produto` (`n_numeprodu`),
  CONSTRAINT `comitemvenda_ibfk_1` FOREIGN KEY (`n_numevenda`) REFERENCES `comvenda` (`n_numevenda`),
  CONSTRAINT `comitemvenda_ibfk_2` FOREIGN KEY (`n_numeprodu`) REFERENCES `comprodu` (`n_numeprodu`),
  CONSTRAINT `fk_item_produto` FOREIGN KEY (`n_numeprodu`) REFERENCES `comprodu` (`n_numeprodu`),
  CONSTRAINT `fk_item_venda` FOREIGN KEY (`n_numevenda`) REFERENCES `comvenda` (`n_numevenda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comitemvenda`
--

LOCK TABLES `comitemvenda` WRITE;
/*!40000 ALTER TABLE `comitemvenda` DISABLE KEYS */;
INSERT INTO `comitemvenda` VALUES (1,1,1,3500.00,1,100.00),(2,2,2,3200.00,1,200.00),(3,3,3,3100.00,1,150.00),(4,4,4,1200.00,1,50.00),(5,5,5,850.00,1,50.00);
/*!40000 ALTER TABLE `comitemvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprodu`
--

DROP TABLE IF EXISTS `comprodu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprodu` (
  `n_numeprodu` int NOT NULL AUTO_INCREMENT,
  `c_codiprodu` varchar(20) DEFAULT NULL,
  `c_descprodu` varchar(100) DEFAULT NULL,
  `n_valoprodu` decimal(10,2) DEFAULT NULL,
  `c_situprodu` varchar(1) DEFAULT NULL,
  `n_numeforne` int NOT NULL,
  PRIMARY KEY (`n_numeprodu`),
  KEY `fk_produto_fornecedor` (`n_numeforne`),
  CONSTRAINT `comprodu_ibfk_1` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`),
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprodu`
--

LOCK TABLES `comprodu` WRITE;
/*!40000 ALTER TABLE `comprodu` DISABLE KEYS */;
INSERT INTO `comprodu` VALUES (1,'PROD001','Notebook Dell Inspiron',3500.00,'A',1),(2,'PROD002','Notebook HP 250',3200.00,'A',2),(3,'PROD003','Notebook Lenovo IdeaPad',3100.00,'A',3),(4,'PROD004','Processador Intel Core i5',1200.00,'A',4),(5,'PROD005','Licença Microsoft Windows 11',850.00,'A',5);
/*!40000 ALTER TABLE `comprodu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comvenda`
--

DROP TABLE IF EXISTS `comvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comvenda` (
  `n_numevenda` int NOT NULL AUTO_INCREMENT,
  `c_codivenda` varchar(10) DEFAULT NULL,
  `n_numeclien` int NOT NULL,
  `n_numeforne` int NOT NULL,
  `n_numvende` int NOT NULL,
  `n_valovenda` decimal(10,2) DEFAULT NULL,
  `n_descvenda` decimal(10,2) DEFAULT NULL,
  `n_totavenda` decimal(10,2) DEFAULT NULL,
  `d_datavenda` date DEFAULT NULL,
  PRIMARY KEY (`n_numevenda`),
  KEY `fk_venda_cliente` (`n_numeclien`),
  KEY `fk_venda_fornecedor` (`n_numeforne`),
  KEY `fk_venda_vendedor` (`n_numvende`),
  CONSTRAINT `comvenda_ibfk_1` FOREIGN KEY (`n_numeclien`) REFERENCES `comclien` (`n_numeclien`),
  CONSTRAINT `comvenda_ibfk_2` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`),
  CONSTRAINT `comvenda_ibfk_3` FOREIGN KEY (`n_numvende`) REFERENCES `comvende` (`n_numvende`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`n_numeclien`) REFERENCES `comclien` (`n_numeclien`),
  CONSTRAINT `fk_venda_fornecedor` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`),
  CONSTRAINT `fk_venda_vendedor` FOREIGN KEY (`n_numvende`) REFERENCES `comvende` (`n_numvende`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comvenda`
--

LOCK TABLES `comvenda` WRITE;
/*!40000 ALTER TABLE `comvenda` DISABLE KEYS */;
INSERT INTO `comvenda` VALUES (1,'VDA001',1,1,1,3500.00,100.00,3400.00,'2026-09-01'),(2,'VDA002',2,2,2,3200.00,200.00,3000.00,'2026-09-05'),(3,'VDA003',3,3,3,3100.00,150.00,2950.00,'2026-09-10'),(4,'VDA004',4,4,4,1200.00,50.00,1150.00,'2026-09-15'),(5,'VDA005',5,5,5,850.00,50.00,800.00,'2026-09-20');
/*!40000 ALTER TABLE `comvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comvendas`
--

DROP TABLE IF EXISTS `comvendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comvendas` (
  `n_numevenda` int NOT NULL AUTO_INCREMENT,
  `c_codivenda` varchar(10) DEFAULT NULL,
  `n_numeclien` int NOT NULL,
  `n_numeforne` int NOT NULL,
  `n_numvende` int NOT NULL,
  `n_valovenda` decimal(10,2) DEFAULT NULL,
  `n_descvenda` decimal(10,2) DEFAULT NULL,
  `n_totavenda` decimal(10,2) DEFAULT NULL,
  `d_datavenda` date DEFAULT NULL,
  PRIMARY KEY (`n_numevenda`),
  KEY `fk_comvendas_cliente` (`n_numeclien`),
  KEY `fk_comvendas_fornecedor` (`n_numeforne`),
  KEY `fk_comvendas_vendedor` (`n_numvende`),
  CONSTRAINT `fk_comvendas_cliente` FOREIGN KEY (`n_numeclien`) REFERENCES `comclien` (`n_numeclien`),
  CONSTRAINT `fk_comvendas_fornecedor` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`),
  CONSTRAINT `fk_comvendas_vendedor` FOREIGN KEY (`n_numvende`) REFERENCES `comvende` (`n_numvende`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comvendas`
--

LOCK TABLES `comvendas` WRITE;
/*!40000 ALTER TABLE `comvendas` DISABLE KEYS */;
INSERT INTO `comvendas` VALUES (1,'REG001',1,1,1,3500.00,100.00,3400.00,'2026-09-01'),(2,'REG002',2,2,2,3200.00,200.00,3000.00,'2026-09-05'),(3,'REG003',3,3,3,3100.00,150.00,2950.00,'2026-09-10'),(4,'REG004',4,4,4,1200.00,50.00,1150.00,'2026-09-15'),(5,'REG005',5,5,5,850.00,50.00,800.00,'2026-09-20'),(6,'REG001',1,1,1,3500.00,100.00,3400.00,'2026-09-01'),(7,'REG002',2,2,2,3200.00,200.00,3000.00,'2026-09-05'),(8,'REG003',3,3,3,3100.00,150.00,2950.00,'2026-09-10'),(9,'REG004',4,4,4,1200.00,50.00,1150.00,'2026-09-15'),(10,'REG005',5,5,5,850.00,50.00,800.00,'2026-09-20');
/*!40000 ALTER TABLE `comvendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comvende`
--

DROP TABLE IF EXISTS `comvende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comvende` (
  `n_numvende` int NOT NULL AUTO_INCREMENT,
  `c_codivende` varchar(10) DEFAULT NULL,
  `c_nomevende` varchar(100) DEFAULT NULL,
  `c_razavende` varchar(100) DEFAULT NULL,
  `c_fonevende` varchar(20) DEFAULT NULL,
  `n_porcvende` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numvende`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comvende`
--

LOCK TABLES `comvende` WRITE;
/*!40000 ALTER TABLE `comvende` DISABLE KEYS */;
INSERT INTO `comvende` VALUES (1,'VEN001','Roberto Lima','Vendedor Interno','(11) 98888-1001',5.00),(2,'VEN002','Fernanda Costa','Vendedora Interna','(11) 98888-1002',6.00),(3,'VEN003','Ricardo Alves','Vendedor Externo','(11) 98888-1003',5.50),(4,'VEN004','Juliana Martins','Vendedora Externa','(11) 98888-1004',7.00),(5,'VEN005','Marcos Pereira','Vendedor Interno','(11) 98888-1005',6.50);
/*!40000 ALTER TABLE `comvende` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 14:24:12
