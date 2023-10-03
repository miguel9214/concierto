/*
MySQL Backup
Database: dbconcierto
Backup Time: 2023-10-02 20:40:35
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `dbconcierto`.`details`;
DROP TABLE IF EXISTS `dbconcierto`.`methodpayment`;
DROP TABLE IF EXISTS `dbconcierto`.`migrations`;
DROP TABLE IF EXISTS `dbconcierto`.`payments`;
DROP TABLE IF EXISTS `dbconcierto`.`shopping`;
DROP TABLE IF EXISTS `dbconcierto`.`tickets`;
DROP TABLE IF EXISTS `dbconcierto`.`users`;
CREATE TABLE `details` (
  `id` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `type_ticket_id` int DEFAULT NULL,
  `shopping_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_shoping` (`shopping_id`),
  CONSTRAINT `detail_shoping` FOREIGN KEY (`shopping_id`) REFERENCES `shopping` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `methodpayment` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `payments` (
  `id` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `transation_id` int DEFAULT NULL,
  `references_external` varchar(255) DEFAULT NULL,
  `method_payment_id` int DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `created_up` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methodpayment` (`method_payment_id`),
  CONSTRAINT `payment_methodpayment` FOREIGN KEY (`method_payment_id`) REFERENCES `methodpayment` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `shopping` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addres` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `created_up` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_uo` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_payment` (`payment_id`),
  CONSTRAINT `shopping_payment` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `tickets` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `created_by_user` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_user` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_tickets_user` (`created_by_user`),
  KEY `updated_tickets_user` (`updated_by_user`),
  CONSTRAINT `created_tickets_user` FOREIGN KEY (`created_by_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `updated_tickets_user` FOREIGN KEY (`updated_by_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
BEGIN;
LOCK TABLES `dbconcierto`.`details` WRITE;
DELETE FROM `dbconcierto`.`details`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `dbconcierto`.`methodpayment` WRITE;
DELETE FROM `dbconcierto`.`methodpayment`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `dbconcierto`.`migrations` WRITE;
DELETE FROM `dbconcierto`.`migrations`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `dbconcierto`.`payments` WRITE;
DELETE FROM `dbconcierto`.`payments`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `dbconcierto`.`shopping` WRITE;
DELETE FROM `dbconcierto`.`shopping`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `dbconcierto`.`tickets` WRITE;
DELETE FROM `dbconcierto`.`tickets`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `dbconcierto`.`users` WRITE;
DELETE FROM `dbconcierto`.`users`;
INSERT INTO `dbconcierto`.`users` (`id`,`name`,`email`,`phone`,`password`,`status`,`updated_at`,`created_at`) VALUES (1, 'miguel Ramos', 'miguel921433@gmail.com', '3178519427', '$2y$10$Gr82yuLfS5/GwEsnrSvu4.MSbhcbWut8./e.eAgba8wufI0PqhTMy', NULL, '2023-10-03 01:33:11', '2023-10-03 01:33:11');
UNLOCK TABLES;
COMMIT;
