/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.4.6-MariaDB : Database - simple_ordering
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`simple_ordering` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `simple_ordering`;

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `less_percent` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupons` */

insert  into `coupons`(`id`,`code`,`less_percent`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values (1,'GO2018',10,0,'2021-07-17 04:07:17','2021-07-17 04:07:17',NULL),(2,'GG',100,0,'2021-07-17 04:20:14','2021-07-17 04:20:34','2021-07-17 04:20:34'),(3,'GG',100,0,'2021-07-17 04:20:56','2021-07-17 04:20:58','2021-07-17 04:20:58'),(4,'gg',10,0,'2021-07-17 04:21:36','2021-07-17 04:21:40','2021-07-17 04:21:40'),(5,'ggg',3123123,0,'2021-07-17 04:21:57','2021-07-17 04:21:59','2021-07-17 04:21:59'),(6,'INAYABS GWAPO',50,1,'2021-07-17 05:43:03','2021-07-18 11:06:50',NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('Burgers','Beverages','Combo Meals') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `tax` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `items` */

insert  into `items`(`id`,`name`,`category`,`price`,`tax`,`created_at`,`updated_at`,`deleted_at`) values (1,'Crabby Patty','Burgers',200.00,20,'2021-07-15 03:47:58','2021-07-15 03:47:58',NULL),(2,'Tanduay','Beverages',50.00,0,'2021-07-15 03:54:14','2021-07-15 03:54:14',NULL),(3,'Chicken with rice','Combo Meals',50.00,2,'2021-07-15 03:54:45','2021-07-15 03:54:58',NULL),(4,'Beef Borgir','Burgers',60.00,0,'2021-07-15 04:14:52','2021-07-15 04:14:52',NULL),(5,'for delete','Burgers',123.00,123,'2021-07-17 03:32:43','2021-07-17 03:32:43',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_07_13_234153_create_permission_tables',1),(5,'2021_07_13_234234_add_users_deleted_and_active',1),(6,'2021_07_13_234331_create_transaction',1),(7,'2021_07_13_234350_create_transaction_details',1),(8,'2021_07_13_234408_creat_item_table',1),(9,'2021_07_15_040117_add_deleted_item',2),(10,'2021_07_15_143927_add_user_id_in_transaction',3),(11,'2021_07_17_032857_create_coupons_table',4),(12,'2021_07_17_055129_updatetransaction',5),(13,'2021_07_18_010104_add_deducted_amount_transaction',6);

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',2),(1,'App\\Models\\User',3),(1,'App\\Models\\User',4),(1,'App\\Models\\User',10),(3,'App\\Models\\User',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'User','web','2021-07-14 00:01:54','2021-07-14 00:01:54'),(2,'Staff','web','2021-07-14 00:02:17','2021-07-14 00:02:17'),(3,'Admin','web','2021-07-14 00:02:26','2021-07-14 00:02:26');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(9,2) NOT NULL,
  `deducted_total` decimal(9,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction` */

insert  into `transaction`(`id`,`coupon_code`,`total_amount`,`deducted_total`,`user_id`,`created_at`,`updated_at`,`deleted_at`) values (14,NULL,628.00,NULL,10,'2021-07-18 01:06:53','2021-07-18 01:06:53',NULL),(15,'INAYABS GWAPO',628.00,314.00,10,'2021-07-18 01:07:14','2021-07-18 01:07:14',NULL),(16,NULL,246.00,NULL,10,'2021-07-18 11:05:53','2021-07-18 11:05:53',NULL);

/*Table structure for table `transaction_details` */

DROP TABLE IF EXISTS `transaction_details`;

CREATE TABLE `transaction_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `transaction_details` */

insert  into `transaction_details`(`id`,`transaction_id`,`item_id`,`quantity`,`subtotal`,`created_at`,`updated_at`,`deleted_at`) values (30,14,5,1,246.00,'2021-07-18 01:06:53','2021-07-18 01:06:53',NULL),(31,14,4,1,60.00,'2021-07-18 01:06:53','2021-07-18 01:06:53',NULL),(32,14,3,1,52.00,'2021-07-18 01:06:53','2021-07-18 01:06:53',NULL),(33,14,2,1,50.00,'2021-07-18 01:06:53','2021-07-18 01:06:53',NULL),(34,14,1,1,220.00,'2021-07-18 01:06:53','2021-07-18 01:06:53',NULL),(35,15,5,1,246.00,'2021-07-18 01:07:14','2021-07-18 01:07:14',NULL),(36,15,4,1,60.00,'2021-07-18 01:07:14','2021-07-18 01:07:14',NULL),(37,15,3,1,52.00,'2021-07-18 01:07:14','2021-07-18 01:07:14',NULL),(38,15,2,1,50.00,'2021-07-18 01:07:14','2021-07-18 01:07:14',NULL),(39,15,1,1,220.00,'2021-07-18 01:07:14','2021-07-18 01:07:14',NULL),(40,16,5,1,246.00,'2021-07-18 11:05:53','2021-07-18 11:05:53',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`is_active`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'Bayani Pepito Catao','tsitonggwapo@gmail.com',NULL,'$2y$10$IjI00yxei31wRuwTgxVk..t0Lc.25agGTG05vYG17NejvRiqPZqtm',0,NULL,'2021-07-13 23:57:45','2021-07-13 23:57:45',NULL),(2,'test','tset123@gmail.com',NULL,'$2y$10$LaQNH6pyQ6i2bKlCEKWlaOaDev1Vthz8EE45n5B928h3/zkFVs9x.',0,NULL,'2021-07-14 00:03:50','2021-07-14 00:03:50',NULL),(3,'Staff','staff@gmail.com',NULL,'$2y$10$DalOOlUfVpxmjsoZD3.fpeCv1uXPbZl3xAWy0tGE0Q4X/DWtIuEWq',0,NULL,'2021-07-14 14:54:32','2021-07-14 14:54:32',NULL),(4,'Staff2','staff2@gmail.com',NULL,'$2y$10$CGSDCNS8PSoWBHk3ZGFrRuX5zyPYjmmVVCvz0AIzHBGQYiR9gvoo6',0,NULL,'2021-07-14 14:55:16','2021-07-14 14:55:16',NULL),(5,'User1','user@gmail.com',NULL,'$2y$10$63WXzFuaB046jNqWAgePUec5R2ze6PfK9QcGlwhXTnxtJvjggy0Gm',0,NULL,'2021-07-15 04:38:01','2021-07-15 04:38:01',NULL),(6,'User 2','user2@gmail.com',NULL,'$2y$10$/Sq.9zcIees0mpZtP714PuyvUm2S829J68p3frSUH4ruW2iZf9DeK',0,NULL,'2021-07-15 04:38:39','2021-07-15 04:38:39',NULL),(7,'rag2','rt@gmail.com',NULL,'$2y$10$3OlBtTJrIh3kZUAQ2i77iOkqX9w/YQ4E0weXzgHKVSi3ZcbLB9UqS',0,NULL,'2021-07-15 04:43:09','2021-07-15 04:43:09',NULL),(8,'kani test','tsest@gmail.com',NULL,'$2y$10$1n4g2qV8WCIYz57axhYE3uTKsIU0RUF2N/tZYgVM5biMxuFSQNQai',0,NULL,'2021-07-15 04:43:26','2021-07-15 04:43:26',NULL),(9,'123123','ako@gmail.com',NULL,'$2y$10$sC5cg4V94Q7aFQQZBPGqBuXsfPsjNv.1fwZH9QZJHJ1gW54OAjTim',0,NULL,'2021-07-15 04:43:59','2021-07-15 04:43:59',NULL),(10,'newest','new@gmail.com',NULL,'$2y$10$C8xTCPZkAZIlIa5DYxkT2OyC2Sy92FilFpqB/3jCoVci/rfrbtXYu',0,NULL,'2021-07-15 04:45:21','2021-07-15 04:45:21',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
