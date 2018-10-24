-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2018 at 08:52 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watsup_chat_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `board_member`
--

CREATE TABLE `board_member` (
  `br_id` int(5) UNSIGNED NOT NULL,
  `u_id` int(5) UNSIGNED NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `board_message`
--

CREATE TABLE `board_message` (
  `br_id` int(5) UNSIGNED NOT NULL,
  `mg_id` int(5) UNSIGNED NOT NULL,
  `us_id` int(5) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `board_message`
--

INSERT INTO `board_message` (`br_id`, `mg_id`, `us_id`, `date`) VALUES
(1, 1, 10001, '2018-10-05 00:26:35'),
(0, 11, 10000, '2018-10-14 04:43:46'),
(0, 12, 10000, '2018-10-19 12:12:02'),
(0, 13, 10000, '2018-10-19 12:12:10'),
(0, 14, 10000, '2018-10-19 12:12:13'),
(0, 15, 10000, '2018-10-19 12:12:18'),
(0, 16, 10000, '2018-10-19 12:12:19'),
(0, 17, 10000, '2018-10-19 12:12:19'),
(0, 18, 10000, '2018-10-19 12:12:20'),
(0, 19, 10000, '2018-10-19 12:12:20'),
(0, 20, 10000, '2018-10-19 12:12:20'),
(0, 21, 10000, '2018-10-19 12:13:52'),
(0, 22, 10000, '2018-10-19 12:13:56'),
(0, 23, 10000, '2018-10-19 12:13:56'),
(0, 24, 10000, '2018-10-19 12:13:57'),
(0, 25, 10000, '2018-10-19 12:13:58'),
(0, 26, 10000, '2018-10-19 12:14:02'),
(0, 27, 10000, '2018-10-19 12:14:14'),
(0, 28, 10000, '2018-10-19 12:14:16'),
(0, 29, 10000, '2018-10-19 12:34:36'),
(0, 30, 10000, '2018-10-19 12:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `group_member_activity`
--

CREATE TABLE `group_member_activity` (
  `br_id` int(5) UNSIGNED NOT NULL,
  `joiner_id` int(5) UNSIGNED NOT NULL,
  `joinee_id` int(5) UNSIGNED NOT NULL,
  `activity` enum('+','-') NOT NULL DEFAULT '+',
  `actvty_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `mg_id` int(5) UNSIGNED NOT NULL,
  `sender_id` int(5) UNSIGNED NOT NULL,
  `gr_id` int(5) UNSIGNED NOT NULL,
  `thread` varchar(250) NOT NULL,
  `read_status` tinyint(1) NOT NULL,
  `m_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`mg_id`, `sender_id`, `gr_id`, `thread`, `read_status`, `m_date`) VALUES
(1, 10000, 0, 'Hi', 0, '2018-10-03 19:09:00'),
(2, 10001, 0, 'ffhdf', 0, '2018-10-09 18:44:55'),
(3, 10001, 0, 'SASASAS', 0, '2018-10-09 18:46:05'),
(4, 10001, 0, 'sd', 0, '2018-10-09 18:46:07'),
(5, 10001, 0, 'sd', 0, '2018-10-09 18:46:09'),
(6, 10001, 0, ' dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv dvv', 0, '2018-10-09 18:46:25'),
(7, 10001, 0, 'undefined', 0, '2018-10-13 22:15:12'),
(8, 10001, 0, 'undefined', 0, '2018-10-13 22:52:21'),
(9, 10001, 0, 'Mani', 0, '2018-10-13 22:53:58'),
(10, 10001, 0, 'Sanchu', 0, '2018-10-13 23:12:11'),
(11, 10001, 0, 'Manju', 0, '2018-10-13 23:13:46'),
(12, 10001, 0, '6- ', 0, '2018-10-19 06:42:02'),
(13, 10001, 0, 'fyj', 0, '2018-10-19 06:42:10'),
(14, 10001, 0, 'gjkghj', 0, '2018-10-19 06:42:13'),
(15, 10001, 0, 'ghfgh', 0, '2018-10-19 06:42:18'),
(16, 10001, 0, 'ghgfh', 0, '2018-10-19 06:42:19'),
(17, 10001, 0, 'hfg', 0, '2018-10-19 06:42:19'),
(18, 10001, 0, 'fdgh', 0, '2018-10-19 06:42:20'),
(19, 10001, 0, 'h', 0, '2018-10-19 06:42:20'),
(20, 10001, 0, 'gh', 0, '2018-10-19 06:42:20'),
(21, 10001, 0, 'g', 0, '2018-10-19 06:43:52'),
(22, 10001, 0, 'hgh', 0, '2018-10-19 06:43:56'),
(23, 10001, 0, '', 0, '2018-10-19 06:43:56'),
(24, 10001, 0, '', 0, '2018-10-19 06:43:57'),
(25, 10001, 0, '', 0, '2018-10-19 06:43:58'),
(26, 10001, 0, '', 0, '2018-10-19 06:44:01'),
(27, 10001, 0, 'yteyhtr', 0, '2018-10-19 06:44:14'),
(28, 10001, 0, 'hgh', 0, '2018-10-19 06:44:16'),
(29, 10001, 0, 'Hi', 0, '2018-10-19 07:04:36'),
(30, 10001, 0, 'sdajbj', 0, '2018-10-19 07:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(5) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(25) NOT NULL,
  `mob` varchar(10) NOT NULL,
  `profile_char` varchar(4) NOT NULL DEFAULT 'ME'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `name`, `date`, `email`, `mob`, `profile_char`) VALUES
(10000, 'Sajay C P', '2018-10-02 16:24:28', 'sajaycp@gmail.com', '9449378688', 'ME'),
(10001, 'Sanju', '2018-10-02 16:24:28', 'sanju@gmail.com', '6658745698', 'ME');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mg_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `mg_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10002;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
