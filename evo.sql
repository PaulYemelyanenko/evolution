-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 14 2018 г., 11:14
-- Версия сервера: 5.6.38
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `evo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_active_users`
--

CREATE TABLE `cgck_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about last user action.';

--
-- Дамп данных таблицы `cgck_active_users`
--

INSERT INTO `cgck_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
('ni79bok8n6psmvvelk4fqu7me49qov2o', 1, 'admin', 1536881635, '67', 1),
('ekfcap0hjsgd6qbjhoftiik844b0ks4l', 1, 'admin', 1536912275, '16', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_active_user_locks`
--

CREATE TABLE `cgck_active_user_locks` (
  `id` int(10) NOT NULL,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `elementType` int(1) NOT NULL DEFAULT '0',
  `elementId` int(10) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about locked elements.';

--
-- Дамп данных таблицы `cgck_active_user_locks`
--

INSERT INTO `cgck_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
(334, 'ekfcap0hjsgd6qbjhoftiik844b0ks4l', 1, 1, 5, 1536912275);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_active_user_sessions`
--

CREATE TABLE `cgck_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about valid user sessions.';

--
-- Дамп данных таблицы `cgck_active_user_sessions`
--

INSERT INTO `cgck_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
('ekfcap0hjsgd6qbjhoftiik844b0ks4l', 1, 1536912483, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_categories`
--

CREATE TABLE `cgck_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';

--
-- Дамп данных таблицы `cgck_categories`
--

INSERT INTO `cgck_categories` (`id`, `category`, `rank`) VALUES
(1, 'SEO', 0),
(2, 'Templates', 0),
(3, 'Js', 0),
(4, 'Manager and Admin', 0),
(5, 'Content', 0),
(6, 'Navigation', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_documentgroup_names`
--

CREATE TABLE `cgck_documentgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_document_groups`
--

CREATE TABLE `cgck_document_groups` (
  `id` int(10) NOT NULL,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_event_log`
--

CREATE TABLE `cgck_event_log` (
  `id` int(11) NOT NULL,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs';

--
-- Дамп данных таблицы `cgck_event_log`
--

INSERT INTO `cgck_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1536905864, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) .htaccess');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_manager_log`
--

CREATE TABLE `cgck_manager_log` (
  `id` int(10) NOT NULL,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';

--
-- Дамп данных таблицы `cgck_manager_log`
--

INSERT INTO `cgck_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(1, 1536775855, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(2, 1536775856, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(3, 1536776159, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(4, 1536776198, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(5, 1536776302, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(6, 1536776318, 1, 'admin', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(7, 1536776350, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(8, 1536776369, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(9, 1536780912, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(10, 1536780920, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(11, 1536781210, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(12, 1536781220, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(13, 1536781250, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(14, 1536781259, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(15, 1536781276, 1, 'admin', 93, '-', '-', 'Backup Manager', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(16, 1536781288, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(17, 1536781291, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(18, 1536781294, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(19, 1536782749, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(20, 1536782759, 1, 'admin', 27, '1', 'Evolution CMS Install Success', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(21, 1536785016, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(22, 1536785024, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(23, 1536785028, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(24, 1536785033, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(25, 1536785045, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(26, 1536785049, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(27, 1536785107, 1, 'admin', 30, '-', '-', 'Saving settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(28, 1536785191, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(29, 1536785191, 1, 'admin', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(30, 1536785224, 1, 'admin', 27, '1', 'Evolution CMS Install Success', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(31, 1536785235, 1, 'admin', 5, '1', 'Evo', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(32, 1536785235, 1, 'admin', 27, '1', 'Evo', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(33, 1536785293, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(34, 1536785293, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(35, 1536785364, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(36, 1536785364, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(37, 1536785405, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(38, 1536785413, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(39, 1536785544, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(40, 1536785577, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(41, 1536785588, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(42, 1536785606, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(43, 1536785969, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(44, 1536785969, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(45, 1536786042, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(46, 1536786054, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(47, 1536786056, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(48, 1536786062, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(49, 1536786068, 1, 'admin', 78, '2', 'mm_rules', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(50, 1536786075, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(51, 1536786107, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(52, 1536786163, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(53, 1536786163, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(54, 1536786169, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(55, 1536786169, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(56, 1536786175, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(57, 1536786176, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(58, 1536786195, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(59, 1536786199, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(60, 1536786281, 1, 'admin', 79, '-', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(61, 1536786281, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(62, 1536786361, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(63, 1536786375, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(64, 1536786381, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(65, 1536786430, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(66, 1536786436, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(67, 1536786631, 1, 'admin', 20, '-', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(68, 1536786631, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(69, 1536786663, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(70, 1536786767, 1, 'admin', 20, '-', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(71, 1536786767, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(72, 1536786776, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(73, 1536786785, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(74, 1536786882, 1, 'admin', 20, '-', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(75, 1536786882, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(76, 1536786898, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(77, 1536787032, 1, 'admin', 20, '-', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(78, 1536787032, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(79, 1536787184, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(80, 1536787208, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(81, 1536787235, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(82, 1536787245, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(83, 1536787245, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(84, 1536787371, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(85, 1536787373, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(86, 1536787684, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(87, 1536787684, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(88, 1536787694, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(89, 1536787769, 1, 'admin', 79, '3', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(90, 1536787769, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(91, 1536787821, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(92, 1536787879, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(93, 1536787879, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(94, 1536787894, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(95, 1536787930, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(96, 1536787930, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(97, 1536787937, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(98, 1536787991, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(99, 1536787991, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(100, 1536787999, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(101, 1536788175, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(102, 1536788215, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(103, 1536788215, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(104, 1536788227, 1, 'admin', 5, '-', 'Gallery', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(105, 1536788227, 1, 'admin', 27, '2', 'Gallery', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(106, 1536788273, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(107, 1536788273, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(108, 1536788308, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(109, 1536788361, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(110, 1536788361, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(111, 1536788377, 1, 'admin', 5, '-', 'Блог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(112, 1536788377, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(113, 1536788422, 1, 'admin', 5, '3', 'Блог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(114, 1536788422, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(115, 1536788427, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(116, 1536788470, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(117, 1536788470, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(118, 1536788474, 1, 'admin', 5, '-', 'Контакты', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(119, 1536788474, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(120, 1536788483, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(121, 1536788503, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(122, 1536788503, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(123, 1536788535, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(124, 1536788535, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(125, 1536788774, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(126, 1536788774, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(127, 1536788866, 1, 'admin', 5, '4', 'Контакты', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(128, 1536788866, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(129, 1536817258, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(130, 1536817267, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(131, 1536817901, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(132, 1536819943, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(133, 1536819943, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(134, 1536820036, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(135, 1536820036, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(136, 1536820211, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(137, 1536820211, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(138, 1536820236, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(139, 1536820236, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(140, 1536820282, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(141, 1536820310, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(142, 1536820310, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(143, 1536820350, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(144, 1536820350, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(145, 1536820549, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(146, 1536820549, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(147, 1536820574, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(148, 1536820574, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(149, 1536821396, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(150, 1536821396, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(151, 1536821451, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(152, 1536821451, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(153, 1536821669, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(154, 1536822354, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(155, 1536822354, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(156, 1536822378, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(157, 1536822400, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(158, 1536822428, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(159, 1536822461, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(160, 1536822777, 1, 'admin', 302, '-', 'Изображение', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(161, 1536822777, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(162, 1536823005, 1, 'admin', 302, '5', 'Изображение', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(163, 1536823005, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(164, 1536823053, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(165, 1536823293, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(166, 1536823294, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(167, 1536823618, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(168, 1536823618, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(169, 1536823970, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(170, 1536823970, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(171, 1536824048, 1, 'admin', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(172, 1536824374, 1, 'admin', 22, '1', 'DLCrumbs', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(173, 1536824628, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(174, 1536824779, 1, 'admin', 302, '-', 'Главные блоки', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(175, 1536824779, 1, 'admin', 301, '6', 'Главные блоки', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(176, 1536825012, 1, 'admin', 302, '6', 'Главные блоки', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(177, 1536825012, 1, 'admin', 301, '6', 'Главные блоки', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(178, 1536825027, 1, 'admin', 302, '6', 'Главный блок', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(179, 1536825027, 1, 'admin', 301, '6', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(180, 1536826187, 1, 'admin', 302, '6', 'Главный блок', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(181, 1536826187, 1, 'admin', 301, '6', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(182, 1536826257, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(183, 1536826406, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(184, 1536826478, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(185, 1536826985, 1, 'admin', 79, '-', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(186, 1536826985, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(187, 1536826996, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(188, 1536827060, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(189, 1536827060, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(190, 1536827224, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(191, 1536827224, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(192, 1536827313, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(193, 1536827327, 1, 'admin', 302, '5', 'Изображение', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(194, 1536827327, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(195, 1536827336, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(196, 1536827350, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(197, 1536827350, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(198, 1536827455, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(199, 1536827482, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(200, 1536827534, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(201, 1536827563, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(202, 1536827563, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(203, 1536827583, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(204, 1536827586, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(205, 1536828052, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(206, 1536828052, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(207, 1536828096, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(208, 1536828096, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(209, 1536828904, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(210, 1536828905, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(211, 1536828946, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(212, 1536828946, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(213, 1536828976, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(214, 1536828976, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(215, 1536829068, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(216, 1536829069, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(217, 1536829287, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(218, 1536829287, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(219, 1536829321, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(220, 1536829321, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(221, 1536829373, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(222, 1536829373, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(223, 1536829445, 1, 'admin', 79, '4', 'half_left', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(224, 1536829445, 1, 'admin', 78, '4', 'half_left', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(225, 1536829701, 1, 'admin', 80, '4', 'half_left', 'Deleting Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(226, 1536829701, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(227, 1536829743, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(228, 1536829743, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(229, 1536829781, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(230, 1536829783, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(231, 1536829786, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(232, 1536829803, 1, 'admin', 301, '6', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(233, 1536829861, 1, 'admin', 302, '6', 'Главный блок', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(234, 1536829861, 1, 'admin', 301, '6', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(235, 1536829936, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(236, 1536829983, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(237, 1536830523, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(238, 1536830803, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(239, 1536830954, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(240, 1536830954, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(241, 1536831341, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(242, 1536831534, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(243, 1536831534, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(244, 1536831545, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(245, 1536831545, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(246, 1536831993, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(247, 1536832811, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(248, 1536832811, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(249, 1536832851, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(250, 1536832891, 1, 'admin', 302, '-', 'main_right_half', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36');
INSERT INTO `cgck_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(251, 1536832891, 1, 'admin', 301, '7', 'main_right_half', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(252, 1536832932, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(253, 1536833685, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(254, 1536833759, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(255, 1536833759, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(256, 1536833777, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(257, 1536833822, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(258, 1536833822, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(259, 1536833923, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(260, 1536833923, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(261, 1536834105, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(262, 1536834140, 1, 'admin', 302, '-', 'main_block', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(263, 1536834140, 1, 'admin', 301, '8', 'main_block', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(264, 1536834658, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(265, 1536834714, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(266, 1536834714, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(267, 1536834852, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(268, 1536834852, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(269, 1536834999, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(270, 1536835000, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(271, 1536835037, 1, 'admin', 301, '6', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(272, 1536835080, 1, 'admin', 302, '6', 'Левый блок главной страницы', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(273, 1536835080, 1, 'admin', 301, '6', 'Левый блок главной страницы', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(274, 1536835091, 1, 'admin', 301, '8', 'main_block', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(275, 1536835219, 1, 'admin', 302, '8', 'Главный блок', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(276, 1536835219, 1, 'admin', 301, '8', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(277, 1536835225, 1, 'admin', 301, '7', 'main_right_half', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(278, 1536835268, 1, 'admin', 302, '7', 'Правый блок главной страницы', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(279, 1536835268, 1, 'admin', 301, '7', 'Правый блок главной страницы', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(280, 1536835274, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(281, 1536835301, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(282, 1536835370, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(283, 1536835370, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(284, 1536835380, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(285, 1536835381, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(286, 1536835386, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(287, 1536835386, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(288, 1536835471, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(289, 1536835517, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(290, 1536835518, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(291, 1536835524, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(292, 1536835524, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(293, 1536835684, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(294, 1536835685, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(295, 1536835688, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(296, 1536835688, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(297, 1536835834, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(298, 1536835835, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(299, 1536835838, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(300, 1536835838, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(301, 1536835875, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(302, 1536835876, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(303, 1536836462, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(304, 1536836462, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(305, 1536836495, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(306, 1536836942, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(307, 1536836955, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(308, 1536836955, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(309, 1536837001, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(310, 1536837002, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(311, 1536837005, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(312, 1536837079, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(313, 1536837079, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(314, 1536838472, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(315, 1536838976, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(316, 1536839033, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(317, 1536839053, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(318, 1536839053, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(319, 1536839129, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(320, 1536839129, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(321, 1536839184, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(322, 1536839184, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(323, 1536839211, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(324, 1536839371, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(325, 1536839407, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(326, 1536839422, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(327, 1536839444, 1, 'admin', 3, '2', 'Галерея', 'Viewing data for resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(328, 1536839477, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(329, 1536839503, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(330, 1536839510, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(331, 1536839551, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(332, 1536839589, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(333, 1536839589, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(334, 1536839614, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(335, 1536839617, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(336, 1536839621, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(337, 1536839648, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(338, 1536839694, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(339, 1536839977, 1, 'admin', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(340, 1536840045, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(341, 1536840059, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(342, 1536840224, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(343, 1536840224, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(344, 1536840283, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(345, 1536840283, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(346, 1536840333, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(347, 1536840333, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(348, 1536840374, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(349, 1536840374, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(350, 1536840473, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(351, 1536840473, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(352, 1536840476, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(353, 1536840572, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(354, 1536840628, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(355, 1536840628, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(356, 1536840704, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(357, 1536840704, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(358, 1536840890, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(359, 1536840956, 1, 'admin', 79, '3', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(360, 1536840956, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(361, 1536840994, 1, 'admin', 79, '1', 'header', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(362, 1536840994, 1, 'admin', 78, '1', 'header', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(363, 1536840998, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(364, 1536841165, 1, 'admin', 79, '3', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(365, 1536841165, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(366, 1536841195, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(367, 1536841388, 1, 'admin', 79, '3', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(368, 1536841388, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(369, 1536841428, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(370, 1536841431, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(371, 1536841595, 1, 'admin', 79, '3', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(372, 1536841595, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(373, 1536841600, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(374, 1536841802, 1, 'admin', 79, '3', 'footer', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(375, 1536841802, 1, 'admin', 78, '3', 'footer', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(376, 1536842364, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(377, 1536842376, 1, 'admin', 17, '-', '-', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(378, 1536842466, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(379, 1536842880, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(380, 1536843631, 1, 'admin', 301, '8', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(381, 1536843638, 1, 'admin', 302, '8', 'Главный блок', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(382, 1536843638, 1, 'admin', 301, '8', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(383, 1536843653, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(384, 1536843659, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(385, 1536845274, 1, 'admin', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(386, 1536845337, 1, 'admin', 26, '-', 'Extras', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(387, 1536845377, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(388, 1536845398, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(389, 1536845479, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(390, 1536845513, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(391, 1536845529, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(392, 1536845533, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(393, 1536845538, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(394, 1536845571, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(395, 1536845586, 1, 'admin', 5, '-', 'Новый ресурс', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(396, 1536845586, 1, 'admin', 27, '5', 'Новый ресурс', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(397, 1536845592, 1, 'admin', 27, '5', 'Новый ресурс', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(398, 1536845601, 1, 'admin', 6, '5', 'Новый ресурс', 'Deleting resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(399, 1536845601, 1, 'admin', 3, '5', 'Новый ресурс', 'Viewing data for resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(400, 1536845631, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(401, 1536845633, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(402, 1536845638, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(403, 1536846920, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(404, 1536846940, 1, 'admin', 112, '1', 'Doc Manager', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(405, 1536847019, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(406, 1536847020, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(407, 1536847036, 1, 'admin', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(408, 1536847136, 1, 'admin', 120, '-', '-', 'Idle (unknown)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(409, 1536847393, 1, 'admin', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(410, 1536847472, 1, 'admin', 26, '-', 'Extras', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(411, 1536847534, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(412, 1536847541, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(413, 1536847547, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(414, 1536847562, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(415, 1536848792, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(416, 1536848928, 1, 'admin', 22, '5', 'DocLister', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(417, 1536849117, 1, 'admin', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(418, 1536849239, 1, 'admin', 17, '-', 'Extras', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(419, 1536849658, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(420, 1536849658, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(421, 1536849669, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(422, 1536849720, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(423, 1536849773, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(424, 1536849775, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(425, 1536849784, 1, 'admin', 106, '-', '-', 'Viewing Modules', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(426, 1536849809, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(427, 1536849812, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(428, 1536849837, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(429, 1536850333, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(430, 1536850669, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(431, 1536850671, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(432, 1536850714, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(433, 1536850732, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(434, 1536850786, 1, 'admin', 8, '-', '-', 'Logged out', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(435, 1536850795, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(436, 1536850824, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(437, 1536850855, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(438, 1536851362, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(439, 1536851364, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(440, 1536851370, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(441, 1536851415, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(442, 1536851634, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(443, 1536851641, 1, 'admin', 103, '13', 'SimpleGallery', 'Saving plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(444, 1536851641, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(445, 1536851651, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(446, 1536851660, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(447, 1536851661, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(448, 1536851689, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(449, 1536851745, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(450, 1536851787, 1, 'admin', 102, '4', 'Forgot Manager Login', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(451, 1536851800, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(452, 1536851802, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(453, 1536851886, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(454, 1536852093, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(455, 1536852126, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(456, 1536852454, 1, 'admin', 112, '2', 'Extras', 'Execute module', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(457, 1536852534, 1, 'admin', 17, '-', 'Extras', 'Editing settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(458, 1536852541, 1, 'admin', 114, '-', '-', 'View event log', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(459, 1536852545, 1, 'admin', 116, '-', '-', 'Delete event log', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(460, 1536852545, 1, 'admin', 114, '-', '-', 'View event log', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(461, 1536852548, 1, 'admin', 53, '-', '-', 'Viewing system info', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(462, 1536852601, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(463, 1536852853, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(464, 1536852859, 1, 'admin', 103, '13', 'SimpleGallery', 'Saving plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(465, 1536852859, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(466, 1536852863, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(467, 1536852893, 1, 'admin', 103, '13', 'SimpleGallery', 'Saving plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(468, 1536852893, 1, 'admin', 102, '13', 'SimpleGallery', 'Edit plugin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(469, 1536852898, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(470, 1536852907, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(471, 1536852924, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(472, 1536853522, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(473, 1536853720, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(474, 1536853720, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(475, 1536858182, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(476, 1536858194, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(477, 1536858198, 1, 'admin', 301, '8', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(478, 1536858236, 1, 'admin', 302, '8', 'Главный блок', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(479, 1536858236, 1, 'admin', 301, '8', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(480, 1536858629, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(481, 1536858733, 1, 'admin', 20, '4', 'Главная', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(482, 1536858733, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(483, 1536858739, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(484, 1536858756, 1, 'admin', 5, '1', 'Главная', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(485, 1536858756, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(486, 1536858881, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(487, 1536858881, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(488, 1536859034, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(489, 1536859253, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(490, 1536859253, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(491, 1536859548, 1, 'admin', 5, '2', 'Галерея', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(492, 1536859548, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(493, 1536859851, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(494, 1536859851, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(495, 1536859980, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(496, 1536859980, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(497, 1536860036, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(498, 1536860036, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(499, 1536862458, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(500, 1536862591, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(501, 1536863023, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(502, 1536863125, 1, 'admin', 302, '5', 'Изображение', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(503, 1536863125, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36');
INSERT INTO `cgck_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`, `ip`, `useragent`) VALUES
(504, 1536863138, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(505, 1536863204, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(506, 1536863245, 1, 'admin', 302, '5', 'Изображение', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(507, 1536863245, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(508, 1536863254, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(509, 1536863342, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(510, 1536864160, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(511, 1536864274, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(512, 1536864375, 1, 'admin', 5, '3', 'Блог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(513, 1536864375, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(514, 1536864473, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(515, 1536865550, 1, 'admin', 76, '-', '-', 'Element management', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(516, 1536867003, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(517, 1536867003, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(518, 1536867046, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(519, 1536867046, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(520, 1536867205, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(521, 1536867205, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(522, 1536867465, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(523, 1536867465, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(524, 1536867526, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(525, 1536867546, 1, 'admin', 302, '5', 'Изображение', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(526, 1536867546, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(527, 1536867558, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(528, 1536867613, 1, 'admin', 5, '3', 'Блог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(529, 1536867613, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(530, 1536867644, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(531, 1536867662, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(532, 1536867662, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(533, 1536867696, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(534, 1536867703, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(535, 1536867829, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(536, 1536867829, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(537, 1536869630, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(538, 1536869645, 1, 'admin', 301, '5', 'Изображение', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(539, 1536869731, 1, 'admin', 302, '5', 'Статья', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(540, 1536869731, 1, 'admin', 301, '5', 'Статья', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(541, 1536869783, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(542, 1536870041, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(543, 1536870059, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(544, 1536870306, 1, 'admin', 5, '3', 'Блог', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(545, 1536870306, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(546, 1536870334, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(547, 1536870363, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(548, 1536870427, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(549, 1536870427, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(550, 1536870586, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(551, 1536870770, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(552, 1536870777, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(553, 1536870888, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(554, 1536871416, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(555, 1536871416, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(556, 1536871541, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(557, 1536871541, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(558, 1536871567, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(559, 1536871572, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(560, 1536871577, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(561, 1536872676, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(562, 1536872676, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(563, 1536872703, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(564, 1536872798, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(565, 1536872809, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(566, 1536872810, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(567, 1536873047, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(568, 1536873054, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(569, 1536873245, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(570, 1536873248, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(571, 1536873311, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(572, 1536873314, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(573, 1536873377, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(574, 1536873379, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(575, 1536875192, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(576, 1536875214, 1, 'admin', 78, '2', 'mm_rules', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(577, 1536875248, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(578, 1536875373, 1, 'admin', 22, '6', 'FormLister', 'Editing Snippet', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(579, 1536878525, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(580, 1536878525, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(581, 1536878537, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(582, 1536878655, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(583, 1536878655, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(584, 1536878680, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(585, 1536878680, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(586, 1536878861, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(587, 1536878861, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(588, 1536878865, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(589, 1536879081, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(590, 1536879081, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(591, 1536879095, 1, 'admin', 5, '4', 'Контакты', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(592, 1536879095, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(593, 1536879099, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(594, 1536879405, 1, 'admin', 5, '4', 'Контакты', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(595, 1536879405, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(596, 1536879411, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(597, 1536879670, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(598, 1536879670, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(599, 1536879675, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(600, 1536879710, 1, 'admin', 5, '4', 'Контакты', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(601, 1536879710, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(602, 1536879751, 1, 'admin', 300, '-', 'Новый параметр (TV)', 'Create Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(603, 1536879792, 1, 'admin', 302, '-', 'address', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(604, 1536879792, 1, 'admin', 301, '9', 'address', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(605, 1536879812, 1, 'admin', 302, '9', 'Адрес', 'Save Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(606, 1536879812, 1, 'admin', 301, '9', 'Адрес', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(607, 1536880478, 1, 'admin', 301, '8', 'Главный блок', 'Edit Template Variable', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(608, 1536880486, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(609, 1536880533, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(610, 1536880533, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(611, 1536880550, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(612, 1536880631, 1, 'admin', 5, '4', 'Контакты', 'Saving resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(613, 1536880631, 1, 'admin', 27, '4', 'Контакты', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(614, 1536880634, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(615, 1536880635, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(616, 1536880728, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(617, 1536880744, 1, 'admin', 27, '1', 'Главная', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(618, 1536880759, 1, 'admin', 27, '2', 'Галерея', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(619, 1536880770, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(620, 1536880865, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(621, 1536881038, 1, 'admin', 20, '7', 'Контакты', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(622, 1536881038, 1, 'admin', 16, '7', 'Контакты', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(623, 1536881055, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'),
(624, 1536905864, 1, 'admin', 58, '-', 'MODX', 'Logged in', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(625, 1536906189, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(626, 1536906225, 1, 'admin', 16, '4', 'Главная', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(627, 1536907017, 1, 'admin', 67, '-', '-', 'Removing locks', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(628, 1536908186, 1, 'admin', 27, '3', 'Блог', 'Editing resource', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(629, 1536908200, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(630, 1536908360, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(631, 1536908432, 1, 'admin', 79, '-', 'categories', 'Saving Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(632, 1536908432, 1, 'admin', 78, '5', 'categories', 'Editing Chunk (HTML Snippet)', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(633, 1536908443, 1, 'admin', 20, '6', 'Блог', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(634, 1536908443, 1, 'admin', 16, '6', 'Блог', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(635, 1536908449, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(636, 1536908733, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(637, 1536909626, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(638, 1536909626, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(639, 1536909640, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(640, 1536909640, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(641, 1536909644, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(642, 1536910168, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(643, 1536910168, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(644, 1536910457, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(645, 1536910457, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(646, 1536910494, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(647, 1536910494, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(648, 1536910499, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(649, 1536910595, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(650, 1536910595, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(651, 1536910630, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(652, 1536910630, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(653, 1536910743, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(654, 1536910743, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(655, 1536910865, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(656, 1536910865, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(657, 1536911026, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(658, 1536911026, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(659, 1536911092, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(660, 1536911092, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(661, 1536911236, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(662, 1536911236, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(663, 1536911293, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(664, 1536911293, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(665, 1536911409, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(666, 1536911409, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(667, 1536911472, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(668, 1536911472, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(669, 1536911497, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(670, 1536911497, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(671, 1536911862, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(672, 1536911862, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(673, 1536911890, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(674, 1536911936, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(675, 1536911936, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(676, 1536912022, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(677, 1536912022, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(678, 1536912061, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(679, 1536912061, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(680, 1536912120, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(681, 1536912120, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(682, 1536912218, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(683, 1536912218, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(684, 1536912236, 1, 'admin', 26, '-', '-', 'Refreshing site', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(685, 1536912275, 1, 'admin', 20, '5', 'Галерея', 'Saving template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'),
(686, 1536912275, 1, 'admin', 16, '5', 'Галерея', 'Editing template', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_manager_users`
--

CREATE TABLE `cgck_manager_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.';

--
-- Дамп данных таблицы `cgck_manager_users`
--

INSERT INTO `cgck_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$P$Bi9NvlstCZNZqgRlZuv2NuhfMu3ALr/');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_membergroup_access`
--

CREATE TABLE `cgck_membergroup_access` (
  `id` int(10) NOT NULL,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_membergroup_names`
--

CREATE TABLE `cgck_membergroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_member_groups`
--

CREATE TABLE `cgck_member_groups` (
  `id` int(10) NOT NULL,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_sg_images`
--

CREATE TABLE `cgck_sg_images` (
  `sg_id` int(10) NOT NULL,
  `sg_image` text NOT NULL,
  `sg_title` varchar(255) NOT NULL DEFAULT '',
  `sg_description` text NOT NULL,
  `sg_properties` text NOT NULL,
  `sg_add` text NOT NULL,
  `sg_isactive` int(1) NOT NULL DEFAULT '1',
  `sg_rid` int(10) DEFAULT NULL,
  `sg_index` int(10) NOT NULL DEFAULT '0',
  `sg_createdon` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Datatable for SimpleGallery plugin.';

--
-- Дамп данных таблицы `cgck_sg_images`
--

INSERT INTO `cgck_sg_images` (`sg_id`, `sg_image`, `sg_title`, `sg_description`, `sg_properties`, `sg_add`, `sg_isactive`, `sg_rid`, `sg_index`, `sg_createdon`) VALUES
(1, 'assets/galleries/2/01.jpg', 'Pharetra rutrum purus', 'Turpis ante lobortis libero, nec imperdiet urna orci sit amet velit. Phasellus sed massa sit amet enim pulvinar sapien molestie.', '{\"width\":286,\"height\":163,\"size\":14076}', '', 1, 2, 0, '2018-09-13 18:38:46'),
(3, 'assets/galleries/2/02.jpg', 'Sed laoreet nulla', 'Sed quam felis, aliquam non tempor quis, pulvinar feugiat lacus. Nullam a urna ac metus ultrices cursus odio at rutrum accumsan.', '{\"width\":286,\"height\":163,\"size\":15876}', '', 1, 2, 1, '2018-09-13 18:38:46'),
(5, 'assets/galleries/2/03.jpg', 'Vestibulum semper erat', 'Aenean rutrum, velit in tincidunt ullamcorper, augue arcu cursus tortor, a pulvinar urna eros ut dolor faucibus et porta magna congue.', '{\"width\":286,\"height\":163,\"size\":15052}', '', 1, 2, 2, '2018-09-13 18:38:46'),
(7, 'assets/galleries/2/04.jpg', 'Condimentum ac eu lectus', 'Etiam faucibus aliquet turpis sit amet congue. Praesent at nulla id lectus mattis consequat. Ut rutrum blandit dui quis condimentum.', '{\"width\":286,\"height\":163,\"size\":15197}', '', 1, 2, 3, '2018-09-13 18:38:47'),
(9, 'assets/galleries/2/05.jpg', 'Duis ut eu lectus mollis', 'Vestibulum in mauris id nulla fermentum congue nec vel dolor erat libero iaculis metus, at suscipit metus est. Validate.', '{\"width\":286,\"height\":163,\"size\":13950}', '', 1, 2, 4, '2018-09-13 18:38:47'),
(11, 'assets/galleries/2/06.jpg', 'Cras dignissim venenatis', 'Ut gravida magna tempus et. Phasellus facilisis, mi sit amet semper convallis, lectus felis convallis ligula, et adipiscing libero dui at felis.', '{\"width\":286,\"height\":163,\"size\":15094}', '', 1, 2, 5, '2018-09-13 18:38:47');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_content`
--

CREATE TABLE `cgck_site_content` (
  `id` int(10) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';

--
-- Дамп данных таблицы `cgck_site_content`
--

INSERT INTO `cgck_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная', '', 'Домашняя страница', 'home', '', 1, 0, 0, 0, 0, '', '<p>Credit goes to hugoandcat.com for slider. Quisque imperdiet bibendum placerat. Ut sit amet nisl ut sapien dictum placerat ac eu sem. Curabitur sit amet lacus nisl. Suspendisse euismod dapibus nisi, sed posuere lorem hendrerit in. Donec ut pulvinar urna. Mauris dignissim ligula ac lectus commodo consequat. Nullam lacinia odio sem.Aliquam nec elit nisl, accumsan sollicitudin nulla. Nunc rhoncus, odio viverra tempor vehicula, orci ipsum vulputate urna, nec et lacus.Nunc euismod augue volutpat ipsum facilisis luctus. Nulla fermentum eleifend est, in convallis sem vulputate vitae. Nam eget tempus justo.Aliquam nec elit nisl, accumsan sollicitudin nulla. Nunc rhoncus, odio viverra tempor vehicula, orci ipsum vulputate urna, nec et lacus.</p>', 1, 4, 0, 1, 1, 1, 1130304721, 1, 1536858756, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'Галерея', '', 'Галерея', 'portfolio', '', 1, 0, 0, 0, 0, '', '', 1, 5, 1, 1, 1, 1, 1536788227, 1, 1536859548, 0, 0, 0, 1536788227, 1, '', 0, 0, 0, 0, 0, 1),
(3, 'document', 'text/html', 'Блог', '', 'Блог', 'blog', '', 1, 0, 0, 0, 0, '', '', 1, 6, 2, 1, 1, 1, 1536788377, 1, 1536870306, 0, 0, 0, 1536788377, 1, '', 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Контакты', '', 'Контакты', 'contact', '', 1, 0, 0, 0, 0, '', '<h1>Contact Information</h1>\r\n<p>&nbsp;</p>\r\n<h4>Send us a message now!</h4>\r\n<p>&nbsp;</p>\r\n<p>Curabitur ullamcorper mi eget diam eleifend eu congue urna pellentesque. Nam turpis nibh, imperdiet ultricies consequat eget, posuere sed nisi. Mauris tortor leo, sagittis non molestie quis, vehicula vitae ligula. Validate.</p>', 1, 7, 3, 1, 1, 1, 1536788474, 1, 1536880631, 0, 0, 0, 1536788474, 1, '', 0, 0, 0, 0, 0, 1),
(5, 'document', 'text/html', 'Новый ресурс', '', '', 'novyj-resurs', '', 1, 0, 0, 0, 1, '', '', 1, 3, 4, 1, 1, 1, 1536845586, 1, 1536845586, 1, 1536845601, 1, 1536845586, 1, '', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_htmlsnippets`
--

CREATE TABLE `cgck_site_htmlsnippets` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';

--
-- Дамп данных таблицы `cgck_site_htmlsnippets`
--

INSERT INTO `cgck_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'header', 'sample header scripts', 2, 'none', 2, 0, '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=[(modx_charset)]\" /> \r\n<title>[*titl*]</title>\r\n[*noIndex*]\r\n<meta name=\"keywords\" content=\"[*keyw*]\" />\r\n<meta name=\"description\" content=\"[*desc*]\" />\r\n<base href=\"[(site_url)]\"/>\r\n<link href=\"theme/css/templatemo_style.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"theme/css/ddsmoothmenu.css\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"theme/css/jquery.dualSlider.0.2.css\" />\r\n\r\n<link rel=\"stylesheet\" href=\"theme/css/slimbox2.css\" type=\"text/css\" media=\"screen\" /> \r\n\r\n</head>\r\n<body>\r\n<div id=\"templatemo_header_wrapper\">\r\n	<div id=\"templatemo_header\">\r\n    	<div id=\"site_title\"><a href=\"[(site_url)]\">[*titl*]</a></div>\r\n        <div id=\"templatemo_menu\" class=\"ddsmoothmenu\">\r\n			 [[DLMenu?\r\n			  &parents=`0`\r\n			  &outerTpl=`@CODE:<ul[+classes+]>[+wrap+]</ul>`\r\n			  &rowTpl=`@CODE:<li[+classes+]><a href=\"[+url+]\">[+title+]</a></li>`\r\n			]]\r\n            <br style=\"clear: left\" />\r\n        </div> <!-- end of templatemo_menu -->\r\n        <div class=\"clear\"></div>\r\n    </div> <!-- END of header -->\r\n</div> <!-- END of header wrapper -->\r\n', 0, 0, 1536840994, 0),
(2, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 3, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nif ($modx->db->getValue($modx->db->select(\'count(id)\', $modx->getFullTableName(\'site_tmplvars\'), \"name=\'documentTags\'\"))) {\r\n	mm_widget_tags(\'documentTags\', \' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n}\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\nmm_createTab(\'SEO\', \'seo\', \'\', \'\', \'\', \'\');\r\nmm_moveFieldsToTab(\'titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');\r\nmm_widget_tags(\'keyw\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n\r\n\r\n//mm_createTab(\'Images\', \'photos\', \'\', \'\', \'\', \'850\');\r\n//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');\r\n\r\n//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');\r\n\r\n//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');\r\n\r\n//mm_hideTabs(\'settings, access\', \'2\');\r\n', 0, 0, 0, 0),
(3, 'footer', 'sample footer', 2, 'none', 2, 0, '<div id=\"templatemo_footer_wrapper\">\r\n	<div id=\"templatemo_footer\">\r\n    	<div class=\"col one_fourth\">\r\n            <h4>Photo Gallery</h4>\r\n            <ul class=\"footer_gallery\">\r\n            	<li><img src=\"theme/images/templatemo_image_03.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_04.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_05.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_06.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_07.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_08.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_09.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_10.jpg\" alt=\"image\" /></li>\r\n                <li><img src=\"theme/images/templatemo_image_11.jpg\" alt=\"image\" /></li>\r\n            </ul>\r\n            <div class=\"clear\"></div>\r\n            <a href=\"portfolio\" class=\"more\">more</a>\r\n        </div>\r\n        <div class=\"col one_fourth\">\r\n            <h4>Recent Posts</h4>\r\n            <ul class=\"no_bullet\">\r\n                <li>\r\n                    <span class=\"header\"><a href=\"#\">Pellentesque nec tempus</a></span>\r\n                    Phasellus porttitor lacus vel risus ullamcorper tempor.\r\n                </li>\r\n                <li>\r\n                    <span class=\"header\"><a href=\"#\">Ipsum dolor sit amet</a></span>\r\n                    Nunc facilisis auctor metus, at mollis urna dictum sit amet.\r\n                </li>\r\n                <li>\r\n                    <span class=\"header\"><a href=\"#\">Morbi tincidunt dictum leo</a></span>\r\n                    Aliquam aliquam lacus eros, ut cursus augue dolor. \r\n                </li>\r\n            </ul>\r\n        </div>\r\n        <div class=\"col one_fourth\">\r\n            <h4>Twitter</h4>\r\n            <ul class=\"no_bullet\">\r\n                <li><a href=\"#\">@templatemo</a> at scelerisque urna in tellus varius ultricies.</li>\r\n                <li>Suspendisse enean <a href=\"#\">#FREE</a> tincidunt massa in tellus varius ultricies.</li>\r\n                <li>Aenean tincidunt massa in tellus varius ultricies. <a href=\"#\">http://bit.ly/13IwZO</a></li>\r\n                <li>Vulputate odio sit amet adipiscing lacus. <a href=\"#\">http://bit.ly/IyyUoO</a></li>\r\n            </ul>\r\n        </div>\r\n        <div class=\"col one_fourth no_margin_right\">\r\n            <h4>About</h4>\r\n            <p>\r\n                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porttitor lacus vel risus ullamcorper tempor. Pellentesque vestibulum vulputate odio sit amet adipiscing. Nunc facilisis auctor metus, at mollis urna dictum sit amet.</p>\r\n                Copyright © 2048 <a href=\"#\">Your Company Name</a> <!-- Credit: www.templatemo.com -->\r\n        </div>\r\n        <div class=\"clear\"></div>\r\n    </div> <!-- END of footer -->\r\n</div> <!-- END of footer wrapper -->\r\n<script type=\"text/javascript\" src=\"theme/js/jquery.min.js\"></script>\r\n<script type=\"text/javascript\" src=\"theme/js/ddsmoothmenu.js\">\r\n<script src=\"theme/js/jquery-1.3.2.min.js\" type=\"text/javascript\"></script>\r\n<script src=\"theme/js/jquery.easing.1.3.js\" type=\"text/javascript\"></script>\r\n<script src=\"theme/js/jquery.timers-1.2.js\" type=\"text/javascript\"></script>\r\n<script type=\"text/javascript\" src=\"theme/js/jquery-1-4-2.min.js\"></script> \r\n<script type=\"text/JavaScript\" src=\"theme/js/slimbox2.js\"></script> \r\n</body>\r\n</html>', 0, 1536786281, 1536841802, 0),
(5, 'categories', 'Категории статей', 2, 'none', 0, 0, '<div id=\"sidebar\" class=\"right\">\r\n    	<div class=\"sidebar_box\">\r\n            <h3>Categories</h3>\r\n            <ul class=\"list_bullet\">\r\n                <li>Augue felis pharetra felis</li>\r\n                <li>Condimentum vulputate augue</li>\r\n                <li>Dolor vel condimentum sed</li>\r\n                <li>Felis pharetra felis erat</li>\r\n                <li>Integer placerat dolor vel</li>\r\n                <li>Tortor mi in massa donec</li>\r\n                <li>Vulputate tortor mi in massa</li>\r\n            </ul>\r\n		</div>\r\n       \r\n    </div> <!-- END of sidebar -->', 0, 1536908432, 1536908432, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_modules`
--

CREATE TABLE `cgck_site_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Modules';

--
-- Дамп данных таблицы `cgck_site_modules`
--

INSERT INTO `cgck_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.3</strong> first repository for Evolution CMS', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for Evolution CMS\r\n * \r\n * @category	module\r\n * @version 	0.1.3\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_module_access`
--

CREATE TABLE `cgck_site_module_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_module_depobj`
--

CREATE TABLE `cgck_site_module_depobj` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_plugins`
--

CREATE TABLE `cgck_site_plugins` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';

--
-- Дамп данных таблицы `cgck_site_plugins`
--

INSERT INTO `cgck_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(1, 'CodeMirror', '<strong>1.5</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)', 0, 4, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.33 (released on 21-12-2017)\r\n *\r\n * @category    plugin\r\n * @version     1.5\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &darktheme=Dark Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;one-dark &fontSize=Font-size;list;10,11,12,13,14,15,16,17,18;14 &lineHeight=Line-height;list;1,1.1,1.2,1.3,1.4,1.5;1.3 &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/evolution-cms/evolution/issues/\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @author      update 64j\r\n * @lastupdate  08-01-2018\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');', 0, '{\"theme\":[{\"label\":\"Theme\",\"type\":\"list\",\"value\":\"default\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"default\",\"desc\":\"\"}],\"darktheme\":[{\"label\":\"Dark Theme\",\"type\":\"list\",\"value\":\"one-dark\",\"options\":\"default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,one-dark,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light\",\"default\":\"one-dark\",\"desc\":\"\"}],\"fontSize\":[{\"label\":\"Font-size\",\"type\":\"list\",\"value\":\"14\",\"options\":\"10,11,12,13,14,15,16,17,18\",\"default\":\"14\",\"desc\":\"\"}],\"lineHeight\":[{\"label\":\"Line-height\",\"type\":\"list\",\"value\":\"1.3\",\"options\":\"1,1.1,1.2,1.3,1.4,1.5\",\"default\":\"1.3\",\"desc\":\"\"}],\"indentUnit\":[{\"label\":\"Indent unit\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"tabSize\":[{\"label\":\"The width of a tab character\",\"type\":\"int\",\"value\":\"4\",\"default\":\"4\",\"desc\":\"\"}],\"lineWrapping\":[{\"label\":\"lineWrapping\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"matchBrackets\":[{\"label\":\"matchBrackets\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"activeLine\":[{\"label\":\"activeLine\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"emmet\":[{\"label\":\"emmet\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"search\":[{\"label\":\"search\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"indentWithTabs\":[{\"label\":\"indentWithTabs\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"undoDepth\":[{\"label\":\"undoDepth\",\"type\":\"int\",\"value\":\"200\",\"default\":\"200\",\"desc\":\"\"}],\"historyEventDelay\":[{\"label\":\"historyEventDelay\",\"type\":\"int\",\"value\":\"1250\",\"default\":\"1250\",\"desc\":\"\"}]}', 0, '', 0, 0),
(2, 'ElementsInTree', '<strong>1.5.9</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n', 0, '{\"adminRoleOnly\":[{\"label\":\"Administrators only\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"treeButtonsInTab\":[{\"label\":\"Tree buttons in tab\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}]}', 1, '', 0, 0),
(3, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';', 0, '', 0, '', 0, 0),
(4, 'Forgot Manager Login', '<strong>1.1.7</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '', 0, '', 0, 0),
(5, 'ManagerManager', '<strong>0.6.3</strong> Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.', 0, 4, 0, '\n/**\n * ManagerManager\n *\n * Customize the EVO Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.3\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  22/01/2018\n */\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');\n', 0, '{\"remove_deprecated_tv_types_pref\":[{\"label\":\"Remove deprecated TV types\",\"type\":\"list\",\"value\":\"yes\",\"options\":\"yes,no\",\"default\":\"yes\",\"desc\":\"\"}],\"config_chunk\":[{\"label\":\"Configuration Chunk\",\"type\":\"text\",\"value\":\"mm_rules\",\"default\":\"mm_rules\",\"desc\":\"\"}]}', 0, '', 0, 0),
(6, 'OutdatedExtrasCheck', '<strong>1.4.0</strong> Check for Outdated critical extras not compatible with EVO 1.4.0', 0, 4, 0, '/**\r\n * OutdatedExtrasCheck\r\n *\r\n * Check for Outdated critical extras not compatible with EVO 1.4.0\r\n *\r\n * @category	plugin\r\n * @version     1.4.0 \r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     evo\r\n * @author      Author: Nicola Lambathakis\r\n * @internal    @events OnManagerWelcomeHome\r\n * @internal    @properties &wdgVisibility=Show widget for:;menu;All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly;All &ThisRole=Run only for this role:;string;;;(role id) &ThisUser=Run only for this user:;string;;;(username) &DittoVersion=Min Ditto version:;string;2.1.3 &EformVersion=Min eForm version:;string;1.4.9 &AjaxSearchVersion=Min AjaxSearch version:;string;1.11.0 &WayfinderVersion=Min Wayfinder version:;string;2.0.5 &WebLoginVersion=Min WebLogin version:;string;1.2 &WebSignupVersion=Min WebSignup version:;string;1.1.2 &WebChangePwdVersion=Min WebChangePwd version:;string;1.1.2 &BreadcrumbsVersion=Min Breadcrumbs version:;string;1.0.5 &ReflectVersion=Min Reflect version:;string;2.2 &JotVersion=Min Jot version:;string;1.1.5 &MtvVersion=Min multiTV version:;string;2.0.13 &badthemes=Outdated Manager Themes:;string;MODxRE2_DropdownMenu,MODxRE2,MODxRE,MODxCarbon,D3X,MODxFLAT,wMOD,ScienceStyle\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @installset base\r\n * @internal    @disabled 0\r\n */\r\n\r\n// get manager role check\r\n$internalKey = $modx->getLoginUserID();\r\n$sid = $modx->sid;\r\n$role = $_SESSION[\'mgrRole\'];\r\n$user = $_SESSION[\'mgrShortname\'];\r\n// show widget only to Admin role 1\r\nif(($role!=1) AND ($wdgVisibility == \'AdminOnly\')) {}\r\n// show widget to all manager users excluded Admin role 1\r\nelse if(($role==1) AND ($wdgVisibility == \'AdminExcluded\')) {}\r\n// show widget only to \"this\" role id\r\nelse if(($role!=$ThisRole) AND ($wdgVisibility == \'ThisRoleOnly\')) {}\r\n// show widget only to \"this\" username\r\nelse if(($user!=$ThisUser) AND ($wdgVisibility == \'ThisUserOnly\')) {}\r\nelse {\r\n// get plugin id and setting button\r\n$result = $modx->db->select(\'id\', $this->getFullTableName(\"site_plugins\"), \"name=\'{$modx->event->activePlugin}\' AND disabled=0\");\r\n$pluginid = $modx->db->getValue($result);\r\nif($modx->hasPermission(\'edit_plugin\')) {\r\n$button_pl_config = \'<a data-toggle=\"tooltip\" href=\"javascript:;\" title=\"\' . $_lang[\"settings_config\"] . \'\" class=\"text-muted pull-right\" onclick=\"parent.modx.popup({url:\\\'\'. MODX_MANAGER_URL.\'?a=102&id=\'.$pluginid.\'&tab=1\\\',title1:\\\'\' . $_lang[\"settings_config\"] . \'\\\',icon:\\\'fa-cog\\\',iframe:\\\'iframe\\\',selector2:\\\'#tabConfig\\\',position:\\\'center center\\\',width:\\\'80%\\\',height:\\\'80%\\\',hide:0,hover:0,overlay:1,overlayclose:1})\" ><i class=\"fa fa-cog fa-spin-hover\" style=\"color:#FFFFFF;\"></i> </a>\';\r\n}\r\n$modx->setPlaceholder(\'button_pl_config\', $button_pl_config);\r\n//plugin lang\r\n$_oec_lang = array();\r\n$plugin_path = $modx->config[\'base_path\'] . \"assets/plugins/extrascheck/\";\r\ninclude($plugin_path . \'lang/english.php\');\r\nif (file_exists($plugin_path . \'lang/\' . $modx->config[\'manager_language\'] . \'.php\')) {\r\ninclude($plugin_path . \'lang/\' . $modx->config[\'manager_language\'] . \'.php\');\r\n}\r\n//run the plugin\r\n// get globals\r\nglobal $modx,$_lang;\r\n//function to extract snippet version from description <strong></strong> tags \r\nif (!function_exists(\'getver\')) {\r\nfunction getver($string, $tag)\r\n{\r\n$content =\"/<$tag>(.*?)<\\/$tag>/\";\r\npreg_match($content, $string, $text);\r\nreturn $text[1];\r\n	}\r\n}\r\n$e = &$modx->Event;\r\n$EVOversion = $modx->config[\'settings_version\'];\r\n$output = \'\';\r\n//get extras module id for the link\r\n$modtable = $modx->getFullTableName(\'site_modules\');\r\n$getExtra = $modx->db->select( \"id, name\", $modtable, \"name=\'Extras\'\" );\r\nwhile( $row = $modx->db->getRow( $getExtra ) ) {\r\n$ExtrasID = $row[\'id\'];\r\n}\r\n//check outdated files\r\n//ajax index\r\n$indexajax = \"../index-ajax.php\";\r\nif (file_exists($indexajax)){\r\n    $output .= \'<div class=\"widget-wrapper alert alert-danger\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>index-ajax.php</b> \'.$_oec_lang[\'not_used\'].\' <b>Evolution \'.$EVOversion.\'</b>.  \'.$_oec_lang[\'if_dont_use\'].\', \'.$_oec_lang[\'please_delete\'].\'.</div>\';\r\n}\r\n//check outdated default manager themes\r\n$oldthemes = explode(\",\",\"$badthemes\");\r\nforeach ($oldthemes as $oldtheme){\r\n	if (file_exists(\'media/style/\'.$oldtheme)){\r\n    $output .= \'<div class=\"widget-wrapper alert alert-danger\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\'.$oldtheme.\'</b> \'.$_lang[\"manager_theme\"].\',  \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>.   \'.$_oec_lang[\'please_delete\'].\' \'.$_oec_lang[\'from_folder\'].\' \' . MODX_MANAGER_PATH . \'media/style/.</div>\';\r\n}\r\n}	\r\n//get site snippets table\r\n$table = $modx->getFullTableName(\'site_snippets\');\r\n//check ditto\r\n//get min version from config\r\n$minDittoVersion = $DittoVersion;\r\n//search the snippet by name\r\n$CheckDitto = $modx->db->select( \"id, name, description\", $table, \"name=\'Ditto\'\" );\r\nif($CheckDitto != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckDitto ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_ditto_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_ditto_version,$minDittoVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_ditto_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minDittoVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>DocLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check ditto\r\n\r\n//check eform\r\n//get min version from config\r\n$minEformVersion = $EformVersion;\r\n//search the snippet by name\r\n$CheckEform = $modx->db->select( \"id, name, description\", $table, \"name=\'eForm\'\" );\r\nif($CheckEform != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckEform ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Eform_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Eform_version,$minEformVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Eform_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minEformVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check eform\r\n	\r\n//check AjaxSearch\r\n//get min version from config\r\n$minAjaxSearchVersion = $AjaxSearchVersion;\r\n//search the snippet by name\r\n$CheckAjaxSearch = $modx->db->select( \"id, name, description\", $table, \"name=\'AjaxSearch\'\" );\r\nif($CheckAjaxSearch != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckAjaxSearch ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_AjaxSearch_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_AjaxSearch_version,$minAjaxSearchVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_AjaxSearch_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minAjaxSearchVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check AjaxSearch	\r\n	\r\n//check Wayfinder\r\n//get min version from config\r\n$minWayfinderVersion = $WayfinderVersion;\r\n//search the snippet by name\r\n$CheckWayfinder = $modx->db->select( \"id, name, description\", $table, \"name=\'Wayfinder\'\" );\r\nif($CheckWayfinder != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWayfinder ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Wayfinder_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Wayfinder_version,$minWayfinderVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Wayfinder_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWayfinderVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Wayfinder\r\n	\r\n//check WebLogin\r\n//get min version from config\r\n$minWebLoginVersion = $WebLoginVersion;\r\n//search the snippet by name\r\n$CheckWebLogin = $modx->db->select( \"id, name, description\", $table, \"name=\'WebLogin\'\" );\r\nif($CheckWebLogin != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWebLogin ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_WebLogin_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_WebLogin_version,$minWebLoginVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_WebLogin_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWebLoginVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check WebLogin\r\n\r\n//check WebChangePwd\r\n//get min version from config\r\n$minWebChangePwdVersion = $WebChangePwdVersion;\r\n//search the snippet by name\r\n$CheckWebChangePwd = $modx->db->select( \"id, name, description\", $table, \"name=\'WebChangePwd\'\" );\r\nif($CheckWebLogin != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWebChangePwd ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_WebChangePwd_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_WebChangePwd_version,$minWebChangePwdVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_WebChangePwd_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWebChangePwdVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check WebChangePwd\r\n	\r\n//check WebSignup\r\n//get min version from config\r\n$minWebSignupVersion = $WebSignupVersion;\r\n//search the snippet by name\r\n$CheckWebSignup = $modx->db->select( \"id, name, description\", $table, \"name=\'WebSignup\'\" );\r\nif($CheckWebSignup != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckWebSignup ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_WebSignup_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_WebSignup_version,$minWebSignupVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_WebSignup_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minWebSignupVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a> \'.$_oec_lang[\'or_move_to\'].\' <b>FormLister</b></div>\';\r\n		}\r\n	}\r\n} \r\n//end check WebSignup\r\n\r\n//check Breadcrumbs\r\n//get min version from config\r\n$minBreadcrumbsVersion = $BreadcrumbsVersion;\r\n//search the snippet by name\r\n$CheckBreadcrumbs = $modx->db->select( \"id, name, description\", $table, \"name=\'Breadcrumbs\'\" );\r\nif($CheckBreadcrumbs != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckBreadcrumbs ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Breadcrumbs_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Breadcrumbs_version,$minBreadcrumbsVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Breadcrumbs_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minBreadcrumbsVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Breadcrumbs\r\n\r\n//check Reflect\r\n//get min version from config\r\n$minReflectVersion = $ReflectVersion;\r\n//search the snippet by name\r\n$CheckReflect = $modx->db->select( \"id, name, description\", $table, \"name=\'Reflect\'\" );\r\nif($CheckReflect != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckReflect ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Reflect_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Reflect_version,$minReflectVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Reflect_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minReflectVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Reflect\r\n\r\n//check Jot\r\n//get min version from config\r\n$minJotVersion = $JotVersion;\r\n//search the snippet by name\r\n$CheckJot = $modx->db->select( \"id, name, description\", $table, \"name=\'Jot\'\" );\r\nif($CheckJot != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckJot ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_Jot_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_Jot_version,$minJotVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_Jot_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minJotVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a>.</div>\';\r\n		}\r\n	}\r\n} \r\n//end check Jot\r\n	\r\n//check Multitv\r\n//get min version from config\r\n$minMtvVersion = $MtvVersion;\r\n//search the snippet by name\r\n$CheckMtv = $modx->db->select( \"id, name, description\", $table, \"name=\'multiTV\'\" );\r\nif($CheckMtv != \'\'){\r\nwhile( $row = $modx->db->getRow( $CheckMtv ) ) {\r\n//extract snippet version from description <strong></strong> tags \r\n$curr_mtv_version = getver($row[\'description\'],\"strong\");\r\n//check snippet version and return an alert if outdated\r\nif (version_compare($curr_mtv_version,$minMtvVersion,\'lt\')){\r\n$output .= \'<div class=\"widget-wrapper alert alert-warning\"><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i> <b>\' . $row[\'name\'] . \'</b> \'.$_lang[\"snippet\"].\' (version \' . $curr_mtv_version . \') \'.$_oec_lang[\'isoutdated\'].\' <b>Evolution \'.$EVOversion.\'</b>. \'.$_oec_lang[\'please_update\'].\' <b>\' . $row[\'name\'] . \'</b> \'.$_oec_lang[\"to_latest\"].\' (\'.$_oec_lang[\'min _required\'].\' \'.$minMtvVersion.\') \'.$_oec_lang[\'from\'].\' <a target=\"main\" href=\"index.php?a=112&id=\'.$ExtrasID.\'\">\'.$_oec_lang[\'extras_module\'].\'</a></div>\';\r\n		}\r\n	}\r\n} \r\n//end check Multitv\r\n\r\nif($output != \'\'){\r\nif($e->name == \'OnManagerWelcomeHome\') {\r\n$out = $output;\r\n$wdgTitle = \'EVO \'.$EVOversion.\' - \'.$_oec_lang[\'title\'].\'\';\r\n$widgets[\'xtraCheck\'] = array(\r\n				\'menuindex\' =>\'0\',\r\n				\'id\' => \'xtraCheck\'.$pluginid.\'\',\r\n				\'cols\' => \'col-12\',\r\n                \'headAttr\' => \'style=\"background-color:#B60205; color:#FFFFFF;\"\',\r\n				\'bodyAttr\' => \'\',\r\n				\'icon\' => \'fa-warning\',\r\n				\'title\' => \'\'.$wdgTitle.\' \'.$button_pl_config.\'\',\r\n				\'body\' => \'<div class=\"card-body\">\'.$out.\'</div>\',\r\n				\'hide\' => \'0\'\r\n			);	\r\n            $e->output(serialize($widgets));\r\nreturn;\r\n		}\r\n	}\r\n}', 0, '{\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Run only for this role:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Run only for this user:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"DittoVersion\":[{\"label\":\"Min Ditto version:\",\"type\":\"string\",\"value\":\"2.1.3\",\"default\":\"2.1.3\",\"desc\":\"\"}],\"EformVersion\":[{\"label\":\"Min eForm version:\",\"type\":\"string\",\"value\":\"1.4.9\",\"default\":\"1.4.9\",\"desc\":\"\"}],\"AjaxSearchVersion\":[{\"label\":\"Min AjaxSearch version:\",\"type\":\"string\",\"value\":\"1.11.0\",\"default\":\"1.11.0\",\"desc\":\"\"}],\"WayfinderVersion\":[{\"label\":\"Min Wayfinder version:\",\"type\":\"string\",\"value\":\"2.0.5\",\"default\":\"2.0.5\",\"desc\":\"\"}],\"WebLoginVersion\":[{\"label\":\"Min WebLogin version:\",\"type\":\"string\",\"value\":\"1.2\",\"default\":\"1.2\",\"desc\":\"\"}],\"WebSignupVersion\":[{\"label\":\"Min WebSignup version:\",\"type\":\"string\",\"value\":\"1.1.2\",\"default\":\"1.1.2\",\"desc\":\"\"}],\"WebChangePwdVersion\":[{\"label\":\"Min WebChangePwd version:\",\"type\":\"string\",\"value\":\"1.1.2\",\"default\":\"1.1.2\",\"desc\":\"\"}],\"BreadcrumbsVersion\":[{\"label\":\"Min Breadcrumbs version:\",\"type\":\"string\",\"value\":\"1.0.5\",\"default\":\"1.0.5\",\"desc\":\"\"}],\"ReflectVersion\":[{\"label\":\"Min Reflect version:\",\"type\":\"string\",\"value\":\"2.2\",\"default\":\"2.2\",\"desc\":\"\"}],\"JotVersion\":[{\"label\":\"Min Jot version:\",\"type\":\"string\",\"value\":\"1.1.5\",\"default\":\"1.1.5\",\"desc\":\"\"}],\"MtvVersion\":[{\"label\":\"Min multiTV version:\",\"type\":\"string\",\"value\":\"2.0.13\",\"default\":\"2.0.13\",\"desc\":\"\"}],\"badthemes\":[{\"label\":\"Outdated Manager Themes:\",\"type\":\"string\",\"value\":\"MODxRE2_DropdownMenu,MODxRE2,MODxRE,MODxCarbon,D3X,MODxFLAT,wMOD,ScienceStyle\",\"default\":\"MODxRE2_DropdownMenu,MODxRE2,MODxRE,MODxCarbon,D3X,MODxFLAT,wMOD,ScienceStyle\",\"desc\":\"\"}]}', 0, '', 0, 0),
(7, 'Quick Manager+', '<strong>1.5.10</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '\r\n/**\r\n * Quick Manager+\r\n * \r\n * Enables QuickManager+ front end content editing support\r\n *\r\n * @category 	plugin\r\n * @version 	1.5.10\r\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\r\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;false &noconflictjq=jQuery noConflict mode in front-end;list;true,false;false &loadfa=Load Font Awesome css in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &position= Toolbar position;list;top,right,bottom,left,before;top &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv &removeBg=Remove toolbar background;list;yes,no;no &buttonStyle=QuickManager buttons CSS stylesheet;list;actionButtons,navButtons;navButtons  \r\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @legacy_names QM+,QuickEdit\r\n * @internal    @installset base, sample\r\n * @internal    @disabled 1\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\r\n * @link        http://www.maagit.fi/modx/quickmanager-plus\r\n * @author      Mikko Lammi\r\n * @author      Since 2011: yama, dmi3yy, segr, Nicola1971.\r\n * @lastupdate  02/02/2018 \r\n */\r\n\r\n// In manager\r\nif (!$modx->checkSession()) return;\r\n\r\n$show = TRUE;\r\n\r\nif ($disabled  != \'\') {\r\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\r\n    if (in_array($modx->documentIdentifier, $arr)) {\r\n        $show = FALSE;\r\n    }\r\n}\r\n\r\nif ($show) {\r\n    // Replace [*#tv*] with QM+ edit TV button placeholders\r\n    if ($tvbuttons == \'true\') {\r\n        if ($modx->event->name == \'OnParseDocument\') {\r\n             $output = &$modx->documentOutput;\r\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\r\n             $modx->documentOutput = $output;\r\n         }\r\n     }\r\n    include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\r\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadfa, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $position, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass, $buttonStyle, $removeBg);\r\n}\r\n', 0, '{\"jqpath\":[{\"label\":\"Path to jQuery\",\"type\":\"text\",\"value\":\"assets\\/js\\/jquery.min.js\",\"default\":\"assets\\/js\\/jquery.min.js\",\"desc\":\"\"}],\"loadmanagerjq\":[{\"label\":\"Load jQuery in manager\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfrontendjq\":[{\"label\":\"Load jQuery in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"noconflictjq\":[{\"label\":\"jQuery noConflict mode in front-end\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"loadfa\":[{\"label\":\"Load Font Awesome css in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"loadtb\":[{\"label\":\"Load modal box in front-end\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tbwidth\":[{\"label\":\"Modal box window width\",\"type\":\"text\",\"value\":\"80%\",\"default\":\"80%\",\"desc\":\"\"}],\"tbheight\":[{\"label\":\"Modal box window height\",\"type\":\"text\",\"value\":\"90%\",\"default\":\"90%\",\"desc\":\"\"}],\"hidefields\":[{\"label\":\"Hide document fields from front-end editors\",\"type\":\"text\",\"value\":\"parent\",\"default\":\"parent\",\"desc\":\"\"}],\"hidetabs\":[{\"label\":\"Hide document tabs from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"hidesections\":[{\"label\":\"Hide document sections from front-end editors\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"addbutton\":[{\"label\":\"Show add document here button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"tpltype\":[{\"label\":\"New document template type\",\"type\":\"list\",\"value\":\"parent\",\"options\":\"parent,id,selected\",\"default\":\"parent\",\"desc\":\"\"}],\"tplid\":[{\"label\":\"New document template id\",\"type\":\"int\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"custombutton\":[{\"label\":\"Custom buttons\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"managerbutton\":[{\"label\":\"Show go to manager button\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"logout\":[{\"label\":\"Logout to\",\"type\":\"list\",\"value\":\"manager\",\"options\":\"manager,front-end\",\"default\":\"manager\",\"desc\":\"\"}],\"disabled\":[{\"label\":\"Plugin disabled on documents\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"autohide\":[{\"label\":\"Autohide toolbar\",\"type\":\"list\",\"value\":\"true\",\"options\":\"true,false\",\"default\":\"true\",\"desc\":\"\"}],\"position\":[{\"label\":\"Toolbar position\",\"type\":\"list\",\"value\":\"top\",\"options\":\"top,right,bottom,left,before\",\"default\":\"top\",\"desc\":\"\"}],\"editbuttons\":[{\"label\":\"Inline edit buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"editbclass\":[{\"label\":\"Edit button CSS class\",\"type\":\"text\",\"value\":\"qm-edit\",\"default\":\"qm-edit\",\"desc\":\"\"}],\"newbuttons\":[{\"label\":\"Inline new resource buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"newbclass\":[{\"label\":\"New resource button CSS class\",\"type\":\"text\",\"value\":\"qm-new\",\"default\":\"qm-new\",\"desc\":\"\"}],\"tvbuttons\":[{\"label\":\"Inline template variable buttons\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"tvbclass\":[{\"label\":\"Template variable button CSS class\",\"type\":\"text\",\"value\":\"qm-tv\",\"default\":\"qm-tv\",\"desc\":\"\"}],\"removeBg\":[{\"label\":\"Remove toolbar background\",\"type\":\"list\",\"value\":\"no\",\"options\":\"yes,no\",\"default\":\"no\",\"desc\":\"\"}],\"buttonStyle\":[{\"label\":\"QuickManager buttons CSS stylesheet\",\"type\":\"list\",\"value\":\"navButtons\",\"options\":\"actionButtons,navButtons\",\"default\":\"navButtons\",\"desc\":\"\"}]}', 1, '', 0, 0),
(8, 'TinyMCE4', '<strong>4.7.4</strong> Javascript rich text editor', 0, 4, 0, '\n/**\n * TinyMCE4\n *\n * Javascript rich text editor\n *\n * @category    plugin\n * @version     4.7.4\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal    @properties &styleFormats=Custom Style Formats <b>RAW</b><br/><br/><ul><li>leave empty to use below block/inline formats</li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2</i></li><li>Also accepts full JSON-config as per TinyMCE4 docs / configure / content-formating / style_formats</li></ul>;textarea; &styleFormats_inline=Custom Style Formats <b>INLINE</b><br/><br/><ul><li>will wrap selected text with span-tag + css-class</li><li>simple-format only</li></ul>;textarea;InlineTitle,cssClass1|InlineTitle2,cssClass2 &styleFormats_block=Custom Style Formats <b>BLOCK</b><br/><br/><ul><li>will add css-class to selected block-element</li><li>simple-format only</li></ul>;textarea;BlockTitle,cssClass3|BlockTitle2,cssClass4 &customParams=Custom Parameters<br/><b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to \"introtext\";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled &paste_as_text=<b>Force Paste as Text</b>;list;enabled,disabled;disabled\n * @internal    @events OnLoadWebDocument,OnParseDocument,OnWebPagePrerender,OnLoadWebPageCache,OnRichTextEditorRegister,OnRichTextEditorInit,OnInterfaceSettingsRender\n * @internal    @modx_category Manager and Admin\n * @internal    @legacy_names TinyMCE Rich Text Editor\n * @internal    @installset base\n * @logo        /assets/plugins/tinymce4/tinymce/logo.png\n * @reportissues https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Plugin docs https://github.com/extras-evolution/tinymce4-for-modx-evo\n * @documentation Official TinyMCE4-docs https://www.tinymce.com/docs/\n * @author      Deesen\n * @lastupdate  2018-01-17\n */\nif (!defined(\'MODX_BASE_PATH\')) { die(\'What are you doing? Get out of here!\'); }\n\nrequire(MODX_BASE_PATH.\"assets/plugins/tinymce4/plugin.tinymce.inc.php\");', 0, '{\"styleFormats\":[{\"label\":\"Custom Style Formats <b>RAW<\\/b><br\\/><br\\/><ul><li>leave empty to use below block\\/inline formats<\\/li><li>allows simple-format: <i>Title,cssClass|Title2,cssClass2<\\/i><\\/li><li>Also accepts full JSON-config as per TinyMCE4 docs \\/ configure \\/ content-formating \\/ style_formats<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"styleFormats_inline\":[{\"label\":\"Custom Style Formats <b>INLINE<\\/b><br\\/><br\\/><ul><li>will wrap selected text with span-tag + css-class<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"default\":\"InlineTitle,cssClass1|InlineTitle2,cssClass2\",\"desc\":\"\"}],\"styleFormats_block\":[{\"label\":\"Custom Style Formats <b>BLOCK<\\/b><br\\/><br\\/><ul><li>will add css-class to selected block-element<\\/li><li>simple-format only<\\/li><\\/ul>\",\"type\":\"textarea\",\"value\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"default\":\"BlockTitle,cssClass3|BlockTitle2,cssClass4\",\"desc\":\"\"}],\"customParams\":[{\"label\":\"Custom Parameters<br\\/><b>(Be careful or leave empty!)<\\/b>\",\"type\":\"textarea\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"entityEncoding\":[{\"label\":\"Entity Encoding\",\"type\":\"list\",\"value\":\"named\",\"options\":\"named,numeric,raw\",\"default\":\"named\",\"desc\":\"\"}],\"entities\":[{\"label\":\"Entities\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"pathOptions\":[{\"label\":\"Path Options\",\"type\":\"list\",\"value\":\"Site config\",\"options\":\"Site config,Absolute path,Root relative,URL,No convert\",\"default\":\"Site config\",\"desc\":\"\"}],\"resizing\":[{\"label\":\"Advanced Resizing\",\"type\":\"list\",\"value\":\"false\",\"options\":\"true,false\",\"default\":\"false\",\"desc\":\"\"}],\"disabledButtons\":[{\"label\":\"Disabled Buttons\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webTheme\":[{\"label\":\"Web Theme\",\"type\":\"test\",\"value\":\"webuser\",\"default\":\"webuser\",\"desc\":\"\"}],\"webPlugins\":[{\"label\":\"Web Plugins\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons1\":[{\"label\":\"Web Buttons 1\",\"type\":\"text\",\"value\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"default\":\"bold italic underline strikethrough removeformat alignleft aligncenter alignright\",\"desc\":\"\"}],\"webButtons2\":[{\"label\":\"Web Buttons 2\",\"type\":\"text\",\"value\":\"link unlink image undo redo\",\"default\":\"link unlink image undo redo\",\"desc\":\"\"}],\"webButtons3\":[{\"label\":\"Web Buttons 3\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webButtons4\":[{\"label\":\"Web Buttons 4\",\"type\":\"text\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"webAlign\":[{\"label\":\"Web Toolbar Alignment\",\"type\":\"list\",\"value\":\"ltr\",\"options\":\"ltr,rtl\",\"default\":\"ltr\",\"desc\":\"\"}],\"width\":[{\"label\":\"Width\",\"type\":\"text\",\"value\":\"100%\",\"default\":\"100%\",\"desc\":\"\"}],\"height\":[{\"label\":\"Height\",\"type\":\"text\",\"value\":\"400px\",\"default\":\"400px\",\"desc\":\"\"}],\"introtextRte\":[{\"label\":\"<b>Introtext RTE<\\/b><br\\/>add richtext-features to \\\"introtext\\\"\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineMode\":[{\"label\":\"<b>Inline-Mode<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"inlineTheme\":[{\"label\":\"<b>Inline-Mode<\\/b><br\\/>Theme\",\"type\":\"text\",\"value\":\"inline\",\"default\":\"inline\",\"desc\":\"\"}],\"browser_spellcheck\":[{\"label\":\"<b>Browser Spellcheck<\\/b><br\\/>At least one dictionary must be installed inside your browser\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}],\"paste_as_text\":[{\"label\":\"<b>Force Paste as Text<\\/b>\",\"type\":\"list\",\"value\":\"disabled\",\"options\":\"enabled,disabled\",\"default\":\"disabled\",\"desc\":\"\"}]}', 0, '', 0, 0),
(9, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '{\"table_name\":[{\"label\":\"Trans table\",\"type\":\"list\",\"value\":\"russian\",\"options\":\"common,russian,dutch,german,czech,utf8,utf8lowercase\",\"default\":\"russian\",\"desc\":\"\"}],\"char_restrict\":[{\"label\":\"Restrict alias to\",\"type\":\"list\",\"value\":\"lowercase alphanumeric\",\"options\":\"lowercase alphanumeric,alphanumeric,legal characters\",\"default\":\"lowercase alphanumeric\",\"desc\":\"\"}],\"remove_periods\":[{\"label\":\"Remove Periods\",\"type\":\"list\",\"value\":\"No\",\"options\":\"Yes,No\",\"default\":\"No\",\"desc\":\"\"}],\"word_separator\":[{\"label\":\"Word Separator\",\"type\":\"list\",\"value\":\"dash\",\"options\":\"dash,underscore,none\",\"default\":\"dash\",\"desc\":\"\"}],\"override_tv\":[{\"label\":\"Override TV name\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}]}', 0, '', 0, 0),
(10, 'Updater', '<strong>0.8.4</strong> show message about outdated CMS version', 0, 4, 0, 'require MODX_BASE_PATH.\'assets/plugins/updater/plugin.updater.php\';\r\n\r\n\r\n', 0, '{\"version\":[{\"label\":\"Version:\",\"type\":\"text\",\"value\":\"evolution-cms\\/evolution\",\"default\":\"evolution-cms\\/evolution\",\"desc\":\"\"}],\"wdgVisibility\":[{\"label\":\"Show widget for:\",\"type\":\"menu\",\"value\":\"All\",\"options\":\"All,AdminOnly,AdminExcluded,ThisRoleOnly,ThisUserOnly\",\"default\":\"All\",\"desc\":\"\"}],\"ThisRole\":[{\"label\":\"Show only to this role id:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"ThisUser\":[{\"label\":\"Show only to this username:\",\"type\":\"string\",\"value\":\"\",\"default\":\"\",\"desc\":\"\"}],\"showButton\":[{\"label\":\"Show Update Button:\",\"type\":\"menu\",\"value\":\"AdminOnly\",\"options\":\"show,hide,AdminOnly\",\"default\":\"AdminOnly\",\"desc\":\"\"}],\"type\":[{\"label\":\"Type:\",\"type\":\"menu\",\"value\":\"tags\",\"options\":\"tags,releases,commits\",\"default\":\"tags\",\"desc\":\"\"}],\"branch\":[{\"label\":\"Commit branch:\",\"type\":\"text\",\"value\":\"develop\",\"default\":\"develop\",\"desc\":\"\"}]}', 0, '', 0, 0),
(11, 'userHelper', '<strong>1.7.21</strong> addition to FormLister', 0, 5, 0, '\n/**\n * userHelper\n * \n * addition to FormLister\n * \n * @category    plugin\n * @version     1.7.21\n * @internal    @properties &logoutKey=Request key;text;logout &cookieName=Cookie Name;text;WebLoginPE &cookieLifetime=Cookie Lifetime, seconds;text;157680000 &maxFails=Max failed logins;text;3 &blockTime=Block for, seconds;text;3600 &trackWebUserActivity=Track web user activity;list;No,Yes;No\n * @internal    @events OnWebAuthentication,OnWebPageInit,OnPageNotFound,OnWebLogin\n * @internal    @modx_category Content\n * @internal    @disabled 1\n**/\n\nrequire MODX_BASE_PATH.\'assets/snippets/FormLister/plugin.userHelper.php\';\n', 0, '{\"logoutKey\":[{\"label\":\"Request key\",\"type\":\"text\",\"value\":\"logout\",\"default\":\"logout\",\"desc\":\"\"}],\"cookieName\":[{\"label\":\"Cookie Name\",\"type\":\"text\",\"value\":\"WebLoginPE\",\"default\":\"WebLoginPE\",\"desc\":\"\"}],\"cookieLifetime\":[{\"label\":\"Cookie Lifetime, seconds\",\"type\":\"text\",\"value\":\"157680000\",\"default\":\"157680000\",\"desc\":\"\"}],\"maxFails\":[{\"label\":\"Max failed logins\",\"type\":\"text\",\"value\":\"3\",\"default\":\"3\",\"desc\":\"\"}],\"blockTime\":[{\"label\":\"Block for, seconds\",\"type\":\"text\",\"value\":\"3600\",\"default\":\"3600\",\"desc\":\"\"}],\"trackWebUserActivity\":[{\"label\":\"Track web user activity\",\"type\":\"list\",\"value\":\"No\",\"options\":\"No,Yes\",\"default\":\"No\",\"desc\":\"\"}]}', 1, '', 0, 0),
(12, 'sgThumb', '<strong>1.2.2</strong> Plugin to create thumbnails for SimpleGallery images', 0, 0, 0, 'require MODX_BASE_PATH.\'assets/plugins/simplegallery/plugin.sgthumb.php\';\n', 0, '{\"tconfig\":[{\"label\":\"Thumbnails Configuration\",\"type\":\"textarea\",\"value\":\"See plugin code for details\",\"default\":\"See plugin code for details\",\"desc\":\"\"}],\"keepOriginal\":[{\"label\":\"Keep original images\",\"type\":\"list\",\"value\":\"No\",\"options\":\"No,Yes\",\"default\":\"No\",\"desc\":\"\"}],\"originalFolder\":[{\"label\":\"Folder for original images\",\"type\":\"text\",\"value\":\"original\",\"default\":\"original\",\"desc\":\"\"}]}', 0, '', 0, 0);
INSERT INTO `cgck_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`, `createdon`, `editedon`) VALUES
(13, 'SimpleGallery', '<strong>1.2.3</strong> Plugin to create image galleries', 0, 0, 0, 'require MODX_BASE_PATH.\'assets/plugins/simplegallery/plugin.simplegallery.php\';', 0, '{\r\n  \"tabName\": [\r\n    {\r\n      \"label\": \"Tab name\",\r\n      \"type\": \"text\",\r\n      \"value\": \"SimpleGallery\",\r\n      \"default\": \"SimpleGallery\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"controller\": [\r\n    {\r\n      \"label\": \"Controller class\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"templates\": [\r\n    {\r\n      \"label\": \"Templates\",\r\n      \"type\": \"text\",\r\n      \"value\": \"2,3,4,5,6,7\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"documents\": [\r\n    {\r\n      \"label\": \"Documents\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"ignoreDoc\": [\r\n    {\r\n      \"label\": \"Ignore Documents\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"role\": [\r\n    {\r\n      \"label\": \"Roles\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"folder\": [\r\n    {\r\n      \"label\": \"Galleries folder\",\r\n      \"type\": \"text\",\r\n      \"value\": \"assets/galleries/\",\r\n      \"default\": \"assets/galleries/\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"thumbsCache\": [\r\n    {\r\n      \"label\": \"Thumbs cache folder\",\r\n      \"type\": \"text\",\r\n      \"value\": \"assets/.sgThumbs/\",\r\n      \"default\": \"assets/.sgThumbs/\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"w\": [\r\n    {\r\n      \"label\": \"Thumbs width\",\r\n      \"type\": \"text\",\r\n      \"value\": \"140\",\r\n      \"default\": \"140\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"h\": [\r\n    {\r\n      \"label\": \"Thumbs height\",\r\n      \"type\": \"text\",\r\n      \"value\": \"105\",\r\n      \"default\": \"105\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"customThumbOptions\": [\r\n    {\r\n      \"label\": \"Custom thumb options\",\r\n      \"type\": \"text\",\r\n      \"value\": \"\",\r\n      \"default\": \"\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"clientResize\": [\r\n    {\r\n      \"label\": \"Client Resize\",\r\n      \"type\": \"list\",\r\n      \"value\": \"No\",\r\n      \"options\": \"No,Yes\",\r\n      \"default\": \"No\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"jpegQuality\": [\r\n    {\r\n      \"label\": \"Jpeg quality\",\r\n      \"type\": \"text\",\r\n      \"value\": \"0.93\",\r\n      \"default\": \"0.93\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"skipPHPThumb\": [\r\n    {\r\n      \"label\": \"Skip PHPThumb\",\r\n      \"type\": \"list\",\r\n      \"value\": \"No\",\r\n      \"options\": \"No,Yes\",\r\n      \"default\": \"No\",\r\n      \"desc\": \"\"\r\n    }\r\n  ],\r\n  \"allowDuplicate\": [\r\n    {\r\n      \"label\": \"Duplicate galleries with documents\",\r\n      \"type\": \"list\",\r\n      \"value\": \"No\",\r\n      \"options\": \"No,Yes\",\r\n      \"default\": \"No\",\r\n      \"desc\": \"\"\r\n    }\r\n  ]\r\n}', 0, ' ', 0, 1536852893);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_plugin_events`
--

CREATE TABLE `cgck_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `cgck_site_plugin_events`
--

INSERT INTO `cgck_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(1, 88, 0),
(2, 25, 0),
(2, 27, 0),
(2, 37, 0),
(2, 39, 0),
(2, 43, 0),
(2, 45, 0),
(2, 49, 0),
(2, 51, 0),
(2, 55, 0),
(2, 57, 0),
(2, 75, 0),
(2, 77, 0),
(2, 206, 0),
(2, 210, 0),
(2, 211, 0),
(3, 34, 0),
(3, 35, 0),
(3, 36, 0),
(3, 40, 0),
(3, 41, 0),
(3, 42, 0),
(4, 80, 0),
(4, 81, 0),
(4, 93, 0),
(5, 28, 0),
(5, 29, 0),
(5, 30, 0),
(5, 31, 0),
(5, 35, 0),
(5, 53, 0),
(5, 205, 0),
(6, 202, 0),
(7, 3, 0),
(7, 13, 0),
(7, 28, 0),
(7, 31, 0),
(7, 92, 0),
(8, 3, 0),
(8, 20, 0),
(8, 85, 0),
(8, 87, 0),
(8, 88, 0),
(8, 91, 0),
(8, 92, 0),
(9, 100, 0),
(10, 70, 0),
(10, 202, 0),
(10, 1000, 0),
(11, 4, 0),
(11, 79, 0),
(11, 90, 0),
(11, 1000, 0),
(12, 1001, 0),
(13, 29, 0),
(13, 98, 0),
(13, 205, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_snippets`
--

CREATE TABLE `cgck_site_snippets` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the snippet'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';

--
-- Дамп данных таблицы `cgck_site_snippets`
--

INSERT INTO `cgck_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `createdon`, `editedon`, `disabled`) VALUES
(1, 'DLCrumbs', '<strong>1.2</strong> DLCrumbs', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLCrumbs.php\';\n', 0, '', '', 0, 0, 0),
(2, 'DLMenu', '<strong>1.4.0</strong> Snippet to build menu with DocLister', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLMenu.php\';\n', 0, '', '', 0, 0, 0),
(3, 'DLSitemap', '<strong>1.0.1</strong> Snippet to build XML sitemap', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLSitemap.php\';\n', 0, '', '', 0, 0, 0),
(4, 'DocInfo', '<strong>1</strong> Take any field from any document (fewer requests than GetField)', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';\r\n', 0, '', '', 0, 0, 0),
(5, 'DocLister', '<strong>2.3.15</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';\n', 0, '', '', 0, 0, 0),
(6, 'FormLister', '<strong>1.7.21</strong> Form processor', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/FormLister/snippet.FormLister.php\';\n', 0, '', '', 0, 0, 0),
(7, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 6, 0, 'return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';', 0, '', '', 0, 0, 0),
(8, 'phpthumb', '<strong>1.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\r\n', 0, '', '', 0, 0, 0),
(9, 'summary', '<strong>2.0.2</strong> Truncates the string to the specified length', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/summary/snippet.summary.php\';', 0, '', '', 0, 0, 0),
(10, 'multiTV', '<strong>2.0.14</strong> Custom Template Variabe containing a sortable multi item list or a datatable', 0, 5, 0, 'return require MODX_BASE_PATH . \'assets/tvs/multitv/multitv.snippet.php\';\n', 0, '', '', 0, 0, 0),
(11, 'sgController', '<strong>1.2.1</strong> use sg_site_content controller for DocLister', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/simplegallery/sgController.php\';', 0, '', '', 0, 0, 0),
(12, 'sgLister', '<strong>1.2.1</strong> DocLister wrapper for SimpleGallery table', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/simplegallery/sgLister.php\';', 0, '', '', 0, 0, 0),
(13, 'sgThumb', '<strong>1.2.1</strong> Snippet for get thumbnails for SimpleGallery', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/simplegallery/sgThumb.php\';', 0, '', '', 0, 0, 0),
(14, 'DDocInfo', '<strong>1</strong> DDocInfo', 0, 5, 0, '$id = isset($id) ? (int)$id : $modx->documentObject[\'id\'];\n$field = isset($field) ? (string)$field : \'id\';\nif($field == \'id\'){\n    $out = $id;\n}else{\n    if($modx->documentObject[\'id\'] == $id){\n        $out = isset($modx->documentObject[$field]) ? $modx->documentObject[$field] : \'\';\n        if(is_array($out)){\n           $out = isset($out[1]) ? $out[1] : \'\';\n        }\n    }else{\n        $out = $modx->doc->edit($id)->get($field);\n    }\n}\nreturn (string)$out;', 0, '', '', 0, 0, 0),
(15, 'DLBeforeAfter', '<strong>1</strong> Navigation between post and upcoming events relative to the current date.', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLBeforeAfter.php\';', 0, '', '', 0, 0, 0),
(16, 'DLGlossary', '<strong>0.1</strong> Filtering documents by the first character', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLGlossary.php\';', 0, '', '', 0, 0, 0),
(17, 'DLPrevNext', '<strong>1.1</strong> DLPrevNext', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLPrevNext.php\';', 0, '', '', 0, 0, 0),
(18, 'DLReflect', '<strong>2</strong> Building a list of dates to filter documents', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflect.php\';', 0, '', '', 0, 0, 0),
(19, 'DLReflectFilter', '<strong>2</strong> Filtering documents by dates provided by DLReflect snippet', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLReflectFilter.php\';', 0, '', '', 0, 0, 0),
(20, 'DLTemplate', '<strong>1</strong> DLTemplate', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLTemplate.php\';', 0, '', '', 0, 0, 0),
(21, 'DLValuelist', '<strong>1.1</strong> DLValuelist', 0, 5, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DLValuelist.php\';', 0, '', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_templates`
--

CREATE TABLE `cgck_site_templates` (
  `id` int(10) NOT NULL,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';

--
-- Дамп данных таблицы `cgck_site_templates`
--

INSERT INTO `cgck_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`, `createdon`, `editedon`) VALUES
(3, 'Minimal Template', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0, 1, 0, 0),
(4, 'Главная', '', 0, 0, '', 0, '{{header}}\r\n<div id=\"templatemo_main\">\r\n	[[multiTV? &tvName=`main_left_half` &docid=`[*id*]` &display=`all` &offset=`0` &orderBy=``]]\r\n	[[multiTV? &tvName=`main_right_half` &docid=`[*id*]` &display=`all` &offset=`0` &orderBy=``]]\r\n        <div class=\"clear h40\"></div>\r\n	[[multiTV? &tvName=`main_block` &docid=`[*id*]` &display=`all` &offset=`0` &orderBy=``]]\r\n        <div class=\"clear\"></div>\r\n	<div cladd=\"container\">\r\n            [*content*]\r\n        </div>\r\n	</div>\r\n</div> <!-- END of main -->\r\n{{footer}}', 0, 1, 1536786631, 1536858733),
(5, 'Галерея', '', 0, 0, '', 0, '{{header}}\r\n<div id=\"templatemo_main\">\r\n	\r\n    <div id=\"gallery\">\r\n    		[[sgLister? &thumbSnippet=`phpthumb` &thumbOptions=`{ \"medium\":\"w=286&h=163\" }` &parents=`[*id*]` &tpl=`@CODE: <div class=\"col one_third gallery_box\">\r\n            <div class=\"img_frame img_frame_13 img_nom\"><span></span>\r\n        	        	<img src=\"[+thumb_medium.sg_image+]\" title=\"[+e.sg_title+]\" alt=\"[+e.sg_description+]\">\r\n        			</div>\r\n            <h4>[+e.sg_title+]</h4>\r\n            <p>[+e.sg_description+]</p>\r\n            \r\n        </div>`\r\n    		&display=`3` \r\n    		&paginate=`pages` \r\n    		&TplWrapPaginate=`@CODE:<div class=\"paging\"><ul>[+wrap+]</ul></div>`\r\n			&TplCurrentPage=`@CODE:<li ><span>[+num+]<span></li>`\r\n    		&TplPage=`@CODE:<li><a href=\"[+link+]\"><span>[+num+]<span></a></li>`\r\n    		&TplNextP=`@CODE:<li><a href=\"[+link+]\">Next</a></li>`\r\n    		&TplPrevP=`@CODE:<li><a href=\"[+link+]\">Previous</a></li>`\r\n    		]]\r\n    	</div>\r\n        <div class=\"clear\"></div>\r\n	[+pages+] \r\n        <div class=\"clear\"></div>\r\n    \r\n</div> <!-- END of main -->\r\n{{footer}}', 0, 1, 1536786767, 1536912275),
(6, 'Блог', '', 0, 0, '', 0, '{{header}}\r\n<div id=\"templatemo_main\">\r\n	[[multiTV? &tvName=`post` &docid=`[*id*]` &display=`all` &offset=`0` &orderBy=``]]\r\n    \r\n    {{categories}}\r\n    <div class=\"clear\"></div>\r\n</div> <!-- END of main -->\r\n{{footer}}', 0, 1, 1536786882, 1536908443),
(7, 'Контакты', '', 0, 0, '', 0, '{{header}}\r\n<div id=\"templatemo_main\">\r\n	[*content*]\r\n	\r\n	[!FormLister?\r\n&formid=`basic`\r\n&rules=`{\r\n\"name\":{\r\n    \"required\":\"Обязательно введите имя\"\r\n},\r\n\"email\":{\r\n    \"required\":\"Обязательно введите email\",\r\n    \"email\":\"Введите email правильно\"\r\n},\r\n\"subject\":{\r\n    \"required\":\"Обязательно введите номер телефона\",\r\n    \"minLength\":{\r\n		\"params\":5,\r\n		\"subject\":\"Тема должна быть не менее 5 символов\"\r\n	}\r\n},\r\n\"message\":{\r\n    \"required\":\"Обязательно введите сообщение\",\r\n    \"minLength\":{\r\n        \"params\":100,\r\n        \"message\":\"Сообщение должно быть не менее 100 символов\"\r\n    }\r\n}\r\n}`\r\n&formTpl=`@CODE:\r\n	<div class=\"half left\">\r\n    	 <div id=\"contact_form\">\r\n                    <form method=\"post\" name=\"contact\" action=\"[~[*id*]~]\">\r\n                        <input type=\"hidden\" name=\"formid\" value=\"basic\">\r\n                        <label for=\"name\">Name:</label> <input type=\"text\" id=\"name\" name=\"name\"  value=\"[+name.value+]\" class=\"[+name.requiredClass+] [+name.errorClass+] input_field\" />\r\n							[+name.error+]\r\n                        <div class=\"cleaner h10\"></div>\r\n                        <label for=\"email\">Email:</label> <input type=\"text\" id=\"email\" name=\"email\" value=\"[+email.value+]\" class=\"validate-email [+name.requiredClass+] [+name.errorClass+] input_field\" />\r\n							[+email.error+]\r\n                        <div class=\"cleaner h10\"></div>\r\n                        \r\n						<label for=\"subject\">Subject:</label> <input type=\"text\" name=\"subject\" id=\"subject\" value=\"[+subject.value+]\" class=\"input_field [+name.requiredClass+] [+name.errorClass+]\" />\r\n							[+subject.error+]\r\n						<div class=\"cleaner h10\"></div>\r\n        \r\n                        <label for=\"text\">Message:</label> <textarea id=\"text\" name=\"text\" rows=\"0\" cols=\"0\" class=\"[+name.requiredClass+] [+name.errorClass+]\">[+message.value+]</textarea>\r\n							[+message.error+]\r\n                        <div class=\"cleaner h10\"></div>\r\n                         [+form.messages+]\r\n                        <input type=\"submit\" value=\"Send\" id=\"submit\" name=\"submit\" class=\"submit_btn left\" />\r\n            	</form>\r\n        </div>   \r\n    </div>`\r\n	&errorClass=` has-error`\r\n	&requiredClass=` has-warning`\r\n	&to=`info@company.com`\r\n	&subject=`Новое сообщение`\r\n	&reportTpl=`@CODE:\r\n	<p>Имя: [+name.value+]</p>\r\n	<p>Тема: [+subject.value+]</p>\r\n	<p>Email: <a href=\"mailto:[+email.value+]\">[+email.value+]</a></p>\r\n	<p>Сообщение: [+message:strip_tags:nl2br+]</p>\r\n	`\r\n	!]\r\n        [[multiTV? &tvName=`address` &docid=`[*id*]` &display=`all` &offset=`0` &orderBy=``]]\r\n    <!-- <div class=\"half right\">\r\n    	<h4>Mailing Address</h4>\r\n        <h6><strong>Company Name</strong></h6>\r\n          	330-660 Aliquam semper dignissim,<br />\r\n            Fusce cursus turpis lacus, 11880<br />\r\n            Sit amet tortor et<br /><br />\r\n    				\r\n    		<strong>Phone:</strong> 020-040-0680 <br />\r\n        <strong>Email:</strong> <a href=\"mailto:info@company.com\">info@company.com</a>  <br />\r\n        <div class=\"cleaner h40\"></div>\r\n        \r\n    </div>   -->\r\n    <div class=\"clear h40\"></div>\r\n    \r\n</div> <!-- END of main -->\r\n{{footer}}', 0, 1, 1536787032, 1536881038);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_tmplvars`
--

CREATE TABLE `cgck_site_tmplvars` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';

--
-- Дамп данных таблицы `cgck_site_tmplvars`
--

INSERT INTO `cgck_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`, `createdon`, `editedon`) VALUES
(1, 'textarea', 'desc', 'Meta description', 'Meta description', 0, 1, 0, '', 0, '', '', '[*introtext*]', 0, 0),
(2, 'text', 'keyw', 'Meta keywords', 'Meta keywords', 0, 1, 0, '', 0, '', '', '[*pagetitle*]', 0, 0),
(3, 'checkbox', 'noIndex', 'No index page', 'Meta robots', 0, 1, 0, 'Нет==<meta name=\"robots\" content=\"noindex, nofollow\">', 0, '', '', '', 0, 0),
(4, 'text', 'titl', 'Meta title', 'Meta title', 0, 1, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]', 0, 0),
(5, 'custom_tv:multitv', 'post', 'Статья', '', 0, 0, 0, '', 0, '', '', '', 1536822777, 1536869731),
(6, 'custom_tv:multitv', 'main_left_half', 'Левый блок главной страницы', '', 0, 0, 0, '', 0, '', '', '', 1536824779, 1536835080),
(7, 'custom_tv:multitv', 'main_right_half', 'Правый блок главной страницы', '', 0, 0, 0, '', 0, '', '', '', 1536832891, 1536835268),
(8, 'custom_tv:multitv', 'main_block', 'Главный блок', 'Блок используемый на главной странице', 0, 0, 0, '', 0, '', '', '', 1536834140, 1536858236),
(9, 'custom_tv:multitv', 'address', 'Адрес', '', 0, 0, 0, '', 0, '', '', '', 1536879792, 1536879812);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_tmplvar_access`
--

CREATE TABLE `cgck_site_tmplvar_access` (
  `id` int(10) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_tmplvar_contentvalues`
--

CREATE TABLE `cgck_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';

--
-- Дамп данных таблицы `cgck_site_tmplvar_contentvalues`
--

INSERT INTO `cgck_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 5, 1, 'theme/images/templatemo_image_01.jpg'),
(2, 6, 1, '{\"fieldValue\":[{\"image\":\"theme/images/templatemo_image_01.jpg\",\"thumb\":\"\",\"title\":\"Proin Vitae Lectus Massa\",\"name\":\"By Danny | May 16th, 2048 in Web Design\",\"part1\":\"Nullam ac facilisis mi. Integer eu lacus ac nibh ultricies pulvinar id eu ligula. Mauris et lectus sit amet leo viverra iaculis ac quis lorem.\",\"part2\":\"Credit goes to hugoandcat.com for slider.   Quisque imperdiet bibendum placerat. Ut sit amet nisl ut sapien dictum placerat ac eu sem. Curabitur sit amet lacus nisl. Suspendisse euismod dapibus nisi, sed posuere lorem hendrerit in. Donec ut pulvinar urna.    Mauris dignissim ligula ac lectus commodo consequat. Nullam lacinia odio sem.\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
(3, 7, 1, '{\"fieldValue\":[{\"title\":\"Welcome To Bookstore\",\"undertitle\":\"Bookstore is a free  template for your website projects.\",\"content\":\"Credit goes to hugoandcat.com for slider.   Quisque imperdiet bibendum placerat. Ut sit amet nisl ut sapien dictum placerat ac eu sem. Curabitur sit amet lacus nisl. Suspendisse euismod dapibus nisi, sed posuere lorem hendrerit in. Donec ut pulvinar urna.    Mauris dignissim ligula ac lectus commodo consequat. Nullam lacinia odio sem.\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
(4, 8, 1, '{\"fieldValue\":[{\"image\":\"theme/images/portfolio/01.jpg\",\"thumb\":\"\",\"title\":\"Gravida Massa Eget\",\"content\":\"Aliquam nec elit nisl, accumsan sollicitudin nulla. Nunc rhoncus, odio viverra tempor vehicula, orci ipsum vulputate urna, nec et lacus.\"},{\"image\":\"theme/images/portfolio/02.jpg\",\"thumb\":\"\",\"title\":\"Pellentesque Pretium Posuere\",\"content\":\"Vestibulum congue laoreet ultricies. Suspendisse pellentesque dapibus lacus, scelerisque lobortis lorem blandit vitae.\"},{\"image\":\"theme/images/portfolio/03.jpg\",\"thumb\":\"\",\"title\":\"Fusce Lobortis Auctor Mattis\",\"content\":\"Nunc euismod augue volutpat ipsum facilisis luctus. Nulla fermentum eleifend est, in convallis sem vulputate vitae. Nam eget tempus justo.\"}],\"fieldSettings\":{\"autoincrement\":1}}'),
(5, 8, 2, '[]'),
(6, 5, 3, '{\"fieldValue\":[{\"image\":\"theme/images/blog/01.jpg\",\"thumb\":\"\",\"title\":\"Free HTML CSS Templates\",\"content\":\"Ut sed lorem ac ante cursus auctor. Nam ut congue velit. Cras eget fermentum sem. Maecenas nec purus lorem, a sodales lectus. Etiam consequat nulla sit amet nisl volutpat ornare. Donec purus nulla, egestas ac porttitor et, pharetra nec felis. Donec lobortis fringilla blandit.\"},{\"image\":\"theme/images/blog/02.jpg\",\"thumb\":\"\",\"title\":\"Online Marketing and Advertising\",\"content\":\"Mauris ac condimentum ligula. Cras luctus, leo ut viverra auctor, odio nisl faucibus urna, sed tincidunt ligula purus a orci. Curabitur porttitor faucibus libero, congue tincidunt velit blandit quis. Donec tortor quam, vehicula et pretium et, adipiscing eu mauris.\"},{\"image\":\"theme/images/blog/03.jpg\",\"thumb\":\"\",\"title\":\"Multimedia and 3D Animations\",\"content\":\">Integer placerat est et arcu accumsan facilisis vehicula mi ultrices. Ut vitae volutpat erat. Suspendisse diam felis, blandit vitae scelerisque non, consequat rutrum purus. Etiam consequat nulla sit amet nisl volutpat ornare. Donec purus nulla, egestas ac porttitor et, pharetra nec felis.\"}]}'),
(7, 9, 4, '{\"fieldValue\":[{\"title\":\"Mailing Address\",\"company\":\"Company Name\",\"address\":\"330-660 Aliquam semper dignissim,<br />             Fusce cursus turpis lacus, 11880<br />             Sit amet tortor et\",\"phone\":\"020-040-0680\",\"email\":\"info@company.com\"}],\"fieldSettings\":{\"autoincrement\":1}}');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_site_tmplvar_templates`
--

CREATE TABLE `cgck_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `cgck_site_tmplvar_templates`
--

INSERT INTO `cgck_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(9, 7, 0),
(8, 4, 0),
(6, 4, 0),
(7, 4, 0),
(5, 6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_system_eventnames`
--

CREATE TABLE `cgck_system_eventnames` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='System Event Names.';

--
-- Дамп данных таблицы `cgck_system_eventnames`
--

INSERT INTO `cgck_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(107, 'OnMakePageCacheKey', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(1033, 'OnDocFormUnDelete', 1, 'Documents'),
(1034, 'onBeforeMoveDocument', 1, 'Documents'),
(1035, 'onAfterMoveDocument', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(109, 'OnSecuritySettingsRender', 1, 'System Settings'),
(110, 'OnFileManagerSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(104, 'OnBeforeLoadDocumentObject', 5, ''),
(105, 'OnAfterLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(106, 'OnParseProperties', 5, ''),
(108, 'OnBeforeParseParams', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(102, 'OnMakeDocUrl', 5, ''),
(103, 'OnBeforeLoadExtension', 5, ''),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(214, 'OnManagerMenuPrerender', 2, ''),
(215, 'OnManagerTopPrerender', 2, ''),
(224, 'OnDocFormTemplateRender', 1, 'Documents'),
(225, 'OnBeforeMinifyCss', 1, ''),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, ''),
(1001, 'OnFileBrowserUpload', 1, 'File Browser Events'),
(1002, 'OnBeforeFileBrowserUpload', 1, 'File Browser Events'),
(1003, 'OnFileBrowserDelete', 1, 'File Browser Events'),
(1004, 'OnBeforeFileBrowserDelete', 1, 'File Browser Events'),
(1005, 'OnFileBrowserInit', 1, 'File Browser Events'),
(1006, 'OnFileBrowserMove', 1, 'File Browser Events'),
(1007, 'OnBeforeFileBrowserMove', 1, 'File Browser Events'),
(1008, 'OnFileBrowserCopy', 1, 'File Browser Events'),
(1009, 'OnBeforeFileBrowserCopy', 1, 'File Browser Events'),
(1010, 'OnBeforeFileBrowserRename', 1, 'File Browser Events'),
(1011, 'OnFileBrowserRename', 1, 'File Browser Events'),
(1036, 'OnBeforeSimpleGallerySave', 6, 'SimpleGallery Events'),
(1037, 'OnSimpleGallerySave', 6, 'SimpleGallery Events'),
(1038, 'OnBeforeSimpleGalleryDelete', 6, 'SimpleGallery Events'),
(1039, 'OnSimpleGalleryDelete', 6, 'SimpleGallery Events'),
(1040, 'OnSimpleGalleryMove', 6, 'SimpleGallery Events'),
(1041, 'OnSimpleGalleryRefresh', 6, 'SimpleGallery Events');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_system_settings`
--

CREATE TABLE `cgck_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `cgck_system_settings`
--

INSERT INTO `cgck_system_settings` (`setting_name`, `setting_value`) VALUES
('settings_version', '1.4.5'),
('manager_theme', 'default'),
('server_offset_time', '0'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'Evo'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('auto_template_logic', 'parent'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('friendly_urls', '1'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('cache_type', '2'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('emailsender', 'redchik091089@gmail.com'),
('use_editor', '1'),
('use_browser', '1'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('upload_maxsize', '10485760'),
('manager_layout', '4'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '600'),
('manager_direction', 'ltr'),
('xhtml_urls', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '0'),
('remember_last_tab', '1'),
('enable_bindings', '1'),
('seostrict', '1'),
('number_of_results', '30'),
('theme_refresher', ''),
('show_picker', '0'),
('show_newresource_btn', '0'),
('show_fullscreen_btn', '0'),
('email_sender_method', '1'),
('site_id', '5b995660117fd'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('site_unavailable_message', 'В настоящее время сайт недоступен.'),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('enable_filter', '0'),
('enable_at_syntax', '0'),
('cache_default', '1'),
('search_default', '1'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('docid_incrmnt_method', '0'),
('enable_cache', '1'),
('minifyphp_incache', '0'),
('server_protocol', 'http'),
('rss_url_news', 'http://feeds.feedburner.com/evocms-release-news'),
('track_visitors', '0'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('make_folders', '0'),
('aliaslistingfolder', '0'),
('allow_duplicate_alias', '0'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_secure', 'none'),
('smtp_host', 'smtp.example.com'),
('smtp_port', '25'),
('smtp_username', 'you@example.com'),
('reload_emailsubject', ''),
('emailsubject', 'Данные для авторизации'),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('manager_theme_mode', '3'),
('login_logo', ''),
('login_bg', ''),
('login_form_position', 'left'),
('manager_menu_position', 'top'),
('tree_page_click', '27'),
('use_breadcrumbs', '0'),
('global_tabs', '1'),
('group_tvs', '0'),
('resource_tree_node_name', 'pagetitle'),
('session_timeout', '15'),
('tree_show_protected', '0'),
('datepicker_offset', '-10'),
('number_of_logs', '100'),
('number_of_messages', '40'),
('which_editor', 'TinyMCE4'),
('tinymce4_theme', 'custom'),
('tinymce4_skin', 'lightgray'),
('tinymce4_skintheme', 'inlite'),
('tinymce4_template_docs', ''),
('tinymce4_template_chunks', ''),
('tinymce4_entermode', 'p'),
('tinymce4_element_format', 'xhtml'),
('tinymce4_schema', 'html5'),
('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code formatselect'),
('tinymce4_custom_buttons3', ''),
('tinymce4_custom_buttons4', ''),
('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
('allow_eval', 'with_scan'),
('safe_functions_at_eval', 'time,date,strtotime,strftime'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('validate_referer', '1'),
('rss_url_security', 'http://feeds.feedburner.com/evocms-security-news'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('captcha_words_default', 'EVO,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('filemanager_path', 'C:/OSPanel/domains/evotest.local/'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg,tpl'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('which_browser', 'mcpuk'),
('rb_webuser', '0'),
('rb_base_dir', 'C:/OSPanel/domains/evotest.local/assets/'),
('rb_base_url', 'assets/'),
('clean_uploaded_filename', '1'),
('strip_image_paths', '1'),
('maxImageWidth', '2600'),
('maxImageHeight', '2200'),
('clientResize', '0'),
('noThumbnailsRecreation', '0'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('lang_code', 'ru'),
('sys_files_checksum', 'a:4:{s:42:\"C:/OSPanel/domains/evotest.local/index.php\";s:32:\"2f6a89952c4b21dd233f0dcb2408d3e7\";s:42:\"C:/OSPanel/domains/evotest.local/.htaccess\";s:32:\"b12739e14a9d18d7090427db01bd4021\";s:50:\"C:/OSPanel/domains/evotest.local/manager/index.php\";s:32:\"89262755b0e2b7ca727e59ba268f0c33\";s:64:\"C:/OSPanel/domains/evotest.local/manager/includes/config.inc.php\";s:32:\"7213d83d12990982e72ebd7b28c91028\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_user_attributes`
--

CREATE TABLE `cgck_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.';

--
-- Дамп данных таблицы `cgck_user_attributes`
--

INSERT INTO `cgck_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `createdon`, `editedon`) VALUES
(1, 1, 'Admin', 1, 'redchik091089@gmail.com', '', '', 0, 0, 0, 10, 1536880728, 1536905864, 0, 'ekfcap0hjsgd6qbjhoftiik844b0ks4l', 0, 0, '', '', '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_user_messages`
--

CREATE TABLE `cgck_user_messages` (
  `id` int(10) NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_user_roles`
--

CREATE TABLE `cgck_user_roles` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `category_manager` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.';

--
-- Дамп данных таблицы `cgck_user_roles`
--

INSERT INTO `cgck_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `category_manager`, `file_manager`, `assets_files`, `assets_images`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`, `display_locks`, `change_resourcetype`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_user_settings`
--

CREATE TABLE `cgck_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_webgroup_access`
--

CREATE TABLE `cgck_webgroup_access` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_webgroup_names`
--

CREATE TABLE `cgck_webgroup_names` (
  `id` int(10) NOT NULL,
  `name` varchar(245) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_web_groups`
--

CREATE TABLE `cgck_web_groups` (
  `id` int(10) NOT NULL,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_web_users`
--

CREATE TABLE `cgck_web_users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_web_user_attributes`
--

CREATE TABLE `cgck_web_user_attributes` (
  `id` int(10) NOT NULL,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.';

-- --------------------------------------------------------

--
-- Структура таблицы `cgck_web_user_settings`
--

CREATE TABLE `cgck_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cgck_active_users`
--
ALTER TABLE `cgck_active_users`
  ADD PRIMARY KEY (`sid`,`username`);

--
-- Индексы таблицы `cgck_active_user_locks`
--
ALTER TABLE `cgck_active_user_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`);

--
-- Индексы таблицы `cgck_active_user_sessions`
--
ALTER TABLE `cgck_active_user_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Индексы таблицы `cgck_categories`
--
ALTER TABLE `cgck_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_documentgroup_names`
--
ALTER TABLE `cgck_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `cgck_document_groups`
--
ALTER TABLE `cgck_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_dg_id` (`document_group`,`document`),
  ADD KEY `document` (`document`),
  ADD KEY `document_group` (`document_group`);

--
-- Индексы таблицы `cgck_event_log`
--
ALTER TABLE `cgck_event_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `cgck_manager_log`
--
ALTER TABLE `cgck_manager_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_manager_users`
--
ALTER TABLE `cgck_manager_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `cgck_membergroup_access`
--
ALTER TABLE `cgck_membergroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_membergroup_names`
--
ALTER TABLE `cgck_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `cgck_member_groups`
--
ALTER TABLE `cgck_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_member` (`user_group`,`member`);

--
-- Индексы таблицы `cgck_sg_images`
--
ALTER TABLE `cgck_sg_images`
  ADD PRIMARY KEY (`sg_id`),
  ADD KEY `sg_rid` (`sg_rid`),
  ADD KEY `sg_index` (`sg_index`),
  ADD KEY `sg_isactive` (`sg_isactive`);

--
-- Индексы таблицы `cgck_site_content`
--
ALTER TABLE `cgck_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `aliasidx` (`alias`),
  ADD KEY `typeidx` (`type`);
ALTER TABLE `cgck_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`);

--
-- Индексы таблицы `cgck_site_htmlsnippets`
--
ALTER TABLE `cgck_site_htmlsnippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_modules`
--
ALTER TABLE `cgck_site_modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_module_access`
--
ALTER TABLE `cgck_site_module_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_module_depobj`
--
ALTER TABLE `cgck_site_module_depobj`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_plugins`
--
ALTER TABLE `cgck_site_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_plugin_events`
--
ALTER TABLE `cgck_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`evtid`);

--
-- Индексы таблицы `cgck_site_snippets`
--
ALTER TABLE `cgck_site_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_templates`
--
ALTER TABLE `cgck_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_tmplvars`
--
ALTER TABLE `cgck_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_rank` (`rank`);

--
-- Индексы таблицы `cgck_site_tmplvar_access`
--
ALTER TABLE `cgck_site_tmplvar_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_site_tmplvar_contentvalues`
--
ALTER TABLE `cgck_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  ADD KEY `idx_tmplvarid` (`tmplvarid`),
  ADD KEY `idx_id` (`contentid`);
ALTER TABLE `cgck_site_tmplvar_contentvalues` ADD FULLTEXT KEY `value_ft_idx` (`value`);

--
-- Индексы таблицы `cgck_site_tmplvar_templates`
--
ALTER TABLE `cgck_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Индексы таблицы `cgck_system_eventnames`
--
ALTER TABLE `cgck_system_eventnames`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_system_settings`
--
ALTER TABLE `cgck_system_settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- Индексы таблицы `cgck_user_attributes`
--
ALTER TABLE `cgck_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `cgck_user_messages`
--
ALTER TABLE `cgck_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_user_roles`
--
ALTER TABLE `cgck_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_user_settings`
--
ALTER TABLE `cgck_user_settings`
  ADD PRIMARY KEY (`user`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `cgck_webgroup_access`
--
ALTER TABLE `cgck_webgroup_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cgck_webgroup_names`
--
ALTER TABLE `cgck_webgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `cgck_web_groups`
--
ALTER TABLE `cgck_web_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`);

--
-- Индексы таблицы `cgck_web_users`
--
ALTER TABLE `cgck_web_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `cgck_web_user_attributes`
--
ALTER TABLE `cgck_web_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`internalKey`);

--
-- Индексы таблицы `cgck_web_user_settings`
--
ALTER TABLE `cgck_web_user_settings`
  ADD PRIMARY KEY (`webuser`,`setting_name`),
  ADD KEY `setting_name` (`setting_name`),
  ADD KEY `webuserid` (`webuser`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cgck_active_user_locks`
--
ALTER TABLE `cgck_active_user_locks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT для таблицы `cgck_categories`
--
ALTER TABLE `cgck_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `cgck_documentgroup_names`
--
ALTER TABLE `cgck_documentgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_document_groups`
--
ALTER TABLE `cgck_document_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_event_log`
--
ALTER TABLE `cgck_event_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cgck_manager_log`
--
ALTER TABLE `cgck_manager_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=687;

--
-- AUTO_INCREMENT для таблицы `cgck_manager_users`
--
ALTER TABLE `cgck_manager_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cgck_membergroup_access`
--
ALTER TABLE `cgck_membergroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_membergroup_names`
--
ALTER TABLE `cgck_membergroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_member_groups`
--
ALTER TABLE `cgck_member_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_sg_images`
--
ALTER TABLE `cgck_sg_images`
  MODIFY `sg_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `cgck_site_content`
--
ALTER TABLE `cgck_site_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `cgck_site_htmlsnippets`
--
ALTER TABLE `cgck_site_htmlsnippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `cgck_site_modules`
--
ALTER TABLE `cgck_site_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cgck_site_module_access`
--
ALTER TABLE `cgck_site_module_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_site_module_depobj`
--
ALTER TABLE `cgck_site_module_depobj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_site_plugins`
--
ALTER TABLE `cgck_site_plugins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `cgck_site_snippets`
--
ALTER TABLE `cgck_site_snippets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `cgck_site_templates`
--
ALTER TABLE `cgck_site_templates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `cgck_site_tmplvars`
--
ALTER TABLE `cgck_site_tmplvars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `cgck_site_tmplvar_access`
--
ALTER TABLE `cgck_site_tmplvar_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_site_tmplvar_contentvalues`
--
ALTER TABLE `cgck_site_tmplvar_contentvalues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `cgck_system_eventnames`
--
ALTER TABLE `cgck_system_eventnames`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1042;

--
-- AUTO_INCREMENT для таблицы `cgck_user_attributes`
--
ALTER TABLE `cgck_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cgck_user_messages`
--
ALTER TABLE `cgck_user_messages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_user_roles`
--
ALTER TABLE `cgck_user_roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cgck_webgroup_access`
--
ALTER TABLE `cgck_webgroup_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_webgroup_names`
--
ALTER TABLE `cgck_webgroup_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_web_groups`
--
ALTER TABLE `cgck_web_groups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_web_users`
--
ALTER TABLE `cgck_web_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cgck_web_user_attributes`
--
ALTER TABLE `cgck_web_user_attributes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
