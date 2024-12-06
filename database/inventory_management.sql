-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 04:37 PM
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
-- Database: `inventory_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `product_type` varchar(50) NOT NULL,
  `size` varchar(20) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `weight_unit` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_id`, `brand`, `product_type`, `size`, `weight`, `weight_unit`) VALUES
(1, 'CAT001', 'Adidas', 'Jacket', 'L', 5.00, 'kg'),
(2, 'CAT002', 'Iron Works', 'Sheet', '4x8 ft', 80.00, 'kg'),
(3, 'CAT003', 'Metal Masters', 'Rod', '1 inch', 2.50, 'kg'),
(4, 'CAT004', 'Alloy Industries', 'Beam', 'I-beam 6 inch', 120.00, 'kg'),
(5, 'CAT005', 'Steel Co', 'Tube', '3 inch', 7.50, 'kg'),
(6, 'CAT-449', 'Adidas', 'Shoes', 'M', 750.00, 'g');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_id`, `customer_name`, `contact`, `address`, `email`) VALUES
(1, 'CUST001', 'John Doe Construction', '555-1234', '123 Build St, Construct City', 'john@doeconstruction.com'),
(2, 'CUST002', 'Smith Fabrication', '555-5678', '456 Weld Ave, Metal Town', 'info@smithfab.com'),
(3, 'CUST003', 'Johnson Industries', '555-9876', '789 Industry Rd, Factoryville', 'sales@johnsonindustries.com'),
(4, 'CUST004', 'Brown & Sons Builders', '555-4321', '321 Frame Ln, Scaffold City', 'orders@brownbuilders.com'),
(5, 'CUST005', 'Green Engineering', '555-8765', '654 Design Blvd, Blueprint City', 'projects@greeneng.com');

-- --------------------------------------------------------

--
-- Table structure for table `purchasing`
--

CREATE TABLE `purchasing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_date` date NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `price_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchasing`
--

INSERT INTO `purchasing` (`id`, `purchase_date`, `invoice_number`, `stock_id`, `supplier_id`, `quantity`, `price`, `sub_total`, `price_total`) VALUES
(1, '2024-09-01', 'PUR001', 1, 1, 50, 50.00, 2500.00, 2500.00),
(2, '2024-09-02', 'PUR002', 2, 2, 25, 200.00, 5000.00, 5000.00),
(3, '2024-09-03', 'PUR003', 3, 3, 100, 25.00, 2500.00, 2500.00),
(4, '2024-09-04', 'PUR004', 4, 4, 10, 500.00, 5000.00, 5000.00),
(5, '2024-09-05', 'PUR005', 5, 5, 40, 75.00, 3000.00, 3000.00),
(6, '2024-09-01', 'PUR-STK001-2024-09-14-001', 1, 1, 50, 50.00, 2500.00, 2500.00),
(7, '2024-09-14', 'PUR-STK002-2024-09-14-001', 2, 2, 3, 200.00, 600.00, 600.00),
(8, '2024-09-14', 'PUR-STK002-2024-09-14-002', 2, 2, 2, 200.00, 400.00, 400.00),
(9, '2024-09-14', 'PUR-STK001-2024-09-14-003', 1, 1, 2, 50.00, 100.00, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_date` date NOT NULL,
  `return_id` varchar(255) NOT NULL,
  `return_type` varchar(15) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `return_date`, `return_id`, `return_type`, `invoice_number`, `reason`) VALUES
(1, '2024-09-11', 'RET001', 'Sale', 'SALE001', 'Wrong size delivered'),
(2, '2024-09-12', 'RET002', 'Purchase', 'PUR002', 'Damaged during shipping'),
(3, '2024-09-13', 'RET003', 'Sale', 'SALE003', 'Customer ordered incorrect quantity'),
(4, '2024-09-14', 'RET004', 'Purchase', 'PUR004', 'Quality issues'),
(7, '2024-09-14', 'RTN-704', 'Buy', 'PUR003', 'what'),
(8, '2024-09-17', 'RTN-109', 'Buy', 'PUR-STK001-2024-09-14-001', 'kualitas kurang baik');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` date NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `price_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `invoice_number`, `stock_id`, `customer_id`, `quantity`, `price`, `sub_total`, `price_total`) VALUES
(1, '2024-09-06', 'SALE001', 1, 1, 10, 75.00, 750.00, 750.00),
(2, '2024-09-07', 'SALE002', 2, 2, 5, 300.00, 1500.00, 1500.00),
(3, '2024-09-08', 'SALE003', 3, 3, 20, 40.00, 800.00, 800.00),
(4, '2024-09-09', 'SALE004', 4, 4, 2, 750.00, 1500.00, 1500.00),
(5, '2024-09-10', 'SALE005', 5, 5, 8, 110.00, 880.00, 880.00);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `stock_id`, `category_id`, `quantity`, `purchase_price`, `selling_price`) VALUES
(1, 'STK001', 1, 155, 50000.00, 75000.00),
(2, 'STK002', 5, 70, 200.00, 300.00),
(3, 'STK003', 3, 200, 25.00, 40.00),
(4, 'STK004', 4, 30, 500.00, 750.00),
(5, 'STK005', 5, 80, 75.00, 110.00),
(7, 'STK-167', 1, 9, 900000.00, 1200000.00);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_id`, `supplier_name`, `contact`, `address`, `email`) VALUES
(1, 'SUPP001', 'Global Steel Supply', '555-2468', '246 Forge St, Steel City', 'sales@globalsteel.com'),
(2, 'SUPP002', 'MetalCorp', '555-1357', '135 Alloy Rd, Ingot Town', 'orders@metalcorp.com'),
(3, 'SUPP003', 'Iron Mountain', '555-3690', '369 Mine Dr, Ore City', 'supply@ironmountain.com'),
(4, 'SUPP004', 'Alloy Alliance', '555-1470', '147 Smelt Ave, Foundry City', 'info@alloyalliance.com'),
(5, 'SUPP005', 'Steel Solutions', '555-2580', '258 Rolling Mill Rd, Billet Town', 'contact@steelsolutions.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `name`, `password_hash`, `salt`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', 'Admin User', 'hashed_password_here', 'salt_value_here', '2024-09-14 02:43:56', '2024-09-14 02:43:56'),
(2, 'john_doe', 'john.doe@example.com', 'John Doe', 'hashed_password_here', 'salt_value_here', '2024-09-14 02:43:56', '2024-09-14 02:43:56'),
(3, 'jane_smith', 'jane.smith@example.com', 'Jane Smith', 'hashed_password_here', 'salt_value_here', '2024-09-14 02:43:56', '2024-09-14 02:43:56'),
(4, 'mike_johnson', 'mike.johnson@example.com', 'Mike Johnson', 'hashed_password_here', 'salt_value_here', '2024-09-14 02:43:56', '2024-09-14 02:43:56'),
(5, 'sarah_brown', 'sarah.brown@example.com', 'Sarah Brown', 'hashed_password_here', 'salt_value_here', '2024-09-14 02:43:56', '2024-09-14 02:43:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `purchasing`
--
ALTER TABLE `purchasing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `stock_id` (`stock_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `return_id` (`return_id`),
  ADD KEY `invoice_number` (`invoice_number`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `stock_id` (`stock_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_id` (`stock_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchasing`
--
ALTER TABLE `purchasing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchasing`
--
ALTER TABLE `purchasing`
  ADD CONSTRAINT `purchasing_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`),
  ADD CONSTRAINT `purchasing_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;