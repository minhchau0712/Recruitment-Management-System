-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `ApplicationID` int NOT NULL,
  `CandidateID` int DEFAULT NULL,
  `PositionID` int DEFAULT NULL,
  `ApplicationDate` date NOT NULL,
  `Status` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`ApplicationID`),
  KEY `PositionID_idx` (`PositionID`),
  KEY `CandidateID_idx` (`CandidateID`),
  KEY `idx_application_date` (`ApplicationDate`),
  CONSTRAINT `CandidateID` FOREIGN KEY (`CandidateID`) REFERENCES `candidates` (`CandidateID`),
  CONSTRAINT `PositionID` FOREIGN KEY (`PositionID`) REFERENCES `jobpositions` (`PositionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,1,'2024-01-10','Accepted'),(2,2,2,'2024-01-12','Accepted'),(3,3,3,'2024-01-15','Rejected'),(4,4,4,'2024-01-18','Pending'),(5,5,5,'2024-01-20','Accepted'),(6,6,6,'2024-01-22','Pending'),(7,7,7,'2024-01-25','Accepted'),(8,8,1,'2024-01-28','Pending'),(9,1,3,'2024-02-01','Accepted'),(10,2,5,'2024-02-05','Rejected');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `CandidateID` int NOT NULL,
  `CandidateName` varchar(45) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CandidateID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'Nguyen Van An','2000-05-12','an.nguyen@gmail.com','0901234567'),(2,'Tran Thi Bich','1999-08-23','bich.tran@gmail.com','0912345678'),(3,'Le Van Cuong','2001-03-15','cuong.le@gmail.com','0923456789'),(4,'Pham Thi Dung','2000-11-30','dung.pham@gmail.com','0934567890'),(5,'Hoang Van Em','1998-07-04','em.hoang@gmail.com','0945678901'),(6,'Vo Thi Phuong','2001-01-20','phuong.vo@gmail.com','0956789012'),(7,'Dang Van Quang','1999-09-17','quang.dang@gmail.com','0967890123'),(8,'Bui Thi Hoa','2000-06-08','hoa.bui@gmail.com','0978901234');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `detailedinterviewresults`
--

DROP TABLE IF EXISTS `detailedinterviewresults`;
/*!50001 DROP VIEW IF EXISTS `detailedinterviewresults`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detailedinterviewresults` AS SELECT 
 1 AS `CandidateName`,
 1 AS `PositionName`,
 1 AS `InterviewDate`,
 1 AS `Result`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employers`
--

DROP TABLE IF EXISTS `employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employers` (
  `EmployerID` int NOT NULL,
  `EmployerName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EmployerID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employers`
--

LOCK TABLES `employers` WRITE;
/*!40000 ALTER TABLE `employers` DISABLE KEYS */;
INSERT INTO `employers` VALUES (1,'FPT Software','hr@fpt.com','0241234567'),(2,'VNG Corporation','recruit@vng.com','0289876543'),(3,'Vingroup','hr@vingroup.vn','0243456789'),(4,'Momo','talent@momo.vn','0287654321'),(5,'Tiki','jobs@tiki.vn','0282345678'),(6,'Grab Vietnam','hr@grab.com','0281234567'),(7,'Shopee Vietnam','recruit@shopee.com','0283456789');
/*!40000 ALTER TABLE `employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interviews` (
  `InterviewID` int NOT NULL AUTO_INCREMENT,
  `ApplicationID` int DEFAULT NULL,
  `InterviewDate` date NOT NULL,
  `Result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`InterviewID`),
  KEY `ApplicationID_idx` (`ApplicationID`),
  CONSTRAINT `ApplicationID` FOREIGN KEY (`ApplicationID`) REFERENCES `applications` (`ApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
INSERT INTO `interviews` VALUES (1,2,'2024-01-20','Pass'),(2,3,'2024-01-22','Fail'),(3,5,'2024-01-28','Pass'),(4,7,'2024-02-01','Pass'),(5,9,'2024-02-10','Pass'),(6,10,'2024-02-12','Fail'),(7,1,'2024-02-15','Pass'),(8,4,'2024-02-18','Pending'),(9,1,'2026-05-20','Pass');
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `After_Interview_Result_Update` AFTER UPDATE ON `interviews` FOR EACH ROW BEGIN
    IF NEW.Result = 'Pass' THEN
        UPDATE Applications 
        SET Status = 'Accepted' 
        WHERE ApplicationID = NEW.ApplicationID;
    ELSEIF NEW.Result = 'Fail' THEN
        UPDATE Applications 
        SET Status = 'Rejected' 
        WHERE ApplicationID = NEW.ApplicationID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `jobapplicationsummaries`
--

DROP TABLE IF EXISTS `jobapplicationsummaries`;
/*!50001 DROP VIEW IF EXISTS `jobapplicationsummaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jobapplicationsummaries` AS SELECT 
 1 AS `PositionName`,
 1 AS `TotalApplications`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jobpositions`
--

DROP TABLE IF EXISTS `jobpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpositions` (
  `PositionID` int NOT NULL,
  `PositionName` varchar(45) DEFAULT NULL,
  `JobDescription` longtext,
  `EmployerID` int DEFAULT NULL,
  PRIMARY KEY (`PositionID`),
  KEY `EmployerID_idx` (`EmployerID`),
  KEY `idx_position_name` (`PositionName`),
  CONSTRAINT `EmployerID` FOREIGN KEY (`EmployerID`) REFERENCES `employers` (`EmployerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobpositions`
--

LOCK TABLES `jobpositions` WRITE;
/*!40000 ALTER TABLE `jobpositions` DISABLE KEYS */;
INSERT INTO `jobpositions` VALUES (1,'Backend Developer','Develop and maintain server-side applications using Java or Python',1),(2,'Frontend Developer','Build responsive UI with ReactJS and NextJS',2),(3,'Data Analyst','Analyze business data and create reports using SQL and Python',3),(4,'Mobile Developer','Develop mobile apps for Android and iOS platforms',4),(5,'DevOps Engineer','Manage CI/CD pipelines and cloud infrastructure',5),(6,'QA Engineer','Design and execute test cases for software quality assurance',6),(7,'Product Manager','Define product roadmap and coordinate development teams',7);
/*!40000 ALTER TABLE `jobpositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `shortlistedcandidates`
--

DROP TABLE IF EXISTS `shortlistedcandidates`;
/*!50001 DROP VIEW IF EXISTS `shortlistedcandidates`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `shortlistedcandidates` AS SELECT 
 1 AS `CandidateName`,
 1 AS `Email`,
 1 AS `PositionName`,
 1 AS `InterviewDate`,
 1 AS `Result`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetAppCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetAppCount`(p_PositionID INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total 
    FROM Applications 
    WHERE PositionID = p_PositionID;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ScheduleInterview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ScheduleInterview`(
    IN p_ApplicationID INT,
    IN p_InterviewDate DATE
)
BEGIN
    -- Thêm một bản ghi phỏng vấn mới với kết quả mặc định là 'Pending'
    INSERT INTO Interviews (ApplicationID, InterviewDate, Result)
    VALUES (p_ApplicationID, p_InterviewDate, 'Pending');
    
    -- Thông báo thành công
    SELECT 'Interview scheduled successfully!' AS Message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `detailedinterviewresults`
--

/*!50001 DROP VIEW IF EXISTS `detailedinterviewresults`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detailedinterviewresults` AS select `c`.`CandidateName` AS `CandidateName`,`p`.`PositionName` AS `PositionName`,`i`.`InterviewDate` AS `InterviewDate`,`i`.`Result` AS `Result` from (((`interviews` `i` join `applications` `a` on((`i`.`ApplicationID` = `a`.`ApplicationID`))) join `candidates` `c` on((`a`.`CandidateID` = `c`.`CandidateID`))) join `jobpositions` `p` on((`a`.`PositionID` = `p`.`PositionID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jobapplicationsummaries`
--

/*!50001 DROP VIEW IF EXISTS `jobapplicationsummaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jobapplicationsummaries` AS select `p`.`PositionName` AS `PositionName`,count(`a`.`ApplicationID`) AS `TotalApplications` from (`jobpositions` `p` left join `applications` `a` on((`p`.`PositionID` = `a`.`ApplicationID`))) group by `p`.`PositionName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shortlistedcandidates`
--

/*!50001 DROP VIEW IF EXISTS `shortlistedcandidates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shortlistedcandidates` AS select `c`.`CandidateName` AS `CandidateName`,`c`.`Email` AS `Email`,`p`.`PositionName` AS `PositionName`,`i`.`InterviewDate` AS `InterviewDate`,`i`.`Result` AS `Result` from (((`candidates` `c` join `applications` `a` on((`c`.`CandidateID` = `a`.`CandidateID`))) join `jobpositions` `p` on((`a`.`PositionID` = `p`.`PositionID`))) join `interviews` `i` on((`a`.`ApplicationID` = `i`.`ApplicationID`))) where (`i`.`Result` = 'Pass') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 15:56:47
