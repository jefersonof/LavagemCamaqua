-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.36 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para samples
CREATE DATABASE IF NOT EXISTS `samples` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `samples`;

-- Copiando estrutura para tabela samples.customer1
CREATE TABLE IF NOT EXISTS `customer1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `car` varchar(255) DEFAULT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `date_create` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.customer1: 8 rows
DELETE FROM `customer1`;
/*!40000 ALTER TABLE `customer1` DISABLE KEYS */;
INSERT INTO `customer1` (`id`, `name`, `car`, `plate`, `address`, `phone`, `birthdate`, `status`, `email`, `gender`, `created_at`, `updated_at`, `deleted_at`, `complement`, `date_create`) VALUES
	(1, 'Henrique', NULL, 'IQB-9H33', NULL, '99893-6677', NULL, NULL, NULL, NULL, '2023-06-09 22:52:55', '2023-06-17 00:49:01', NULL, NULL, NULL),
	(3, 'Marcelo', NULL, 'JBF3H12', NULL, '99923-0202', NULL, NULL, NULL, NULL, '2023-06-09 22:55:34', NULL, NULL, NULL, NULL),
	(4, 'Rafael', NULL, 'IKK-975', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-09 23:00:49', NULL, NULL, NULL, NULL),
	(5, 'Jairo', NULL, 'QQY-6I85', NULL, '99666-1730', NULL, NULL, NULL, NULL, '2023-06-09 16:05:16', NULL, NULL, NULL, NULL),
	(6, 'Paulo Castro', NULL, 'I1W-0297', NULL, '98213-2348', NULL, NULL, NULL, NULL, '2023-06-16 23:06:37', NULL, NULL, NULL, NULL),
	(7, 'Marlon', NULL, 'QQW-1A33', NULL, '99191-2007', NULL, NULL, NULL, NULL, '2023-06-16 23:09:13', NULL, NULL, NULL, NULL),
	(8, 'Nome Teste', 'Opala', 'tgg-7B52', 'Otto 98', '99887-7444', NULL, NULL, NULL, NULL, '2023-06-16 23:19:30', NULL, '2023-06-16', 'Casa 2', NULL),
	(9, 'Nome Teste', 'Opala', 'www-3n63', 'Otto 98', '99995-5444', NULL, NULL, NULL, NULL, '2023-06-16 23:21:18', NULL, NULL, 'Casa', NULL);
/*!40000 ALTER TABLE `customer1` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.customer_skill
CREATE TABLE IF NOT EXISTS `customer_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `skill_id` (`skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.customer_skill: 0 rows
DELETE FROM `customer_skill`;
/*!40000 ALTER TABLE `customer_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_skill` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `unity` varchar(200) DEFAULT NULL,
  `photo_path` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.product: 4 rows
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `description`, `sale_price`, `stock`, `unity`, `photo_path`) VALUES
	(1, 'Lavagem Completa P', 35, NULL, NULL, NULL),
	(2, 'Lavagem Completa G', 50, NULL, NULL, NULL),
	(3, 'Lavagem Expresaa P', 20, NULL, NULL, NULL),
	(4, 'Lavagem Expressa G', 35, NULL, NULL, NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.product_image
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.product_image: 0 rows
DELETE FROM `product_image`;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.sale
CREATE TABLE IF NOT EXISTS `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `obs` text,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.sale: 5 rows
DELETE FROM `sale`;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` (`id`, `date`, `total`, `customer_id`, `obs`, `status_id`) VALUES
	(1, '2016-06-23', 20, 1, NULL, NULL),
	(2, '2016-06-23', 35, 3, NULL, NULL),
	(3, NULL, 50, 7, NULL, NULL),
	(4, NULL, 35, 5, NULL, NULL),
	(5, NULL, 35, 4, NULL, NULL);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.sale_item
CREATE TABLE IF NOT EXISTS `sale_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_price` float DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.sale_item: 5 rows
DELETE FROM `sale_item`;
/*!40000 ALTER TABLE `sale_item` DISABLE KEYS */;
INSERT INTO `sale_item` (`id`, `sale_price`, `amount`, `discount`, `total`, `product_id`, `sale_id`) VALUES
	(1, 20, NULL, 0, 20, 2, 1),
	(2, 35, NULL, 0, 35, 1, 2),
	(3, 50, NULL, 0, 50, 2, 3),
	(4, 35, NULL, 0, 35, 1, 4),
	(5, 35, NULL, 0, 35, 1, 5);
/*!40000 ALTER TABLE `sale_item` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.sale_status
CREATE TABLE IF NOT EXISTS `sale_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `color` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.sale_status: 0 rows
DELETE FROM `sale_status`;
/*!40000 ALTER TABLE `sale_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_status` ENABLE KEYS */;

-- Copiando estrutura para tabela samples.skill
CREATE TABLE IF NOT EXISTS `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela samples.skill: 0 rows
DELETE FROM `skill`;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
