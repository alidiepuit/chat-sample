-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 172.17.0.3
-- Generation Time: Apr 09, 2018 at 03:10 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admaf_bsb`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_ads`
--

CREATE TABLE `class_ads` (
  `id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(3) NOT NULL,
  `package_id` int(2) NOT NULL,
  `usr_pkg` int(10) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `price` double DEFAULT '-1',
  `currency` varchar(10) DEFAULT NULL,
  `meta_description` varchar(256) DEFAULT NULL,
  `meta_keywords` varchar(256) DEFAULT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT '0',
  `rented` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(10) NOT NULL DEFAULT '0',
  `user_approved` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `highlited` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(1) NOT NULL DEFAULT '0',
  `video` text,
  `rating` double(4,2) NOT NULL DEFAULT '0.00',
  `language` varchar(30) NOT NULL DEFAULT 'eng',
  `unique_id` varchar(30) DEFAULT NULL,
  `auction` int(1) DEFAULT '0',
  `make` varchar(64) DEFAULT NULL,
  `rv_make` varchar(64) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `model1` varchar(64) DEFAULT NULL,
  `bodystyle` varchar(64) DEFAULT NULL,
  `transmission` varchar(64) DEFAULT NULL,
  `fuel` varchar(64) DEFAULT NULL,
  `doors` int(2) DEFAULT NULL,
  `color` varchar(64) DEFAULT NULL,
  `condition_vehicles` varchar(64) DEFAULT NULL,
  `vehicle_options` text,
  `rv_features` text,
  `property_type` varchar(64) DEFAULT NULL,
  `bathrooms` int(2) DEFAULT NULL,
  `year_built` int(4) DEFAULT NULL,
  `estate_condition` varchar(64) DEFAULT NULL,
  `amenities` text,
  `community_amenities` text,
  `city` varchar(128) DEFAULT NULL,
  `location1` varchar(64) DEFAULT NULL,
  `location2` varchar(255) DEFAULT NULL,
  `warranty` varchar(128) DEFAULT NULL,
  `specs` varchar(128) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `kilometers` varchar(128) DEFAULT NULL,
  `year` varchar(128) DEFAULT NULL,
  `model2` varchar(128) DEFAULT NULL,
  `post_type` varchar(128) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL,
  `engine_cc` varchar(128) DEFAULT NULL,
  `rims_wheel_size` varchar(128) DEFAULT NULL,
  `mobel` varchar(128) DEFAULT NULL,
  `model3` varchar(128) DEFAULT NULL,
  `salt_neighbourhood` varchar(128) DEFAULT NULL,
  `amman_neighbourhood` varchar(128) DEFAULT NULL,
  `irbid_neighbourhood` varchar(128) DEFAULT NULL,
  `zarqa_neighbourhood` varchar(128) DEFAULT NULL,
  `mafraq_neighbourhood` varchar(128) DEFAULT NULL,
  `madaba_neighbourhood` varchar(128) DEFAULT NULL,
  `aqaba_neighbourhood` varchar(128) DEFAULT NULL,
  `jerach_neighbourhood` varchar(128) DEFAULT NULL,
  `al_karak_neighbourhood` varchar(128) DEFAULT NULL,
  `ajloun_neighbourhood` varchar(128) DEFAULT NULL,
  `maan_neighbourhood` varchar(128) DEFAULT NULL,
  `ramtha_neighbourhood` varchar(128) DEFAULT NULL,
  `tafilah_neighbourhood` varchar(128) DEFAULT NULL,
  `number_or_rooms` varchar(128) DEFAULT NULL,
  `number_of_bathroom` varchar(128) DEFAULT NULL,
  `floor` varchar(128) DEFAULT NULL,
  `age_of_building` varchar(128) DEFAULT NULL,
  `surface_area` varchar(255) DEFAULT NULL,
  `furnished` varchar(128) DEFAULT NULL,
  `amenities1` text,
  `city1` varchar(100) DEFAULT NULL,
  `neighbourhood` varchar(100) DEFAULT NULL,
  `rental_period` varchar(128) DEFAULT NULL,
  `surface_area1` varchar(255) DEFAULT NULL,
  `land_area` varchar(255) DEFAULT NULL,
  `number_of_floors` varchar(128) DEFAULT NULL,
  `type1` varchar(128) DEFAULT NULL,
  `zoned_for` varchar(128) DEFAULT NULL,
  `maker` varchar(100) DEFAULT NULL,
  `model4` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model5` varchar(100) DEFAULT NULL,
  `condition` varchar(128) DEFAULT NULL,
  `brand1` varchar(100) DEFAULT NULL,
  `model6` varchar(100) DEFAULT NULL,
  `brand2` varchar(128) DEFAULT NULL,
  `processor_speed` varchar(128) DEFAULT NULL,
  `memory_ram` varchar(128) DEFAULT NULL,
  `hard_drive` varchar(128) DEFAULT NULL,
  `screen_size` varchar(128) DEFAULT NULL,
  `mobel1` varchar(128) DEFAULT NULL,
  `accessory_type` varchar(128) DEFAULT NULL,
  `user_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class_ads`
--

INSERT INTO `class_ads` (`id`, `user_id`, `category_id`, `package_id`, `usr_pkg`, `date_added`, `date_expires`, `title`, `description`, `price`, `currency`, `meta_description`, `meta_keywords`, `sold`, `rented`, `viewed`, `user_approved`, `active`, `pending`, `featured`, `highlited`, `priority`, `video`, `rating`, `language`, `unique_id`, `auction`, `make`, `rv_make`, `model`, `model1`, `bodystyle`, `transmission`, `fuel`, `doors`, `color`, `condition_vehicles`, `vehicle_options`, `rv_features`, `property_type`, `bathrooms`, `year_built`, `estate_condition`, `amenities`, `community_amenities`, `city`, `location1`, `location2`, `warranty`, `specs`, `lat`, `lng`, `kilometers`, `year`, `model2`, `post_type`, `payment_method`, `engine_cc`, `rims_wheel_size`, `mobel`, `model3`, `salt_neighbourhood`, `amman_neighbourhood`, `irbid_neighbourhood`, `zarqa_neighbourhood`, `mafraq_neighbourhood`, `madaba_neighbourhood`, `aqaba_neighbourhood`, `jerach_neighbourhood`, `al_karak_neighbourhood`, `ajloun_neighbourhood`, `maan_neighbourhood`, `ramtha_neighbourhood`, `tafilah_neighbourhood`, `number_or_rooms`, `number_of_bathroom`, `floor`, `age_of_building`, `surface_area`, `furnished`, `amenities1`, `city1`, `neighbourhood`, `rental_period`, `surface_area1`, `land_area`, `number_of_floors`, `type1`, `zoned_for`, `maker`, `model4`, `brand`, `model5`, `condition`, `brand1`, `model6`, `brand2`, `processor_speed`, `memory_ram`, `hard_drive`, `screen_size`, `mobel1`, `accessory_type`, `user_category_id`) VALUES
(26, 1, 8, 1, 16, '2018-02-20 11:47:08', '2018-03-22 11:47:08', 'BMW e90 For sale', 'BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale', 12000, 'JD', '', '', 0, 0, 64, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'BMW', NULL, '325', NULL, 'Saloon', 'Automatic', 'Petrol', 4, 'Blue', 'New', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', '31.9453666,35.92837159999999,5', 'amman', 'No', 'GCC', 31.9453666, 35.92837159999999, '10,000 - 19,999', '2016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1, 8, 1, 17, '2018-02-21 06:04:55', '2018-03-23 06:04:55', 'SL63 2009 AMG CONVERTIBLE', 'MERCEDES SL63 AMG CONVERTIBLE\r\n2009 MODEL\r\n6.3L V8\r\n\r\nGULF SPECS GCC CAR\r\nFULL SERVICE HISTORY\r\nBLACK EXTERIOR WITH LEATHER INTERIOR\r\nFULLY WRAPPED WITH 3M FILM MATTE GREY\r\nKEYLESS ENTRY', 119000, 'JD', '', '', 0, 0, 5, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Mercedes-Benz', NULL, 'SL 63 AMG', NULL, 'Convertible', 'Automatic', 'Petrol', 2, 'Silver', 'Used', 'Safety Belt Pretensioners|Safety Belt Pretensioners|Alloy Wheels|Tuning|Climate Control|Leather Seats|Power Locks|Sunroof|Cassette Player', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Irbid', NULL, NULL, 'No', 'GCC', 0, 0, '30,000 - 39,999', '2009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1, 8, 1, 18, '2018-02-21 06:12:04', '2018-03-23 06:12:04', 'Mercedes SL500', 'Selling Mercedes SL500 R129 from 1997. 5 speed automatic gearbox. Perfectly working soft top and hardtop.\r\nHave all the receipts since when the car was in Dubai (Japan imported). Excellent condition. 18 inch wheel AMG Monoblocks.\r\nNo silly offers. Only serious buyers.', 65000, 'JD', '', '', 0, 0, 4, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Mercedes-Benz', NULL, 'SL 500', NULL, 'Convertible', 'Automatic', 'Petrol', 2, 'Silver', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', '31.9453666,35.92837159999999,5', 'amman', 'No', 'GCC', 31.9453666, 35.92837159999999, '60,000 - 69,999', '2008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(29, 1, 8, 1, 19, '2018-02-21 06:58:43', '2018-03-23 06:58:43', 'VW GTI Golf - Lady Owner - Great Condition', 'Selling my VW GTI which I\'ve owned for the past 3 years. Previously bought from another lady driver and have had it regularly serviced every 10,000km. I recently got a punture so replaced the front two tyres / the back tyres are still in perfect condition. I work as a teacher so wont be able to show the car until after 4pm during the week.', 1111, 'JD', '', '', 0, 0, 213, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Volkswagen', NULL, 'Golf', NULL, 'Coupe', 'Automatic', 'Petrol', 2, 'Red', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', '31.1853497,35.70477329999994,5', NULL, 'Yes', NULL, 31.1853497, 35.70477329999994, '30,000 - 39,999', '2014', NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Al Karak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26),
(30, 1, 8, 1, 20, '2018-02-21 11:02:52', '2018-03-23 11:02:52', 'Nissan Armada', 'Nissan Armada 2011 LE\r\nFull Option\r\nBrown espresso exterior\r\nBeige leather interior\r\n8 cylinders\r\n184000km\r\nFirst Owner', 20000, 'JD', '', '', 0, 0, 6, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Nissan', NULL, 'Armada', NULL, '4x4', 'Automatic', 'Petrol', 5, 'Black', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', '31.9453666,35.92837159999999,5', 'abdoun', 'Yes', NULL, 31.9453666, 35.92837159999999, '50,000 - 59,999', '2011', NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(31, 1, 16, 1, 21, '2018-02-24 11:48:47', '2018-03-26 11:48:47', '3 BEDROOM FOR SALE', '3 BEDROOM FOR SALE 3 BEDROOM FOR SALE 3 BEDROOM FOR SALE 3 BEDROOM FOR SALE 3 BEDROOM FOR SALE', 11212121, 'JD', '', '', 0, 0, 2, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 1, 8, 1, 22, '2018-02-28 09:18:22', '2018-03-30 09:18:22', 'Bmw e90 Test Car', 'Bmw e90 Test Car Bmw e90 Test Car Bmw e90 Test Car Bmw e90 Test Car Bmw e90 Test Car Bmw e90 Test CarBmw e90 Test Car Bmw e90 Test Car', 12000, 'JD', '', '', 0, 0, 21, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'BMW', NULL, '320', NULL, 'Sedan', 'Automatic', 'Gasoline', 2, 'Silver', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '31.9453666,35.92837159999999,5', 'amman', 'Yes', 'Germany', 31.9453666, 35.92837159999999, '60,000 - 69,999', '2013', NULL, 'Offering', 'Cash Only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', 'Al Gardens', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(42, 5, 8, 1, 32, '2018-03-10 12:00:42', '2018-04-09 12:00:42', 'test', 'test', -1, 'JD', '', '', 0, 0, 20, 1, 1, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Acura', NULL, 'MDX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 1, 8, 1, 1, '2018-03-16 16:10:30', '2018-04-15 16:10:30', 'Nice car', 'Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car Nice car', 18000, 'JD', '', '', 0, 0, 5, 1, 1, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Alpina', NULL, 'B10', NULL, 'Coupe', 'Automatic', 'Diesel', 4, 'Grey', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', 'India', 0, 0, '20,000 - 29,999', '2013', NULL, 'Offering', 'Cash Only', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(44, 1, 8, 1, 2, '2018-03-18 04:18:38', '2018-04-17 04:18:38', '123', '123', -1, 'JD', '', '', 0, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Abarth', NULL, '500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ajloun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 1, 8, 1, 3, '2018-03-18 05:33:39', '2018-04-17 05:33:39', 'test', 'test', -1, 'JD', '', '', 0, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Aixam', NULL, 'Crossline', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Al Karak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 1, 8, 1, 4, '2018-03-18 05:45:46', '2018-04-17 05:45:46', '123', '123', -1, 'JD', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Alfa Romeo', NULL, 'Alfa 147', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ajloun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 1, 8, 1, 5, '2018-03-18 06:03:18', '2018-04-17 06:03:18', 'tst', 'tsdf', -1, 'JD', '', '', 0, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Alfa Romeo', NULL, 'Alfa 145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aqaba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 1, 8, 1, 6, '2018-03-18 06:08:32', '2018-04-17 06:08:32', 'final', 'fadf', -1, 'JD', '', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Aixam', NULL, 'Scouty R', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 'For Sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aqaba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_ads`
--
ALTER TABLE `class_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_package` (`package_id`),
  ADD KEY `idx_price` (`price`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_viewed` (`viewed`),
  ADD KEY `date_added` (`date_added`),
  ADD KEY `date_expires` (`date_expires`),
  ADD KEY `idx_featured` (`featured`),
  ADD KEY `idx_active` (`active`),
  ADD KEY `idx_pending` (`pending`),
  ADD KEY `idx_highlited` (`highlited`),
  ADD KEY `idx_priority` (`priority`),
  ADD KEY `idx_sold` (`sold`),
  ADD KEY `idx_rented` (`rented`),
  ADD KEY `usr_pkg` (`usr_pkg`),
  ADD KEY `priority_2` (`priority`,`date_added`),
  ADD KEY `active_2` (`active`,`date_added`),
  ADD KEY `active_3` (`active`,`priority`),
  ADD KEY `active_4` (`active`,`priority`,`date_added`),
  ADD KEY `user_approved` (`user_approved`),
  ADD KEY `app` (`active`,`priority`,`price`),
  ADD KEY `priority_3` (`priority`,`price`),
  ADD KEY `priority_4` (`priority`,`title`),
  ADD KEY `lat` (`lat`),
  ADD KEY `lng` (`lng`),
  ADD KEY `city1` (`city1`),
  ADD KEY `neighbourhood` (`neighbourhood`),
  ADD KEY `maker` (`maker`),
  ADD KEY `model4` (`model4`),
  ADD KEY `brand` (`brand`),
  ADD KEY `model5` (`model5`),
  ADD KEY `brand1` (`brand1`),
  ADD KEY `model6` (`model6`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_ads`
--
ALTER TABLE `class_ads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
