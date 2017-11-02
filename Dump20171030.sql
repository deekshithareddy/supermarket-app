-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(45) DEFAULT NULL,
  `customerphno` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'cus1','1236547896','272/b ads colony'),(2,'cus2','1236547896','272/b ads colony'),(3,'cus3','1236547896','272/b ads colony');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(45) DEFAULT NULL,
  `employeephno` varchar(45) DEFAULT NULL,
  `employeeemail` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin','1234567893','admin@gmail.com','admin'),(2,'emp1','1234567896','emp1@gmail.com','emp1');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemlist`
--

DROP TABLE IF EXISTS `itemlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemlist` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(45) DEFAULT NULL,
  `itemprice` varchar(45) DEFAULT NULL,
  `itemquantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemlist`
--

LOCK TABLES `itemlist` WRITE;
/*!40000 ALTER TABLE `itemlist` DISABLE KEYS */;
INSERT INTO `itemlist` VALUES (1,'icecreames','20','6'),(2,'chocs','22	','18'),(3,'pens','50','35'),(4,'papers','23','2'),(5,'choclets','24','200'),(6,'bisckets','56','8'),(7,'dal','23','24'),(8,'straberries','23','51'),(9,'vegiees','56','60'),(10,'knife','23','50'),(11,'combs','10','8'),(12,'matts','56','56'),(13,'watchs','8','200'),(14,'bottels','5','200'),(15,'caps','23','200'),(16,'peanuts','6','3'),(17,'belts','7','7'),(18,'soups','8','8'),(19,'rice','9','6'),(20,'ricebowl','10','10'),(21,'soaps','11','11'),(22,'spoons','12','12'),(23,'powder','13','14'),(24,'deos','15','16'),(25,'fruits','17','18'),(26,'drinks','19','20'),(27,'clips','21','22'),(28,'water','23','24'),(29,'books','25','26'),(30,'cake','27','28'),(31,'soachunks','29','30'),(32,'soabeens','31','32'),(33,'breadcrums','33	','34'),(34,'fries','35','36'),(35,'apples','37','38'),(36,'potatos','39','40'),(37,'lays','41','42'),(38,'perfumes','43','44'),(39,'eggs','45','46'),(40,'tictac','47','48'),(41,'gum','49','50'),(42,'polo','51','52'),(43,'coke','10','20'),(44,'mazza','35','20'),(45,'sprite','35','36');
/*!40000 ALTER TABLE `itemlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitems` (
  `orderitemsid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `tax_per` int(11) DEFAULT NULL,
  `totalamount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitemsid`),
  KEY `fk_orderitems_1_idx` (`orderid`),
  KEY `fk_orderitems_2_idx` (`itemid`),
  CONSTRAINT `fk_orderitems_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitems_2` FOREIGN KEY (`itemid`) REFERENCES `itemlist` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,NULL,20,10,200,10,220),(2,2,NULL,5,10,50,5,55),(3,3,NULL,20,40,800,10,200),(4,16,1,2,10,20,20,22),(5,18,1,35,10,350,20,420),(6,19,2,15,2,30,NULL,30),(7,3,4,20,2,40,2,42),(8,23,4,20,1,20,NULL,20),(9,23,2,15,5,75,NULL,75),(10,24,1,35,20,700,20,840),(11,25,6,5,10,50,NULL,50),(12,25,9,20,2,40,NULL,40),(13,28,9,20,1,20,NULL,20),(14,28,11,5,20,100,NULL,100),(15,3,4,20,2,40,2,42),(16,30,5,50,2,100,NULL,100),(17,31,3,50,20,1000,NULL,1000),(18,31,2,22,2,44,NULL,44),(19,31,4,23,10,230,NULL,230),(20,35,6,56,12,672,NULL,672),(21,36,9,56,20,1120,NULL,1120),(22,37,11,10,2,20,NULL,20),(23,38,11,10,2,20,NULL,20),(24,39,9,56,3,168,NULL,168),(25,40,14,5,10,50,NULL,50),(26,41,15,23,1,23,NULL,23),(27,42,4,23,2,46,NULL,46),(28,42,6,56,1,56,NULL,56),(29,43,4,23,2,46,NULL,46),(30,44,5,24,5,120,NULL,120),(31,45,11,10,6,60,NULL,60),(32,45,11,10,2,20,NULL,20),(33,46,6,56,2,112,NULL,112),(34,46,9,56,6,336,NULL,336),(35,47,4,23,2,46,NULL,46),(36,48,10,23,5,115,NULL,115),(37,49,16,6,3,18,NULL,18),(38,49,4,23,1,23,NULL,23),(39,50,3,50,20,1000,NULL,1000),(40,50,13,8,13,104,NULL,104),(41,50,19,9,3,27,NULL,27),(42,51,4,23,1,23,NULL,23),(43,51,1,20,2,40,20,48),(44,51,10,23,10,230,NULL,230),(45,51,3,50,10,500,NULL,500),(46,53,5,24,60,1440,NULL,1440),(47,53,1,20,2,40,20,48),(48,53,1,20,6,120,20,144),(49,54,1,20,2,40,20,48),(50,55,1,20,2,40,8,48);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `employeeid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `employeeid_idx` (`employeeid`),
  CONSTRAINT `employeeid` FOREIGN KEY (`employeeid`) REFERENCES `employee` (`employeeid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,NULL,220),(2,1,NULL,55),(3,1,'2017-10-26',200),(4,1,'2017-10-26',NULL),(5,2,'2017-10-26',NULL),(6,2,'2017-10-26',NULL),(7,2,'2017-10-26',NULL),(8,2,'2017-10-26',NULL),(9,2,'2017-10-26',NULL),(10,2,'2017-10-26',NULL),(11,2,'2017-10-26',NULL),(12,2,'2017-10-26',NULL),(13,2,'2017-10-26',NULL),(14,2,'2017-10-26',NULL),(15,2,'2017-10-26',NULL),(16,2,'2017-10-26',NULL),(17,2,'2017-10-26',NULL),(18,1,'2017-10-27',NULL),(19,1,'2017-10-27',NULL),(20,NULL,NULL,220),(21,NULL,NULL,220),(22,NULL,NULL,55),(23,1,'2017-10-27',NULL),(24,1,'2017-10-27',840),(25,1,'2017-10-27',90),(26,1,'2017-10-27',NULL),(27,1,'2017-10-27',NULL),(28,1,'2017-10-27',120),(29,1,'2017-10-27',NULL),(30,2,'2017-10-27',100),(31,1,'2017-10-30',1274),(32,2,'2017-10-30',NULL),(33,2,'2017-10-30',NULL),(34,2,'2017-10-30',NULL),(35,1,'2017-10-30',672),(36,1,'2017-10-30',1120),(37,1,'2017-10-30',20),(38,1,'2017-10-30',20),(39,1,'2017-10-30',168),(40,1,'2017-10-30',50),(41,1,'2017-10-30',23),(42,1,'2017-10-30',102),(43,1,'2017-10-30',46),(44,1,'2017-10-30',120),(45,1,'2017-10-30',80),(46,1,'2017-10-30',448),(47,1,'2017-10-30',46),(48,1,'2017-10-30',115),(49,1,'2017-10-30',41),(50,1,'2017-10-30',1131),(51,1,'2017-10-30',801),(52,1,'2017-10-30',NULL),(53,1,'2017-10-30',1632),(54,1,'2017-10-30',48),(55,1,'2017-10-30',48);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `taxid` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `tax_per` int(11) NOT NULL,
  PRIMARY KEY (`taxid`),
  KEY `fk_tax_1_idx` (`itemid`),
  CONSTRAINT `fk_tax_1` FOREIGN KEY (`itemid`) REFERENCES `itemlist` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (1,1,'2017-01-01','2017-03-31',10),(2,1,'2017-03-28','2017-12-31',20);
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shopping'
--
/*!50003 DROP PROCEDURE IF EXISTS `addcustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addcustomer`(IN cname VARCHAR(50), IN cphno VARCHAR(50), IN caddress VARCHAR(50))
BEGIN 
insert into customer (customername, customerphno, address) values (cname, cphno, caddress);  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addorderitems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addorderitems`(IN oid INT, IN iid INT, IN iprice INT, IN iquantity INT, IN iamount INT, IN itax INT, IN itotalamount INT)
BEGIN 
insert into orderitems (orderid, itemid, price, quantity, amount, tax_per, totalamount) values (oid, iid, iprice, iquantity, iamount, itax, itotalamount);
select orderid,itemid,price,quantity,amount,tax_per,totalamount from orderitems where orderitemsid=LAST_INSERT_ID(); 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createItems`(IN iname VARCHAR(50), IN iprice VARCHAR(50), IN quantity VARCHAR(50))
BEGIN 
insert into itemlist (itemname, itemprice, itemquantity) values (iname, iprice, quantity);  
select * from itemlist where itemid=LAST_INSERT_ID(); 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createorder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createorder`(IN eid INT)
BEGIN 
insert into orders (employeeid, date) values (eid, CURDATE());  
select * from orders where orderid=LAST_INSERT_ID();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emplogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emplogin`(IN ename VARCHAR(50), IN epswd VARCHAR(50))
BEGIN
select * from employee where employeename=ename and password=epswd;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getorderlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getorderlist`(IN eid INT)
BEGIN 
select * from orders where employeeid=eid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gettaxpercentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gettaxpercentage`(IN iid INT)
BEGIN 
select min(tax_per) as tax_per, itemname, itemprice, itemquantity  from tax 
join 
itemlist on tax.itemid=itemlist.itemid 
where tax.itemid=iid and CURDATE()>=tax.fromdate and CURDATE()<=tax.todate and itemlist.itemid=iid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showitemlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `showitemlist`()
BEGIN
select * from itemlist;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateItemlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateItemlist`(IN iid INT, IN quantity VARCHAR(50))
BEGIN
UPDATE itemlist
SET itemquantity= quantity
WHERE itemid = iid;
select * from itemlist;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateItems`(IN iid INT, IN iname VARCHAR(50), IN iprice VARCHAR(50), IN quantity VARCHAR(50))
BEGIN
UPDATE itemlist
SET itemname = iname, itemprice= iprice, itemquantity= quantity
WHERE itemid = iid;
select * from shopping.itemlist where itemid= iid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateorders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateorders`(IN oid INT)
BEGIN
UPDATE orders
SET amount =(SELECT  sum(totalamount) from orderitems where orderid=oid) where orderid=oid;
SELECT  sum(totalamount) as totalamount, sum(amount) as amount, sum(tax_per) as tax_per from orderitems where orderid=oid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-30 15:38:15
