-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: zoo_species_management
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal_placement`
--

DROP TABLE IF EXISTS `animal_placement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal_placement` (
  `placement_id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int NOT NULL,
  `enclosure_id` int NOT NULL,
  `enclosure_name` varchar(100) NOT NULL,
  `date_placed` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`placement_id`),
  KEY `fk_placement_animal` (`animal_id`),
  KEY `fk_placement_enclosure` (`enclosure_id`),
  CONSTRAINT `fk_placement_animal` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_placement_enclosure` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`enclosure_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_enclosure_name_on_insert` BEFORE INSERT ON `animal_placement` FOR EACH ROW BEGIN
  DECLARE v_enclosure_name VARCHAR(100);
  SELECT name
    INTO v_enclosure_name
  FROM enclosures
  WHERE enclosure_id = NEW.enclosure_id
  LIMIT 1;
  SET NEW.enclosure_name = v_enclosure_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_enclosure_name_on_update` BEFORE UPDATE ON `animal_placement` FOR EACH ROW BEGIN
  
  DECLARE v_enclosure_name2 VARCHAR(100);
  
  
  IF OLD.enclosure_id <> NEW.enclosure_id THEN
    SELECT name
      INTO v_enclosure_name2
    FROM enclosures
    WHERE enclosure_id = NEW.enclosure_id
    LIMIT 1;
    
    SET NEW.enclosure_name = v_enclosure_name2;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `species_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `species_common_name` varchar(100) NOT NULL,
  `species_diet_type` enum('Herbivore','Carnivore','Omnivore') NOT NULL,
  `conservation_status` enum('Least Concern','Near Threatened','Vulnerable','Endangered','Critically Endangered','Extinct') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`animal_id`),
  KEY `fk_animals_species` (`species_id`),
  CONSTRAINT `fk_animals_species` FOREIGN KEY (`species_id`) REFERENCES `species` (`species_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_species_details_animals` BEFORE INSERT ON `animals` FOR EACH ROW BEGIN
  DECLARE v_common VARCHAR(100);
  DECLARE v_diet   ENUM('Herbivore','Carnivore','Omnivore');
  DECLARE v_status ENUM(
    'Least Concern','Near Threatened','Vulnerable',
    'Endangered','Critically Endangered','Extinct'
  );
  SELECT common_name, diet_type, conservation_status
    INTO v_common, v_diet, v_status
  FROM species
  WHERE species_id = NEW.species_id
  LIMIT 1;
  SET NEW.species_common_name = v_common;
  SET NEW.species_diet_type   = v_diet;
  SET NEW.conservation_status = v_status;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_species_details_animals_on_update` BEFORE UPDATE ON `animals` FOR EACH ROW BEGIN
  
  DECLARE v_common2 VARCHAR(100);
  DECLARE v_diet2   ENUM('Herbivore','Carnivore','Omnivore');
  DECLARE v_status2 ENUM(
    'Least Concern','Near Threatened','Vulnerable',
    'Endangered','Critically Endangered','Extinct'
  );
  
  
  IF OLD.species_id <> NEW.species_id THEN
    SELECT common_name, diet_type, conservation_status
      INTO v_common2, v_diet2, v_status2
    FROM species
    WHERE species_id = NEW.species_id
    LIMIT 1;
    
    SET NEW.species_common_name = v_common2;
    SET NEW.species_diet_type   = v_diet2;
    SET NEW.conservation_status = v_status2;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cuisine_types`
--

DROP TABLE IF EXISTS `cuisine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine_types` (
  `cuisine_type_id` int NOT NULL AUTO_INCREMENT,
  `cuisine_name` varchar(50) NOT NULL,
  PRIMARY KEY (`cuisine_type_id`),
  UNIQUE KEY `cuisine_name` (`cuisine_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eateries`
--

DROP TABLE IF EXISTS `eateries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eateries` (
  `eatery_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cuisine_type_id` int NOT NULL,
  `average_price_range` decimal(6,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`eatery_id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_eateries_cuisine` (`cuisine_type_id`),
  CONSTRAINT `fk_eateries_cuisine` FOREIGN KEY (`cuisine_type_id`) REFERENCES `cuisine_types` (`cuisine_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eatery_enclosure_proximity`
--

DROP TABLE IF EXISTS `eatery_enclosure_proximity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eatery_enclosure_proximity` (
  `proximity_id` int NOT NULL AUTO_INCREMENT,
  `eatery_id` int NOT NULL,
  `enclosure_id` int NOT NULL,
  `distance_meters` decimal(5,2) NOT NULL,
  `walking_time_minutes` decimal(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`proximity_id`),
  KEY `fk_proximity_eatery` (`eatery_id`),
  KEY `fk_proximity_enclosure` (`enclosure_id`),
  CONSTRAINT `fk_proximity_eatery` FOREIGN KEY (`eatery_id`) REFERENCES `eateries` (`eatery_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_proximity_enclosure` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`enclosure_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `enclosure_animal_view`
--

DROP TABLE IF EXISTS `enclosure_animal_view`;
/*!50001 DROP VIEW IF EXISTS `enclosure_animal_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `enclosure_animal_view` AS SELECT 
 1 AS `enclosure_name`,
 1 AS `animal_names`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `enclosure_species_view`
--

DROP TABLE IF EXISTS `enclosure_species_view`;
/*!50001 DROP VIEW IF EXISTS `enclosure_species_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `enclosure_species_view` AS SELECT 
 1 AS `enclosure_name`,
 1 AS `species_names`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enclosures`
--

DROP TABLE IF EXISTS `enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enclosures` (
  `enclosure_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `environment_type` enum('Savannah','Rainforest','Desert','Aquatic','Reptile House','Aviary','Mixed') NOT NULL,
  `capacity` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`enclosure_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cascade_enclosure_name_changes` AFTER UPDATE ON `enclosures` FOR EACH ROW BEGIN
  IF OLD.name <> NEW.name THEN
    UPDATE animal_placement
    SET enclosure_name = NEW.name,
        updated_at = CURRENT_TIMESTAMP
    WHERE enclosure_id = NEW.enclosure_id;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `eatery_id` int NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `dietary_type` enum('Vegetarian','Vegan','Non-Vegetarian','Gluten-Free','Other') NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `fk_menu_items_eatery` (`eatery_id`),
  CONSTRAINT `fk_menu_items_eatery` FOREIGN KEY (`eatery_id`) REFERENCES `eateries` (`eatery_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `species_id` int NOT NULL AUTO_INCREMENT,
  `common_name` varchar(100) NOT NULL,
  `scientific_name` varchar(150) DEFAULT NULL,
  `kingdom` varchar(50) DEFAULT NULL,
  `phylum` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `order` varchar(50) DEFAULT NULL,
  `family` varchar(50) DEFAULT NULL,
  `diet_type` enum('Herbivore','Carnivore','Omnivore') NOT NULL,
  `conservation_status` enum('Least Concern','Near Threatened','Vulnerable','Endangered','Critically Endangered','Extinct') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`species_id`),
  UNIQUE KEY `common_name` (`common_name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sync_species_to_animals` AFTER UPDATE ON `species` FOR EACH ROW BEGIN
  UPDATE animals
  SET
    species_common_name   = NEW.common_name,
    species_diet_type     = NEW.diet_type,
    conservation_status   = NEW.conservation_status,
    updated_at            = CURRENT_TIMESTAMP
  WHERE species_id = NEW.species_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'zoo_species_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_new_animal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_animal`(
  IN p_species_id INT,
  IN p_name VARCHAR(100),
  IN p_date_of_birth DATE,
  IN p_gender ENUM('Male','Female'),
  IN p_enclosure_id INT
)
BEGIN
  INSERT INTO animals (
    species_id, name, date_of_birth, gender
  ) VALUES (
    p_species_id, p_name, p_date_of_birth, p_gender
  );

  INSERT INTO animal_placement (
    animal_id, enclosure_id, date_placed
  ) VALUES (
    LAST_INSERT_ID(),
    p_enclosure_id,
    CURRENT_DATE()
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_enclosure_capacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_enclosure_capacity`(IN p_enclosure_id INT)
BEGIN
  DECLARE v_total_cap INT;
  DECLARE v_current_count INT;
  DECLARE v_remaining INT;

  SELECT capacity
    INTO v_total_cap
  FROM enclosures
  WHERE enclosure_id = p_enclosure_id;

  SELECT COUNT(*)
    INTO v_current_count
  FROM animal_placement
  WHERE enclosure_id = p_enclosure_id;

  SET v_remaining = v_total_cap - v_current_count;

  SELECT
    v_total_cap      AS total_capacity,
    v_current_count  AS current_animals,
    v_remaining      AS remaining_capacity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `enclosure_animal_view`
--

/*!50001 DROP VIEW IF EXISTS `enclosure_animal_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `enclosure_animal_view` AS select `e`.`name` AS `enclosure_name`,group_concat(`a`.`name` order by `a`.`name` ASC separator ', ') AS `animal_names` from ((`animal_placement` `ap` join `animals` `a` on((`ap`.`animal_id` = `a`.`animal_id`))) join `enclosures` `e` on((`ap`.`enclosure_id` = `e`.`enclosure_id`))) group by `e`.`enclosure_id`,`e`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `enclosure_species_view`
--

/*!50001 DROP VIEW IF EXISTS `enclosure_species_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `enclosure_species_view` AS select `e`.`name` AS `enclosure_name`,group_concat(distinct `a`.`species_common_name` order by `a`.`species_common_name` ASC separator ', ') AS `species_names` from ((`animal_placement` `ap` join `animals` `a` on((`ap`.`animal_id` = `a`.`animal_id`))) join `enclosures` `e` on((`ap`.`enclosure_id` = `e`.`enclosure_id`))) group by `e`.`enclosure_id`,`e`.`name` */;
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

-- Dump completed on 2025-06-17 17:22:01
