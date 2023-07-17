-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2023 at 10:07 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lv-spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hilton Conn DVM', 'mclaughlin.verlie@example.org', '2023-07-10 23:58:22', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pkCkaIxP6G', '2023-07-10 23:58:22', '2023-07-10 23:58:22'),
(2, 'Prof. Taurean McLaughlin', 'darrell.eichmann@example.com', '2023-07-10 23:59:15', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'klr1QYGj33', '2023-07-10 23:59:15', '2023-07-10 23:59:15'),
(3, 'Mrs. Bernadine Kiehn', 'ijohnson@example.org', '2023-07-10 23:59:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZK9yzyjeG8', '2023-07-10 23:59:16', '2023-07-10 23:59:16'),
(4, 'Telly Friesen', 'medhurst.chelsey@example.com', '2023-07-10 23:59:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'p7exOhg49h', '2023-07-10 23:59:17', '2023-07-10 23:59:17'),
(5, 'Zora Armstrong', 'jefferey85@example.org', '2023-07-10 23:59:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DsSJEMz5z0', '2023-07-10 23:59:18', '2023-07-10 23:59:18'),
(6, 'Chesley Stark', 'brooklyn.miller@example.org', '2023-07-10 23:59:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7sTo9uKgof', '2023-07-10 23:59:19', '2023-07-10 23:59:19'),
(7, 'Alexandra Johns', 'ukrajcik@example.org', '2023-07-10 23:59:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Q7GpvG2dVW', '2023-07-10 23:59:19', '2023-07-10 23:59:19'),
(8, 'Emilie Cartwright', 'heller.cooper@example.net', '2023-07-10 23:59:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Fyy9aT2NQ1', '2023-07-10 23:59:21', '2023-07-10 23:59:21'),
(9, 'Claudine Renner', 'myrtle81@example.com', '2023-07-10 23:59:21', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ES4H5iMSUM', '2023-07-10 23:59:21', '2023-07-10 23:59:21'),
(10, 'Declan Reilly V', 'kunze.samson@example.com', '2023-07-10 23:59:22', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kSoZwgls7V', '2023-07-10 23:59:22', '2023-07-10 23:59:22'),
(11, 'Prof. Bradford Olson', 'reta.schoen@example.net', '2023-07-10 23:59:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4ibyOJaGGh', '2023-07-10 23:59:23', '2023-07-10 23:59:23'),
(12, 'Eleanore Hudson', 'arnaldo.glover@example.com', '2023-07-10 23:59:23', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CbpSDv5jWC', '2023-07-10 23:59:23', '2023-07-10 23:59:23'),
(13, 'Isobel Gislason', 'kschamberger@example.org', '2023-07-10 23:59:24', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pwZzYl5CDS', '2023-07-10 23:59:24', '2023-07-10 23:59:24'),
(14, 'Sophie Rogahn III', 'klein.juwan@example.com', '2023-07-10 23:59:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6Oooa445gx', '2023-07-10 23:59:25', '2023-07-10 23:59:25'),
(15, 'Hector Flatley', 'marvin.huels@example.org', '2023-07-10 23:59:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6tRRpwrqlg', '2023-07-10 23:59:25', '2023-07-10 23:59:25'),
(16, 'Dr. Letitia Wintheiser PhD', 'elwin50@example.com', '2023-07-10 23:59:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hV4ci8V56y', '2023-07-10 23:59:26', '2023-07-10 23:59:26'),
(17, 'Mr. Leopold Mills V', 'ugaylord@example.org', '2023-07-10 23:59:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6aeQ2oaFZp', '2023-07-10 23:59:27', '2023-07-10 23:59:27'),
(18, 'Dangelo Bernier', 'claudie19@example.com', '2023-07-10 23:59:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '78vc9mTi6r', '2023-07-10 23:59:27', '2023-07-10 23:59:27'),
(19, 'Mrs. Valentina Breitenberg', 'libbie33@example.net', '2023-07-10 23:59:28', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lngUqRiHKU', '2023-07-10 23:59:28', '2023-07-10 23:59:28'),
(20, 'Mara Huel', 'dspencer@example.com', '2023-07-10 23:59:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'y8XJwMdTpU', '2023-07-10 23:59:29', '2023-07-10 23:59:29'),
(21, 'Mr. Cary O\'Conner Sr.', 'tbechtelar@example.com', '2023-07-10 23:59:30', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FJ6PvmlZnD', '2023-07-10 23:59:30', '2023-07-10 23:59:30'),
(24, 'Maliya', 'maliya@ex.com', NULL, '$2y$10$zsmvSmrzdmasajddPUSVJuuecHSUdFbhMxfWmHF6ly9SLG.aplDcG', NULL, '2023-07-11 00:58:46', '2023-07-11 00:58:46'),
(25, 'Ms Dang', 'dang@ex.com', NULL, '$2y$10$cPMU2kgiUCdcCoKf4mSNJe6pulljQuriyEbbD8r.cBC8HcVm2u9gC', NULL, '2023-07-11 01:06:33', '2023-07-11 01:06:33'),
(27, 'Metrey', 'metrey@ex.com', NULL, '$2y$10$oLOO0aFV/1RmQXMkfHpFjeV4X.53Rtr8FfFnkHIf7undm4/l9Q/wK', NULL, '2023-07-11 01:21:50', '2023-07-12 02:19:41'),
(29, 'Jena', 'jana@ex.com', NULL, '$2y$10$HlRZTzTjQOc4y9hLQPMW4.c7ufFi2dcPNB2TUeQbbubmHDsSpPxYq', NULL, '2023-07-11 02:22:07', '2023-07-11 02:22:07');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
