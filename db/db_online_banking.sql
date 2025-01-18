-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 05:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_online_banking`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

CREATE TABLE `tbl_bank_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_type` varchar(20) NOT NULL,
  `account_number` text NOT NULL,
  `initial_amount` decimal(16,2) NOT NULL,
  `balance` decimal(16,2) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bank_accounts`
--

INSERT INTO `tbl_bank_accounts` (`id`, `user_id`, `account_type`, `account_number`, `initial_amount`, `balance`, `status`) VALUES
(1, 1, 'S', '9858487106', 20000.00, 20000.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fund_transfer_transactions`
--

CREATE TABLE `tbl_fund_transfer_transactions` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `particulats` text NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `id` int(11) NOT NULL,
  `bank_account_id` int(11) NOT NULL,
  `transaction_type` varchar(6) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `transaction_by` varchar(50) NOT NULL,
  `transation_holder_contact` varchar(15) NOT NULL,
  `transaction_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(5) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `first_name`, `last_name`, `email`, `password`, `role`, `status`) VALUES
(1, 'Sunil Bahadur', 'Bist', 'sunil@nast.edu.np', 'pass', 'ADMIN', 1),
(2, 'subodh', 'awasthi', 'subodhawasthi040@gmail.com', '1234@Subodh', 'CUST', 1),
(3, 'Deepak', 'Pant', 'deepak@123', '123456', 'CUST', 1),
(4, 'Niraj', 'paneru', 'niraj123@gmail.com', '222', 'CUST', 1),
(5, 'Jaynarayan', '', '', '', 'CUST', 1),
(6, 'salina', 'biswokarma', 'salina@gmail.ccom', 'alina@@22', 'CUST', 1),
(7, 'Jaynarayan', 'Upadhyaya', 'jaynarayanupadhyaya@gmail.com', '', 'CUST', 1),
(10, 'sulochana ', 'bhatta', 'bhattasulochana9@gmail.com', 'pass', 'CUST', 1),
(13, 'Raman', 'Chaudhary', 'dhsagcfahgjkah@gmail.com', 'Qwerty123', 'CUST', 1),
(14, 'Jaynarayan', 'Upadhyaya', 'narayan@gmail.com', '', 'CUST', 1),
(15, 'surendra', 'deuba', 'deuba1@gmail.com', '33333', 'CUST', 1),
(22, 'Jaynarayan', 'Upadhyaya', 'shyaam@gmail.com', '2222', 'CUST', 1),
(27, 'salinaaa', 'bishwokarma', 'alina@gmail.ccom', '2222', 'CUST', 1),
(28, 'SB', 'B', 'bcahod@nast.edu.np', 'pass', 'CUST', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_fund_transfer_transactions`
--
ALTER TABLE `tbl_fund_transfer_transactions`
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD KEY `bank_account_id` (`bank_account_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD CONSTRAINT `tbl_bank_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Constraints for table `tbl_fund_transfer_transactions`
--
ALTER TABLE `tbl_fund_transfer_transactions`
  ADD CONSTRAINT `tbl_fund_transfer_transactions_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `tbl_users` (`id`),
  ADD CONSTRAINT `tbl_fund_transfer_transactions_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `tbl_users` (`id`);

--
-- Constraints for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD CONSTRAINT `tbl_transactions_ibfk_1` FOREIGN KEY (`bank_account_id`) REFERENCES `tbl_bank_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
