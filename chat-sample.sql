-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 172.17.0.3
-- Generation Time: Apr 10, 2018 at 08:08 AM
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
-- Database: `chat_sample`
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
(1, 5, 26, 1, 'adf', '2018-02-08 12:12:17', '2018-02-08 12:14:44', 'Test ads for contents'),
(2, 3, 12, 1, 'you can chat now', '2018-02-08 12:12:52', '2018-02-08 12:20:19', 'Rent apartment'),
(3, 5, 26, 1, 'hello', '2018-02-08 12:13:18', '2018-02-08 12:14:44', 'Test ads for contents'),
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
(165, 1, 7, 5, 'hello', '2018-03-18 11:47:04', '2018-03-18 11:48:30', ''),
(168, 5, 7, 1, 'hello', '2018-03-18 11:48:45', '2018-03-18 11:51:18', 'Bmw e90 Test Car'),
(192, 1, 26, 5, 'dfasdf', '2018-04-09 16:42:30', '2018-04-09 16:44:13', 'BMW e90 For sale'),
(193, 1, 26, 5, 'adf', '2018-04-09 16:42:32', '2018-04-09 16:44:13', 'BMW e90 For sale'),
(194, 1, 10, 5, 'a', '2018-04-09 16:43:40', '2018-04-09 16:46:21', 'Mercedes SL500'),
(195, 1, 10, 5, 'w', '2018-04-09 16:43:42', '2018-04-09 16:46:21', 'Mercedes SL500'),
(196, 5, 26, 1, '123', '2018-04-09 16:44:14', '2018-04-09 16:44:19', 'BMW e90 For sale'),
(197, 1, 10, 5, '12', '2018-04-09 16:46:11', '2018-04-09 16:46:21', 'Mercedes SL500'),
(198, 5, 10, 1, 'qwe', '2018-04-09 16:46:24', '2018-04-09 16:47:26', 'Test ads for contents'),
(199, 1, 7, 5, '123', '2018-04-09 16:48:07', '2018-04-09 16:48:09', 'SL63 2009 AMG CONVERTIBLE'),
(200, 5, 7, 1, '456', '2018-04-09 16:48:11', '2018-04-09 16:48:42', 'SL63 2009 AMG CONVERTIBLE'),
(201, 1, 7, 5, 'asdf', '2018-04-09 16:49:17', '2018-04-09 17:05:08', 'SL63 2009 AMG CONVERTIBLE'),
(202, 1, 26, 5, 'asdf', '2018-04-09 16:49:54', '2018-04-09 17:05:08', 'BMW e90 For sale'),
(203, 1, 7, 5, 'hello', '2018-04-09 17:19:51', '2018-04-09 17:19:55', 'SL63 2009 AMG CONVERTIBLE'),
(204, 5, 7, 1, 'yeah, i see you', '2018-04-09 17:19:59', '2018-04-09 17:20:12', 'SL63 2009 AMG CONVERTIBLE'),
(205, 1, 7, 5, '1', '2018-04-09 17:20:13', '2018-04-09 17:20:22', 'SL63 2009 AMG CONVERTIBLE'),
(206, 1, 7, 5, '2', '2018-04-09 17:20:15', '2018-04-09 17:20:22', 'SL63 2009 AMG CONVERTIBLE'),
(207, 1, 7, 5, '3', '2018-04-09 17:20:16', '2018-04-09 17:20:22', 'SL63 2009 AMG CONVERTIBLE'),
(208, 5, 7, 1, 'hello', '2018-04-09 17:20:25', '2018-04-09 17:22:12', 'SL63 2009 AMG CONVERTIBLE'),
(209, 5, 7, 1, '123', '2018-04-09 17:20:27', '2018-04-09 17:22:12', 'SL63 2009 AMG CONVERTIBLE'),
(210, 1, 7, 5, '123', '2018-04-10 03:01:12', '2018-04-10 06:52:08', 'SL63 2009 AMG CONVERTIBLE'),
(211, 1, 7, 5, '123', '2018-04-10 04:03:09', '2018-04-10 06:52:08', 'SL63 2009 AMG CONVERTIBLE'),
(212, 1, 7, 5, '3', '2018-04-10 04:03:18', '2018-04-10 06:52:08', 'SL63 2009 AMG CONVERTIBLE'),
(213, 1, 7, 5, '4', '2018-04-10 04:04:00', '2018-04-10 06:52:08', 'SL63 2009 AMG CONVERTIBLE'),
(214, 1, 7, 5, 'fuck', '2018-04-10 04:05:27', '2018-04-10 06:52:08', 'SL63 2009 AMG CONVERTIBLE'),
(215, 1, 10, 5, '1', '2018-04-10 04:17:37', NULL, 'Mercedes SL500'),
(216, 1, 7, 5, 'hello', '2018-04-10 06:52:26', '2018-04-10 07:44:50', 'SL63 2009 AMG CONVERTIBLE'),
(217, 1, 7, 5, '123', '2018-04-10 06:57:05', '2018-04-10 07:44:50', 'SL63 2009 AMG CONVERTIBLE'),
(218, 1, 7, 5, '3', '2018-04-10 06:57:08', '2018-04-10 07:44:50', 'SL63 2009 AMG CONVERTIBLE'),
(219, 1, 26, 5, 'te', '2018-04-10 06:57:28', NULL, 'BMW e90 For sale'),
(220, 1, 7, 5, '1', '2018-04-10 07:22:34', '2018-04-10 07:44:50', 'SL63 2009 AMG CONVERTIBLE'),
(221, 1, 7, 5, 'adf', '2018-04-10 07:22:57', '2018-04-10 07:44:50', 'SL63 2009 AMG CONVERTIBLE'),
(222, 1, 7, 5, 'asdf', '2018-04-10 07:57:50', '2018-04-10 07:57:53', 'SL63 2009 AMG CONVERTIBLE'),
(223, 5, 7, 1, '123', '2018-04-10 07:57:54', '2018-04-10 08:06:17', 'SL63 2009 AMG CONVERTIBLE'),
(224, 1, 7, 5, '123', '2018-04-10 08:06:18', '2018-04-10 08:06:37', 'SL63 2009 AMG CONVERTIBLE'),
(225, 5, 7, 1, 'hello', '2018-04-10 08:06:38', NULL, 'SL63 2009 AMG CONVERTIBLE');

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
(7, 1, 8, 1, 17, '2018-02-21 06:04:55', '2018-03-23 06:04:55', 'SL63 2009 AMG CONVERTIBLE', 'MERCEDES SL63 AMG CONVERTIBLE\r\n2009 MODEL\r\n6.3L V8\r\n\r\nGULF SPECS GCC CAR\r\nFULL SERVICE HISTORY\r\nBLACK EXTERIOR WITH LEATHER INTERIOR\r\nFULLY WRAPPED WITH 3M FILM MATTE GREY\r\nKEYLESS ENTRY', 119000, 'JD', '', '', 0, 0, 5, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Mercedes-Benz', NULL, 'SL 63 AMG', NULL, 'Convertible', 'Automatic', 'Petrol', 2, 'Silver', 'Used', 'Safety Belt Pretensioners|Safety Belt Pretensioners|Alloy Wheels|Tuning|Climate Control|Leather Seats|Power Locks|Sunroof|Cassette Player', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Irbid', NULL, NULL, 'No', 'GCC', 0, 0, '30,000 - 39,999', '2009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, 8, 1, 18, '2018-02-21 06:12:04', '2018-03-23 06:12:04', 'Mercedes SL500', 'Selling Mercedes SL500 R129 from 1997. 5 speed automatic gearbox. Perfectly working soft top and hardtop.\r\nHave all the receipts since when the car was in Dubai (Japan imported). Excellent condition. 18 inch wheel AMG Monoblocks.\r\nNo silly offers. Only serious buyers.', 65000, 'JD', '', '', 0, 0, 4, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'Mercedes-Benz', NULL, 'SL 500', NULL, 'Convertible', 'Automatic', 'Petrol', 2, 'Silver', 'Used', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', '31.9453666,35.92837159999999,5', 'amman', 'No', 'GCC', 31.9453666, 35.92837159999999, '60,000 - 69,999', '2008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(26, 1, 8, 1, 16, '2018-02-20 11:47:08', '2018-03-22 11:47:08', 'BMW e90 For sale', 'BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale BMW e90 For sale', 12000, 'JD', '', '', 0, 0, 64, 1, 0, 0, 0, 0, 0, NULL, 0.00, 'eng', NULL, 0, 'BMW', NULL, '325', NULL, 'Saloon', 'Automatic', 'Petrol', 4, 'Blue', 'New', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amman', '31.9453666,35.92837159999999,5', 'amman', 'No', 'GCC', 31.9453666, 35.92837159999999, '10,000 - 19,999', '2016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
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

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessionId` varchar(32) COLLATE utf8_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sessionId`, `expires`, `data`) VALUES
('67lcnab86emvi4enbognovorh7', 1523351170, '{\"authen\":{\"id\":\"1\",\"first_name\":\"test1\",\"last_name\":\"diep\",\"username\":\"test1\",\"country\":\"\",\"state\":\"\",\"city\":\"\",\"email\":\"\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"dob\":\"2018-04-09\",\"age\":\"20\",\"gender\":\"\",\"mobile\":\"\",\"avatar\":\"avatar-default.png\"}}'),
('JF5Gnpo1kHH2wHO7_pke_JkA9cNMo3ft', 1523433919, '{\"authen\":{\"id\":\"1\",\"first_name\":\"test1\",\"last_name\":\"diep\",\"username\":\"test1\",\"country\":\"\",\"state\":\"\",\"city\":\"\",\"email\":\"\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"dob\":\"2018-04-09\",\"age\":\"20\",\"gender\":\"\",\"mobile\":\"\",\"avatar\":\"avatar-default.png\"}}'),
('v87d6kirqnc5h57m16n5rtnl61', 1523351195, '{\"authen\":{\"id\":\"5\",\"first_name\":\"test2\",\"last_name\":\"qwe\",\"username\":\"test2\",\"country\":\"\",\"state\":\"\",\"city\":\"\",\"email\":\"\",\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"dob\":\"2018-04-09\",\"age\":\"21\",\"gender\":\"\",\"mobile\":\"\",\"avatar\":\"avatar-default.png\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `dob` date NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `avatar` varchar(255) CHARACTER SET latin1 DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `country`, `state`, `city`, `email`, `password`, `dob`, `age`, `gender`, `mobile`, `avatar`) VALUES
(1, 'test1', 'diep', 'test1', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '2018-04-09', 20, '', '', 'avatar-default.png'),
(5, 'test2', 'qwe', 'test2', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '2018-04-09', 21, '', '', 'avatar-default.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_msg`
--

CREATE TABLE `users_msg` (
  `msg_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL DEFAULT '0',
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `msg_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 = unread, 1 = read',
  `msg_text` text NOT NULL,
  `msg_text_from` text NOT NULL,
  `msg_text_to` text NOT NULL,
  `msg_file` varchar(50) NOT NULL,
  `msg_type` enum('i','j','v','t') NOT NULL DEFAULT 't' COMMENT 'i=image, j=json, v=video, t=text',
  `msg_clear_1` int(11) NOT NULL DEFAULT '0',
  `msg_clear_2` int(11) NOT NULL DEFAULT '0',
  `msg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_msg_thread`
--

CREATE TABLE `users_msg_thread` (
  `thread_id` int(11) NOT NULL,
  `user_id1` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users_msg`
--
ALTER TABLE `users_msg`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `user_id_to` (`from_id`,`to_id`,`msg_status`) USING BTREE,
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `users_msg_thread`
--
ALTER TABLE `users_msg_thread`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `user_id1` (`user_id1`,`user_id2`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbox_contact`
--
ALTER TABLE `chatbox_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;
--
-- AUTO_INCREMENT for table `class_ads`
--
ALTER TABLE `class_ads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_msg`
--
ALTER TABLE `users_msg`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_msg_thread`
--
ALTER TABLE `users_msg_thread`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
