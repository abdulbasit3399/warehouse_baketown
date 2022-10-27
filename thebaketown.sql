-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2022 at 08:12 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thebaketown`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `supported_date` date NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,2) NOT NULL DEFAULT '0.00',
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `holder_name`, `bank_name`, `account_number`, `opening_balance`, `contact_number`, `bank_address`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '', '-', -1296000.00, '-', '-', 1, '2022-10-09 08:56:32', '2022-10-22 13:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint UNSIGNED NOT NULL,
  `bill_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `vender_id` int NOT NULL,
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `order_number` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `shipping_display` int NOT NULL DEFAULT '1',
  `send_date` date DEFAULT NULL,
  `discount_apply` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `bill_id`, `vender_id`, `bill_date`, `due_date`, `order_number`, `status`, `shipping_display`, `send_date`, `discount_apply`, `category_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2022-10-09', '2022-10-10', 0, 4, 1, '2022-10-09', 0, 2, 1, '2022-10-09 09:55:48', '2022-10-09 10:52:38'),
(2, '2', 2, '2022-10-09', '2022-10-10', 0, 4, 1, '2022-10-09', 0, 2, 1, '2022-10-09 10:54:55', '2022-10-09 10:57:27'),
(3, '3', 2, '2022-10-09', '2022-10-09', 0, 4, 1, '2022-10-09', 0, 2, 1, '2022-10-09 10:55:34', '2022-10-09 10:57:49'),
(4, '4', 1, '2022-10-22', '2022-10-22', 51515, 1, 1, '2022-10-22', 0, 2, 1, '2022-10-22 13:12:59', '2022-10-22 13:13:11');

-- --------------------------------------------------------

--
-- Table structure for table `bill_payments`
--

CREATE TABLE `bill_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `bill_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `account_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_payments`
--

INSERT INTO `bill_payments` (`id`, `bill_id`, `date`, `amount`, `account_id`, `payment_method`, `reference`, `add_receipt`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-09', '758000.00', 1, 0, 'skdnvn', NULL, 'cash paid', '2022-10-09 10:52:38', '2022-10-09 10:52:38'),
(2, 2, '2022-10-09', '41000.00', 1, 0, 'skdnvn', NULL, 'asc d d', '2022-10-09 10:57:27', '2022-10-09 10:57:27'),
(3, 3, '2022-10-09', '60000.00', 1, 0, 'skdnvn', NULL, 'd ds dsvdsvsdv', '2022-10-09 10:57:49', '2022-10-09 10:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `bill_products`
--

CREATE TABLE `bill_products` (
  `id` bigint UNSIGNED NOT NULL,
  `bill_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `tax` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_products`
--

INSERT INTO `bill_products` (`id`, `bill_id`, `product_id`, `quantity`, `tax`, `discount`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1000, '', 0.00, '758.00', '', '2022-10-09 09:55:48', '2022-10-09 09:55:48'),
(2, 2, 1, 20, '', 0.00, '2050.00', '', '2022-10-09 10:54:55', '2022-10-09 10:54:55'),
(3, 3, 1, 30, '', 0.00, '2000.00', '', '2022-10-09 10:55:34', '2022-10-09 10:55:34'),
(4, 4, 3, 500, '', 0.00, '1000.00', '', '2022-10-22 13:12:59', '2022-10-22 13:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income_data` text COLLATE utf8mb4_unicode_ci,
  `expense_data` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `sub_type` int NOT NULL DEFAULT '0',
  `is_enabled` int NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `name`, `code`, `type`, `sub_type`, `is_enabled`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Accounts Receivable', 120, 1, 1, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(2, 'Computer Equipment', 160, 1, 2, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(3, 'Office Equipment', 150, 1, 2, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(4, 'Inventory', 140, 1, 3, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(5, 'Budget - Finance Staff', 857, 1, 6, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(6, 'Accumulated Depreciation', 170, 1, 7, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(7, 'Accounts Payable', 200, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(8, 'Accruals', 205, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(9, 'Office Equipment', 150, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(10, 'Clearing Account', 855, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(11, 'Employee Benefits Payable', 235, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(12, 'Employee Deductions payable', 236, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(13, 'Historical Adjustments', 255, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(14, 'Revenue Received in Advance', 835, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(15, 'Rounding', 260, 2, 8, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(16, 'Costs of Goods Sold', 500, 3, 11, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(17, 'Advertising', 600, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(18, 'Automobile Expenses', 644, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(19, 'Bad Debts', 684, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(20, 'Bank Revaluations', 810, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(21, 'Bank Service Charges', 605, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(22, 'Consulting & Accounting', 615, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(23, 'Depreciation', 700, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(24, 'General Expenses', 628, 3, 12, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(25, 'Interest Income', 460, 4, 13, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(26, 'Other Revenue', 470, 4, 13, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(27, 'Purchase Discount', 475, 4, 13, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(28, 'Sales', 400, 4, 13, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(29, 'Common Stock', 330, 5, 16, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(30, 'Owners Contribution', 300, 5, 16, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(31, 'Owners Draw', 310, 5, 16, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(32, 'Retained Earnings', 320, 5, 16, 1, NULL, 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_account_sub_types`
--

CREATE TABLE `chart_of_account_sub_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `type` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_account_sub_types`
--

INSERT INTO `chart_of_account_sub_types` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Current Asset', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(2, 'Fixed Asset', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(3, 'Inventory', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(4, 'Non-current Asset', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(5, 'Prepayment', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(6, 'Bank & Cash', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(7, 'Depreciation', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(8, 'Current Liability', 2, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(9, 'Liability', 2, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(10, 'Non-current Liability', 2, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(11, 'Direct Costs', 3, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(12, 'Expense', 3, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(13, 'Revenue', 4, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(14, 'Sales', 4, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(15, 'Other Income', 4, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(16, 'Equity', 5, '2022-10-09 08:56:32', '2022-10-09 08:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_account_types`
--

CREATE TABLE `chart_of_account_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_account_types`
--

INSERT INTO `chart_of_account_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Assets', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(2, 'Liabilities', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(3, 'Expenses', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(4, 'Income', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(5, 'Equity', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `company_payment_settings`
--

CREATE TABLE `company_payment_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint UNSIGNED NOT NULL,
  `customer` int NOT NULL DEFAULT '0',
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(8,2) NOT NULL DEFAULT '0.00',
  `type` int NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `edit_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `description` text COLLATE utf8mb4_unicode_ci,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `customer_signature` longtext COLLATE utf8mb4_unicode_ci,
  `company_signature` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_attachments`
--

CREATE TABLE `contract_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `contract_id` int NOT NULL,
  `files` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_comments`
--

CREATE TABLE `contract_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `contract_id` int NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_notes`
--

CREATE TABLE `contract_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `contract_id` int NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice` int NOT NULL DEFAULT '0',
  `customer` int NOT NULL DEFAULT '0',
  `amount` double(15,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_id`, `name`, `email`, `tax_number`, `password`, `contact`, `avatar`, `created_by`, `is_active`, `email_verified_at`, `billing_name`, `billing_country`, `billing_state`, `billing_city`, `billing_phone`, `billing_zip`, `billing_address`, `shipping_name`, `shipping_country`, `shipping_state`, `shipping_city`, `shipping_phone`, `shipping_zip`, `shipping_address`, `lang`, `balance`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sample customer', 'abcd@email.com', '545454545454', '$2y$10$AWirCKFWhU0XVsAv5TgIhuDQ7ulWP9VWbvjjPv1DyzUxfL3BhLDp2', '03247763398', '', 1, 1, NULL, 'sample', 'pakistan', 'punjab', 'fsd', '545454545', '354545', 'msd v sd sdlkdsnvsd klsdnvsldvsd v', 'sample', 'pakistan', 'punjab', 'fsd', '545454545', '354545', 'msd v sd sdlkdsnvsd klsdnvsldvsd v', '', 22080.00, NULL, NULL, '2022-10-09 09:37:51', '2022-10-26 04:42:39'),
(2, 2, 'abdul basit', 'basit@gmail.com', '545454545454', '$2y$10$/e8JYWWQulRBhd2PrnkfAONy5hR3ISvcjRjPi6Im5Ght.rubr5h8a', '646564524', '', 1, 1, NULL, 'sample', 'pakistan', 'punjab', 'fsd', '64116165', '354545', 'mdsvsd, vvlsdv, sdvksdv', 'sample', 'pakistan', 'punjab', 'fsd', '64116165', '354545', 'mdsvsd, vvlsdv, sdvksdv', '', 36100.00, NULL, NULL, '2022-10-09 10:26:27', '2022-10-09 10:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `record_id` bigint UNSIGNED NOT NULL,
  `field_id` bigint UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debit_notes`
--

CREATE TABLE `debit_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `bill` int NOT NULL DEFAULT '0',
  `vendor` int NOT NULL DEFAULT '0',
  `amount` double(15,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `slug`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Bill Payment Create', NULL, 'bill_payment_create', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(2, 'Customer Invoice Send', NULL, 'customer_invoice_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(3, 'Bill Send', NULL, 'bill_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(4, 'Invoice Payment Create', NULL, 'invoice_payment_create', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(5, 'Invoice Send', NULL, 'invoice_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(6, 'Payment Reminder', NULL, 'payment_reminder', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(7, 'Proposal Send', NULL, 'proposal_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(8, 'Create User', NULL, 'create_user', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(9, 'Vendor Bill Send', NULL, 'vendor_bill_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(10, 'Contract', NULL, 'contract', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(11, 'Retainer Send', NULL, 'retainer_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(12, 'Customer Retainer Send', NULL, 'customer_retainer_send', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(13, 'Retainer Payment Create', NULL, 'retainer_payment_create', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `email_template_langs`
--

CREATE TABLE `email_template_langs` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'Bill Payment Create', '<p>مرحبا ، { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>نحن نكتب لإبلاغكم بأننا قد أرسلنا مدفوعات (payment_bill) } الخاصة بك.</p>\n                    <p>&nbsp;</p>\n                    <p>لقد أرسلنا قيمتك { payment_amount } لأجل { payment_bill } قمت بالاحالة في التاريخ { payment_date } من خلال { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>شكرا جزيلا لك وطاب يومك ! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(2, 1, 'da', 'Bill Payment Create', '<p>Hej, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Vi skriver for at informere dig om, at vi har sendt din { payment_bill }-betaling.</p>\n                    <p>&nbsp;</p>\n                    <p>Vi har sendt dit bel&oslash;b { payment_amount } betaling for { payment_bill } undertvist p&aring; dato { payment_date } via { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Mange tak, og ha en god dag!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(3, 1, 'de', 'Bill Payment Create', '<p>Hi, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Wir schreiben Ihnen mitzuteilen, dass wir Ihre Zahlung von {payment_bill} gesendet haben.</p>\n                    <p>&nbsp;</p>\n                    <p>Wir haben Ihre Zahlung {payment_amount} Zahlung f&uuml;r {payment_bill} am Datum {payment_date} &uuml;ber {payment_method} gesendet.</p>\n                    <p>&nbsp;</p>\n                    <p>Vielen Dank und haben einen guten Tag! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(4, 1, 'en', 'Bill Payment Create', '<p>Hi, {payment_name}</p>\n                    <p>Welcome to {app_name}</p>\n                    <p>We are writing to inform you that we has sent your {payment_bill} payment.</p>\n                    <p>We has sent your amount {payment_amount} payment for {payment_bill} submited on date {payment_date} via {payment_method}.</p>\n                    <p>Thank You very much and have a good day !!!!</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(5, 1, 'es', 'Bill Payment Create', '<p>Hi, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Estamos escribiendo para informarle que hemos enviado su pago {payment_bill}.</p>\n                    <p>&nbsp;</p>\n                    <p>Hemos enviado su importe {payment_amount} pago para {payment_bill} submitado en la fecha {payment_date} a trav&eacute;s de {payment_method}.</p>\n                    <p>&nbsp;</p>\n                    <p>Thank You very much and have a good day! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(6, 1, 'fr', 'Bill Payment Create', '<p>Salut, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Nous vous &eacute;crivons pour vous informer que nous avons envoy&eacute; votre paiement { payment_bill }.</p>\n                    <p>&nbsp;</p>\n                    <p>Nous avons envoy&eacute; votre paiement { payment_amount } pour { payment_bill } soumis &agrave; la date { payment_date } via { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Merci beaucoup et avez un bon jour ! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(7, 1, 'it', 'Bill Payment Create', '<p>Ciao, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Scriviamo per informarti che abbiamo inviato il tuo pagamento {payment_bill}.</p>\n                    <p>&nbsp;</p>\n                    <p>Abbiamo inviato la tua quantit&agrave; {payment_amount} pagamento per {payment_bill} subita alla data {payment_date} tramite {payment_method}.</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie mille e buona giornata! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(8, 1, 'ja', 'Bill Payment Create', '<p>こんにちは、 {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>&nbsp;</p>\n                    <p>{payment_bill} の支払いを送信したことをお知らせするために執筆しています。</p>\n                    <p>&nbsp;</p>\n                    <p>{payment_date } に提出された {payment_議案} に対する金額 {payment_date} の支払いは、 {payment_method}を介して送信されました。</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとうございます。良い日をお願いします。</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(9, 1, 'nl', 'Bill Payment Create', '<p>Hallo, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Wij schrijven u om u te informeren dat wij uw betaling van { payment_bill } hebben verzonden.</p>\n                    <p>&nbsp;</p>\n                    <p>We hebben uw bedrag { payment_amount } betaling voor { payment_bill } verzonden op datum { payment_date } via { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Hartelijk dank en hebben een goede dag! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(10, 1, 'pl', 'Bill Payment Create', '<p>Witaj, {payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Piszemy, aby poinformować Cię, że wysłaliśmy Twoją płatność {payment_bill }.</p>\n                    <p>&nbsp;</p>\n                    <p>Twoja kwota {payment_amount } została wysłana przez użytkownika {payment_bill } w dniu {payment_date } za pomocą metody {payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję bardzo i mam dobry dzień! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(11, 1, 'ru', 'Bill Payment Create', '<p>Привет, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Мы пишем, чтобы сообщить вам, что мы отправили вашу оплату { payment_bill }.</p>\n                    <p>&nbsp;</p>\n                    <p>Мы отправили вашу сумму оплаты { payment_amount } для { payment_bill }, подав на дату { payment_date } через { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Большое спасибо и хорошего дня! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(12, 1, 'pt', 'Bill Payment Create', '<p>Oi, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Estamos escrevendo para inform&aacute;-lo que enviamos o seu pagamento {payment_bill}.</p>\n                    <p>&nbsp;</p>\n                    <p>N&oacute;s enviamos sua quantia {payment_amount} pagamento por {payment_bill} requisitado na data {payment_date} via {payment_method}.</p>\n                    <p>&nbsp;</p>\n                    <p>Muito obrigado e tenha um bom dia! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(13, 2, 'ar', 'Customer Invoice Send', '<p>مرحبا ، { invoice_name }</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى رقم الفاتورة الملحقة { invoice_number } للخدمة / الخدمة.</p>\n                    <p>ببساطة اضغط على الاختيار بأسفل.</p>\n                    <p>{ invoice_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(14, 2, 'da', 'Customer Invoice Send', '<p>Hej, { invoice_name }</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer { invoice_number } for product/service.</p>\n                    <p>Klik p&aring; knappen nedenfor.</p>\n                    <p>{ invoice_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(15, 2, 'de', 'Customer Invoice Send', '<p>Hi, {invoice_name}</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>Hoffe, diese E-Mail findet dich gut! Bitte beachten Sie die beigef&uuml;gte Rechnungsnummer {invoice_number} f&uuml;r Produkt/Service.</p>\n                    <p>Klicken Sie einfach auf den Button unten.</p>\n                    <p>{invoice_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank,</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(16, 2, 'en', 'Customer Invoice Send', '<p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Hi, {invoice_name}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Welcome to {app_name}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Hope this email finds you well! Please see attached invoice number {invoice_number} for product/service.</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Simply click on the button below.</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">{invoice_url}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Feel free to reach out if you have any questions.</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Thank You,</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Regards,</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">{company_name}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(17, 2, 'es', 'Customer Invoice Send', '<p>Hi, {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>&iexcl;Espero que este email le encuentre bien! Consulte el n&uacute;mero de factura adjunto {invoice_number} para el producto/servicio.</p>\n                    <p>&nbsp;</p>\n                    <p>Simplemente haga clic en el bot&oacute;n de abajo.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&nbsp;</p>\n                    <p>Gracias,</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(18, 2, 'fr', 'Customer Invoice Send', '<p>Bonjour, { invoice_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! Voir le num&eacute;ro de facture { invoice_number } pour le produit/service.</p>\n                    <p>&nbsp;</p>\n                    <p>Cliquez simplement sur le bouton ci-dessous.</p>\n                    <p>&nbsp;</p>\n                    <p>{ invoice_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>&nbsp;</p>\n                    <p>Merci,</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(19, 2, 'it', 'Customer Invoice Send', '<p>Ciao, {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Spero che questa email ti trovi bene! Si prega di consultare il numero di fattura collegato {invoice_number} per il prodotto/servizio.</p>\n                    <p>&nbsp;</p>\n                    <p>Semplicemente clicca sul pulsante sottostante.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie,</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(20, 2, 'ja', 'Customer Invoice Send', '<p>こんにちは、 {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>&nbsp;</p>\n                    <p>この E メールでよくご確認ください。 製品 / サービスについては、添付された請求書番号 {invoice_number} を参照してください。</p>\n                    <p>&nbsp;</p>\n                    <p>以下のボタンをクリックしてください。</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとうございます</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(21, 2, 'nl', 'Customer Invoice Send', '<p>Hallo, { invoice_name }</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>Hoop dat deze e-mail je goed vindt! Zie bijgevoegde factuurnummer { invoice_number } voor product/service.</p>\n                    <p>Klik gewoon op de knop hieronder.</p>\n                    <p>{ invoice_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank U,</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(22, 2, 'pl', 'Customer Invoice Send', '<p>Witaj, {invoice_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Sprawdź załączoną fakturę numer {invoice_number } dla produktu/usługi.</p>\n                    <p>&nbsp;</p>\n                    <p>Wystarczy kliknąć na przycisk poniżej.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję,</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(23, 2, 'ru', 'Customer Invoice Send', '<p>Привет, { invoice_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный номер счета-фактуры { invoice_number } для производства/услуги.</p>\n                    <p>&nbsp;</p>\n                    <p>Просто нажмите на кнопку внизу.</p>\n                    <p>&nbsp;</p>\n                    <p>{ invoice_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>&nbsp;</p>\n                    <p>Спасибо.</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(24, 2, 'pt', 'Customer Invoice Send', '<p>Oi, {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o n&uacute;mero da fatura anexa {invoice_number} para produto/servi&ccedil;o.</p>\n                    <p>&nbsp;</p>\n                    <p>Basta clicar no bot&atilde;o abaixo.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>&nbsp;</p>\n                    <p>Obrigado,</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(25, 3, 'ar', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا ، { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا بك في { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">أتمنى أن يجدك هذا البريد الإلكتروني جيدا ! ! برجاء الرجوع الى رقم الفاتورة الملحقة { bill_number } للحصول على المنتج / الخدمة.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ببساطة اضغط على الاختيار بأسفل.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">شكرا لك</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(26, 3, 'da', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hej, { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Velkommen til { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer } { bill_number } for product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klik p&aring; knappen nedenfor.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Tak.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Med venlig hilsen</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(27, 3, 'de', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Willkommen bei {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoffe, diese E-Mail findet dich gut!! Sehen Sie sich die beigef&uuml;gte Rechnungsnummer {bill_number} f&uuml;r Produkt/Service an.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klicken Sie einfach auf den Button unten.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Vielen Dank,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrachtet,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(28, 3, 'en', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Welcome to {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hope this email finds you well!! Please see attached bill number {bill_number} for product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Simply click on the button below.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feel free to reach out if you have any questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Thank You,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(29, 3, 'es', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi,&nbsp;{bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Bienvenido a {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Espero que este correo te encuentre bien!! Consulte el n&uacute;mero de factura adjunto {bill_number} para el producto/servicio.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Simplemente haga clic en el bot&oacute;n de abajo.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Gracias,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considerando,</span></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(30, 3, 'fr', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Salut,&nbsp;{bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Bienvenue dans { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Jesp&egrave;re que ce courriel vous trouve bien ! ! Veuillez consulter le num&eacute;ro de facture {bill_number}&nbsp;associ&eacute; au produit / service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Cliquez simplement sur le bouton ci-dessous.</span></p>\n                    <p><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Merci,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(31, 3, 'it', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Ciao, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Benvenuti in {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Spero che questa email ti trovi bene!! Si prega di consultare il numero di fattura allegato {bill_number} per il prodotto/servizio.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Semplicemente clicca sul pulsante sottostante.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sentiti libero di raggiungere se hai domande.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Grazie,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Riguardo,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(32, 3, 'ja', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">こんにちは、 {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name} へようこそ</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">この E メールによりよく検出されます !! 製品 / サービスの添付された請求番号 {bill_number} を参照してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">以下のボタンをクリックしてください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">質問がある場合は、自由に連絡してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ありがとうございます</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">よろしく</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(33, 3, 'nl', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hallo, { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Welkom bij { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoop dat deze e-mail je goed vindt!! Zie bijgevoegde factuurnummer { bill_number } voor product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klik gewoon op de knop hieronder.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Voel je vrij om uit te reiken als je vragen hebt.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dank U,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft:</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(34, 3, 'pl', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witaj,&nbsp;{bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witamy w aplikacji {app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Mam nadzieję, że ta wiadomość e-mail znajduje Cię dobrze!! Zapoznaj się z załączonym numerem rachunku {bill_number } dla produktu/usługi.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Wystarczy kliknąć na przycisk poniżej.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Czuj się swobodnie, jeśli masz jakieś pytania.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dziękuję,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">W odniesieniu do</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url }</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(35, 3, 'ru', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Привет, { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Вас приветствует { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Надеюсь, это письмо найдет вас хорошо! См. прилагаемый номер счета { bill_number } для product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Просто нажмите на кнопку внизу.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Не стеснитесь, если у вас есть вопросы.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Спасибо.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">С уважением,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(36, 3, 'pt', 'Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Oi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Bem-vindo a {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Espero que este e-mail encontre voc&ecirc; bem!! Por favor, consulte o n&uacute;mero de faturamento conectado {bill_number} para produto/servi&ccedil;o.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Basta clicar no bot&atilde;o abaixo.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Obrigado,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considera,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(37, 4, 'ar', 'Invoice Payment Create', '<p>مرحبا</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>عزيزي { payment_name }</p>\n                    <p>لقد قمت باستلام المبلغ الخاص بك {payment_amount}&nbsp; لبرنامج { invoice_number } الذي تم تقديمه في التاريخ { payment_date }</p>\n                    <p>مقدار الاستحقاق { invoice_number } الخاص بك هو {payment_dueAmount}</p>\n                    <p>ونحن نقدر الدفع الفوري لكم ونتطلع إلى استمرار العمل معكم في المستقبل.</p>\n                    <p>&nbsp;</p>\n                    <p>شكرا جزيلا لكم ويوم جيد ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(38, 4, 'da', 'Invoice Payment Create', '<p>Hej.</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>K&aelig;re { payment_name }</p>\n                    <p>Vi har modtaget din m&aelig;ngde { payment_amount } betaling for { invoice_number } undert.d. p&aring; dato { payment_date }</p>\n                    <p>Dit { invoice_number } Forfaldsbel&oslash;b er { payment_dueAmount }</p>\n                    <p>Vi s&aelig;tter pris p&aring; din hurtige betaling og ser frem til fortsatte forretninger med dig i fremtiden.</p>\n                    <p>Mange tak, og ha en god dag!</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(39, 4, 'de', 'Invoice Payment Create', '<p>Hi,</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>Sehr geehrter {payment_name}</p>\n                    <p>Wir haben Ihre Zahlung {payment_amount} f&uuml;r {invoice_number}, die am Datum {payment_date} &uuml;bergeben wurde, erhalten.</p>\n                    <p>Ihr {invoice_number} -f&auml;lliger Betrag ist {payment_dueAmount}</p>\n                    <p>Wir freuen uns &uuml;ber Ihre prompte Bezahlung und freuen uns auf das weitere Gesch&auml;ft mit Ihnen in der Zukunft.</p>\n                    <p>Vielen Dank und habe einen guten Tag!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(40, 4, 'en', 'Invoice Payment Create', '<p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Hi,</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Welcome to {app_name}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Dear {payment_name}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">We have recieved your amount {payment_amount} payment for {invoice_number} submited on date {payment_date}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Your {invoice_number} Due amount is {payment_dueAmount}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">We appreciate your prompt payment and look forward to continued business with you in the future.</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Thank you very much and have a good day!!</span></span></p>\n                    <p>&nbsp;</p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Regards,</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">{company_name}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">{app_url}</span></span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(41, 4, 'es', 'Invoice Payment Create', '<p>Hola,</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>Estimado {payment_name}</p>\n                    <p>Hemos recibido su importe {payment_amount} pago para {invoice_number} submitado en la fecha {payment_date}</p>\n                    <p>El importe de {invoice_number} Due es {payment_dueAmount}</p>\n                    <p>Agradecemos su pronto pago y esperamos continuar con sus negocios con usted en el futuro.</p>\n                    <p>Muchas gracias y que tengan un buen d&iacute;a!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(42, 4, 'fr', 'Invoice Payment Create', '<p>Salut,</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>Cher { payment_name }</p>\n                    <p>Nous avons re&ccedil;u votre montant { payment_amount } de paiement pour { invoice_number } soumis le { payment_date }</p>\n                    <p>Votre {invoice_number} Montant d&ucirc; est { payment_dueAmount }</p>\n                    <p>Nous appr&eacute;cions votre rapidit&eacute; de paiement et nous attendons avec impatience de poursuivre vos activit&eacute;s avec vous &agrave; lavenir.</p>\n                    <p>Merci beaucoup et avez une bonne journ&eacute;e ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(43, 4, 'it', 'Invoice Payment Create', '<p>Ciao,</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>Caro {payment_name}</p>\n                    <p>Abbiamo ricevuto la tua quantit&agrave; {payment_amount} pagamento per {invoice_number} subita alla data {payment_date}</p>\n                    <p>Il tuo {invoice_number} A somma cifra &egrave; {payment_dueAmount}</p>\n                    <p>Apprezziamo il tuo tempestoso pagamento e non vedo lora di continuare a fare affari con te in futuro.</p>\n                    <p>Grazie mille e buona giornata!!</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(44, 4, 'ja', 'Invoice Payment Create', '<p>こんにちは。</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>{ payment_name} に出れます</p>\n                    <p>{ payment_date} 日付で提出された {請求書番号} の支払金額 } の金額を回収しました。 }</p>\n                    <p>お客様の {請求書番号} 予定額は {payment_dueAmount} です</p>\n                    <p>お客様の迅速な支払いを評価し、今後も継続してビジネスを継続することを期待しています。</p>\n                    <p>ありがとうございます。良い日をお願いします。</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(45, 4, 'nl', 'Invoice Payment Create', '<p>Hallo,</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>Beste { payment_name }</p>\n                    <p>We hebben uw bedrag ontvangen { payment_amount } betaling voor { invoice_number } ingediend op datum { payment_date }</p>\n                    <p>Uw { invoice_number } verschuldigde bedrag is { payment_dueAmount }</p>\n                    <p>Wij waarderen uw snelle betaling en kijken uit naar verdere zaken met u in de toekomst.</p>\n                    <p>Hartelijk dank en hebben een goede dag!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(46, 4, 'pl', 'Invoice Payment Create', '<p>Witam,</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>Droga {payment_name }</p>\n                    <p>Odebrano kwotę {payment_amount } płatności za {invoice_number } w dniu {payment_date }, kt&oacute;ry został zastąpiony przez użytkownika.</p>\n                    <p>{invoice_number } Kwota należna: {payment_dueAmount }</p>\n                    <p>Doceniamy Twoją szybką płatność i czekamy na kontynuację działalności gospodarczej z Tobą w przyszłości.</p>\n                    <p>Dziękuję bardzo i mam dobry dzień!!</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(47, 4, 'ru', 'Invoice Payment Create', '<p>Привет.</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>Дорогая { payment_name }</p>\n                    <p>Мы получили вашу сумму оплаты {payment_amount} для { invoice_number }, подавшей на дату { payment_date }</p>\n                    <p>Ваша { invoice_number } Должная сумма-{ payment_dueAmount }</p>\n                    <p>Мы ценим вашу своевременную оплату и надеемся на продолжение бизнеса с вами в будущем.</p>\n                    <p>Большое спасибо и хорошего дня!!</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(48, 4, 'pt', 'Invoice Payment Create', '<p>Oi,</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>Querido {payment_name}</p>\n                    <p>N&oacute;s recibimos sua quantia {payment_amount} pagamento para {invoice_number} requisitado na data {payment_date}</p>\n                    <p>Sua quantia {invoice_number} Due &eacute; {payment_dueAmount}</p>\n                    <p>Agradecemos o seu pronto pagamento e estamos ansiosos para continuarmos os neg&oacute;cios com voc&ecirc; no futuro.</p>\n                    <p>Muito obrigado e tenha um bom dia!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(49, 5, 'ar', 'Invoice Send', '<p>مرحبا { invoice_name },</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى رقم الفاتورة الملحقة { invoice_number } للخدمة / الخدمة.</p>\n                    <p>ببساطة اضغط على الاختيار بأسفل</p>\n                    <p>{ invoice_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لعملك ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(50, 5, 'da', 'Invoice Send', '<p>Hallo { invoice_name },</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer { invoice_number } for product/service.</p>\n                    <p>Klik p&aring; knappen nedenfor</p>\n                    <p>{ invoice_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak for din virksomhed!</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(51, 5, 'de', 'Invoice Send', '<p>Hello {invoice_name},</p>\n                    <p>Hoffe, diese E-Mail findet dich gut! Bitte beachten Sie die beigef&uuml;gte Rechnungsnummer {invoice_number} f&uuml;r Produkt/Service.</p>\n                    <p>Klicken Sie einfach auf den Button unten</p>\n                    <p>{invoice_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank f&uuml;r Ihr Unternehmen!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(52, 5, 'en', 'Invoice Send', '<p>Hello {invoice_name},</p>\n                    <p>Hope this email finds you well! Please see attached invoice number {invoice_number} for product/service.</p>\n                    <p>Simply click on the button below</p>\n                    <p>{invoice_url}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you for your business!!</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}<br />{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(53, 5, 'es', 'Invoice Send', '<p>Hello {invoice_name},</p>\n                    <p>&iexcl;Espero que este email le encuentre bien! Consulte el n&uacute;mero de factura adjunto {invoice_number} para el producto/servicio.</p>\n                    <p>Simplemente haga clic en el bot&oacute;n de abajo</p>\n                    <p>{invoice_url}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias por su negocio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(54, 5, 'fr', 'Invoice Send', '<p>Bonjour {invoice_name},</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! Voir le num&eacute;ro de facture { invoice_number } pour le produit/service.</p>\n                    <p>Cliquez simplement sur le bouton ci-dessous</p>\n                    <p>{ invoice_url}</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Merci pour votre entreprise ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(55, 5, 'it', 'Invoice Send', '<p>Ciao {invoice_name},</p>\n                    <p>Spero che questa email ti trovi bene! Si prega di consultare il numero di fattura collegato {invoice_number} per il prodotto/servizio.</p>\n                    <p>Semplicemente clicca sul pulsante sottostante</p>\n                    <p>{invoice_url}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie per il tuo business!!</p>\n                    <p>&nbsp;</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(56, 5, 'ja', 'Invoice Send', '<p>こんにちは {invoice_name}、</p>\n                    <p>この E メールでよくご確認ください。 製品 / サービスについては、添付された請求書番号 {invoice_number} を参照してください。</p>\n                    <p>以下のボタンをクリックしてください。</p>\n                    <p>{invoice_url}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>お客様のビジネスに感謝します。</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(57, 5, 'nl', 'Invoice Send', '<p>Hallo { invoice_name },</p>\n                    <p>Hoop dat deze e-mail je goed vindt! Zie bijgevoegde factuurnummer { invoice_number } voor product/service.</p>\n                    <p>Klik gewoon op de knop hieronder</p>\n                    <p>{ invoice_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u voor uw bedrijf!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(58, 5, 'pl', 'Invoice Send', '<p>Witaj {invoice_name },</p>\n                    <p>Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Sprawdź załączoną fakturę numer {invoice_number } dla produktu/usługi.</p>\n                    <p>Wystarczy kliknąć na przycisk poniżej</p>\n                    <p>{invoice_url }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy za prowadzenie działalności!!</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(59, 5, 'ru', 'Invoice Send', '<p>Здравствуйте, { invice_name },</p>\n                    <p>Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный номер счета-фактуры { invoice_number } для производства/услуги.</p>\n                    <p>Просто нажмите на кнопку ниже</p>\n                    <p>{ invoice_url }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо за ваше дело!</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(60, 5, 'pt', 'Invoice Send', '<p>Ol&aacute; {invoice_name},</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o n&uacute;mero da fatura anexa {invoice_number} para produto/servi&ccedil;o.</p>\n                    <p>Basta clicar no bot&atilde;o abaixo</p>\n                    <p>{invoice_url}</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado pelo seu neg&oacute;cio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(61, 6, 'ar', 'Payment Reminder', '<p>عزيزي ، { payment_name }</p>\n                    <p>آمل أن تكون بخير. هذا مجرد تذكير بأن الدفع على الفاتورة { invoice_number } الاجمالي { payment_dueAmount } ، والتي قمنا بارسالها على { payment_date } مستحق اليوم.</p>\n                    <p>يمكنك دفع مبلغ لحساب البنك المحدد على الفاتورة.</p>\n                    <p>أنا متأكد أنت مشغول ، لكني أقدر إذا أنت يمكن أن تأخذ a لحظة ونظرة على الفاتورة عندما تحصل على فرصة.</p>\n                    <p>إذا كان لديك أي سؤال مهما يكن ، يرجى الرد وسأكون سعيدا لتوضيحها.</p>\n                    <p>&nbsp;</p>\n                    <p>شكرا&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(62, 6, 'da', 'Payment Reminder', '<p>K&aelig;re, { payment_name }</p>\n                    <p>Dette er blot en p&aring;mindelse om, at betaling p&aring; faktura { invoice_number } i alt { payment_dueAmount}, som vi sendte til { payment_date }, er forfalden i dag.</p>\n                    <p>Du kan foretage betalinger til den bankkonto, der er angivet p&aring; fakturaen.</p>\n                    <p>Jeg er sikker p&aring; du har travlt, men jeg ville s&aelig;tte pris p&aring;, hvis du kunne tage et &oslash;jeblik og se p&aring; fakturaen, n&aring;r du f&aring;r en chance.</p>\n                    <p>Hvis De har nogen sp&oslash;rgsm&aring;l, s&aring; svar venligst, og jeg vil med gl&aelig;de tydeligg&oslash;re dem.</p>\n                    <p>&nbsp;</p>\n                    <p>Tak.&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(63, 6, 'de', 'Payment Reminder', '<p>Sehr geehrte/r, {payment_name}</p>\n                    <p>Ich hoffe, Sie sind gut. Dies ist nur eine Erinnerung, dass die Zahlung auf Rechnung {invoice_number} total {payment_dueAmount}, die wir gesendet am {payment_date} ist heute f&auml;llig.</p>\n                    <p>Sie k&ouml;nnen die Zahlung auf das auf der Rechnung angegebene Bankkonto vornehmen.</p>\n                    <p>Ich bin sicher, Sie sind besch&auml;ftigt, aber ich w&uuml;rde es begr&uuml;&szlig;en, wenn Sie einen Moment nehmen und &uuml;ber die Rechnung schauen k&ouml;nnten, wenn Sie eine Chance bekommen.</p>\n                    <p>Wenn Sie irgendwelche Fragen haben, antworten Sie bitte und ich w&uuml;rde mich freuen, sie zu kl&auml;ren.</p>\n                    <p>&nbsp;</p>\n                    <p>Danke,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(64, 6, 'en', 'Payment Reminder', '<p>Dear, {payment_name}</p>\n                    <p>I hope you&rsquo;re well.This is just a reminder that payment on invoice {invoice_number} total dueAmount {payment_dueAmount} , which we sent on {payment_date} is due today.</p>\n                    <p>You can make payment to the bank account specified on the invoice.</p>\n                    <p>I&rsquo;m sure you&rsquo;re busy, but I&rsquo;d appreciate if you could take a moment and look over the invoice when you get a chance.</p>\n                    <p>If you have any questions whatever, please reply and I&rsquo;d be happy to clarify them.</p>\n                    <p>&nbsp;</p>\n                    <p>Thanks,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(65, 6, 'es', 'Payment Reminder', '<p>Estimado, {payment_name}</p>\n                    <p>Espero que est&eacute;s bien. Esto es s&oacute;lo un recordatorio de que el pago en la factura {invoice_number} total {payment_dueAmount}, que enviamos en {payment_date} se vence hoy.</p>\n                    <p>Puede realizar el pago a la cuenta bancaria especificada en la factura.</p>\n                    <p>Estoy seguro de que est&aacute;s ocupado, pero agradecer&iacute;a si podr&iacute;as tomar un momento y mirar sobre la factura cuando tienes una oportunidad.</p>\n                    <p>Si tiene alguna pregunta, por favor responda y me gustar&iacute;a aclararlas.</p>\n                    <p>&nbsp;</p>\n                    <p>Gracias,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(66, 6, 'fr', 'Payment Reminder', '<p>Cher, { payment_name }</p>\n                    <p>Jesp&egrave;re que vous &ecirc;tes bien, ce nest quun rappel que le paiement sur facture {invoice_number}total { payment_dueAmount }, que nous avons envoy&eacute; le {payment_date} est d&ucirc; aujourdhui.</p>\n                    <p>Vous pouvez effectuer le paiement sur le compte bancaire indiqu&eacute; sur la facture.</p>\n                    <p>Je suis s&ucirc;r que vous &ecirc;tes occup&eacute;, mais je vous serais reconnaissant de prendre un moment et de regarder la facture quand vous aurez une chance.</p>\n                    <p>Si vous avez des questions, veuillez r&eacute;pondre et je serais heureux de les clarifier.</p>\n                    <p>&nbsp;</p>\n                    <p>Merci,&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(67, 6, 'it', 'Payment Reminder', '<p>Caro, {payment_name}</p>\n                    <p>Spero che tu stia bene, questo &egrave; solo un promemoria che il pagamento sulla fattura {invoice_number} totale {payment_dueAmount}, che abbiamo inviato su {payment_date} &egrave; dovuto oggi.</p>\n                    <p>&Egrave; possibile effettuare il pagamento al conto bancario specificato sulla fattura.</p>\n                    <p>Sono sicuro che sei impegnato, ma apprezzerei se potessi prenderti un momento e guardare la fattura quando avrai una chance.</p>\n                    <p>Se avete domande qualunque, vi prego di rispondere e sarei felice di chiarirle.</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(68, 6, 'ja', 'Payment Reminder', '<p>ID、 {payment_name}</p>\n                    <p>これは、 { payment_dueAmount} の合計 {payment_dueAmount } に対する支払いが今日予定されていることを思い出させていただきたいと思います。</p>\n                    <p>請求書に記載されている銀行口座に対して支払いを行うことができます。</p>\n                    <p>お忙しいのは確かですが、機会があれば、少し時間をかけてインボイスを見渡すことができればありがたいのですが。</p>\n                    <p>何か聞きたいことがあるなら、お返事をお願いしますが、喜んでお答えします。</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとう。&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(69, 6, 'nl', 'Payment Reminder', '<p>Geachte, { payment_name }</p>\n                    <p>Ik hoop dat u goed bent. Dit is gewoon een herinnering dat betaling op factuur { invoice_number } totaal { payment_dueAmount }, die we verzonden op { payment_date } is vandaag verschuldigd.</p>\n                    <p>U kunt betaling doen aan de bankrekening op de factuur.</p>\n                    <p>Ik weet zeker dat je het druk hebt, maar ik zou het op prijs stellen als je even over de factuur kon kijken als je een kans krijgt.</p>\n                    <p>Als u vragen hebt, beantwoord dan uw antwoord en ik wil ze graag verduidelijken.</p>\n                    <p>&nbsp;</p>\n                    <p>Bedankt.&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(70, 6, 'pl', 'Payment Reminder', '<p>Drogi, {payment_name }</p>\n                    <p>Mam nadzieję, że jesteś dobrze. To jest tylko przypomnienie, że płatność na fakturze {invoice_number } total {payment_dueAmount }, kt&oacute;re wysłaliśmy na {payment_date } jest dzisiaj.</p>\n                    <p>Płatność można dokonać na rachunek bankowy podany na fakturze.</p>\n                    <p>Jestem pewien, że jesteś zajęty, ale byłbym wdzięczny, gdybyś m&oacute;gł wziąć chwilę i spojrzeć na fakturę, kiedy masz szansę.</p>\n                    <p>Jeśli masz jakieś pytania, proszę o odpowiedź, a ja chętnie je wyjaśniam.</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję,&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(71, 6, 'ru', 'Payment Reminder', '<p>Уважаемый, { payment_name }</p>\n                    <p>Я надеюсь, что вы хорошо. Это просто напоминание о том, что оплата по счету { invoice_number } всего { payment_dueAmount }, которое мы отправили в { payment_date }, сегодня.</p>\n                    <p>Вы можете произвести платеж на банковский счет, указанный в счете-фактуре.</p>\n                    <p>Я уверена, что ты занята, но я была бы признательна, если бы ты смог бы поглядеться на счет, когда у тебя появится шанс.</p>\n                    <p>Если у вас есть вопросы, пожалуйста, ответьте, и я буду рад их прояснить.</p>\n                    <p>&nbsp;</p>\n                    <p>Спасибо.&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(72, 6, 'pt', 'Payment Reminder', '<p>Querido, {payment_name}</p>\n                    <p>Espero que voc&ecirc; esteja bem. Este &eacute; apenas um lembrete de que o pagamento na fatura {invoice_number} total {payment_dueAmount}, que enviamos em {payment_date} &eacute; devido hoje.</p>\n                    <p>Voc&ecirc; pode fazer o pagamento &agrave; conta banc&aacute;ria especificada na fatura.</p>\n                    <p>Eu tenho certeza que voc&ecirc; est&aacute; ocupado, mas eu agradeceria se voc&ecirc; pudesse tirar um momento e olhar sobre a fatura quando tiver uma chance.</p>\n                    <p>Se voc&ecirc; tiver alguma d&uacute;vida o que for, por favor, responda e eu ficaria feliz em esclarec&ecirc;-las.</p>\n                    <p>&nbsp;</p>\n                    <p>Obrigado,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(73, 7, 'ar', 'Proposal Send', '<p>مرحبا ، { proposal_name }</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى رقم الاقتراح المرفق { proposal_number } للمنتج / الخدمة.</p>\n                    <p>اضغط ببساطة على الاختيار بأسفل</p>\n                    <p>{ proposal_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لعملك ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(74, 7, 'da', 'Proposal Send', '<p>Hej, {proposal__name }</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se det vedh&aelig;ftede forslag nummer { proposal_number } for product/service.</p>\n                    <p>klik bare p&aring; knappen nedenfor</p>\n                    <p>{ proposal_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak for din virksomhed!</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(75, 7, 'de', 'Proposal Send', '<p>Hi, {proposal_name}</p>\n                    <p>Hoffe, diese E-Mail findet dich gut! Bitte sehen Sie die angeh&auml;ngte Vorschlagsnummer {proposal_number} f&uuml;r Produkt/Service an.</p>\n                    <p>Klicken Sie einfach auf den Button unten</p>\n                    <p>{proposal_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank f&uuml;r Ihr Unternehmen!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(76, 7, 'en', 'Proposal Send', '<p>Hi, {proposal_name}</p>\n                    <p>Hope this email ﬁnds you well! Please see attached proposal number {proposal_number} for product/service.</p>\n                    <p>simply click on the button below</p>\n                    <p>{proposal_url}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you for your business!!</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(77, 7, 'es', 'Proposal Send', '<p>Hi, {proposal_name}</p>\n                    <p>&iexcl;Espero que este email le encuentre bien! Consulte el n&uacute;mero de propuesta adjunto {proposal_number} para el producto/servicio.</p>\n                    <p>simplemente haga clic en el bot&oacute;n de abajo</p>\n                    <p>{proposal_url}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias por su negocio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(78, 7, 'fr', 'Proposal Send', '<p>Salut, {proposal_name}</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! Veuillez consulter le num&eacute;ro de la proposition jointe {proposal_number} pour le produit/service.</p>\n                    <p>Il suffit de cliquer sur le bouton ci-dessous</p>\n                    <p>{proposal_url}</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Merci pour votre entreprise ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(79, 7, 'it', 'Proposal Send', '<p>Ciao, {proposal_name}</p>\n                    <p>Spero che questa email ti trovi bene! Si prega di consultare il numero di proposta allegato {proposal_number} per il prodotto/servizio.</p>\n                    <p>semplicemente clicca sul pulsante sottostante</p>\n                    <p>{proposal_url}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie per il tuo business!!</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(80, 7, 'ja', 'Proposal Send', '<p>こんにちは、 {proposal_name}</p>\n                    <p>この E メールでよくご確認ください。 製品 / サービスの添付されたプロポーザル番号 {proposal_number} を参照してください。</p>\n                    <p>下のボタンをクリックするだけで</p>\n                    <p>{proposal_url}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>お客様のビジネスに感謝します。</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(81, 7, 'nl', 'Proposal Send', '<p>Hallo, {proposal_name}</p>\n                    <p>Hoop dat deze e-mail je goed vindt! Zie bijgevoegde nummer { proposal_number } voor product/service.</p>\n                    <p>gewoon klikken op de knop hieronder</p>\n                    <p>{ proposal_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u voor uw bedrijf!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(82, 7, 'pl', 'Proposal Send', '<p>Witaj, {proposal_name}</p>\n                    <p>Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Proszę zapoznać się z załączonym numerem wniosku {proposal_number} dla produktu/usługi.</p>\n                    <p>po prostu kliknij na przycisk poniżej</p>\n                    <p>{proposal_url}</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy za prowadzenie działalności!!</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(83, 7, 'ru', 'Proposal Send', '<p>Здравствуйте, { proposal_name }</p>\n                    <p>Надеюсь, это электронное письмо найдет вас хорошо! См. вложенное предложение номер { proposal_number} для product/service.</p>\n                    <p>просто нажмите на кнопку внизу</p>\n                    <p>{ proposal_url}</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо за ваше дело!</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(84, 7, 'pt', 'Proposal Send', '<p>Oi, {proposal_name}</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o n&uacute;mero da proposta anexada {proposal_number} para produto/servi&ccedil;o.</p>\n                    <p>basta clicar no bot&atilde;o abaixo</p>\n                    <p>{proposal_url}</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado pelo seu neg&oacute;cio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(85, 8, 'ar', 'Create User', '<p>مرحبا ، مرحبا بك في { app_name }.</p>\n                    <p>البريد الالكتروني : { email }</p>\n                    <p>كلمة السرية : { password }</p>\n                    <p>{ app_url }</p>\n                    <p>شكرا</p>\n                    <p>{ app_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(86, 8, 'da', 'Create User', '<p>Hej,</p>\n                    <p>velkommen til { app_name }.</p>\n                    <p>E-mail: { email }</p>\n                    <p>-kodeord: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Tak.</p>\n                    <p>{ app_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(87, 8, 'de', 'Create User', '<p>Hallo, Willkommen bei {app_name}.</p>\n                    <p>E-Mail: {email}</p>\n                    <p>Kennwort: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Danke,</p>\n                    <p>{app_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(88, 8, 'en', 'Create User', '<p>Hello,&nbsp;<br />Welcome to {app_name}.</p>\n                    <p><strong>Email&nbsp;</strong>: {email}<br /><strong>Password</strong>&nbsp;: {password}</p>\n                    <p>{app_url}</p>\n                    <p>Thanks,<br />{app_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(89, 8, 'es', 'Create User', '<p>Hola, Bienvenido a {app_name}.</p>\n                    <p>Correo electr&oacute;nico: {email}</p>\n                    <p>Contrase&ntilde;a: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Gracias,</p>\n                    <p>{app_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(90, 8, 'fr', 'Create User', '<p>Bonjour, Bienvenue dans { app_name }.</p>\n                    <p>E-mail: { email }</p>\n                    <p>Mot de passe: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Merci,</p>\n                    <p>{ app_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(91, 8, 'it', 'Create User', '<p>Ciao, Benvenuti in {app_name}.</p>\n                    <p>Email: {email}</p>\n                    <p>Password: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie,</p>\n                    <p>{app_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(92, 8, 'ja', 'Create User', '<p>こんにちは、 {app_name}へようこそ。</p>\n                    <p>E メール : {email}</p>\n                    <p>パスワード : {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとう。</p>\n                    <p>{app_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(93, 8, 'nl', 'Create User', '<p>Hallo, Welkom bij { app_name }.</p>\n                    <p>E-mail: { email }</p>\n                    <p>Wachtwoord: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Bedankt.</p>\n                    <p>{ app_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(94, 8, 'pl', 'Create User', '<p>Witaj, Witamy w aplikacji {app_name }.</p>\n                    <p>E-mail: {email }</p>\n                    <p>Hasło: {password }</p>\n                    <p>{app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję,</p>\n                    <p>{app_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(95, 8, 'ru', 'Create User', '<p>Здравствуйте, Добро пожаловать в { app_name }.</p>\n                    <p>Адрес электронной почты: { email }</p>\n                    <p>Пароль: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Спасибо.</p>\n                    <p>{app_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(96, 8, 'pt', 'Create User', '<p>Ol&aacute;, Bem-vindo a {app_name}.</p>\n                    <p>E-mail: {email}</p>\n                    <p>Senha: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Obrigado,</p>\n                    <p>{app_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(97, 9, 'ar', 'Vendor Bill Send', '<p>مرحبا ، { bill_name }</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا ! ! برجاء الرجوع الى رقم الفاتورة الملحقة { bill_number } للحصول على المنتج / الخدمة.</p>\n                    <p>ببساطة اضغط على الاختيار بأسفل.</p>\n                    <p>{ bill_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(98, 9, 'da', 'Vendor Bill Send', '<p>Hej, { bill_name }</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer } { bill_number } for product/service.</p>\n                    <p>Klik p&aring; knappen nedenfor.</p>\n                    <p>{ bill_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(99, 9, 'de', 'Vendor Bill Send', '<p>Hi, {bill_name}</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>Hoffe, diese E-Mail findet dich gut!! Sehen Sie sich die beigef&uuml;gte Rechnungsnummer {bill_number} f&uuml;r Produkt/Service an.</p>\n                    <p>Klicken Sie einfach auf den Button unten.</p>\n                    <p>{bill_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank,</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(100, 9, 'en', 'Vendor Bill Send', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Welcome to {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hope this email finds you well!! Please see attached bill number {bill_number} for product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Simply click on the button below.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feel free to reach out if you have any questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Thank You,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(101, 9, 'es', 'Vendor Bill Send', '<p>Hi, {bill_name}</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>&iexcl;Espero que este correo te encuentre bien!! Consulte el n&uacute;mero de factura adjunto {bill_number} para el producto/servicio.</p>\n                    <p>Simplemente haga clic en el bot&oacute;n de abajo.</p>\n                    <p>{bill_url}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>Gracias,</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(102, 9, 'fr', 'Vendor Bill Send', '<p>Salut, { bill_name }</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! ! Veuillez consulter le num&eacute;ro de facture { bill_number } associ&eacute; au produit / service.</p>\n                    <p>Cliquez simplement sur le bouton ci-dessous.</p>\n                    <p>{bill_url }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Merci,</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(103, 9, 'it', 'Vendor Bill Send', '<p>Ciao, {bill_name}</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>Spero che questa email ti trovi bene!! Si prega di consultare il numero di fattura allegato {bill_number} per il prodotto/servizio.</p>\n                    <p>Semplicemente clicca sul pulsante sottostante.</p>\n                    <p>{bill_url}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie,</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(104, 9, 'ja', 'Vendor Bill Send', '<p>こんにちは、 {bill_name}</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>この E メールによりよく検出されます !! 製品 / サービスの添付された請求番号 {bill_number} を参照してください。</p>\n                    <p>以下のボタンをクリックしてください。</p>\n                    <p>{bill_url}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとうございます</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(105, 9, 'nl', 'Vendor Bill Send', '<p>Hallo, { bill_name }</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>Hoop dat deze e-mail je goed vindt!! Zie bijgevoegde factuurnummer { bill_number } voor product/service.</p>\n                    <p>Klik gewoon op de knop hieronder.</p>\n                    <p>{ bill_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank U,</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(106, 9, 'pl', 'Vendor Bill Send', '<p>Witaj, {bill_name }</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>Mam nadzieję, że ta wiadomość e-mail znajduje Cię dobrze!! Zapoznaj się z załączonym numerem rachunku {bill_number } dla produktu/usługi.</p>\n                    <p>Wystarczy kliknąć na przycisk poniżej.</p>\n                    <p>{bill_url}</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękuję,</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(107, 9, 'ru', 'Vendor Bill Send', '<p>Привет, { bill_name }</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>Надеюсь, это письмо найдет вас хорошо! См. прилагаемый номер счета { bill_number } для product/service.</p>\n                    <p>Просто нажмите на кнопку внизу.</p>\n                    <p>{ bill_url }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(108, 9, 'pt', 'Vendor Bill Send', '<p>Oi, {bill_name}</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem!! Por favor, consulte o n&uacute;mero de faturamento conectado {bill_number} para produto/servi&ccedil;o.</p>\n                    <p>Basta clicar no bot&atilde;o abaixo.</p>\n                    <p>{bill_url}</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado,</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(109, 10, 'ar', 'Contract', '<p>مرحبا { contract_customer }</p>\n                    <p>موضوع العقد : { contract_subject }</p>\n                    <p>نوع العقد : { contract_type }</p>\n                    <p>قيمة العقد : { contract_value }</p>\n                    <p>تاريخ البدء : { contract_start_date }</p>\n                    <p>تاريخ الانتهاء : { contract_end_date }</p>\n                    <p>. أتطلع لسماع منك</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(110, 10, 'da', 'Contract', '<p>Hej { contract_customer }</p>\n                    <p>Kontraktemne: { contract_subject }</p>\n                    <p>Kontrakttype: { contract_type }</p>\n                    <p>Kontraktv&aelig;rdi: { contract_value }</p>\n                    <p>Startdato: { contract_start_date }</p>\n                    <p>Slutdato: { contract_end_date }</p>\n                    <p>Jeg gl&aelig;der mig til at h&oslash;re fra dig.</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(111, 10, 'de', 'Contract', '<p>Hi {contract_customer}</p>\n                    <p>Vertragsgegenstand: {contract_subject}</p>\n                    <p>Vertragstyp: {contract_type}</p>\n                    <p>Vertragswert: {contract_value}</p>\n                    <p>Startdatum: {contract_start_date}</p>\n                    <p>Enddatum: {contract_end_date}</p>\n                    <p>Freuen Sie sich auf das H&ouml;ren von Ihnen.</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(112, 10, 'es', 'Contract', '<p>Hi {contract_customer}</p>\n                    <p>Asunto del contrato: {contract_subject}</p>\n                    <p>Tipo de contrato: {contract_type}</p>\n                    <p>Valor de contrato: {contract_value}</p>\n                    <p>Fecha de inicio: {contract_start_date}</p>\n                    <p>Fecha de finalizaci&oacute;n: {contract_end_date}</p>\n                    <p>Con ganas de escuchar de ti.</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(113, 10, 'en', 'Contract', '<p>Hi {contract_customer}</p>\n                    <p>Contract Subject: {contract_subject}</p>\n                    <p>Contract Type: {contract_type}</p>\n                    <p>Contract Value: {contract_value}</p>\n                    <p>Start Date: {contract_start_date}</p>\n                    <p>End Date: {contract_end_date}</p>\n                    <p>Looking forward to hear from you.</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(114, 10, 'fr', 'Contract', '<p>Bonjour { contract_customer }</p>\n                    <p>Objet du contrat: { contract_subject }</p>\n                    <p>Type de contrat: { contract_type }</p>\n                    <p>Valeur du contrat: { contract_value }</p>\n                    <p>Date de d&eacute;but: { contract_start_date }</p>\n                    <p>Date de fin: { contract_end_date }</p>\n                    <p>Vous avez h&acirc;te de vous entendre.</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(115, 10, 'it', 'Contract', '<p>Ciao {contract_customer}</p>\n                    <p>Oggetto contratto: {contract_subject}</p>\n                    <p>Tipo di contratto: {contract_type}</p>\n                    <p>Valore contratto: {contract_value}</p>\n                    <p>Data inizio: {contract_start_date}</p>\n                    <p>Data di fine: {contract_end_date}</p>\n                    <p>Non vedo lora di sentirti.</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(116, 10, 'ja', 'Contract', '<p>こんにちは {contract_customer }</p>\n                    <p>契約件名: {contract_subject}</p>\n                    <p>契約タイプ: {contract_type}</p>\n                    <p>契約値: {contract_value}</p>\n                    <p>開始日: {contract_start_date}</p>\n                    <p>終了日: {contract_end_date}</p>\n                    <p>あなたからの便りを楽しみにしています</p>\n                    <p>&nbsp;</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(117, 10, 'nl', 'Contract', '<p>Hallo { contract_customer }</p>\n                    <p>Contractonderwerp: { contract_subject }</p>\n                    <p>Contracttype: { contract_type }</p>\n                    <p>Contractwaarde: { contract_value }</p>\n                    <p>Begindatum: { contract_start_date }</p>\n                    <p>Einddatum: { contract_end_date }</p>\n                    <p>Ik kijk ernaar uit om van je te horen.</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(118, 10, 'pl', 'Contract', '<p>Witaj {contract_customer }</p>\n                    <p>Temat kontraktu: {contract_subject }</p>\n                    <p>Typ kontraktu: {contract_type }</p>\n                    <p>Wartość kontraktu: {contract_value }</p>\n                    <p>Data rozpoczęcia: {contract_start_date }</p>\n                    <p>Data zakończenia: {contract_end_date }</p>\n                    <p>Nie mogę się doczekać, by usłyszeć od ciebie.</p>\n                    <p>&nbsp;</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(119, 10, 'pt', 'Contract', '<p>Oi {contract_customer}</p>\n                    <p>Assunto do Contrato: {contract_subject}</p>\n                    <p>Tipo de Contrato: {contract_type}</p>\n                    <p>Valor do Contrato: {contract_value}</p>\n                    <p>Data de In&iacute;cio: {contract_start_date}</p>\n                    <p>Data de encerramento: {contract_end_date}</p>\n                    <p>Olhando para a frente para ouvir de voc&ecirc;.</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(120, 10, 'ru', 'Contract', '<p>Здравствуйте { contract_customer }</p>\n                    <p>Тема договора: { contract_subject }</p>\n                    <p>Тип контракта: { contract_type }</p>\n                    <p>Значение контракта: { contract_value }</p>\n                    <p>Дата начала: { contract_start_date }</p>\n                    <p>Дата окончания: { contract_end_date }</p>\n                    <p>С нетерпением жду услышать от тебя.</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(121, 11, 'ar', 'Retainer Send', '<p>مرحبًا ، {retainer_name}</p><p>آمل أن يكون هذا البريد الإلكتروني جيدًا! يرجى الاطلاع على رقم التجنيب المرفق {retainer_number} للمنتج/الخدمة.</p><p>ببساطة انقر على الزر أدناه</p><p>{retainer_url}</p><p>لا تتردد في التواصل إذا كان لديك أي أسئلة.</p><p>شكرا لك على عملك!!</p><p>&nbsp;</p><p>يعتبر،</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(122, 11, 'da', 'Retainer Send', '<p>Hej, {retainer_name}</p><p>H&aring;ber denne e -mail finder dig godt! Se vedh&aelig;ftet indehavernummer {retainer_number} for produkt/service.</p><p>Klik blot p&aring; knappen nedenfor</p><p>{retainer_url}</p><p>Du er velkommen til at n&aring; ud, hvis du har sp&oslash;rgsm&aring;l.</p><p>Tak for din forretning!!</p><p>&nbsp;</p><p>Hilsen,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(123, 11, 'de', 'Retainer Send', '<p>Hi, {retainer_name}</p><p>Ich hoffe, diese E -Mail findet Sie gut! Bitte beachten Sie die beigef&uuml;gte Retainer -Nummer {retainer_number} f&uuml;r Produkt/Dienstleistung.</p><p>Klicken Sie einfach auf die Schaltfl&auml;che unten</p><p>{retainer_url}</p><p>F&uuml;hlen Sie sich frei zu erreichen, wenn Sie Fragen haben.</p><p>Danke f&uuml;r dein Gesch&auml;ft !!</p><p>&nbsp;</p><p>Gr&uuml;&szlig;e,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(124, 11, 'es', 'Retainer Send', '<p>Hola, {retainer_name}</p><p>&iexcl;Espero que este correo electr&oacute;nico te encuentre bien! Consulte el n&uacute;mero de retenci&oacute;n adjunto {retainer_number} para producto/servicio.</p><p>Simplemente haga clic en el bot&oacute;n de abajo</p><p>{retainer_url}</p><p>No dude en comunicarse si tiene alguna pregunta.</p><p>&iexcl;&iexcl;Gracias por hacer negocios!!</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(125, 11, 'en', 'Retainer Send', '<p>Hi, {retainer_name}</p><p>Hope this email ﬁnds you well! Please see attached retainer number {retainer_number} for product/service.</p><p>simply click on the button below</p><p>{retainer_url}</p><p>Feel free to reach out if you have any questions.</p><p>Thank you for your business!!</p><p>&nbsp;</p><p>Regards,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(126, 11, 'fr', 'Retainer Send', '<p>Salut, {retainer_name}</p><p>J\'esp&egrave;re que cet e-mail vous trouve bien! Veuillez consulter le num&eacute;ro de dispositif ci-joint {retainer_number} pour le produit / service.</p><p>Cliquez simplement sur le bouton ci-dessous</p><p>{retainer_url}</p><p>N\'h&eacute;sitez pas &agrave; tendre la main si vous avez des questions.</p><p>Merci pour votre entreprise !!</p><p>&nbsp;</p><p>Salutations,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(127, 11, 'it', 'Retainer Send', '<p>Ciao, {retainer_name}</p><p>Spero che questa e -mail ti faccia bene! Si prega di consultare il numero di fermo allegato {retainer_number} per prodotto/servizio.</p><p>Basta fare clic sul pulsante in basso</p><p>{retainer_url}</p><p>Sentiti libero di contattare se hai domande.</p><p>Grazie per il tuo business!!</p><p>&nbsp;</p><p>Saluti,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(128, 11, 'ja', 'Retainer Send', '<p>こんにちは、{retainer_name}</p><p>この電子メールがあなたをうまく見つけることを願っています！製品/サービスについては、添付のリテーナー番号{retainer_number}を参照してください。</p><p>下のボタンをクリックするだけです</p><p>{retainer_url}</p><p>ご質問がある場合は、お気軽にご連絡ください。</p><p>お買い上げくださってありがとうございます！！</p><p>&nbsp;</p><p>よろしく、</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(129, 11, 'nl', 'Retainer Send', '<p>Hallo, {retainer_Name}</p><p>Ik hoop dat deze e -mail je goed vindt! Zie bijgevoegd bewaarnummer {retainer_number} voor product/service.</p><p>Klik eenvoudig op de onderstaande knop</p><p>{retainer_url}</p><p>Voel je vrij om contact op te nemen als je vragen hebt.</p><p>Bedankt voor uw zaken!!</p><p>&nbsp;</p><p>Groeten,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(130, 11, 'pl', 'Retainer Send', '<p>Cześć, {retainer_name}</p><p>Mam nadzieję, że ten e -mail dobrze Cię znajdzie! Aby uzyskać produkt/usługę/usługi.</p><p>Po prostu kliknij przycisk poniżej</p><p>{retainer_url}</p><p>Możesz się skontaktować, jeśli masz jakieś pytania.</p><p>Dziękuję za Tw&oacute;j biznes !!</p><p>&nbsp;</p><p>Pozdrowienia,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(131, 11, 'pt', 'Retainer Send', '<p>Oi, {retainer_name}</p><p>Espero que este e -mail o encontre bem! Consulte o n&uacute;mero do retentor anexado {retainer_number} para obter o produto/servi&ccedil;o.</p><p>Basta clicar no bot&atilde;o abaixo</p><p>{retainer_url}</p><p>Sinta -se &agrave; vontade para alcan&ccedil;ar se tiver alguma d&uacute;vida.</p><p>Agrade&ccedil;o pelos seus servi&ccedil;os!!</p><p>&nbsp;</p><p>Cumprimentos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(132, 11, 'ru', 'Retainer Send', '<p>Привет, {retainer_name}</p><p>Надеюсь, что это электронное письмо вам хорошо найдет! Пожалуйста, см. Прикрепленный номер фиксатора {retainer_number} для продукта/услуги.</p><p>Просто нажмите на кнопку ниже</p><p>{retainer_url}</p><p>Не стесняйтесь обращаться, если у вас есть какие -либо вопросы.</p><p>Спасибо за ваш бизнес !!</p><p>&nbsp;</p><p>С уважением,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(133, 12, 'ar', 'Customer Retainer Send', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">مرحبًا ، {retainer_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">مرحبا بكم في {app_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">أتمنى حين تصلك رسالتي أن تكون بخير! يرجى الاطلاع على رقم التجنيب المرفق {retainer_number} للمنتج/الخدمة.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">ببساطة انقر على الزر أدناه.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{retainer_url}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">لا تتردد في التواصل إذا كان لديك أي أسئلة.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">شكرا لك،</span></span></p><p>&nbsp;</p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">يعتبر،</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(134, 12, 'da', 'Customer Retainer Send', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hej, {retainer_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Velkommen til {app_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">H&aring;ber denne e -mail finder dig godt! Se vedh&aelig;ftet indehavernummer {retainer_number} for produkt/service.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Klik blot p&aring; knappen nedenfor.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{retainer_url}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Du er velkommen til at n&aring; ud, hvis du har sp&oslash;rgsm&aring;l.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Tak skal du have,</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">&nbsp;</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hilsen,</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(135, 12, 'de', 'Customer Retainer Send', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hi, {retainer_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Willkommen bei {app_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Ich hoffe diese email kommt bei dir an! Bitte beachten Sie die beigef&uuml;gte Retainer -Nummer {retainer_number} f&uuml;r Produkt/Dienstleistung.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Klicken Sie einfach auf die Schaltfl&auml;che unten.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{retainer_url}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">F&uuml;hlen Sie sich frei zu erreichen, wenn Sie Fragen haben.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Danke,</span></span></p><p>&nbsp;</p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Gr&uuml;&szlig;e,</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(136, 12, 'es', 'Customer Retainer Send', '<p>Hola, {retainer_name}</p><p>Bienvenido a {app_name}</p><p>&iexcl;Espero que este mensaje te encuentre bien! Consulte el n&uacute;mero de retenci&oacute;n adjunto {retainer_number} para producto/servicio.</p><p>Simplemente haga clic en el bot&oacute;n de abajo.</p><p>{retainer_url}</p><p>No dude en comunicarse si tiene alguna pregunta.</p><p>Gracias,</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(137, 12, 'en', 'Customer Retainer Send', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Hi, {retainer_name}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Welcome to {app_name}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Hope this email finds you well! Please see attached retainer number {retainer_number} for product/service.</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Simply click on the button below.</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">{retainer_url}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Feel free to reach out if you have any questions.</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Thank You,</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Regards,</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">{company_name}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">{app_url}</span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(138, 12, 'fr', 'Customer Retainer Send', '<p>Hola, {retainer_name}</p><p>Bienvenido a {app_name}</p><p>&iexcl;Espero que este mensaje te encuentre bien! Consulte el n&uacute;mero de retenci&oacute;n adjunto {retainer_number} para producto/servicio.</p><p>Simplemente haga clic en el bot&oacute;n de abajo.</p><p>{retainer_url}</p><p>No dude en comunicarse si tiene alguna pregunta.</p><p>Gracias,</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(139, 12, 'it', 'Customer Retainer Send', '<p>Ciao, {retainer_name}</p><p>Benvenuti in {app_name}</p><p>Spero che questa email ti trovi bene! Si prega di consultare il numero di fermo allegato {retainer_number} per prodotto/servizio.</p><p>Basta fare clic sul pulsante in basso.</p><p>{retainer_url}</p><p>Sentiti libero di contattare se hai domande.</p><p>Grazie,</p><p>&nbsp;</p><p>Saluti,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(140, 12, 'ja', 'Customer Retainer Send', '<p>こんにちは、{retainer_name}</p><p>{app_name}へようこそ</p><p>このメールは、あなたがよく見つけた願っています！製品/サービスについては、添付のリテーナー番号{retainer_number}を参照してください。</p><p>下のボタンをクリックするだけです。</p><p>{retainer_url}</p><p>ご質問がある場合は、お気軽にご連絡ください。</p><p>ありがとうございました、</p><p>&nbsp;</p><p>よろしく、</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(141, 12, 'nl', 'Customer Retainer Send', '<p>Hallo, {retainer_name}</p><p>Welkom bij {app_name}</p><p>Ik hoop dat deze e-mail je goed vindt! Zie bijgevoegde houdernummer {retainer_number} voor product/service.</p><p>Klik eenvoudig op de onderstaande knop.</p><p>{retainer_url}</p><p>Neem gerust contact op als je vragen hebt.</p><p>Bedankt,</p><p>&nbsp;</p><p>Groeten,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(142, 12, 'pl', 'Customer Retainer Send', '<p>Cześć, {retainer_name}</p><p>Witamy w {app_name}</p><p>Mam nadzieję, że ten e-mail Cię dobrze odnajdzie! Zobacz załączony numer ustalający {retainer_number} dla produktu/usługi.</p><p>Po prostu kliknij poniższy przycisk.</p><p>{retainer_url}</p><p>Jeśli masz jakiekolwiek pytania, skontaktuj się z nami.</p><p>Dziękuję,</p><p>&nbsp;</p><p>Pozdrowienia,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(143, 12, 'pt', 'Customer Retainer Send', '<p>Ol&aacute;, {retainer_name}</p><p>Bem-vindo ao {app_name}</p><p>Espero que este e-mail o encontre bem! Consulte o n&uacute;mero de reten&ccedil;&atilde;o em anexo {retainer_number} para o produto/servi&ccedil;o.</p><p>Basta clicar no bot&atilde;o abaixo.</p><p>{retainer_url}</p><p>Sinta-se &agrave; vontade para entrar em contato se tiver alguma d&uacute;vida.</p><p>Obrigada,</p><p>&nbsp;</p><p>Cumprimentos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(144, 12, 'ru', 'Customer Retainer Send', '<p>Привет, {retainer_name}</p><p>Добро пожаловать в {app_name}</p><p>Надеюсь, это письмо найдет вас хорошо! Пожалуйста, смотрите прилагаемый номер клиента {retainer_number} для продукта/услуги.</p><p>Просто нажмите на кнопку ниже.</p><p>{retainer_url}</p><p>Не стесняйтесь обращаться, если у вас есть какие-либо вопросы.</p><p>Благодарю вас,</p><p>&nbsp;</p><p>С уважением,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(145, 13, 'ar', 'Retainer Payment Create', '<p>أهلاً،</p><p>مرحبًا بك في {app_name}</p><p>عزيزي {payment_name}</p><p>لقد استلمنا المبلغ {payment_amount} الخاص بك مقابل {retainer_number} تم إرساله بتاريخ {payment_date}</p><p>المبلغ المستحق {retainer_number} هو {payment_dueAmount}</p><p>نحن نقدر دفعك الفوري ونتطلع إلى استمرار العمل معك في المستقبل.</p><p>شكرا جزيلا لك ويوم سعيد !!</p><p>&nbsp;</p><p>يعتبر،</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(146, 13, 'da', 'Retainer Payment Create', '<p>Hej,</p><p>Velkommen til {app_name}</p><p>K&aelig;re {payment_name}</p><p>Vi har modtaget dit bel&oslash;b {payment_amount} betaling for {retainer_number} indsendt p&aring; datoen {payment_date}</p><p>Dit forfaldne bel&oslash;b for {retainer_number} er {payment_dueAmount}</p><p>Vi s&aelig;tter pris p&aring; din hurtige betaling og ser frem til at forts&aelig;tte forretninger med dig i fremtiden.</p><p>Mange tak og god dag!!</p><p>&nbsp;</p><p>Med venlig hilsen</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(147, 13, 'de', 'Retainer Payment Create', '<p>Hi,</p><p>Willkommen bei {app_name}</p><p>Sehr geehrte(r) {payment_name}</p><p>Wir haben Ihre Zahlung in H&ouml;he von {payment_amount} f&uuml;r {retainer_number} erhalten, die am {payment_date} eingereicht wurde</p><p>Ihr {retainer_number} f&auml;lliger Betrag betr&auml;gt {payment_dueAmount}</p><p>Wir wissen Ihre prompte Zahlung zu sch&auml;tzen und freuen uns auf die weitere Zusammenarbeit mit Ihnen in der Zukunft.</p><p>Vielen Dank und einen sch&ouml;nen Tag!!</p><p>&nbsp;</p><p>Gr&uuml;&szlig;e,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(148, 13, 'es', 'Retainer Payment Create', '<p>Hola,</p><p>Bienvenido a {app_name}</p><p>Estimado {payment_name}</p><p>Recibimos su pago de {payment_amount} por {retainer_number} enviado en la fecha {payment_date}</p><p>Su monto adeudado de {retainer_number} es {payment_dueAmount}</p><p>Agradecemos su pago puntual y esperamos seguir haciendo negocios con usted en el futuro.</p><p>&iexcl;&iexcl;Muchas gracias y buen d&iacute;a!!</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(149, 13, 'en', 'Retainer Payment Create', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hi,</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Welcome to {app_name}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Dear {payment_name}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">We have recieved your amount {payment_amount} payment for {invoice_number} submited on date {payment_date}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Your {invoice_number} Due amount is {payment_dueAmount}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">We appreciate your prompt payment and look forward to continued business with you in the future.</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Thank you very much and have a good day!!</span></span></p>                    <p>&nbsp;</p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Regards,</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(150, 13, 'fr', 'Retainer Payment Create', '<p>Salut</p><p>Bienvenue sur {app_name}</p><p>Cher {payment_name}</p><p>Nous avons re&ccedil;u votre paiement d\'un montant de {payment_amount} pour {retainer_number} soumis le {payment_date}</p><p>Votre montant d&ucirc; de {retainer_number} est de {payment_dueAmount}</p><p>Nous appr&eacute;cions votre paiement rapide et esp&eacute;rons continuer &agrave; faire affaire avec vous &agrave; l\'avenir.</p><p>Merci beaucoup et bonne journ&eacute;e !!</p><p>&nbsp;</p><p>Salutations,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(151, 13, 'it', 'Retainer Payment Create', '<p>Ciao,</p><p>Benvenuti in {app_name}</p><p>Caro {payment_name}</p><p>Abbiamo ricevuto il tuo importo {payment_amount} pagamento per {retainer_number} inviato alla data {payment_date}</p><p>Il tuo {retainer_number} l\'importo dovuto &egrave; {payment_dueamount}</p><p>Apprezziamo il tuo rapido pagamento e non vediamo l\'ora di continuare a fare affari con te in futuro.</p><p>Grazie mille e buona giornata !!</p><p>&nbsp;</p><p>Saluti,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(152, 13, 'ja', 'Retainer Payment Create', '<p>やあ、</p><p>{app_name}へようこそ</p><p>親愛なる{payment_name}</p><p>{retainer_number}の金額{payment_amount}支払いを受け取りました{payment_date}に提出されました</p><p>あなたの{reterer_number}正当な金額は{payment_dueamount}です</p><p>私たちはあなたの迅速な支払いに感謝し、将来あなたとの継続的なビジネスを楽しみにしています。</p><p>どうもありがとうございました、そして良い一日を！</p><p>&nbsp;</p><p>よろしく、</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(153, 13, 'nl', 'Retainer Payment Create', '<p>Hoi,</p><p>Welkom bij {app_name}</p><p>Beste {payment_Name}</p><p>We hebben uw bedrag ontvangen.</p><p>Uw {retainer_number} vervallen bedrag is {payment_dueAmount}</p><p>We waarderen uw snelle betaling en kijken uit naar voortdurende zaken met u in de toekomst.</p><p>Heel erg bedankt en een fijne dag fijn !!</p><p>&nbsp;</p><p>Groeten,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(154, 13, 'pl', 'Retainer Payment Create', '<p>Cześć,</p><p>Witamy w {app_name}</p><p>Drogi {payment_name}</p><p>Otrzymaliśmy twoją kwotę {payment_amount} płatność za {retainer_number} przesłany na datę {payment_date}</p><p>Twoja {retainer_number} należna kwota to {payment_dueAmount}</p><p>Doceniamy twoją szybką płatność i czekamy na dalszą działalność z Tobą w przyszłości.</p><p>Dziękuję bardzo i życzę miłego dnia !!</p><p>&nbsp;</p><p>Pozdrowienia,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(155, 13, 'pt', 'Retainer Payment Create', '<p>Oi,</p><p>Bem -vindo ao {app_Name}</p><p>Querido {retainer_name}</p><p>Recebemos seu valor {payment_amount} pagamento de {retainer_number} submetido na data {payment_date}</p><p>Seu {retainer_number} de vencimento &eacute; {payment_dueAmount}</p><p>Agradecemos seu pagamento imediato e esperamos os neg&oacute;cios cont&iacute;nuos com voc&ecirc; no futuro.</p><p>Muito obrigado e tenha um bom dia !!</p><p>&nbsp;</p><p>Cumprimentos,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(156, 13, 'ru', 'Retainer Payment Create', '<p>Привет,</p><p>Добро пожаловать в {app_name}</p><p>Дорогой {retainer_name}</p><p>Мы получили вашу сумму {payment_amount} платеж за {retainer_number}, представленную на дату {payment_date}</p><p>Ваша {retainer_number} Долженная сумма {payment_dueAmount}</p><p>Мы ценим вашу оперативную оплату и с нетерпением ждем продолжения бизнеса с вами в будущем.</p><p>Большое спасибо и хорошего дня !!</p><p>&nbsp;</p><p>С уважением,</p><p>{company_name}</p><p>{app_url}</p>', '2022-10-09 08:56:33', '2022-10-09 08:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(16,2) DEFAULT '0.00',
  `date` date DEFAULT NULL,
  `project` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `is_display` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int NOT NULL,
  `ref_number` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `shipping_display` int NOT NULL DEFAULT '1',
  `discount_apply` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `customer_id`, `issue_date`, `due_date`, `send_date`, `category_id`, `ref_number`, `status`, `shipping_display`, `discount_apply`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-10-09', '2022-10-09', '2022-10-09', 3, '', 4, 1, 0, 1, '2022-10-09 09:47:45', '2022-10-09 10:11:48'),
(2, 2, 2, '2022-10-10', '2022-10-10', '2022-10-09', 3, '', 4, 1, 0, 1, '2022-10-09 10:28:50', '2022-10-09 10:31:24'),
(3, 3, 2, '2022-10-12', '2022-10-13', NULL, 3, 'sdvsdv', 0, 1, 0, 1, '2022-10-22 11:19:42', '2022-10-22 11:19:42'),
(4, 4, 1, '2022-10-15', '2022-10-22', NULL, 3, 'sdvsdv', 0, 1, 0, 1, '2022-10-22 11:25:21', '2022-10-22 11:25:21'),
(5, 5, 1, '2022-10-25', '2022-10-25', NULL, 3, 'sdvsdv', 1, 1, 0, 1, '2022-10-26 04:42:39', '2022-10-26 04:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `account_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manually',
  `txn_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `invoice_id`, `date`, `amount`, `account_id`, `payment_method`, `receipt`, `payment_type`, `txn_id`, `currency`, `order_id`, `reference`, `add_receipt`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-09', '20800.00', 1, 0, NULL, 'Manually', NULL, NULL, NULL, 'skdnvn', NULL, 'skdnv sdlvsd vlksdnv', '2022-10-09 10:11:48', '2022-10-09 10:11:48'),
(2, 2, '2022-10-09', '36100.00', 1, 0, NULL, 'Manually', NULL, NULL, NULL, 'skdnvn', NULL, 'cash received', '2022-10-09 10:31:24', '2022-10-09 10:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `tax` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `quantity`, `tax`, `discount`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, '', 0.00, '2080.00', 'Mayonis of Warda', '2022-10-09 09:47:45', '2022-10-09 09:47:45'),
(2, 2, 3, 20, '', 0.00, '780.00', 'skdv sdkvsdv sdvk sdv', '2022-10-09 10:28:50', '2022-10-09 10:28:50'),
(3, 2, 2, 10, '', 0.00, '2050.00', 'skdv sdkvsdv sdvk sdv', '2022-10-09 10:28:50', '2022-10-09 10:28:50'),
(4, 3, 3, 1, '', 0.00, '2080.00', 'fdkjskkvnsd dlsdv ,sd lkskdn', '2022-10-22 11:19:42', '2022-10-22 11:19:42'),
(5, 4, 3, 1, '', 0.00, '1000.00', 'fdkjskkvnsd dlsdv ,sd lkskdn', '2022-10-22 11:25:21', '2022-10-22 11:25:21'),
(6, 5, 3, 1, '0.00', 0.00, '2080.00', NULL, '2022-10-26 04:42:39', '2022-10-26 04:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `journal_id` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_items`
--

CREATE TABLE `journal_items` (
  `id` bigint UNSIGNED NOT NULL,
  `journal` int NOT NULL DEFAULT '0',
  `account` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `debit` double(8,2) NOT NULL DEFAULT '0.00',
  `credit` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_28_102009_create_settings_table', 1),
(5, '2019_11_13_051828_create_taxes_table', 1),
(6, '2019_11_13_055026_create_invoices_table', 1),
(7, '2019_11_13_072623_create_expenses_table', 1),
(8, '2020_01_08_063207_create_product_services_table', 1),
(9, '2020_01_08_084029_create_product_service_categories_table', 1),
(10, '2020_01_08_092717_create_product_service_units_table', 1),
(11, '2020_01_08_121541_create_customers_table', 1),
(12, '2020_01_09_104945_create_venders_table', 1),
(13, '2020_01_09_113852_create_bank_accounts_table', 1),
(14, '2020_01_09_124222_create_transfers_table', 1),
(15, '2020_01_10_064723_create_transactions_table', 1),
(16, '2020_01_13_072608_create_invoice_products_table', 1),
(17, '2020_01_15_034438_create_revenues_table', 1),
(18, '2020_01_15_051228_create_bills_table', 1),
(19, '2020_01_15_060859_create_bill_products_table', 1),
(20, '2020_01_15_073237_create_payments_table', 1),
(21, '2020_01_18_051650_create_invoice_payments_table', 1),
(22, '2020_01_20_091035_create_bill_payments_table', 1),
(23, '2020_02_25_052356_create_credit_notes_table', 1),
(24, '2020_02_26_033827_create_debit_notes_table', 1),
(25, '2020_04_02_045834_create_proposals_table', 1),
(26, '2020_04_02_055706_create_proposal_products_table', 1),
(27, '2020_04_18_035141_create_goals_table', 1),
(28, '2020_04_21_115823_create_assets_table', 1),
(29, '2020_04_24_023732_create_custom_fields_table', 1),
(30, '2020_04_24_024217_create_custom_field_values_table', 1),
(31, '2020_05_21_065337_create_permission_tables', 1),
(32, '2020_06_30_120854_add_balance_to_customers_table', 1),
(33, '2020_06_30_121531_add_balance_to_vender_table', 1),
(34, '2020_07_01_033457_change_product_services_tax_id_column_type', 1),
(35, '2020_07_01_063255_change_tax_column_type', 1),
(36, '2020_07_03_054342_add_convert_in_proposal_table', 1),
(37, '2020_07_07_052211_add_field_in_invoice_payments_table', 1),
(38, '2020_07_22_131715_change_amount_type_size', 1),
(39, '2020_08_04_034206_change_settings_value_type', 1),
(40, '2020_09_16_040822_change_user_type_size_in_users_table', 1),
(41, '2020_09_17_053350_change_shipping_default_val', 1),
(42, '2020_09_17_070031_add_description_field', 1),
(43, '2020_12_11_094137_add_mode_to_users', 1),
(44, '2020_12_11_094137_add_receipt_to_payment', 1),
(45, '2020_12_11_094137_add_tax_number_to_customers', 1),
(46, '2021_01_11_062508_create_chart_of_accounts_table', 1),
(47, '2021_01_11_070441_create_chart_of_account_types_table', 1),
(48, '2021_01_12_032834_create_journal_entries_table', 1),
(49, '2021_01_12_033815_create_journal_items_table', 1),
(50, '2021_01_20_072219_create_chart_of_account_sub_types_table', 1),
(51, '2021_07_17_054252_company_payment_settings', 1),
(52, '2021_09_10_160559_add_last_login_to_user_table', 1),
(53, '2021_12_02_052828_create_budgets_table', 1),
(54, '2022_03_03_100148_change_price_val', 1),
(55, '2022_03_11_035602_create_stock_reports_table', 1),
(56, '2022_07_20_045017_create_email_templates_table', 1),
(57, '2022_07_20_045102_create_email_template_langs_table', 1),
(58, '2022_07_20_045138_create_user_email_templates_table', 1),
(59, '2022_08_02_115833_create_contract_types_table', 1),
(60, '2022_08_02_120927_create_contracts_table', 1),
(61, '2022_08_02_121554_create_contract_attachments_table', 1),
(62, '2022_08_02_121734_create_contract_notes_table', 1),
(63, '2022_08_02_121843_create_contract_comments_table', 1),
(64, '2022_08_15_114839_create_retainers_table', 1),
(65, '2022_08_16_024500_create_retainer_payments_table', 1),
(66, '2022_08_16_024853_create_retainer_products_table', 1),
(67, '2022_09_21_113722_add_type_field_in_all_contract_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Customer', 1),
(3, 'App\\Models\\User', 1),
(2, 'App\\Models\\Vender', 1),
(1, 'App\\Models\\Customer', 2),
(4, 'App\\Models\\User', 2),
(2, 'App\\Models\\Vender', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `account_id` int NOT NULL,
  `vender_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `recurring` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` int NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `date`, `amount`, `account_id`, `vender_id`, `description`, `category_id`, `recurring`, `payment_method`, `reference`, `add_receipt`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2022-10-09', '500000.00', 1, 1, 'By Cash', 2, NULL, 0, '', '1665327726_ta-1-1.png', 1, '2022-10-09 10:02:06', '2022-10-09 10:02:06'),
(2, '2022-10-22', '50000.00', 1, 1, '', 2, NULL, 0, '', '1666462234_Black-pepper-nutritional-information-calories.jpg', 1, '2022-10-22 13:10:34', '2022-10-22 13:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'show dashboard', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'manage user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'create user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'edit user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'delete user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'create language', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'manage system settings', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'manage role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'create role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'edit role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'delete role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'manage permission', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'create permission', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'edit permission', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'delete permission', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'manage company settings', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'manage business settings', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'manage stripe settings', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'manage expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'create expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'edit expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'delete expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'manage invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'create invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'edit invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'delete invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'show invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'create payment invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'delete payment invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'send invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'delete invoice product', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'convert invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'manage plan', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'create plan', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'edit plan', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'manage constant unit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'create constant unit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'edit constant unit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'delete constant unit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'manage constant tax', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'create constant tax', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'edit constant tax', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'delete constant tax', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'manage constant category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'create constant category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'edit constant category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'delete constant category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'manage product & service', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'create product & service', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'edit product & service', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'delete product & service', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'manage customer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'create customer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'edit customer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'delete customer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'show customer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'manage vender', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'create vender', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'edit vender', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'delete vender', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'show vender', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'manage bank account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'create bank account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'edit bank account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'delete bank account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'manage transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'create transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'edit transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'delete transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'manage constant payment method', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'create constant payment method', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'edit constant payment method', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'delete constant payment method', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'manage transaction', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'manage revenue', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'create revenue', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'edit revenue', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'delete revenue', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'manage bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'create bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'edit bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'delete bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'show bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'manage payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'create payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'edit payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'delete payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'delete bill product', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'buy plan', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'send bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'create payment bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'delete payment bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'manage order', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'income report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'expense report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'income vs expense report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'invoice report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'bill report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'stock report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'tax report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'loss & profit report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'manage customer payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'manage customer transaction', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'manage customer invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'vender manage bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'manage vender bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'manage vender payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'manage vender transaction', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'manage credit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'create credit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'edit credit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'delete credit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'manage debit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'create debit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'edit debit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'delete debit note', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'duplicate invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'duplicate bill', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'manage coupon', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'create coupon', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'edit coupon', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'delete coupon', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'manage proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'create proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'edit proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'delete proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'duplicate proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'show proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'send proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'delete proposal product', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'manage customer proposal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'manage goal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'create goal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'edit goal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'delete goal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'manage assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'create assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'edit assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'delete assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'statement report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'manage constant custom field', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'create constant custom field', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'edit constant custom field', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'delete constant custom field', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'manage chart of account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'create chart of account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'edit chart of account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'delete chart of account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'manage journal entry', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'create journal entry', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'edit journal entry', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'delete journal entry', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'show journal entry', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'balance sheet report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'ledger report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'trial balance report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'create budget planner', 'web', '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(158, 'edit budget planner', 'web', '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(159, 'manage budget planner', 'web', '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(160, 'delete budget planner', 'web', '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(161, 'view budget planner', 'web', '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(162, 'manage contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'create contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'manage customer contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'edit contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'delete contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'view contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'duplicate contract', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'delete attachment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'delete comment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'delete notes', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'contract description', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'upload attachment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'add comment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'add notes', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'send contract mail', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'manage retainer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_services`
--

CREATE TABLE `product_services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `purchase_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '0',
  `tax_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `unit_id` int NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_services`
--

INSERT INTO `product_services` (`id`, `name`, `sku`, `sale_price`, `purchase_price`, `quantity`, `tax_id`, `category_id`, `unit_id`, `type`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Warda Mayo', 'warda', '2050.00', '2050.00', 140, '', 1, 1, 'product', 'Mayonis of Warda', 1, '2022-10-09 09:26:37', '2022-10-09 10:55:34'),
(2, 'Warda Mayo', 'warda', '2050.00', '2000.00', 190, '', 1, 1, 'product', 'skdv sdkvsdv sdvk sdv', 1, '2022-10-09 09:36:50', '2022-10-09 10:28:50'),
(3, 'Foodies Tooping', 'FTopi', '800.00', '758.00', 2477, '', 4, 1, 'product', 'fdkjskkvnsd dlsdv ,sd lkskdn', 1, '2022-10-09 09:55:12', '2022-10-26 04:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_service_categories`
--

CREATE TABLE `product_service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#fc544b',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_service_categories`
--

INSERT INTO `product_service_categories` (`id`, `name`, `type`, `color`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Mayo', '0', '#000000', 1, '2022-10-09 09:23:23', '2022-10-09 09:23:23'),
(2, 'sample category', '2', '#000000', 1, '2022-10-09 09:46:35', '2022-10-09 09:46:35'),
(3, 'income category', '1', '#000000', 1, '2022-10-09 09:46:50', '2022-10-09 09:46:50'),
(4, 'Topping', '0', '#000000', 1, '2022-10-09 09:54:26', '2022-10-09 09:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_service_units`
--

CREATE TABLE `product_service_units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_service_units`
--

INSERT INTO `product_service_units` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Pcs', 1, '2022-10-09 09:26:05', '2022-10-09 09:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` bigint UNSIGNED NOT NULL,
  `proposal_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `discount_apply` int NOT NULL DEFAULT '0',
  `converted_invoice_id` int NOT NULL DEFAULT '0',
  `is_convert` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_products`
--

CREATE TABLE `proposal_products` (
  `id` bigint UNSIGNED NOT NULL,
  `proposal_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `tax` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retainers`
--

CREATE TABLE `retainers` (
  `id` bigint UNSIGNED NOT NULL,
  `retainer_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `discount_apply` int NOT NULL DEFAULT '0',
  `converted_invoice_id` int NOT NULL DEFAULT '0',
  `is_convert` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `retainers`
--

INSERT INTO `retainers` (`id`, `retainer_id`, `customer_id`, `issue_date`, `due_date`, `send_date`, `category_id`, `status`, `discount_apply`, `converted_invoice_id`, `is_convert`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-10-11', NULL, NULL, 3, 0, 0, 0, 0, 1, '2022-10-11 11:39:24', '2022-10-11 11:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `retainer_payments`
--

CREATE TABLE `retainer_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `retainer_id` int NOT NULL,
  `date` date NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `account_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manually',
  `txn_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retainer_products`
--

CREATE TABLE `retainer_products` (
  `id` bigint UNSIGNED NOT NULL,
  `retainer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `tax` double(8,2) DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `retainer_products`
--

INSERT INTO `retainer_products` (`id`, `retainer_id`, `product_id`, `quantity`, `tax`, `discount`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, 0.00, 2050.00, NULL, '2022-10-11 11:39:24', '2022-10-11 11:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `account_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `category_id` int NOT NULL,
  `payment_method` int NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revenues`
--

INSERT INTO `revenues` (`id`, `date`, `amount`, `account_id`, `customer_id`, `category_id`, `payment_method`, `reference`, `add_receipt`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2022-10-10', '20000.00', 1, 1, 3, 0, '', NULL, 'sdvn dsl s dlbsdv lksdbvsd vsldkbv sdv', 1, '2022-10-09 10:07:36', '2022-10-09 10:07:36'),
(2, '2022-10-10', '36100.00', 1, 2, 3, 0, 'skdnvn', NULL, 'cash received', 1, '2022-10-09 10:29:44', '2022-10-09 10:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'customer', 'web', 0, '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(2, 'vender', 'web', 0, '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(3, 'company', 'web', 0, '2022-10-09 08:56:31', '2022-10-09 08:56:31'),
(4, 'accountant', 'web', 1, '2022-10-09 08:56:32', '2022-10-09 08:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(27, 1),
(56, 1),
(102, 1),
(103, 1),
(104, 1),
(128, 1),
(131, 1),
(164, 1),
(167, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(61, 2),
(83, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(132, 3),
(133, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(138, 3),
(139, 3),
(140, 3),
(141, 3),
(142, 3),
(143, 3),
(144, 3),
(145, 3),
(146, 3),
(147, 3),
(148, 3),
(149, 3),
(150, 3),
(151, 3),
(152, 3),
(153, 3),
(154, 3),
(155, 3),
(156, 3),
(157, 3),
(158, 3),
(159, 3),
(160, 3),
(161, 3),
(162, 3),
(163, 3),
(165, 3),
(166, 3),
(167, 3),
(168, 3),
(169, 3),
(170, 3),
(171, 3),
(172, 3),
(173, 3),
(174, 3),
(175, 3),
(176, 3),
(177, 3),
(1, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(74, 4),
(75, 4),
(76, 4),
(77, 4),
(78, 4),
(79, 4),
(80, 4),
(81, 4),
(82, 4),
(83, 4),
(84, 4),
(85, 4),
(86, 4),
(87, 4),
(88, 4),
(90, 4),
(91, 4),
(92, 4),
(94, 4),
(95, 4),
(96, 4),
(97, 4),
(99, 4),
(100, 4),
(101, 4),
(109, 4),
(110, 4),
(111, 4),
(112, 4),
(113, 4),
(114, 4),
(115, 4),
(116, 4),
(123, 4),
(124, 4),
(125, 4),
(126, 4),
(127, 4),
(128, 4),
(129, 4),
(130, 4),
(132, 4),
(133, 4),
(134, 4),
(135, 4),
(136, 4),
(137, 4),
(138, 4),
(139, 4),
(140, 4),
(141, 4),
(142, 4),
(143, 4),
(144, 4),
(145, 4),
(146, 4),
(147, 4),
(148, 4),
(149, 4),
(150, 4),
(151, 4),
(152, 4),
(153, 4),
(154, 4),
(155, 4),
(156, 4),
(157, 4),
(158, 4),
(159, 4),
(160, 4),
(161, 4),
(177, 4);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'local_storage_validation', 'csv,jpeg,jpg,pdf,png,xls,xlsx', 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(2, 'wasabi_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(3, 's3_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(4, 'local_storage_max_upload_size', '2048000', 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(5, 'wasabi_max_upload_size', '2048000', 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(6, 's3_max_upload_size', '2048000', 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(7, 'site_currency', 'PKR', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(8, 'site_currency_symbol', 'Rs', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(9, 'site_currency_symbol_position', 'pre', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(10, 'site_date_format', 'M j, Y', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(11, 'site_time_format', 'g:i A', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(12, 'invoice_prefix', '#INVO', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(13, 'invoice_starting_number', '6', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(14, 'proposal_prefix', '#PROP', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(15, 'proposal_starting_number', '1', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(16, 'bill_prefix', '#BILL', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(17, 'retainer_starting_number', '2', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(18, 'retainer_prefix', '#RET', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(19, 'bill_starting_number', '5', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(20, 'customer_prefix', '#CUST', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(21, 'vender_prefix', '#VEND', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(22, 'footer_title', '', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(23, 'decimal_number', '2', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(24, 'journal_prefix', '#JUR', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(25, 'shipping_display', 'on', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(26, 'footer_notes', '', 1, '2022-10-09 09:27:03', '2022-10-09 09:27:03'),
(27, 'storage_setting', 'local', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_reports`
--

CREATE TABLE `stock_reports` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_reports`
--

INSERT INTO `stock_reports` (`id`, `product_id`, `quantity`, `type`, `type_id`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 'invoice', 1, '10   quantity sold in invoice #INVO00001', 1, '2022-10-09 09:47:45', '2022-10-09 09:47:45'),
(2, 3, 1000, 'bill', 1, '1000   quantity purchase in bill #BILL00001', 1, '2022-10-09 09:55:48', '2022-10-09 09:55:48'),
(3, 3, 20, 'invoice', 2, '20   quantity sold in invoice #INVO00002', 1, '2022-10-09 10:28:50', '2022-10-09 10:28:50'),
(4, 2, 10, 'invoice', 2, '10   quantity sold in invoice #INVO00002', 1, '2022-10-09 10:28:50', '2022-10-09 10:28:50'),
(5, 1, 20, 'bill', 2, '20   quantity purchase in bill #BILL00002', 1, '2022-10-09 10:54:55', '2022-10-09 10:54:55'),
(6, 1, 30, 'bill', 3, '30   quantity purchase in bill #BILL00003', 1, '2022-10-09 10:55:34', '2022-10-09 10:55:34'),
(7, 3, 1, 'invoice', 3, '1   quantity sold in invoice #INVO00003', 1, '2022-10-22 11:19:42', '2022-10-22 11:19:42'),
(8, 3, 1, 'invoice', 4, '1   quantity sold in invoice #INVO00004', 1, '2022-10-22 11:25:21', '2022-10-22 11:25:21'),
(9, 3, 500, 'bill', 4, '500   quantity purchase in bill #BILL00004', 1, '2022-10-22 13:12:59', '2022-10-22 13:12:59'),
(10, 3, 1, 'invoice', 5, '1   quantity sold in invoice #INVO00005', 1, '2022-10-26 04:42:39', '2022-10-26 04:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '0',
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `user_type`, `account`, `type`, `amount`, `description`, `date`, `created_by`, `payment_id`, `category`, `created_at`, `updated_at`) VALUES
(1, 1, 'Vender', 1, 'Payment', '500000.00', 'By Cash', '2022-10-09', 1, 1, 'sample category', '2022-10-09 10:02:06', '2022-10-09 10:02:06'),
(2, 1, 'Customer', 1, 'Revenue', '20000.00', 'sdvn dsl s dlbsdv lksdbvsd vsldkbv sdv', '2022-10-10', 1, 1, 'income category', '2022-10-09 10:07:36', '2022-10-09 10:07:36'),
(3, 1, 'Customer', 1, 'Partial', '20800.00', 'skdnv sdlvsd vlksdnv', '2022-10-09', 1, 1, 'Invoice', '2022-10-09 10:11:48', '2022-10-09 10:11:48'),
(4, 2, 'Customer', 1, 'Revenue', '36100.00', 'cash received', '2022-10-10', 1, 2, 'income category', '2022-10-09 10:29:44', '2022-10-09 10:29:44'),
(5, 2, 'Customer', 1, 'Partial', '36100.00', 'cash received', '2022-10-09', 1, 2, 'Invoice', '2022-10-09 10:31:24', '2022-10-09 10:31:24'),
(6, 1, 'Vender', 1, 'Partial', '758000.00', 'cash paid', '2022-10-09', 1, 1, 'Bill', '2022-10-09 10:52:38', '2022-10-09 10:52:38'),
(7, 2, 'Vender', 1, 'Partial', '41000.00', 'asc d d', '2022-10-09', 1, 2, 'Bill', '2022-10-09 10:57:27', '2022-10-09 10:57:27'),
(8, 2, 'Vender', 1, 'Partial', '60000.00', 'd ds dsvdsvsdv', '2022-10-09', 1, 3, 'Bill', '2022-10-09 10:57:49', '2022-10-09 10:57:49'),
(9, 1, 'Vender', 1, 'Payment', '50000.00', '', '2022-10-22', 1, 2, 'sample category', '2022-10-22 13:10:34', '2022-10-22 13:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `from_account` int NOT NULL DEFAULT '0',
  `to_account` int NOT NULL DEFAULT '0',
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `payment_method` int NOT NULL DEFAULT '0',
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `created_by` int NOT NULL DEFAULT '0',
  `delete_status` int NOT NULL DEFAULT '1',
  `is_active` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `lang`, `mode`, `created_by`, `delete_status`, `is_active`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company@example.com', NULL, '$2y$10$DyrrI3jjaPk/8KIU1asKBu9LfgBTuPqbsxxMIinalT6OPdXjLeixe', 'company', '', 'en', 'light', 0, 1, 1, NULL, NULL, '2022-10-09 08:56:32', '2022-10-09 08:56:32'),
(2, 'accountant', 'accountant@example.com', NULL, '$2y$10$1XZvR37oqbR1AbRwSTzQPO141vZsGwTJHgL5NXAbmjNBT2POeBZge', 'accountant', '', 'en', 'light', 1, 1, 1, NULL, NULL, '2022-10-09 08:56:32', '2022-10-09 08:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_email_templates`
--

CREATE TABLE `user_email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `template_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_email_templates`
--

INSERT INTO `user_email_templates` (`id`, `template_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(2, 2, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(3, 3, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(4, 4, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(5, 5, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(6, 6, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(7, 7, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(8, 8, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(9, 9, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(10, 10, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(11, 11, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(12, 12, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33'),
(13, 13, 1, 1, '2022-10-09 08:56:33', '2022-10-09 08:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `venders`
--

CREATE TABLE `venders` (
  `id` bigint UNSIGNED NOT NULL,
  `vender_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `balance` double(8,2) NOT NULL DEFAULT '0.00',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `venders`
--

INSERT INTO `venders` (`id`, `vender_id`, `name`, `email`, `tax_number`, `password`, `contact`, `avatar`, `created_by`, `is_active`, `email_verified_at`, `billing_name`, `billing_country`, `billing_state`, `billing_city`, `billing_phone`, `billing_zip`, `billing_address`, `shipping_name`, `shipping_country`, `shipping_state`, `shipping_city`, `shipping_phone`, `shipping_zip`, `shipping_address`, `lang`, `balance`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Foodies', 'foodies@gmail.com', '545451521', '$2y$10$pDJLiJG2m50/2BkeeQ4GCuEVE.qq7hDhteMNBnTPY6vcyLl8KVTwm', '322323232', '', 1, 1, NULL, 'dskvnsdn', 'sdfjfv', 'sdfnvj', 'jsnvdkjs', '64116165', '155141', 'sdmvn slkjkndvs dlbsdv', 'dskvnsdn', 'sdfjfv', 'sdfnvj', 'jsnvdkjs', '64116165', '155141', 'sdmvn slkjkndvs dlbsdv', '', -50000.00, NULL, NULL, '2022-10-09 09:52:07', '2022-10-22 13:13:11'),
(2, 2, 'Warda', 'warda@email.com', '4', '$2y$10$o1N.UNHRYwZrwUS213ydFu3eV7KZxbjCgetbVPVGRm/uzOPnsxGJy', '615454', '', 1, 1, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, NULL, NULL, '2022-10-09 10:51:38', '2022-10-09 10:57:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_payments`
--
ALTER TABLE `bill_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_products`
--
ALTER TABLE `bill_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_account_sub_types`
--
ALTER TABLE `chart_of_account_sub_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_account_types`
--
ALTER TABLE `chart_of_account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_payment_settings`
--
ALTER TABLE `company_payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_payment_settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_attachments`
--
ALTER TABLE `contract_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_comments`
--
ALTER TABLE `contract_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_notes`
--
ALTER TABLE `contract_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_field_values_record_id_field_id_unique` (`record_id`,`field_id`),
  ADD KEY `custom_field_values_field_id_foreign` (`field_id`);

--
-- Indexes for table `debit_notes`
--
ALTER TABLE `debit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_items`
--
ALTER TABLE `journal_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_services`
--
ALTER TABLE `product_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_service_categories`
--
ALTER TABLE `product_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_service_units`
--
ALTER TABLE `product_service_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_products`
--
ALTER TABLE `proposal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retainers`
--
ALTER TABLE `retainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retainer_payments`
--
ALTER TABLE `retainer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retainer_products`
--
ALTER TABLE `retainer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `stock_reports`
--
ALTER TABLE `stock_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venders`
--
ALTER TABLE `venders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `venders_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bill_payments`
--
ALTER TABLE `bill_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bill_products`
--
ALTER TABLE `bill_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `chart_of_account_sub_types`
--
ALTER TABLE `chart_of_account_sub_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chart_of_account_types`
--
ALTER TABLE `chart_of_account_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company_payment_settings`
--
ALTER TABLE `company_payment_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_attachments`
--
ALTER TABLE `contract_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_comments`
--
ALTER TABLE `contract_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_notes`
--
ALTER TABLE `contract_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_notes`
--
ALTER TABLE `credit_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit_notes`
--
ALTER TABLE `debit_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_items`
--
ALTER TABLE `journal_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `product_services`
--
ALTER TABLE `product_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_service_categories`
--
ALTER TABLE `product_service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_service_units`
--
ALTER TABLE `product_service_units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_products`
--
ALTER TABLE `proposal_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retainers`
--
ALTER TABLE `retainers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `retainer_payments`
--
ALTER TABLE `retainer_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retainer_products`
--
ALTER TABLE `retainer_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `stock_reports`
--
ALTER TABLE `stock_reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `venders`
--
ALTER TABLE `venders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
