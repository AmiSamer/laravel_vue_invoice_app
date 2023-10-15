-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2023 at 02:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `key`, `prefix`, `value`, `created_at`, `updated_at`) VALUES
(1, 'invoice', 'INV-', '20000', '2023-10-09 05:03:10', '2023-10-09 05:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Chaz Dach IV', 'Orin Toy', 'roberts.jordane@blick.info', '58497 Hailie Mill\nWebsterton, ND 72609-5267', '2023-10-09 06:04:50', '2023-10-09 06:04:50'),
(2, 'Arianna Huels MD', 'Mrs. Dolly Balistreri', 'bednar.khalid@sipes.org', '974 Gaylord View Suite 026\nAufderharfort, CA 73104-2898', '2023-10-09 06:04:50', '2023-10-09 06:04:50'),
(3, 'Emmanuelle Boyer', 'Ms. Hilda Franecki II', 'robyn.beahan@hotmail.com', '8022 Forest Springs\nNorth Bethshire, AR 10041-5781', '2023-10-09 06:04:50', '2023-10-09 06:04:50'),
(4, 'Ashtyn Sipes', 'Ms. Jana Harvey', 'collier.tod@hotmail.com', '292 Paige Crescent Suite 574\nIzabellatown, HI 17578-1993', '2023-10-09 06:04:50', '2023-10-09 06:04:50'),
(5, 'Lesley Batz', 'Randal Rolfson', 'legros.kamryn@yahoo.com', '236 Estevan Gateway\nRobelfort, MT 58504-9966', '2023-10-09 06:04:50', '2023-10-09 06:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `due_date` date NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `terms_and_conditions` text NOT NULL,
  `sub_total` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `number`, `customer_id`, `date`, `due_date`, `reference`, `terms_and_conditions`, `sub_total`, `discount`, `total`, `created_at`, `updated_at`) VALUES
(1, '811', 6, '2005-08-03', '1988-09-26', 'REF-133', 'Corporis soluta non dolorem minima at. Provident id consequatur ducimus nemo. Rerum necessitatibus vel eligendi molestiae minima.', 221, 93, 298, '2023-10-09 07:02:01', '2023-10-09 07:02:01'),
(2, '98', 19, '1970-04-30', '2010-03-21', 'REF-204', 'Nemo deleniti rerum alias ipsa qui ipsum. Suscipit quis quia blanditiis non autem fuga.', 286, 23, 1488, '2023-10-09 07:02:01', '2023-10-09 07:02:01'),
(3, '320', 18, '1991-03-27', '1978-10-05', 'REF-43', 'Expedita odit quia eos numquam. Sapiente et amet a maiores quas ipsam. Blanditiis officia aut sit beatae rerum adipisci.', 679, 84, 1959, '2023-10-09 07:02:02', '2023-10-09 07:02:02'),
(4, '193', 4, '2011-06-23', '1997-08-01', 'REF-134', 'Necessitatibus consequatur in fugiat veritatis. Et in quia qui ipsum tempore fugiat. Pariatur velit ea fuga voluptatibus.', 127, 33, 1665, '2023-10-09 07:02:02', '2023-10-09 07:02:02'),
(5, '117', 5, '1999-06-15', '2004-09-10', 'REF-46', 'Quod sapiente blanditiis qui error. Repudiandae perspiciatis quibusdam perferendis ut. Fugiat beatae rerum voluptates optio dolore.', 834, 58, 1753, '2023-10-09 07:02:02', '2023-10-09 07:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `product_id`, `unit_price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 533, 32, 4205, 3, '2023-10-09 07:09:20', '2023-10-09 07:09:20'),
(2, 486, 34, 2679, 4, '2023-10-09 07:09:20', '2023-10-09 07:09:20'),
(3, 701, 92, 1318, 4, '2023-10-09 07:09:20', '2023-10-09 07:09:20'),
(4, 825, 61, 3763, 3, '2023-10-09 07:09:20', '2023-10-09 07:09:20'),
(5, 165, 81, 4186, 4, '2023-10-09 07:09:20', '2023-10-09 07:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_09_104441_create_counters_table', 1),
(6, '2023_10_09_111845_create_products_table', 2),
(7, '2023_10_09_114221_create_customers_table', 3),
(8, '2023_10_09_120606_create_invoices_table', 4),
(9, '2023_10_09_130401_create_invoice_items_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `unit_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `item_code`, `description`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 'IC-100058', 'Name of Product260', 100, '2023-10-09 05:41:01', '2023-10-09 05:41:01'),
(2, 'IC-1000216', 'Name of Product282', 100, '2023-10-09 05:41:01', '2023-10-09 05:41:01'),
(3, 'IC-1000395', 'Name of Product344', 100, '2023-10-09 05:41:01', '2023-10-09 05:41:01'),
(4, 'IC-1000292', 'Name of Product451', 100, '2023-10-09 05:41:01', '2023-10-09 05:41:01'),
(5, 'IC-1000213', 'Name of Product64', 100, '2023-10-09 05:41:01', '2023-10-09 05:41:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `counters_key_unique` (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_number_unique` (`number`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_item_code_unique` (`item_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
