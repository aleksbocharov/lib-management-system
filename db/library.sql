-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2016 at 03:33 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `AuthID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(50) NOT NULL,
  `Comments` varchar(150) NOT NULL,
  PRIMARY KEY (`AuthID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AuthID`, `AuthorName`, `Comments`) VALUES
(1, 'Vasily Ivanov', 'Spesialised in Java'),
(2, 'Kevin Tatroe', 'Specialized in PHP'),
(3, 'Benjamin Graham', 'Benjamin Graham (real name Grossbaum) was a British-born American professional investor.'),
(4, 'Raymond A. Serway', 'Raymond A. Serway physisist'),
(5, 'Ron Larson ', ' Ron Larson mathematician');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE IF NOT EXISTS `borrow` (
  `BID` int(11) NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `Comments` varchar(100) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `StaffID` int(11) NOT NULL,
  PRIMARY KEY (`BID`),
  KEY `UserID` (`UserID`,`ItemID`,`StaffID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`BID`, `StartDate`, `DueDate`, `Comments`, `UserID`, `ItemID`, `StaffID`) VALUES
(2, '2015-01-01', '2015-01-15', '', 1, 2, 1),
(32, '2015-01-14', '2015-02-13', '', 1, 1, 1),
(39, '2015-01-14', '2015-02-13', '', 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `branc_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `addres` varchar(255) NOT NULL,
  PRIMARY KEY (`branc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) NOT NULL,
  `LocID` int(11) NOT NULL,
  `ITID` int(11) NOT NULL,
  `PubID` int(11) NOT NULL,
  `AuthID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'available',
  PRIMARY KEY (`ItemID`),
  KEY `LocID` (`LocID`,`ITID`,`PubID`,`AuthID`,`TopicID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `ItemName`, `LocID`, `ITID`, `PubID`, `AuthID`, `TopicID`, `status`) VALUES
(1, 'Introduction to Java', 1, 1, 1, 1, 1, 'borrowed'),
(2, 'Programming PHP', 2, 1, 2, 2, 1, 'borrowed'),
(4, 'The Intelligent Investor', 11, 1, 3, 3, 2, 'borrowed'),
(5, 'College Physics', 55, 1, 1, 4, 3, 'available'),
(6, 'Calculus ', 123, 1, 2, 5, 3, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `ITID` int(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(150) NOT NULL,
  PRIMARY KEY (`ITID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`ITID`, `Name`, `Description`) VALUES
(1, 'Book', 'Printed Text Book'),
(2, 'Journal', 'Journal'),
(3, 'CD', 'Compact Disc with electronic data');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `bloc_num` int(11) NOT NULL,
  `shel_num` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_comt`
--

CREATE TABLE IF NOT EXISTS `order_comt` (
  `oc_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`oc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE IF NOT EXISTS `publisher` (
  `PubID` int(11) NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Descr` varchar(100) NOT NULL,
  PRIMARY KEY (`PubID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`PubID`, `PublisherName`, `Address`, `Descr`) VALUES
(1, 'McGraw-Hill', ' 2 Penn Plaza, 10th Floor. City: New York. State: NY, USA', 'American publicly traded corporation headquartered in New York City'),
(2, 'O''Reilly', 'O''Reilly Media, Sebastopol, CA', 'Open source advocate and publisher of technical and computer book documentation.'),
(3, 'Barnes & Noble', '555 Fifth Avenue, New York, NY 10017', 'the largest retail bookseller in the United States, and the leading retailer of content.');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `RID` int(11) NOT NULL AUTO_INCREMENT,
  `ResDate` date NOT NULL,
  `Comments` varchar(150) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  PRIMARY KEY (`RID`),
  KEY `UserID` (`UserID`,`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `addres` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `st_id` int(11) NOT NULL COMMENT 'FOREIGN',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `position`, `addres`, `phone`, `st_id`) VALUES
(1, 'John Smith', 'Librarian', 'Streeet 1', 1051051, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_type`
--

CREATE TABLE IF NOT EXISTS `staff_type` (
  `stid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `descriptn` varchar(255) NOT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `staff_type`
--

INSERT INTO `staff_type` (`stid`, `name`, `descriptn`) VALUES
(1, 'Librarian', 'Manages Books');

-- --------------------------------------------------------

--
-- Table structure for table `supl_type`
--

CREATE TABLE IF NOT EXISTS `supl_type` (
  `supl_typeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `decriptn` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`supl_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `addres` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `supl_type` varchar(255) NOT NULL,
  PRIMARY KEY (`supl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `TopicID` int(11) NOT NULL AUTO_INCREMENT,
  `TopicName` varchar(50) NOT NULL,
  `Description` varchar(150) NOT NULL,
  PRIMARY KEY (`TopicID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`TopicID`, `TopicName`, `Description`) VALUES
(1, 'Programming', 'Copmuter Programming: Java, PHP, Python etc.'),
(2, 'Finance', 'Finance is a field that deals with the allocation of assets and liabilities over time under conditions of certainty and uncertainty.'),
(3, 'Science', 'Math, Physics, Chemistry etc.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'Active',
  `UTypeID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UTypeID` (`UTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `name`, `password`, `FName`, `LName`, `Phone`, `Status`, `UTypeID`) VALUES
(1, 'alex', 'assa', 'John', 'Doe', '011007007', 'Active', 1),
(2, 'niels', 'assa', 'Niels', 'Bohr', '011107107', 'Active', 2),
(3, '', '', 'Dmitri', 'Mendeleev', '011117117', 'Active', 3),
(4, '', '', 'Test', 'Testovich', '007', 'Active', 3),
(5, '', '', 'Jane', 'Doe', '111', 'Active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `username` (`name`),
  KEY `id_3` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`) VALUES
(1, 'alex', 'assa'),
(2, 'test', 'assa'),
(3, 'johndoe', 'assa');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `UTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `LoanLengthDays` int(11) NOT NULL,
  `PenltyPerDay` int(11) NOT NULL,
  PRIMARY KEY (`UTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`UTypeID`, `Title`, `LoanLengthDays`, `PenltyPerDay`) VALUES
(1, 'Undergraduate Student', 15, 1),
(2, 'Postgraduate Student', 30, 2),
(3, 'Lecturer', 60, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UTypeID`) REFERENCES `user_type` (`UTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
