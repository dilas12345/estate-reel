-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2014 at 09:59 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `php_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_info`
--

CREATE TABLE IF NOT EXISTS `address_info` (
`address_id` int(4) NOT NULL,
  `house_no` varchar(15) DEFAULT NULL,
  `street_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `apartment_no` varchar(10) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `address_info`
--

INSERT INTO `address_info` (`address_id`, `house_no`, `street_name`, `apartment_no`, `city`, `province`, `zip_code`, `country`) VALUES
(1, '6165', 'Sherbrooke W', '-', 'Montreal', 'Quebec', 'H4B 1M1', 'Canada'),
(2, '1212', 'Av. Des Pins Ouest', '-', 'Montreal', 'Quebec', 'H3G 1A9', 'Canada'),
(3, '1800', 'St. Mathieu', '-', 'Montreal', 'Quebec', 'H3H 2S8', 'Canada'),
(4, '4301', 'Rue de la Roche', '-', 'Montreal', 'Quebec', ' H2J 3H8', 'Canada');

-- --------------------------------------------------------

--
-- Table structure for table `apartment_images`
--

CREATE TABLE IF NOT EXISTS `apartment_images` (
`image_id` int(5) NOT NULL,
  `dwelling_Id` int(6) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_size` varchar(200) NOT NULL,
  `file_type` varchar(200) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `apartment_images`
--

INSERT INTO `apartment_images` (`image_id`, `dwelling_Id`, `file_name`, `file_size`, `file_type`) VALUES
(1, 1, '25-11-2014-1751623174-1416942326.jpg', '24298', 'image/jpeg'),
(2, 2, '25-11-2014-2083539209-1416942467.jpg', '15757', 'image/jpeg'),
(3, 3, '25-11-2014-229986368-1416948293.jpg', '11578', 'image/jpeg'),
(4, 4, '25-11-2014-981023916-1416948467.jpg', '16059', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `bannedusers`
--

CREATE TABLE IF NOT EXISTS `bannedusers` (
`banId` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `description` varchar(1028) CHARACTER SET utf8 DEFAULT NULL,
  `from_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `to_` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bannedusers`
--

INSERT INTO `bannedusers` (`banId`, `user_id`, `description`, `from_`, `to_`) VALUES
(1, 3, 'You have disrespected our policies therefore you h', '2014-11-25 20:54:29', '2014-12-26');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE IF NOT EXISTS `conversation` (
`conversationId` int(6) NOT NULL,
  `user_one` int(6) NOT NULL,
  `user_two` int(6) NOT NULL,
  `time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_reply`
--

CREATE TABLE IF NOT EXISTS `conversation_reply` (
`cr_id` int(6) NOT NULL,
  `reply_message` varchar(1000) DEFAULT NULL,
  `time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conversationId` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dwellings`
--

CREATE TABLE IF NOT EXISTS `dwellings` (
`dwelling_Id` int(6) NOT NULL,
  `address_id` int(4) NOT NULL,
  `user_id` int(6) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `no_of_rooms` int(11) DEFAULT NULL,
  `no_of_bathrooms` int(11) DEFAULT NULL,
  `no_of_living_rooms` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rangeType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `dwellings`
--

INSERT INTO `dwellings` (`dwelling_Id`, `address_id`, `user_id`, `type`, `description`, `no_of_rooms`, `no_of_bathrooms`, `no_of_living_rooms`, `price`, `rangeType`) VALUES
(1, 1, 2, 'Apartment', 'Bright, large studios (1 1/2, 2 1/2) for rent in well maintained, quiet building. All dwellings are clean and renovated with hardwood floors. Include hot water, heating, stove, fridge. Laundry room in the building, janitor on the spot. Close to transport and services (metro Vendome and bus 105). Close to Concordia University (Loyola Campus). \r\n\r\nAvailable now, December 1st or January 1st. Price range between $550 and $590 per month. \r\nTo visit call 514-294-5868', 1, 1, 1, 500, 'Rent'),
(2, 2, 2, 'Apartment', 'Large windows frame bright, gorgeous views of Mount Royal and downtown. You?ll feel right at home with an updated kitchen, a renovated bathroom, a balcony and hardwood flooring. Need to get to McGill, Royal Victoria or MGH? Skip transit because they?re all easy walks from La Tour Horizon.\r\n\r\n', 2, 1, 1, 1699, 'Rent'),
(3, 3, 2, 'Apartment', 'includes fridge, stove, oven, washing machine, dryer and a dishwasher; \r\ndoesn''t include electricity \r\n\r\nit''s located on Rene-levesque street and it has a balcony (long one) on the street \r\n\r\n', 1, 1, 1, 1500, 'Rent'),
(4, 4, 2, 'Apartment', 'Super appart 3.5 au coeur du plateau mont royal, entre le Parc Lafontaine et l?avenue Mont Royal \r\n\r\n1 chambre ferm?e \r\n1 grand salon \r\ncuisine ouverte \r\nbalcon \r\nbeaucoup de rangements \r\nparquet \r\ntr?s lumineux \r\nlaundry room et garage ? v?lo dans l?immeuble \r\n\r\nLe loyer comprend les charges \r\nCession de bail \r\nLibre ? partir du 22 d?cembre \r\n\r\ncommerces et restaurants ? 3 minutes ? pied \r\npr?s du m?tro Mont-Royal \r\nlignes de bus 11 et 14 au pied de l?immeuble \r\n\r\nJe rentre en Californie le 22 d?cembre, la fin du mois de d?cembre est gratuite. \r\n\r\nIdeal pour les nouveaux arrivants ? Montr?al: je pr?f?rerais laisser les meubles (table, canap?, lit, bureau, diff?rents meubles ikea achet?s neufs il y a un peu plus d?un an, tous en parfait ?tat) faites moi une offre, et il ne vous restera plus qu?a poser vos valises! ', 2, 3, 2, 390000, 'Sale');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(6) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `rangeType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `phoneNumber`, `username`, `password`, `salt`, `type`, `rangeType`) VALUES
(1, 'Ajmer', 'Singh', 'Ajmer@ajmer.ca', '438 323 2343', 'ajmer', '45FIRt6yMSMKE', '45fee2b5f36b86015a2ab9564e765aa0b582f7c66a74c54c4b153128048bc888', 'Tenant', 'Regular'),
(2, 'Fabian', 'Vergara', 'hg-faver@hotmail.com', '222 324 2344', 'faver', 'd3yTTT.8w5.oo', 'd341cc51ea668a4bd7475905756b864efca1138c6d3e32a0ce0c0357d0f7acc3', 'Landlord', 'Admin'),
(3, 'Camilo', 'Vides', 'Camilo@yahoo.ca', '514 233 3421', 'camilo', '1clHbzjXlIRxY', '1ca5f21a442fb85c95de9bfffcaa38851341959ea1dfd38ff9b852aaa630104f', 'Tenant', 'Regular');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_info`
--
ALTER TABLE `address_info`
 ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `apartment_images`
--
ALTER TABLE `apartment_images`
 ADD PRIMARY KEY (`image_id`), ADD KEY `dwelling_Id` (`dwelling_Id`);

--
-- Indexes for table `bannedusers`
--
ALTER TABLE `bannedusers`
 ADD PRIMARY KEY (`banId`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
 ADD PRIMARY KEY (`conversationId`), ADD KEY `user_one` (`user_one`), ADD KEY `user_two` (`user_two`);

--
-- Indexes for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
 ADD PRIMARY KEY (`cr_id`), ADD KEY `conversationId` (`conversationId`);

--
-- Indexes for table `dwellings`
--
ALTER TABLE `dwellings`
 ADD PRIMARY KEY (`dwelling_Id`), ADD KEY `user_id` (`user_id`), ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_info`
--
ALTER TABLE `address_info`
MODIFY `address_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `apartment_images`
--
ALTER TABLE `apartment_images`
MODIFY `image_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bannedusers`
--
ALTER TABLE `bannedusers`
MODIFY `banId` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
MODIFY `conversationId` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
MODIFY `cr_id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dwellings`
--
ALTER TABLE `dwellings`
MODIFY `dwelling_Id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartment_images`
--
ALTER TABLE `apartment_images`
ADD CONSTRAINT `apartment_images_ibfk_1` FOREIGN KEY (`dwelling_Id`) REFERENCES `dwellings` (`dwelling_Id`);

--
-- Constraints for table `bannedusers`
--
ALTER TABLE `bannedusers`
ADD CONSTRAINT `bannedusers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
ADD CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`user_one`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`user_two`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
ADD CONSTRAINT `conversation_reply_ibfk_1` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`conversationId`);

--
-- Constraints for table `dwellings`
--
ALTER TABLE `dwellings`
ADD CONSTRAINT `dwellings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `dwellings_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address_info` (`address_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;