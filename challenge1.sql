-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 172.17.0.3
-- Generation Time: Apr 09, 2018 at 03:07 PM
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
-- Table structure for table `chatbox_block`
--

CREATE TABLE `chatbox_block` (
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chatbox_contact`
--

CREATE TABLE `chatbox_contact` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ads_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen_at` datetime DEFAULT NULL,
  `ads_title` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chatbox_contact`
--

INSERT INTO `chatbox_contact` (`id`, `user_id`, `ads_id`, `contact_id`, `message`, `create_at`, `seen_at`, `ads_title`) VALUES
(1, 5, 10, 1, 'adf', '2018-02-08 12:12:17', '2018-02-08 12:14:44', 'Test ads for contents'),
(2, 3, 12, 1, 'you can chat now', '2018-02-08 12:12:52', '2018-02-08 12:20:19', 'Rent apartment'),
(3, 5, 10, 1, 'hello', '2018-02-08 12:13:18', '2018-02-08 12:14:44', 'Test ads for contents'),
(4, 5, 10, 1, 'you see my chat?', '2018-02-08 12:13:23', '2018-02-08 12:14:44', 'Test ads for contents'),
(5, 1, 10, 5, 'yes', '2018-02-08 12:14:48', '2018-02-08 12:14:56', 'Test ads for contents'),
(6, 5, 10, 1, 'ok', '2018-02-08 12:14:58', '2018-02-08 12:15:12', 'Test ads for contents'),
(7, 5, 10, 1, 'you can go any where', '2018-02-08 12:15:03', '2018-02-08 12:15:12', 'Test ads for contents'),
(8, 1, 10, 5, 'if i close ur window', '2018-02-08 12:15:21', '2018-02-08 12:15:33', 'Test ads for contents'),
(9, 1, 10, 5, 'how i will open it again', '2018-02-08 12:15:31', '2018-02-08 12:15:33', 'Test ads for contents'),
(10, 5, 10, 1, 'yeah', '2018-02-08 12:15:50', '2018-02-08 12:16:05', 'Test ads for contents'),
(11, 5, 10, 1, 'phase 3 will make the page chat', '2018-02-08 12:15:58', '2018-02-08 12:16:05', 'Test ads for contents'),
(12, 5, 10, 1, 'will list all history of user', '2018-02-08 12:16:06', '2018-02-08 12:16:16', 'Test ads for contents'),
(13, 1, 10, 5, 'is there a code for status ', '2018-02-08 12:16:27', '2018-02-08 12:17:43', 'Test ads for contents'),
(14, 1, 10, 5, 'if the user online or offline ', '2018-02-08 12:16:34', '2018-02-08 12:17:43', 'Test ads for contents'),
(15, 5, 10, 1, 'you can try offline', '2018-02-08 12:16:56', '2018-02-08 12:17:03', 'Test ads for contents'),
(16, 5, 10, 1, 'i will chat something', '2018-02-08 12:16:59', '2018-02-08 12:17:03', 'Test ads for contents'),
(17, 5, 10, 1, 'then you go to web again', '2018-02-08 12:17:09', '2018-02-08 12:18:35', 'Test ads for contents'),
(18, 1, 10, 5, 'of i will sign out', '2018-02-08 12:17:11', '2018-02-08 12:17:43', 'Test ads for contents'),
(19, 5, 10, 1, 'yeah', '2018-02-08 12:17:17', '2018-02-08 12:18:35', 'Test ads for contents'),
(20, 5, 10, 1, 'right', '2018-02-08 12:17:18', '2018-02-08 12:18:35', 'Test ads for contents'),
(21, 5, 10, 1, '1', '2018-02-08 12:17:44', '2018-02-08 12:18:35', 'Test ads for contents'),
(22, 5, 10, 1, '2', '2018-02-08 12:17:45', '2018-02-08 12:18:35', 'Test ads for contents'),
(23, 5, 10, 1, '3', '2018-02-08 12:17:46', '2018-02-08 12:18:35', 'Test ads for contents'),
(24, 5, 10, 1, '4', '2018-02-08 12:17:46', '2018-02-08 12:18:35', 'Test ads for contents'),
(25, 1, 10, 5, 'yah i can see it ', '2018-02-08 12:18:44', '2018-02-08 12:19:01', 'Test ads for contents'),
(26, 1, 10, 5, 'but the history only for the last few lines ? ', '2018-02-08 12:18:58', '2018-02-08 12:19:01', 'Test ads for contents'),
(27, 5, 10, 1, 'yup', '2018-02-08 12:19:04', '2018-02-08 12:19:11', 'Test ads for contents'),
(28, 5, 10, 1, 'for now', '2018-02-08 12:19:06', '2018-02-08 12:19:11', 'Test ads for contents'),
(29, 5, 10, 1, 'i will get all later', '2018-02-08 12:19:12', '2018-02-08 12:19:48', 'Test ads for contents'),
(30, 5, 10, 1, 'for phase 3', '2018-02-08 12:19:16', '2018-02-08 12:19:48', 'Test ads for contents'),
(31, 1, 10, 5, 'and its only ur chat not mine ', '2018-02-08 12:19:18', '2018-02-09 09:29:57', 'Test ads for contents'),
(32, 5, 10, 1, 'ah ok', '2018-02-08 12:19:38', '2018-02-08 12:19:48', 'Test ads for contents'),
(33, 5, 10, 1, 'i will fix that', '2018-02-08 12:19:46', '2018-02-08 12:19:48', 'Test ads for contents'),
(34, 1, 10, 5, 'thats very good', '2018-02-08 12:20:02', '2018-02-09 09:29:57', 'Test ads for contents'),
(35, 5, 10, 1, 'a', '2018-02-09 09:30:49', '2018-02-09 09:42:59', 'Test ads for contents'),
(36, 3, 9, 1, 'test', '2018-02-09 09:38:55', '2018-02-09 14:45:03', '3 BEDROOM FOR SALE IN ALKHOR TOWERS'),
(37, 3, 7, 1, 'kkkk', '2018-02-09 14:41:24', '2018-02-09 14:42:17', 'Bmw e90 Test Car'),
(38, 3, 7, 1, '7p;;p;4', '2018-02-09 14:42:06', '2018-02-09 14:42:17', 'Bmw e90 Test Car'),
(39, 3, 7, 1, 'kkkk', '2018-02-09 14:44:46', '2018-02-09 14:44:49', 'Bmw e90 Test Car'),
(41, 4, 10, 1, 'fgfgfgfg', '2018-02-10 09:16:53', '2018-02-10 09:22:06', 'Test ads for contents'),
(42, 1, 10, 4, 'gfdgdfg', '2018-02-10 09:22:11', '2018-02-10 09:22:18', 'Test ads for contents'),
(43, 1, 12, 3, 'ghfghfgh', '2018-02-10 09:22:34', '2018-02-10 11:19:50', 'Rent apartment'),
(44, 5, 10, 1, 'hello', '2018-02-10 10:43:54', '2018-02-10 11:08:03', 'Test ads for contents'),
(45, 5, 7, 1, 'hi', '2018-02-10 10:57:45', '2018-02-10 11:08:02', 'Bmw e90 Test Car'),
(46, 5, 7, 1, 'dfa', '2018-02-10 10:58:13', '2018-02-10 11:08:02', 'Bmw e90 Test Car'),
(47, 3, 7, 1, '&lt;script&gt;alert(1)&lt;/script&gt;', '2018-02-10 11:20:28', '2018-02-10 11:27:13', 'Bmw e90 Test Car'),
(48, 3, 7, 1, '389rhh uhf; she;lshf sl;fjsj;fwhfoph3rhi23ho hophowehf;kwelnf;l ', '2018-02-10 11:20:47', '2018-02-10 11:27:13', 'Bmw e90 Test Car'),
(49, 1, 7, 5, 'hello', '2018-02-10 11:27:47', '2018-02-10 11:27:51', 'Bmw e90 Test Car'),
(50, 5, 7, 1, 'hi', '2018-02-10 11:27:52', '2018-02-11 00:05:00', 'Bmw e90 Test Car'),
(51, 4, 10, 1, 'rrtrtrtr', '2018-02-10 11:44:56', '2018-02-10 11:54:11', 'Test ads for contents'),
(52, 1, 10, 4, 'sadsadas', '2018-02-10 23:57:52', NULL, 'Test ads for contents'),
(53, 5, 7, 1, 'hello', '2018-02-11 03:39:01', '2018-02-11 03:40:08', 'Bmw e90 Test Car'),
(54, 1, 7, 5, 'sdd', '2018-02-11 03:42:02', '2018-02-12 21:04:29', 'Bmw e90 Test Car'),
(56, 1, 10, 4, 'sf', '2018-02-12 09:04:01', NULL, 'Test ads for contents'),
(57, 7, 10, 1, 'hehe', '2018-02-12 09:22:31', '2018-02-12 09:22:48', 'Test ads for contents'),
(58, 1, 12, 3, 'df', '2018-02-12 09:28:14', '2018-02-12 11:34:28', 'Rent apartment'),
(59, 7, 10, 1, 'helo adnan', '2018-02-12 09:28:41', '2018-02-12 11:34:18', 'Test ads for contents'),
(60, 7, 10, 1, 'hhaa', '2018-02-12 09:28:58', '2018-02-12 11:34:18', 'Test ads for contents'),
(62, 3, 12, 1, 'holla', '2018-02-12 11:34:31', '2018-02-12 11:35:45', 'Rent apartment'),
(64, 3, 12, 1, 'vhjhjghj', '2018-02-12 11:35:31', '2018-02-12 11:35:45', 'Rent apartment'),
(65, 1, 12, 3, 'kg', '2018-02-12 11:35:46', '2018-02-12 11:35:52', 'Rent apartment'),
(66, 1, 12, 3, 'hello', '2018-02-12 11:36:28', '2018-02-12 11:36:43', 'Rent apartment'),
(67, 1, 10, 7, 'trryrty', '2018-02-12 23:28:44', NULL, 'Test ads for contents'),
(68, 5, 7, 1, 'hello', '2018-02-13 00:09:28', '2018-02-13 00:10:48', 'Bmw e90 Test Car'),
(69, 5, 7, 1, 'adf', '2018-02-13 00:19:12', '2018-02-13 00:20:05', 'Bmw e90 Test Car'),
(70, 5, 10, 1, 'now', '2018-02-13 00:40:44', '2018-02-13 05:24:01', 'Test ads for contents'),
(71, 5, 10, 1, 'hello', '2018-02-13 00:41:08', '2018-02-13 05:24:01', 'Test ads for contents'),
(73, 1, 7, 3, 'hi', '2018-02-14 01:41:55', '2018-02-14 03:07:06', 'Bmw e90 Test Car'),
(74, 1, 7, 3, 'hgjghj', '2018-02-14 01:42:01', '2018-02-14 03:07:06', 'Bmw e90 Test Car'),
(75, 3, 7, 1, 'hello', '2018-02-14 03:07:08', '2018-02-14 03:07:10', 'Bmw e90 Test Car'),
(76, 3, 7, 1, 'adnan?', '2018-02-14 03:07:11', '2018-02-14 03:07:57', 'Bmw e90 Test Car'),
(77, 1, 7, 3, 'hala', '2018-02-14 03:07:13', '2018-02-14 03:08:10', 'Bmw e90 Test Car'),
(78, 3, 7, 1, 'kefak', '2018-02-14 03:07:18', '2018-02-14 03:07:57', 'Bmw e90 Test Car'),
(79, 1, 7, 3, '??? ', '2018-02-14 03:07:21', '2018-02-14 03:08:10', 'Bmw e90 Test Car'),
(80, 1, 7, 3, '??? ?????', '2018-02-14 03:07:33', '2018-02-14 03:08:10', 'Bmw e90 Test Car'),
(81, 3, 7, 1, 'facebook', '2018-02-14 03:07:54', '2018-02-14 03:07:57', 'Bmw e90 Test Car'),
(82, 1, 7, 3, '????????', '2018-02-14 03:08:00', '2018-02-14 03:08:10', 'Bmw e90 Test Car'),
(83, 1, 7, 3, '????', '2018-02-14 03:08:03', '2018-02-14 03:08:10', 'Bmw e90 Test Car'),
(84, 3, 7, 1, 'a7la orange', '2018-02-14 03:08:14', '2018-02-14 03:08:20', 'Bmw e90 Test Car'),
(85, 1, 7, 3, 'firefox orange :D', '2018-02-14 03:08:28', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(86, 1, 7, 3, 'i think i need to add icons ', '2018-02-14 03:08:37', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(87, 1, 7, 3, 'smiles ', '2018-02-14 03:08:40', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(88, 1, 7, 3, 'or no need ', '2018-02-14 03:08:46', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(89, 3, 7, 1, 'if we can why not', '2018-02-14 03:09:00', '2018-02-14 03:09:05', 'Bmw e90 Test Car'),
(90, 3, 7, 1, ':)', '2018-02-14 03:09:01', '2018-02-14 03:09:05', 'Bmw e90 Test Car'),
(91, 3, 7, 1, 'its saying seen 5 minutes ago', '2018-02-14 03:09:29', '2018-02-14 03:10:15', 'Bmw e90 Test Car'),
(92, 3, 7, 1, 'lol', '2018-02-14 03:09:31', '2018-02-14 03:10:15', 'Bmw e90 Test Car'),
(93, 1, 7, 3, 'yes ', '2018-02-14 03:09:37', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(94, 1, 7, 3, 'i need to style ', '2018-02-14 03:09:43', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(95, 1, 7, 3, 'seen', '2018-02-14 03:09:46', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(96, 1, 7, 3, 'is typing ', '2018-02-14 03:09:50', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(97, 1, 7, 3, 'wo hal osas', '2018-02-14 03:09:53', '2018-02-14 03:09:54', 'Bmw e90 Test Car'),
(98, 3, 7, 1, 'cool', '2018-02-14 03:09:57', '2018-02-14 03:10:15', 'Bmw e90 Test Car'),
(99, 3, 7, 1, 'listen get inspired by facebook chat design', '2018-02-14 03:10:10', '2018-02-14 03:10:15', 'Bmw e90 Test Car'),
(100, 1, 7, 3, 'walak khalas kter zabet heek el window ', '2018-02-14 03:10:30', '2018-02-14 03:11:34', 'Bmw e90 Test Car'),
(101, 3, 7, 1, 'really good', '2018-02-14 03:11:43', '2018-02-14 03:11:44', 'Bmw e90 Test Car'),
(102, 3, 7, 1, 'just small touches ', '2018-02-14 03:11:47', '2018-02-14 03:11:51', 'Bmw e90 Test Car'),
(103, 3, 7, 1, 'really small', '2018-02-14 03:11:50', '2018-02-14 03:11:51', 'Bmw e90 Test Car'),
(104, 1, 7, 3, 'akeed', '2018-02-14 03:11:55', '2018-02-14 03:11:56', 'Bmw e90 Test Car'),
(105, 3, 7, 1, 'coolio', '2018-02-14 03:11:59', '2018-02-14 03:12:59', 'Bmw e90 Test Car'),
(106, 3, 7, 1, 'we are actually using this now lol', '2018-02-14 03:12:10', '2018-02-14 03:12:59', 'Bmw e90 Test Car'),
(107, 1, 7, 3, 'hahahaha', '2018-02-14 03:12:14', '2018-02-14 03:15:19', 'Bmw e90 Test Car'),
(108, 1, 7, 3, '3anjad ', '2018-02-14 03:12:17', '2018-02-14 03:15:19', 'Bmw e90 Test Car'),
(109, 1, 7, 3, 'more7', '2018-02-14 03:12:26', '2018-02-14 03:15:19', 'Bmw e90 Test Car'),
(110, 3, 7, 1, 'fdgdfgdfg', '2018-02-14 03:15:11', '2018-02-14 03:17:16', 'Bmw e90 Test Car'),
(111, 3, 7, 1, 'fgdfgdfgdfgdfgdfgdfgdfgdfg', '2018-02-14 03:15:21', '2018-02-14 03:17:16', 'Bmw e90 Test Car'),
(112, 3, 7, 1, 'ya', '2018-02-14 03:18:29', '2018-02-14 03:20:23', 'Bmw e90 Test Car'),
(113, 3, 7, 1, 'i would round the edges of the speech bubble and make eveything a bit smaller ', '2018-02-14 03:19:18', '2018-02-14 03:20:23', 'Bmw e90 Test Car'),
(114, 3, 7, 1, 'sdfsdfs', '2018-02-14 03:28:23', '2018-02-14 03:30:55', 'Bmw e90 Test Car'),
(115, 3, 7, 1, 'fdsfsdfsdf', '2018-02-14 03:30:06', '2018-02-14 03:30:55', 'Bmw e90 Test Car'),
(116, 3, 7, 1, 'dfgdfgdfgdfgdfg', '2018-02-14 03:33:00', '2018-02-14 03:35:02', 'Bmw e90 Test Car'),
(117, 3, 7, 1, 'gfdgdfggdfggdffdsfsdfsdfdsfsdffsdfsdgdfgdfg', '2018-02-14 03:36:06', '2018-02-14 03:45:47', 'Bmw e90 Test Car'),
(118, 3, 7, 1, 'ghjghjghjghjghjdsfsdfsdfsdfsdf', '2018-02-14 03:59:15', '2018-02-14 04:00:29', 'Bmw e90 Test Car'),
(119, 3, 7, 1, 'fgdgfgfgfgfgfgfgfgfgfgfgfgfgfgfgf', '2018-02-14 04:00:58', '2018-02-14 04:09:11', 'Bmw e90 Test Car'),
(120, 3, 7, 1, 'dsfsdfsdffsdfsdffsdfsdfsdfsdfsdf', '2018-02-14 04:01:08', '2018-02-14 04:09:11', 'Bmw e90 Test Car'),
(121, 3, 7, 1, 'fdsfsdfsdfsdfsdfsfdsfsdfsdfsdfsdf', '2018-02-14 04:02:02', '2018-02-14 04:09:11', 'Bmw e90 Test Car'),
(122, 3, 7, 1, 'fdfgdfgdf', '2018-02-14 04:11:22', '2018-02-14 04:11:25', 'Bmw e90 Test Car'),
(123, 3, 7, 1, 'ewrwer', '2018-02-14 04:12:17', '2018-02-14 04:12:24', 'Bmw e90 Test Car'),
(124, 3, 7, 1, 'ewrwerwer', '2018-02-14 04:14:54', '2018-02-14 04:16:20', 'Bmw e90 Test Car'),
(125, 3, 7, 1, 'fdsfsdfsdfsdf', '2018-02-14 04:15:03', '2018-02-14 04:16:20', 'Bmw e90 Test Car'),
(126, 3, 7, 1, 'dfgdfgdfg', '2018-02-14 04:16:14', '2018-02-14 04:16:20', 'Bmw e90 Test Car'),
(127, 3, 7, 1, 'gdfgdfgdfgdfgdfgdfgdfg', '2018-02-14 04:19:35', '2018-02-14 04:19:44', 'Bmw e90 Test Car'),
(128, 3, 7, 1, 'lklklklklklnmbnmbmnbmn', '2018-02-14 04:21:14', '2018-02-14 04:21:19', 'Bmw e90 Test Car'),
(129, 3, 7, 1, 'kjkjkjk,nkkljkljkljkljj', '2018-02-14 04:22:12', '2018-02-14 04:23:34', 'Bmw e90 Test Car'),
(130, 1, 7, 3, 'sdsd', '2018-02-14 04:39:40', '2018-02-14 05:48:07', 'Bmw e90 Test Car'),
(131, 1, 7, 3, 'opop', '2018-02-14 04:57:00', '2018-02-14 05:48:07', 'Bmw e90 Test Car'),
(132, 1, 7, 5, '??????', '2018-02-14 07:48:29', '2018-02-14 21:30:48', 'Bmw e90 Test Car'),
(133, 1, 7, 5, '?????????', '2018-02-14 07:48:34', '2018-02-14 21:30:48', 'Bmw e90 Test Car'),
(134, 5, 10, 1, 'hello', '2018-02-15 01:34:07', '2018-02-15 01:34:24', ''),
(135, 5, 10, 1, 'hi', '2018-02-15 01:34:19', '2018-02-15 01:34:24', ''),
(136, 1, 7, 3, 'asdasd', '2018-02-15 01:45:24', '2018-02-15 01:45:30', 'Bmw e90 Test Car'),
(137, 3, 7, 1, 'iuouiou', '2018-02-15 01:45:34', '2018-02-15 01:45:38', 'Bmw e90 Test Car'),
(138, 1, 7, 3, 'adnan', '2018-02-15 01:45:39', '2018-02-15 01:45:46', 'Bmw e90 Test Car'),
(139, 1, 7, 3, '\'[[[[', '2018-02-15 04:16:40', '2018-02-15 04:16:46', 'Bmw e90 Test Car'),
(140, 3, 7, 1, 'ilioio', '2018-02-15 04:16:58', '2018-02-15 04:37:57', 'Bmw e90 Test Car'),
(141, 3, 7, 1, '[p]p[]', '2018-02-15 04:17:03', '2018-02-15 04:37:57', 'Bmw e90 Test Car'),
(142, 1, 7, 3, '3', '2018-02-15 04:37:59', '2018-02-17 10:07:14', 'Bmw e90 Test Car'),
(143, 5, 7, 1, 'asd', '2018-02-17 09:39:15', '2018-02-17 09:39:51', 'Bmw e90 Test Car'),
(144, 5, 7, 1, 'df', '2018-02-17 09:39:48', '2018-02-17 09:39:51', 'Bmw e90 Test Car'),
(145, 5, 7, 1, 'dfasdf', '2018-02-17 09:39:58', '2018-02-17 09:40:08', 'Bmw e90 Test Car'),
(146, 5, 7, 1, 'adf', '2018-02-17 09:40:05', '2018-02-17 09:40:08', 'Bmw e90 Test Car'),
(147, 1, 7, 5, 'gfhgfhfg', '2018-02-17 09:40:10', '2018-02-17 10:12:55', 'Bmw e90 Test Car'),
(148, 1, 7, 5, 'can u put it in the footer like freelance ', '2018-02-17 09:40:30', '2018-02-17 10:12:55', 'Bmw e90 Test Car'),
(149, 5, 7, 1, 'what you mean', '2018-02-17 09:40:58', '2018-02-17 09:41:07', 'Bmw e90 Test Car'),
(150, 1, 7, 5, 'i will write there ', '2018-02-17 09:41:14', '2018-02-17 10:12:55', 'Bmw e90 Test Car'),
(151, 1, 7, 5, 'check how it looks ', '2018-02-17 09:41:19', '2018-02-17 10:12:55', 'Bmw e90 Test Car'),
(152, 5, 7, 1, 'oh i see', '2018-02-17 09:41:28', '2018-02-17 09:43:36', 'Bmw e90 Test Car'),
(153, 5, 7, 1, 'ok', '2018-02-17 09:41:34', '2018-02-17 09:43:36', 'Bmw e90 Test Car'),
(154, 3, 7, 1, 'sadsadasdasdasdas', '2018-02-17 10:07:42', '2018-02-17 10:13:02', 'Bmw e90 Test Car'),
(155, 5, 7, 1, 'dfas', '2018-02-17 10:12:56', '2018-02-17 10:14:22', 'Bmw e90 Test Car'),
(156, 5, 7, 1, 'df', '2018-02-17 10:13:36', '2018-02-17 10:14:22', 'Bmw e90 Test Car'),
(157, 1, 7, 5, 'df', '2018-02-17 10:14:24', '2018-02-17 10:14:36', 'Bmw e90 Test Car'),
(158, 1, 7, 5, 'cv', '2018-02-17 10:16:14', '2018-02-17 10:16:19', 'Bmw e90 Test Car'),
(159, 5, 7, 1, 'test', '2018-02-17 10:16:22', '2018-02-17 10:20:55', 'Bmw e90 Test Car'),
(160, 3, 7, 1, 'xcvcxvcxvcxvcxvcxvcxvcxvcxvxc', '2018-02-17 10:16:57', '2018-02-17 11:30:36', 'Bmw e90 Test Car'),
(161, 1, 7, 5, 'hello', '2018-03-02 21:07:05', '2018-03-02 21:07:11', ''),
(162, 5, 7, 1, 'hi', '2018-03-02 21:07:12', '2018-03-03 02:36:34', ''),
(163, 1, 26, 1, 'jkjk', '2018-03-07 07:25:07', '2018-03-07 07:25:14', 'BMW e90 For sale'),
(164, 1, 26, 1, 'rrtrt', '2018-03-07 07:25:16', '2018-03-07 07:25:18', 'BMW e90 For sale'),
(165, 1, 7, 5, 'hello', '2018-03-18 11:47:04', '2018-03-18 11:48:30', ''),
(166, 1, 26, 1, 'Hello', '2018-03-18 11:48:17', '2018-03-18 11:48:22', 'BMW e90 For sale'),
(167, 1, 26, 1, 'Hello', '2018-03-18 11:48:45', '2018-03-18 11:48:57', 'BMW e90 For sale'),
(168, 5, 7, 1, 'hello', '2018-03-18 11:48:45', '2018-03-18 11:51:18', 'Bmw e90 Test Car'),
(169, 1, 26, 1, 'test', '2018-03-18 11:48:58', '2018-03-18 11:56:44', 'BMW e90 For sale'),
(190, 1, 26, 1, 'hfhfhhfhfhfhf', '2018-03-18 12:43:54', '2018-03-18 13:51:29', 'BMW e90 For sale');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbox_block`
--
ALTER TABLE `chatbox_block`
  ADD UNIQUE KEY `user_id` (`user_id`,`contact_id`);

--
-- Indexes for table `chatbox_contact`
--
ALTER TABLE `chatbox_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ads_id` (`ads_id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `create_at` (`create_at`),
  ADD KEY `seen_at` (`seen_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbox_contact`
--
ALTER TABLE `chatbox_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
