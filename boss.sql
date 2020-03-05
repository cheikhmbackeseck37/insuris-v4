-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: labsis
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `ACCNTS_asset`
--

DROP TABLE IF EXISTS `ACCNTS_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `type` varchar(200) NOT NULL,
  `open_balance` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `memo` varchar(200) NOT NULL,
  `dated` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_asset`
--

LOCK TABLES `ACCNTS_asset` WRITE;
/*!40000 ALTER TABLE `ACCNTS_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_bank`
--

DROP TABLE IF EXISTS `ACCNTS_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `ref_number` varchar(100) NOT NULL,
  `dated` date NOT NULL,
  `name` varchar(200) NOT NULL,
  `banked` varchar(200) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_bank`
--

LOCK TABLES `ACCNTS_bank` WRITE;
/*!40000 ALTER TABLE `ACCNTS_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_deduction`
--

DROP TABLE IF EXISTS `ACCNTS_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_deduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nssf` int(11) NOT NULL,
  `nhif` int(11) NOT NULL,
  `nhsb` int(11) NOT NULL,
  `paye` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `dated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_deduction_employee_id_689da5fb_fk_accounts_employee_id` (`employee_id`),
  CONSTRAINT `ACCNTS_deduction_employee_id_689da5fb_fk_accounts_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_deduction`
--

LOCK TABLES `ACCNTS_deduction` WRITE;
/*!40000 ALTER TABLE `ACCNTS_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_deduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_expense`
--

DROP TABLE IF EXISTS `ACCNTS_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_expense` date NOT NULL,
  `memo` varchar(1000) NOT NULL,
  `bill_due` date NOT NULL,
  `terms_of_payment` varchar(100) NOT NULL,
  `payment_method` varchar(200) NOT NULL,
  `VAT` varchar(10) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `expense_type` varchar(100) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_expense_vendor_id_e4cfede7_fk_CRM_supplier_id` (`vendor_id`),
  CONSTRAINT `ACCNTS_expense_vendor_id_e4cfede7_fk_CRM_supplier_id` FOREIGN KEY (`vendor_id`) REFERENCES `CRM_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_expense`
--

LOCK TABLES `ACCNTS_expense` WRITE;
/*!40000 ALTER TABLE `ACCNTS_expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_income`
--

DROP TABLE IF EXISTS `ACCNTS_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `open_balance` int(11) NOT NULL,
  `memo` varchar(200) NOT NULL,
  `dated` date NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_income_member_id_cd744e50_fk_CRM_member_id` (`member_id`),
  CONSTRAINT `ACCNTS_income_member_id_cd744e50_fk_CRM_member_id` FOREIGN KEY (`member_id`) REFERENCES `CRM_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_income`
--

LOCK TABLES `ACCNTS_income` WRITE;
/*!40000 ALTER TABLE `ACCNTS_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_invoice`
--

DROP TABLE IF EXISTS `ACCNTS_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_generate` date NOT NULL,
  `description` varchar(2000) NOT NULL,
  `VAT` varchar(5) NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `balance` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_invoice_member_id_815a0bca_fk_CRM_client_id` (`member_id`),
  CONSTRAINT `ACCNTS_invoice_member_id_815a0bca_fk_CRM_client_id` FOREIGN KEY (`member_id`) REFERENCES `CRM_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_invoice`
--

LOCK TABLES `ACCNTS_invoice` WRITE;
/*!40000 ALTER TABLE `ACCNTS_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_liability`
--

DROP TABLE IF EXISTS `ACCNTS_liability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_liability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `open_balance` int(11) NOT NULL,
  `memo` varchar(200) NOT NULL,
  `dated` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_liability`
--

LOCK TABLES `ACCNTS_liability` WRITE;
/*!40000 ALTER TABLE `ACCNTS_liability` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_liability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_payment`
--

DROP TABLE IF EXISTS `ACCNTS_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) NOT NULL,
  `payment_for` varchar(100) NOT NULL,
  `date_of_generate` date NOT NULL,
  `VAT` varchar(5) NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_payment_member_id_39325e9c_fk_CRM_client_id` (`member_id`),
  CONSTRAINT `ACCNTS_payment_member_id_39325e9c_fk_CRM_client_id` FOREIGN KEY (`member_id`) REFERENCES `CRM_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_payment`
--

LOCK TABLES `ACCNTS_payment` WRITE;
/*!40000 ALTER TABLE `ACCNTS_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_payroll`
--

DROP TABLE IF EXISTS `ACCNTS_payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pension` int(11) NOT NULL,
  `lunch` int(11) NOT NULL,
  `month` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_taxed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_payroll_employee_id_80029489_fk_accounts_employee_id` (`employee_id`),
  CONSTRAINT `ACCNTS_payroll_employee_id_80029489_fk_accounts_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_payroll`
--

LOCK TABLES `ACCNTS_payroll` WRITE;
/*!40000 ALTER TABLE `ACCNTS_payroll` DISABLE KEYS */;
INSERT INTO `ACCNTS_payroll` VALUES (2,0,0,'2020-03-01',1,0);
/*!40000 ALTER TABLE `ACCNTS_payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCNTS_sales`
--

DROP TABLE IF EXISTS `ACCNTS_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCNTS_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_due` date NOT NULL,
  `payment_terms` varchar(200) NOT NULL,
  `date_of_sale` date NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ACCNTS_sales_invoice_id_ed6352ec_fk_ACCNTS_invoice_id` (`invoice_id`),
  KEY `ACCNTS_sales_member_id_a76846fe_fk_CRM_client_id` (`member_id`),
  CONSTRAINT `ACCNTS_sales_invoice_id_ed6352ec_fk_ACCNTS_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `ACCNTS_invoice` (`id`),
  CONSTRAINT `ACCNTS_sales_member_id_a76846fe_fk_CRM_client_id` FOREIGN KEY (`member_id`) REFERENCES `CRM_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCNTS_sales`
--

LOCK TABLES `ACCNTS_sales` WRITE;
/*!40000 ALTER TABLE `ACCNTS_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCNTS_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_barcode`
--

DROP TABLE IF EXISTS `CRM_barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_barcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GTIN` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_packaging` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depth` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gross_weight` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_weight` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `GTIN` (`GTIN`),
  KEY `CRM_barcode_client_id_0615af36_fk_CRM_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_barcode`
--

LOCK TABLES `CRM_barcode` WRITE;
/*!40000 ALTER TABLE `CRM_barcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_barcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_client`
--

DROP TABLE IF EXISTS `CRM_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_prefix` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_issue` date NOT NULL,
  `certificate_of_incorporation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copy_of_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copy_of_blank_cheque` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copy_of_trade_licence` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_of_product_barcoded` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `director_pin_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_certificate_pin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copy_of_kebs_certicate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_me1` int(11) NOT NULL,
  `is_me2` int(11) NOT NULL,
  `is_cacc_x` int(11) NOT NULL,
  `is_ccm` int(11) NOT NULL,
  `is_accm` int(11) NOT NULL,
  `is_cacc` int(11) NOT NULL,
  `is_tm` int(11) NOT NULL,
  `is_gm` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `Prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sexe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_f` int(11) NOT NULL,
  `tel_p` int(11) NOT NULL,
  `pays` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archive` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date_naissance` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Matricule` int(11) NOT NULL,
  `company_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_client`
--

LOCK TABLES `CRM_client` WRITE;
/*!40000 ALTER TABLE `CRM_client` DISABLE KEYS */;
INSERT INTO `CRM_client` VALUES (7,'0','0','2020-03-19','','','','','','','','',0,0,0,0,0,0,0,0,0,'liberoa','boiu','Female','uploads/0.jpeg','cheikh@gmiali.com',123473,123443,'AD','sengak','1',NULL,123456,NULL),(8,'0','0','2020-03-20','','','','','','','','',0,0,0,0,0,0,0,0,0,'marie','thione','Female','uploads/moman.jpg','cg@gmail.com',123476,123477,'AW','kdfgf','1',NULL,123484,'ugb'),(9,'0','0','2020-03-27','','','','','','','','',0,0,0,0,0,0,0,0,0,'ksks','QSQS','Female','uploads/moman_IpHey7N.jpg','QSDQ@QSQS.COM',123470,123477,'AQ','AZDAAAAAAA','1',NULL,123507,'sqs'),(10,'0','0','2020-03-12','','','','','','','','',0,0,0,0,0,0,0,0,0,'AZDA','AZDAZD','Male','uploads/moman_9hNySeG.jpg','AZDAZD@AZ.COM',123456,123456,'DZ','AZDAD','1',NULL,123456,'AZDAZ'),(11,'0','0','2020-03-18','','','','','','','','',0,0,0,0,0,0,0,0,0,'ZEFEZ','ZEFZF','Female','uploads/moman_3yviQ1S.jpg','EEF@EFE.COM',123456,123456,'AO','SDFSDF','1',NULL,123471,'EFZEFZE');
/*!40000 ALTER TABLE `CRM_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_event`
--

DROP TABLE IF EXISTS `CRM_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` date NOT NULL,
  `status` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CRM_event_training_id_e835b166_fk_CRM_training_id` (`training_id`),
  CONSTRAINT `CRM_event_training_id_e835b166_fk_CRM_training_id` FOREIGN KEY (`training_id`) REFERENCES `CRM_training` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_event`
--

LOCK TABLES `CRM_event` WRITE;
/*!40000 ALTER TABLE `CRM_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_feedback`
--

DROP TABLE IF EXISTS `CRM_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` date NOT NULL,
  `status` int(11) NOT NULL,
  `client_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CRM_feedback_client_name_id_062eebbb_fk_CRM_client_id` (`client_name_id`),
  CONSTRAINT `CRM_feedback_client_name_id_062eebbb_fk_CRM_client_id` FOREIGN KEY (`client_name_id`) REFERENCES `CRM_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_feedback`
--

LOCK TABLES `CRM_feedback` WRITE;
/*!40000 ALTER TABLE `CRM_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_member`
--

DROP TABLE IF EXISTS `CRM_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_member`
--

LOCK TABLES `CRM_member` WRITE;
/*!40000 ALTER TABLE `CRM_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_note`
--

DROP TABLE IF EXISTS `CRM_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` varchar(1000) NOT NULL,
  `dated` datetime(6) NOT NULL,
  `current_user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CRM_note_current_user_id_e7c29579_fk_accounts_employee_id` (`current_user_id`),
  KEY `CRM_note_member_id_f319af11_fk_CRM_client_id` (`member_id`),
  CONSTRAINT `CRM_note_current_user_id_e7c29579_fk_accounts_employee_id` FOREIGN KEY (`current_user_id`) REFERENCES `accounts_employee` (`id`),
  CONSTRAINT `CRM_note_member_id_f319af11_fk_CRM_client_id` FOREIGN KEY (`member_id`) REFERENCES `CRM_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_note`
--

LOCK TABLES `CRM_note` WRITE;
/*!40000 ALTER TABLE `CRM_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_recordapprove`
--

DROP TABLE IF EXISTS `CRM_recordapprove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_recordapprove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dated` datetime(6) NOT NULL,
  `current_user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CRM_recordapprove_current_user_id_8d29efc7_fk_accounts_` (`current_user_id`),
  KEY `CRM_recordapprove_member_id_b88100ee_fk_CRM_client_id` (`member_id`),
  CONSTRAINT `CRM_recordapprove_current_user_id_8d29efc7_fk_accounts_` FOREIGN KEY (`current_user_id`) REFERENCES `accounts_employee` (`id`),
  CONSTRAINT `CRM_recordapprove_member_id_b88100ee_fk_CRM_client_id` FOREIGN KEY (`member_id`) REFERENCES `CRM_client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_recordapprove`
--

LOCK TABLES `CRM_recordapprove` WRITE;
/*!40000 ALTER TABLE `CRM_recordapprove` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_recordapprove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_supplier`
--

DROP TABLE IF EXISTS `CRM_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_supplier`
--

LOCK TABLES `CRM_supplier` WRITE;
/*!40000 ALTER TABLE `CRM_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRM_training`
--

DROP TABLE IF EXISTS `CRM_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CRM_training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `all_trainee` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `happened_on` date NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CRM_training_trainer_id_9d2300d5_fk_accounts_employee_id` (`trainer_id`),
  CONSTRAINT `CRM_training_trainer_id_9d2300d5_fk_accounts_employee_id` FOREIGN KEY (`trainer_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRM_training`
--

LOCK TABLES `CRM_training` WRITE;
/*!40000 ALTER TABLE `CRM_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRM_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Legal_category`
--

DROP TABLE IF EXISTS `Legal_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Legal_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dated` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Legal_category`
--

LOCK TABLES `Legal_category` WRITE;
/*!40000 ALTER TABLE `Legal_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Legal_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Legal_contract`
--

DROP TABLE IF EXISTS `Legal_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Legal_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `dofsigning` date NOT NULL,
  `doflapsing` date NOT NULL,
  `document` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Legal_contract_category_id_fc45e3e9_fk_Legal_category_id` (`category_id`),
  CONSTRAINT `Legal_contract_category_id_fc45e3e9_fk_Legal_category_id` FOREIGN KEY (`category_id`) REFERENCES `Legal_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Legal_contract`
--

LOCK TABLES `Legal_contract` WRITE;
/*!40000 ALTER TABLE `Legal_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Legal_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Legal_gs1docs`
--

DROP TABLE IF EXISTS `Legal_gs1docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Legal_gs1docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `dated` date NOT NULL,
  `document` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Legal_gs1docs`
--

LOCK TABLES `Legal_gs1docs` WRITE;
/*!40000 ALTER TABLE `Legal_gs1docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `Legal_gs1docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Legal_letter`
--

DROP TABLE IF EXISTS `Legal_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Legal_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `dated` date NOT NULL,
  `document` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Legal_letter`
--

LOCK TABLES `Legal_letter` WRITE;
/*!40000 ALTER TABLE `Legal_letter` DISABLE KEYS */;
/*!40000 ALTER TABLE `Legal_letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_employee`
--

DROP TABLE IF EXISTS `accounts_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `date_of_birth` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kin_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_no` int(11) NOT NULL,
  `nssf_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nhif_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `KRA` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `huduma` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` int(11) NOT NULL,
  `next_of_kin_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_phone_number` int(11) NOT NULL,
  `county` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_of_kin_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependant_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependant_relationship` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependant_contact` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_bal` int(10) unsigned NOT NULL,
  `profile_pic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_benifits` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `salary` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL DEFAULT '4',
  `position_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `accounts_employee_position_id_3f7cd7b7_uniq` (`position_id`),
  KEY `accounts_employee_department_id_28acdfd0_fk_departmen` (`department_id`),
  CONSTRAINT `accounts_employee_department_id_28acdfd0_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `departments_department` (`id`),
  CONSTRAINT `accounts_employee_position_id_3f7cd7b7_fk_departmen` FOREIGN KEY (`position_id`) REFERENCES `departments_position` (`id`),
  CONSTRAINT `accounts_employee_user_id_593173d8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_employee`
--

LOCK TABLES `accounts_employee` WRITE;
/*!40000 ALTER TABLE `accounts_employee` DISABLE KEYS */;
INSERT INTO `accounts_employee` VALUES (1,'Kisumu-K',708067459,'2019-01-16','junior@gmail.com',0,'45544','658754','4586','545412','54445',0,'',751545121,'','','Omambia Daug','Son','074404509',0,'profile_pics/c.jpg','',0,'20000',1,1,15);
/*!40000 ALTER TABLE `accounts_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add employee',7,'add_employee'),(26,'Can change employee',7,'change_employee'),(27,'Can delete employee',7,'delete_employee'),(28,'Can view employee',7,'view_employee'),(29,'Can add apply leave',8,'add_applyleave'),(30,'Can change apply leave',8,'change_applyleave'),(31,'Can delete apply leave',8,'delete_applyleave'),(32,'Can view apply leave',8,'view_applyleave'),(33,'Can add leave',9,'add_leave'),(34,'Can change leave',9,'change_leave'),(35,'Can delete leave',9,'delete_leave'),(36,'Can view leave',9,'view_leave'),(37,'Can add department',10,'add_department'),(38,'Can change department',10,'change_department'),(39,'Can delete department',10,'delete_department'),(40,'Can view department',10,'view_department'),(41,'Can add position',11,'add_position'),(42,'Can change position',11,'change_position'),(43,'Can delete position',11,'delete_position'),(44,'Can view position',11,'view_position'),(45,'Can add target',12,'add_target'),(46,'Can change target',12,'change_target'),(47,'Can delete target',12,'delete_target'),(48,'Can view target',12,'view_target'),(49,'Can add client',13,'add_client'),(50,'Can change client',13,'change_client'),(51,'Can delete client',13,'delete_client'),(52,'Can view client',13,'view_client'),(53,'Can add feedback',14,'add_feedback'),(54,'Can change feedback',14,'change_feedback'),(55,'Can delete feedback',14,'delete_feedback'),(56,'Can view feedback',14,'view_feedback'),(57,'Can add supplier',15,'add_supplier'),(58,'Can change supplier',15,'change_supplier'),(59,'Can delete supplier',15,'delete_supplier'),(60,'Can view supplier',15,'view_supplier'),(61,'Can add training',16,'add_training'),(62,'Can change training',16,'change_training'),(63,'Can delete training',16,'delete_training'),(64,'Can view training',16,'view_training'),(65,'Can add payroll',17,'add_payroll'),(66,'Can change payroll',17,'change_payroll'),(67,'Can delete payroll',17,'delete_payroll'),(68,'Can view payroll',17,'view_payroll'),(69,'Can add barcode',18,'add_barcode'),(70,'Can change barcode',18,'change_barcode'),(71,'Can delete barcode',18,'delete_barcode'),(72,'Can view barcode',18,'view_barcode'),(73,'Can add client approval',19,'add_clientapproval'),(74,'Can change client approval',19,'change_clientapproval'),(75,'Can delete client approval',19,'delete_clientapproval'),(76,'Can view client approval',19,'view_clientapproval'),(77,'Can add event',20,'add_event'),(78,'Can change event',20,'change_event'),(79,'Can delete event',20,'delete_event'),(80,'Can view event',20,'view_event'),(81,'Can add site',21,'add_site'),(82,'Can change site',21,'change_site'),(83,'Can delete site',21,'delete_site'),(84,'Can view site',21,'view_site'),(85,'Can add email address',22,'add_emailaddress'),(86,'Can change email address',22,'change_emailaddress'),(87,'Can delete email address',22,'delete_emailaddress'),(88,'Can view email address',22,'view_emailaddress'),(89,'Can add email confirmation',23,'add_emailconfirmation'),(90,'Can change email confirmation',23,'change_emailconfirmation'),(91,'Can delete email confirmation',23,'delete_emailconfirmation'),(92,'Can view email confirmation',23,'view_emailconfirmation'),(93,'Can add performance',24,'add_performance'),(94,'Can change performance',24,'change_performance'),(95,'Can delete performance',24,'delete_performance'),(96,'Can view performance',24,'view_performance'),(97,'Can add note',25,'add_note'),(98,'Can change note',25,'change_note'),(99,'Can delete note',25,'delete_note'),(100,'Can view note',25,'view_note'),(101,'Can add record approve',26,'add_recordapprove'),(102,'Can change record approve',26,'change_recordapprove'),(103,'Can delete record approve',26,'delete_recordapprove'),(104,'Can view record approve',26,'view_recordapprove'),(105,'Can add member',27,'add_member'),(106,'Can change member',27,'change_member'),(107,'Can delete member',27,'delete_member'),(108,'Can view member',27,'view_member'),(109,'Can add invoice',28,'add_invoice'),(110,'Can change invoice',28,'change_invoice'),(111,'Can delete invoice',28,'delete_invoice'),(112,'Can view invoice',28,'view_invoice'),(113,'Can add pay roll',29,'add_payroll'),(114,'Can change pay roll',29,'change_payroll'),(115,'Can delete pay roll',29,'delete_payroll'),(116,'Can view pay roll',29,'view_payroll'),(117,'Can add payment',30,'add_payment'),(118,'Can change payment',30,'change_payment'),(119,'Can delete payment',30,'delete_payment'),(120,'Can view payment',30,'view_payment'),(121,'Can add sales',31,'add_sales'),(122,'Can change sales',31,'change_sales'),(123,'Can delete sales',31,'delete_sales'),(124,'Can view sales',31,'view_sales'),(125,'Can add expense',32,'add_expense'),(126,'Can change expense',32,'change_expense'),(127,'Can delete expense',32,'delete_expense'),(128,'Can view expense',32,'view_expense'),(129,'Can add asset',33,'add_asset'),(130,'Can change asset',33,'change_asset'),(131,'Can delete asset',33,'delete_asset'),(132,'Can view asset',33,'view_asset'),(133,'Can add income',34,'add_income'),(134,'Can change income',34,'change_income'),(135,'Can delete income',34,'delete_income'),(136,'Can view income',34,'view_income'),(137,'Can add liability',35,'add_liability'),(138,'Can change liability',35,'change_liability'),(139,'Can delete liability',35,'delete_liability'),(140,'Can view liability',35,'view_liability'),(141,'Can add bank',36,'add_bank'),(142,'Can change bank',36,'change_bank'),(143,'Can delete bank',36,'delete_bank'),(144,'Can view bank',36,'view_bank'),(145,'Can add deduction',37,'add_deduction'),(146,'Can change deduction',37,'change_deduction'),(147,'Can delete deduction',37,'delete_deduction'),(148,'Can view deduction',37,'view_deduction'),(149,'Can add category',38,'add_category'),(150,'Can change category',38,'change_category'),(151,'Can delete category',38,'delete_category'),(152,'Can view category',38,'view_category'),(153,'Can add contract',39,'add_contract'),(154,'Can change contract',39,'change_contract'),(155,'Can delete contract',39,'delete_contract'),(156,'Can view contract',39,'view_contract'),(157,'Can add g s1 docs',40,'add_gs1docs'),(158,'Can change g s1 docs',40,'change_gs1docs'),(159,'Can delete g s1 docs',40,'delete_gs1docs'),(160,'Can view g s1 docs',40,'view_gs1docs'),(161,'Can add letter',41,'add_letter'),(162,'Can change letter',41,'change_letter'),(163,'Can delete letter',41,'delete_letter'),(164,'Can view letter',41,'view_letter');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'argon2$argon2i$v=19$m=512,t=2,p=2$ekZJcGRjeWxscEZZ$o8sU42ChUu8MUMSRLkP19Q','2019-02-27 07:23:31.458573',0,'omambia','Omambia','Dauglous','omambiadauglous@gmail.com',0,1,'2019-01-28 17:59:33.409242'),(2,'argon2$argon2i$v=19$m=512,t=2,p=2$aU5LVG10akkxV0wx$46lMhUxTyG6KVGgL0c9+ww',NULL,1,'domambia','Omambia','Joshua','omambiadauglous1@gmail.com',0,1,'2019-02-07 05:13:05.951886'),(10,'argon2$argon2i$v=19$m=512,t=2,p=2$Y3hYSTUyMzRIU2l0$vl8X38hhBC8os4fsJlTrig','2019-02-25 10:09:16.281315',0,'Faiza','Faiza','Gs1','faiza@gmail.com',0,1,'2019-02-15 12:18:28.757029'),(11,'argon2$argon2i$v=19$m=512,t=2,p=2$SFJFZWJUZmJ2MGVy$WL9bJtQ7kxHrecceEdXwtQ','2019-02-20 08:55:39.030851',0,'eva','Eva12','Cherry','eva@gmail.com',0,1,'2019-02-15 12:20:39.250800'),(12,'argon2$argon2i$v=19$m=512,t=2,p=2$UXBQUHZwanczeDBw$8xXBgsnl+vdaqEY7LOP4Og','2019-02-22 08:25:05.345396',1,'hackert','','','hackert@gmail.com',1,1,'2019-02-22 08:24:49.657945'),(13,'argon2$argon2i$v=19$m=512,t=2,p=2$cmlvRlR5dkthMjZH$YHhmttv4pOTaQew6McOTXQ','2020-02-28 12:51:50.881408',1,'labsis','','','lab@gmail.com',1,1,'2020-02-22 18:37:55.134795'),(14,'argon2$argon2i$v=19$m=512,t=2,p=2$UEZodzBydXFVcXdz$K2G3qEC0YIiD0tZz33mgJQ',NULL,0,'labsisb','Cheikh Ahmadou Mbacke','seck','postgres@localhost',0,1,'2020-02-25 03:12:30.141129'),(15,'argon2$argon2i$v=19$m=512,t=2,p=2$YndlRjF6UUtIcGlY$lfugkmJugEK7fd+CQIcg0g','2020-03-04 12:06:07.655463',1,'admin','mbacke','seck','admin@gmail.com',1,1,'2020-02-28 13:02:22.000000'),(16,'argon2$argon2i$v=19$m=512,t=2,p=2$Mk1URDE5TkFmN3hW$hpMHjvyam4NtT9pFQp2vvA',NULL,0,'sarry','Cheikh Ahmadou Mbacke','poue','cheikhpazzzper@gmail.com',0,1,'2020-02-28 14:22:54.772985'),(17,'argon2$argon2i$v=19$m=512,t=2,p=2$eVcyVHQxaHc3YlRa$yUplq2TlI2bl/ur0b2oppQ',NULL,0,'tesste','sss','azr','cheikhahmadoumbacke.seck@uvs.edu.sn',0,1,'2020-02-28 14:45:13.815015'),(18,'argon2$argon2i$v=19$m=512,t=2,p=2$UGxiaUN6bVpUaFNl$cCS4+eAPZwUgYpCC8xlysg',NULL,0,'admin78','cheikh ahmadou mbackebb','seckh','cheikhjpaper@gmail.com',0,1,'2020-02-28 16:40:38.105147'),(19,'argon2$argon2i$v=19$m=512,t=2,p=2$bGwxbXg0TVFyak8w$ECiZnVCX4Dziwj8JRLX1Hw',NULL,0,'cesss','zzzz','azzzzzzzzzzzz','cheikhahmadoumdbacke.seck@uvs.edu.sn',0,1,'2020-02-28 17:03:48.427681');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_department`
--

DROP TABLE IF EXISTS `departments_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_department`
--

LOCK TABLES `departments_department` WRITE;
/*!40000 ALTER TABLE `departments_department` DISABLE KEYS */;
INSERT INTO `departments_department` VALUES (1,'Human Resource','HR','2019-01-28'),(2,'Accounts','ACC','2019-02-15'),(3,'Technical Executive','TECH','2019-02-15'),(4,'Corporate and Communications','CCM','2019-02-15'),(5,'Legal','LE','2019-02-15'),(6,'Research and Development','R&D','2019-02-15'),(7,'jamuo','vv','2020-02-29'),(8,'mansis','cc','2020-03-01');
/*!40000 ALTER TABLE `departments_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_position`
--

DROP TABLE IF EXISTS `departments_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_position_department_id_8b23d744_fk_departmen` (`department_id`),
  CONSTRAINT `departments_position_department_id_8b23d744_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `departments_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_position`
--

LOCK TABLES `departments_position` WRITE;
/*!40000 ALTER TABLE `departments_position` DISABLE KEYS */;
INSERT INTO `departments_position` VALUES (1,'Human Resource Manager','HRM',1),(2,'General Manager','GM',1),(3,'Membership Executive','ME1',1),(4,'Corporate and Communications Manager','CCM',4),(5,'Technical Manager','TM',3),(6,'Company Accountant','CACC',2),(7,'Legal Office','LEO',5),(8,'tesst','ss',1),(9,'88778','78',3),(10,'78poopp','744',3),(11,'895411jhg','855',3),(12,'ggg','nn',7);
/*!40000 ALTER TABLE `departments_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (2,'2019-02-22 08:25:25.627255','1','Omambia',2,'[{\"changed\": {\"fields\": [\"all_trainee\"]}}]',16,12),(3,'2019-02-22 08:41:02.817259','1','domambia',2,'[]',16,12),(4,'2019-02-22 08:41:22.836255','2','Faiza',1,'[{\"added\": {}}]',16,12),(5,'2020-02-22 18:40:11.030916','5','Eva12 Cherry',2,'[{\"changed\": {\"fields\": [\"huduma\", \"id_no\", \"nssf_no\", \"nhif_no\", \"KRA\", \"employee_no\", \"bank\", \"next_of_kin_name\", \"next_of_kin_phone\"]}}]',7,13),(6,'2020-02-28 14:56:08.594874','8','tesst',1,'[{\"added\": {}}]',11,15),(7,'2020-02-28 15:01:33.082984','9','88778',1,'[{\"added\": {}}]',11,15),(8,'2020-02-28 15:01:44.564641','10','78poopp',1,'[{\"added\": {}}]',11,15),(9,'2020-02-28 15:01:55.869930','11','895411jhg',1,'[{\"added\": {}}]',11,15),(12,'2020-02-28 16:35:12.342941','1','Omambia Dauglous',2,'[]',7,15),(13,'2020-02-28 16:54:53.500750','5','Eva12 Cherry',3,'',7,15),(14,'2020-02-28 16:55:19.039264','4','Faiza Gs1',2,'[{\"changed\": {\"fields\": [\"nssf_no\", \"nhif_no\", \"KRA\", \"employee_no\", \"huduma\"]}}]',7,15),(15,'2020-02-29 22:19:30.565844','7','jamuo',1,'[{\"added\": {}}]',10,15),(16,'2020-02-29 22:19:35.733220','12','ggg',1,'[{\"added\": {}}]',11,15),(17,'2020-03-01 14:15:20.584220','15','admin',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,15),(18,'2020-03-01 14:20:51.738694','4','mbacke seck',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',7,15),(19,'2020-03-01 15:25:18.598903','1','mbacke seck',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',7,15);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (33,'ACCNTS','asset'),(36,'ACCNTS','bank'),(37,'ACCNTS','deduction'),(32,'ACCNTS','expense'),(34,'ACCNTS','income'),(28,'ACCNTS','invoice'),(35,'ACCNTS','liability'),(30,'ACCNTS','payment'),(29,'ACCNTS','payroll'),(31,'ACCNTS','sales'),(22,'account','emailaddress'),(23,'account','emailconfirmation'),(7,'accounts','employee'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(18,'CRM','barcode'),(13,'CRM','client'),(19,'CRM','clientapproval'),(20,'CRM','event'),(14,'CRM','feedback'),(27,'CRM','member'),(25,'CRM','note'),(26,'CRM','recordapprove'),(15,'CRM','supplier'),(16,'CRM','training'),(10,'departments','department'),(11,'departments','position'),(24,'hrm','performance'),(8,'leave','applyleave'),(9,'leave','leave'),(38,'Legal','category'),(39,'Legal','contract'),(40,'Legal','gs1docs'),(41,'Legal','letter'),(17,'payroll','payroll'),(6,'sessions','session'),(21,'sites','site'),(12,'targets','target');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'departments','0001_initial','2019-01-28 15:43:40.414350'),(2,'contenttypes','0001_initial','2019-01-28 15:43:40.790622'),(3,'auth','0001_initial','2019-01-28 15:43:47.214942'),(4,'accounts','0001_initial','2019-01-28 15:43:50.010549'),(5,'accounts','0002_auto_20190125_0913','2019-01-28 15:43:50.102518'),(6,'CRM','0001_initial','2019-01-28 15:43:52.569360'),(7,'CRM','0002_auto_20190125_1030','2019-01-28 15:43:52.629527'),(8,'CRM','0003_auto_20190125_1049','2019-01-28 15:43:53.333161'),(9,'CRM','0004_auto_20190125_1052','2019-01-28 15:43:54.141554'),(10,'CRM','0005_feedback_created_on','2019-01-28 15:43:54.563921'),(11,'CRM','0006_auto_20190125_1200','2019-01-28 15:43:55.403908'),(12,'CRM','0007_auto_20190127_1038','2019-01-28 15:43:56.018315'),(13,'accounts','0003_employee_alt_phone_number','2019-01-28 15:43:56.485077'),(14,'admin','0001_initial','2019-01-28 15:43:57.997041'),(15,'admin','0002_logentry_remove_auto_add','2019-01-28 15:43:58.046333'),(16,'admin','0003_logentry_add_action_flag_choices','2019-01-28 15:43:58.098744'),(17,'contenttypes','0002_remove_content_type_name','2019-01-28 15:43:58.860067'),(18,'auth','0002_alter_permission_name_max_length','2019-01-28 15:43:59.489170'),(19,'auth','0003_alter_user_email_max_length','2019-01-28 15:44:00.034311'),(20,'auth','0004_alter_user_username_opts','2019-01-28 15:44:00.080112'),(21,'auth','0005_alter_user_last_login_null','2019-01-28 15:44:00.487756'),(22,'auth','0006_require_contenttypes_0002','2019-01-28 15:44:00.564349'),(23,'auth','0007_alter_validators_add_error_messages','2019-01-28 15:44:00.653732'),(24,'auth','0008_alter_user_username_max_length','2019-01-28 15:44:01.224207'),(25,'auth','0009_alter_user_last_name_max_length','2019-01-28 15:44:01.896548'),(26,'leave','0001_initial','2019-01-28 15:44:05.248096'),(27,'sessions','0001_initial','2019-01-28 15:44:05.726268'),(28,'targets','0001_initial','2019-01-28 15:44:06.930275'),(29,'targets','0002_auto_20190114_0749','2019-01-28 15:44:06.988403'),(30,'targets','0003_auto_20190114_0751','2019-01-28 15:44:07.036846'),(31,'CRM','0008_remove_training_topic','2019-01-29 07:20:14.576211'),(32,'leave','0002_auto_20190129_0738','2019-01-29 07:38:20.797441'),(33,'payroll','0001_initial','2019-01-30 15:48:45.509011'),(34,'leave','0003_auto_20190204_1233','2019-02-04 12:33:19.514687'),(35,'departments','0002_auto_20190207_0310','2019-02-07 03:10:46.744475'),(36,'accounts','0004_employee_profile_pic','2019-02-07 05:07:57.673607'),(37,'CRM','0009_training_all_trainee','2019-02-07 07:06:44.360112'),(38,'accounts','0005_auto_20190210_0529','2019-02-15 08:26:44.030391'),(39,'accounts','0006_remove_employee_department','2019-02-15 08:26:44.078090'),(40,'accounts','0007_employee_leave_balance','2019-02-15 08:26:44.120673'),(41,'accounts','0008_employee_leave_bal','2019-02-15 08:26:44.162636'),(42,'accounts','0009_employee_company_benifits','2019-02-15 08:26:44.204268'),(43,'accounts','0010_auto_20190215_0811','2019-02-15 08:26:44.246391'),(44,'leave','0004_auto_20190214_1136','2019-02-15 08:26:44.329975'),(45,'CRM','0002_clientapproval','2019-02-15 08:49:35.429101'),(46,'CRM','0003_clientapproval_status','2019-02-15 08:50:25.619679'),(47,'CRM','0004_auto_20190215_0937','2019-02-15 09:37:38.367180'),(48,'CRM','0005_barcode_feedback_supplier_training','2019-02-15 09:39:12.920962'),(49,'CRM','0006_auto_20190218_0739','2019-02-18 07:39:15.475155'),(50,'CRM','0007_event','2019-02-21 14:09:18.603738'),(51,'CRM','0008_auto_20190221_1447','2019-02-21 14:47:46.402003'),(52,'CRM','0009_remove_training_name','2019-02-22 08:32:32.465060'),(53,'CRM','0010_auto_20190226_1205','2019-02-26 12:06:40.788434'),(54,'accounts','0011_auto_20190226_1347','2019-02-26 13:47:23.503585'),(55,'accounts','0012_auto_20190226_1555','2019-02-26 15:55:39.221793'),(56,'account','0001_initial','2019-02-27 07:02:54.714212'),(57,'account','0002_email_max_length','2019-02-27 07:02:54.986852'),(58,'sites','0001_initial','2019-02-27 07:02:55.214547'),(59,'sites','0002_alter_domain_unique','2019-02-27 07:02:55.390363'),(60,'accounts','0013_auto_20190227_0754','2019-02-27 08:29:39.267720'),(61,'departments','0003_auto_20190227_0754','2019-02-27 08:29:39.325161'),(62,'leave','0005_auto_20190227_0754','2019-02-27 08:29:39.356363'),(63,'accounts','0014_auto_20190227_0920','2020-02-22 18:37:09.857120'),(64,'accounts','0015_auto_20190320_0843','2020-02-22 18:37:09.998491'),(65,'accounts','0016_auto_20190412_1223','2020-02-22 18:37:10.019432'),(66,'accounts','0017_remove_employee_leave_balance','2020-02-22 18:37:10.172408'),(67,'accounts','0018_auto_20190416_0851','2020-02-22 18:37:10.334387'),(68,'accounts','0019_auto_20190416_0911','2020-02-22 18:37:10.374961'),(69,'accounts','0020_deduction','2020-02-22 18:37:10.567091'),(70,'accounts','0021_auto_20190417_1142','2020-02-22 18:37:10.701977'),(71,'CRM','0002_auto_20190305_0931','2020-02-22 18:37:10.714974'),(72,'CRM','0003_auto_20190305_0934','2020-02-22 18:37:10.848556'),(73,'CRM','0004_auto_20190310_1352','2020-02-22 18:37:10.963436'),(74,'CRM','0005_auto_20190311_0318','2020-02-22 18:37:10.986944'),(75,'CRM','0006_auto_20190319_0815','2020-02-22 18:37:11.045430'),(76,'CRM','0007_auto_20190416_0851','2020-02-22 18:37:11.056070'),(77,'CRM','0008_auto_20190416_0857','2020-02-22 18:37:11.069068'),(78,'CRM','0009_note','2020-02-22 18:37:11.317509'),(79,'CRM','0010_recordapprove','2020-02-22 18:37:11.644848'),(80,'CRM','0011_member','2020-02-22 18:37:11.774747'),(81,'ACCNTS','0001_initial','2020-02-22 18:37:11.970373'),(82,'ACCNTS','0002_auto_20190304_0808','2020-02-22 18:37:12.004471'),(83,'ACCNTS','0003_auto_20190305_1012','2020-02-22 18:37:12.266591'),(84,'ACCNTS','0004_payroll','2020-02-22 18:37:12.468626'),(85,'ACCNTS','0005_payment','2020-02-22 18:37:12.714700'),(86,'ACCNTS','0006_sales','2020-02-22 18:37:13.037992'),(87,'ACCNTS','0007_auto_20190320_1217','2020-02-22 18:37:13.212095'),(88,'ACCNTS','0008_remove_sales_amount_paid','2020-02-22 18:37:13.306270'),(89,'ACCNTS','0009_expense','2020-02-22 18:37:13.626035'),(90,'ACCNTS','0010_auto_20190326_0704','2020-02-22 18:37:14.039727'),(91,'ACCNTS','0011_asset_employeetax_income_liability','2020-02-22 18:37:14.498100'),(92,'ACCNTS','0012_auto_20190329_0554','2020-02-22 18:37:14.820452'),(93,'ACCNTS','0013_bank','2020-02-22 18:37:14.922786'),(94,'ACCNTS','0014_deduction','2020-02-22 18:37:15.183790'),(95,'ACCNTS','0015_auto_20190417_1150','2020-02-22 18:37:15.413891'),(96,'ACCNTS','0016_payroll_is_taxed','2020-02-22 18:37:15.522688'),(97,'ACCNTS','0017_auto_20190417_1209','2020-02-22 18:37:15.673477'),(98,'ACCNTS','0018_deduction_dated','2020-02-22 18:37:15.871862'),(99,'ACCNTS','0019_auto_20190417_1244','2020-02-22 18:37:15.937303'),(100,'ACCNTS','0020_auto_20190423_1053','2020-02-22 18:37:16.020585'),(101,'ACCNTS','0021_income_member','2020-02-22 18:37:16.194973'),(102,'ACCNTS','0022_remove_income_name','2020-02-22 18:37:16.321813'),(103,'ACCNTS','0023_auto_20190423_1113','2020-02-22 18:37:16.371372'),(104,'CRM','0012_auto_20200221_2340','2020-02-22 18:37:16.421117'),(105,'Legal','0001_initial','2020-02-22 18:37:16.717642'),(106,'Legal','0002_contract_category','2020-02-22 18:37:16.888127'),(107,'Legal','0003_auto_20190409_1202','2020-02-22 18:37:16.935358'),(108,'Legal','0004_auto_20190409_1242','2020-02-22 18:37:16.975909'),(109,'Legal','0005_category_dated','2020-02-22 18:37:17.081541'),(110,'Legal','0006_auto_20190409_1407','2020-02-22 18:37:17.119543'),(111,'Legal','0007_auto_20190410_0759','2020-02-22 18:37:17.607442'),(112,'Legal','0008_auto_20190412_1223','2020-02-22 18:37:17.678604'),(113,'hrm','0001_initial','2020-02-22 18:37:17.959332'),(114,'leave','0006_remove_applyleave_period','2020-02-22 18:37:18.458136'),(115,'leave','0007_auto_20190308_0803','2020-02-22 18:37:19.397300'),(116,'leave','0008_auto_20190308_0809','2020-02-22 18:37:20.077578'),(117,'CRM','0013_auto_20200228_1634','2020-02-28 16:34:44.828204');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('01xt6hlej9v3gz83wgo9add5bh6dsgj6','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 19:38:35.117812'),('21sg8bdd9ge4ebfmz35u2nczx14qrpm1','MDc0MGQ2MjdkM2M3MzViODlkYWQwODE1OWMxZTZiNTdiMjdhNzQ4ODp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODdlNjYwZmRhZTgxNzY2MzJmYTM3MDRiMTRlODIyNzZjZWQ3ZWU4MyJ9','2019-03-08 08:25:05.381332'),('2ikyhbi17ffsny2w0njtpg4rduc357b1','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 22:47:54.861808'),('3yxmgx3gyygcg0nw56yawlvzcddp856m','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 19:30:41.094903'),('4qoegj2dle3j7zuhywc1xpgbgvq1ta4i','MjBkZDIyZGQ4OWQ2MjkxNWVkOWU5ODFmYjZkYTgyZjNlODhkODgwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWUxNmIxOWRjOTZiYThlODBjNDdlNmJiZmRjY2EzNmFkYmJkZmVhIiwidXNlcm5hbWUiOiJvbWFtYmlhIn0=','2019-02-21 06:37:38.299883'),('4shmc1iewp34goj6oxxybzihifv9xr2y','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 02:19:03.955236'),('62it5biusmu7ugqj5cc4s540m5bu1o2u','MjBkZDIyZGQ4OWQ2MjkxNWVkOWU5ODFmYjZkYTgyZjNlODhkODgwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWUxNmIxOWRjOTZiYThlODBjNDdlNmJiZmRjY2EzNmFkYmJkZmVhIiwidXNlcm5hbWUiOiJvbWFtYmlhIn0=','2019-03-11 10:39:53.725173'),('6i5uztvg484hzg5hjg1un5s6lgmt34f5','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 20:34:42.402220'),('6lajwo23fv86ytmderf8oyqz12blzh5t','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-03 11:05:36.471531'),('7kzridgug0jg23y9x7va9v5fr9xdxion','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-27 21:53:14.419797'),('7witr7coqcfqjlgo0mq4e8adcujw1njk','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-28 00:00:38.303339'),('8hwdmik9ab8c8rj177343mypvn3elija','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 00:55:05.147821'),('9am6xuk9csylvn7hmeuca3472vbkezfu','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-03 01:12:29.030012'),('9he0sf74chgemo9zaw8hmu3j0p8wjatz','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 01:00:56.689337'),('9onpa1cpk2065iksaj4d9q8avifsksbx','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-24 18:27:54.058552'),('9sdqpr1d5c7916zh5xo7wr455z9k90bk','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-01 23:01:54.688221'),('9um0010lym6hkkmmv98y32a96cnk6bf7','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-01 21:48:34.110100'),('9ynxp22yv5k06db0fi664gk0512eqh43','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 00:57:18.427277'),('aopx9i656va4uhims2e1n2pt1cudy1hn','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 02:14:37.571642'),('ayck99omdnl098gqwfv4vlq547l1fcih','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-02 03:19:51.024410'),('bxod0dkm4h65hta9s0co8i07prqmi3uk','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-01 15:35:18.119373'),('clt43asjbd6v22jzv38d40607dmh8t8g','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-25 04:54:56.160120'),('d7f75nrl6b82kzf9cdtwy0nhvhddpzhd','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 22:34:35.164856'),('dkoc7yw179248buoeev9y0ejvuvbw8oh','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 14:30:50.807518'),('dvljs9ngzh4vajy3d20ideqz6b0xwzhy','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-28 18:44:39.289887'),('e2zfcniasgrz954ggytqljjcbel9m3ia','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 00:09:19.096055'),('e94vgqw3lffdqelsr4ic8minhfnr6fj7','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-24 05:28:31.674743'),('ep9tl5oaergom9lf1219nalc8h6w15yj','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 01:55:34.897558'),('f3o2hfsw19fgqbutqf194t9l7n8p0emy','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 22:39:02.759206'),('f6p19zq0xnsbcxok85jx7yc0x1pnnnmt','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-24 05:02:44.993814'),('fjhzcnz728jfe2dtsu0kr47ffadmt7ft','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 03:49:26.982126'),('fqho7n5ff81h4xkbo3b60jn2pz4kn9b0','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-04 13:46:12.189141'),('g2rwouyk5eruol26rqwrtdw68j51idsn','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-27 19:52:10.981023'),('gikd72z29o8kl6e70snpmcr8cxx86nlg','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-03 14:17:00.006136'),('hi78spkut1jv2cbq4xl0n0sr85m8ulx6','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 19:42:29.260003'),('i9fevegzgfff253cyobee9hv8vt63kke','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-24 05:22:57.000894'),('ilpo2cm37elhbc34y971djv2lupmekys','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 17:05:56.005294'),('j04zl87mikjysi1pevs73asrrv45yn3y','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-28 15:25:54.785029'),('k0yndoaz10sj7kb9uaed1dsk9wprytts','Y2ZiMmNkMGRkOWRkNDY3NWJkOWYwODYyOWMyZjhhOTQyYThhNWIwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWxsYXV0aC5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRpb25CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGVlMTZiMTlkYzk2YmE4ZTgwYzQ3ZTZiYmZkY2NhMzZhZGJiZGZlYSIsInVzZXJuYW1lIjoib21hbWJpYSJ9','2019-03-13 07:23:31.507224'),('krcvq0zmcyzt3xcxutbhjpr9d05k6xvh','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-01 00:03:31.115625'),('kw5ofgftv2buh5zrj54ar7mfj9n05lc6','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-23 23:13:39.074074'),('n8n5ejzniutlz0v3a7fmw6fvqmjjll6t','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-01 19:34:37.739893'),('nuv3ump6iztdxzeavjbhcdy9oaxtu989','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-28 00:01:48.563169'),('p24qzmu4i95md22av24ot7tu8uk6jcyu','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-04 01:38:08.328665'),('q7fnpdv9ulr9z8g7zf0ns0ujjic023h0','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-24 18:41:43.072879'),('qa66nez697ws1nazt2kx7ceizibtroa4','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-03 03:58:58.213941'),('qm1vzwjneg9fie4tc6hcszfz96xif81p','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-03-02 16:23:25.056568'),('scbib4r4axkzhem5h83pfw7ptj4rfam8','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-25 00:31:17.046355'),('vqyxl3hpqiar7vudllni1tdt8joyu8ta','MjBkZDIyZGQ4OWQ2MjkxNWVkOWU5ODFmYjZkYTgyZjNlODhkODgwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWUxNmIxOWRjOTZiYThlODBjNDdlNmJiZmRjY2EzNmFkYmJkZmVhIiwidXNlcm5hbWUiOiJvbWFtYmlhIn0=','2019-02-11 18:00:04.248476'),('w2j5ft06hm9wfd44pbwtj6xebki98w96','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-24 03:10:17.213808'),('wbuoner1czmsfcb71i1efb4qmpcx7wdy','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-28 21:49:08.710485'),('wieexuir7t9j3norksue12l5czi9ka7j','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 21:49:09.113204'),('wobjpektcjbum0zj1nfs7fluys9eng8g','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 20:04:22.978100'),('x0onayibalndacehynr5dgn3yszcjs83','MjBkZDIyZGQ4OWQ2MjkxNWVkOWU5ODFmYjZkYTgyZjNlODhkODgwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZWUxNmIxOWRjOTZiYThlODBjNDdlNmJiZmRjY2EzNmFkYmJkZmVhIiwidXNlcm5hbWUiOiJvbWFtYmlhIn0=','2019-02-14 17:48:16.157073'),('yrir6yonungpnucwsgubncai29d1d6do','NjkxMmRjYzUyOWQyNjhjZWEwNDllY2Q2OGNmYTU5ODAxOTIyYmRmODp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmMzOTVmZGFmMzc5ZmNiM2JhMTY5NGRkZWMwMDkzODY5YmExNDhlYSIsInVzZXJuYW1lIjoiYWRtaW4ifQ==','2020-02-29 22:11:17.192346'),('z3a33qk1jsc3mebfu1sphlady1o7kmgr','ZDY2MTEzMjk1MTY2NjNhZTMwMjgzNmMyN2ZmODI1Y2MwM2ZhNGUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2I4OGU1NzRlOThiZDVmM2Y3NDE0MzcxM2NjZjQ3Y2I2YzlkMGY0MCIsInVzZXJuYW1lIjoibGFic2lzIn0=','2020-02-27 20:02:11.981556');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrm_performance`
--

DROP TABLE IF EXISTS `hrm_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrm_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `objective` varchar(200) NOT NULL,
  `notes` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hrm_performance_employee_id_2db34f55_fk_accounts_employee_id` (`employee_id`),
  CONSTRAINT `hrm_performance_employee_id_2db34f55_fk_accounts_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrm_performance`
--

LOCK TABLES `hrm_performance` WRITE;
/*!40000 ALTER TABLE `hrm_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrm_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_applyleave`
--

DROP TABLE IF EXISTS `leave_applyleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_applyleave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `end_date` date NOT NULL,
  `resume_date` date NOT NULL,
  `home_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_id` int(11) NOT NULL,
  `person_taking_charge_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_applyleave_leave_id_24f45d69` (`leave_id`),
  KEY `leave_applyleave_person_taking_charge_id_ca981a05` (`person_taking_charge_id`),
  CONSTRAINT `leave_applyleave_leave_id_24f45d69_fk_leave_leave_id` FOREIGN KEY (`leave_id`) REFERENCES `leave_leave` (`id`),
  CONSTRAINT `leave_applyleave_person_taking_charge_ca981a05_fk_accounts_` FOREIGN KEY (`person_taking_charge_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_applyleave`
--

LOCK TABLES `leave_applyleave` WRITE;
/*!40000 ALTER TABLE `leave_applyleave` DISABLE KEYS */;
INSERT INTO `leave_applyleave` VALUES (9,'2019-02-01',1,'2019-02-07','2019-02-05','0708067459','omambia',1,1);
/*!40000 ALTER TABLE `leave_applyleave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_leave`
--

DROP TABLE IF EXISTS `leave_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_leave`
--

LOCK TABLES `leave_leave` WRITE;
/*!40000 ALTER TABLE `leave_leave` DISABLE KEYS */;
INSERT INTO `leave_leave` VALUES (1,'Sick Leave','Given any employee seeking medical attention','2019-01-29');
/*!40000 ALTER TABLE `leave_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_payroll`
--

DROP TABLE IF EXISTS `payroll_payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payroll_file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_payroll_employee_id_cd24ccf6_fk_accounts_employee_id` (`employee_id`),
  CONSTRAINT `payroll_payroll_employee_id_cd24ccf6_fk_accounts_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_payroll`
--

LOCK TABLES `payroll_payroll` WRITE;
/*!40000 ALTER TABLE `payroll_payroll` DISABLE KEYS */;
INSERT INTO `payroll_payroll` VALUES (1,'documents/payroll/80cda5f7804548698721c849fc1783a4.pdf','2019-01-30',1),(2,'documents/payroll/09ff2e3f1253412b838528bdae750be5.pdf','2019-01-30',1);
/*!40000 ALTER TABLE `payroll_payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targets_target`
--

DROP TABLE IF EXISTS `targets_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targets_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_appraisal` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `who_appraised` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `targets_target_employee_id_18397c0c_fk_accounts_employee_id` (`employee_id`),
  CONSTRAINT `targets_target_employee_id_18397c0c_fk_accounts_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `accounts_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targets_target`
--

LOCK TABLES `targets_target` WRITE;
/*!40000 ALTER TABLE `targets_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `targets_target` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-04 13:24:07
