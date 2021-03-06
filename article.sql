-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2015 年 05 月 07 日 21:18
-- 服务器版本: 5.5.23
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `app_arcaneprince`
--

-- --------------------------------------------------------

--
-- 表的结构 `article_article`
--

CREATE TABLE IF NOT EXISTS `article_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` longtext,
  `catagory_id` int(11) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_cbd024a9` (`catagory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `article_article`
--

INSERT INTO `article_article` (`id`, `title`, `content`, `catagory_id`, `datetime`) VALUES
(1, 'title1', '[{"type":"code","detail":"<div class=\\"highlight\\"><pre><span class=\\"kn\\">import</span> <span class=\\"nn\\">pprint</span><span class=\\"k\\">print</span> <span class=\\"s\\">&quot;Hello World&quot;</span></pre></div>"},{"type":"text", "detail":"text"}]', 1, '2015-04-25 16:58:13'),
(2, 'title2', '[{"type":"code","detail":"<div class=\\"highlight\\"><pre><span class=\\"kn\\">import</span> <span class=\\"nn\\">pprint</span><span class=\\"k\\">print</span> <span class=\\"s\\">&quot;Hello World&quot;</span></pre></div>"},{"type":"text", "detail":"text"}]', 1, '2015-04-24 16:58:40'),
(3, 'title3', '[{"type": "code", "detail": "<div class=\\"highlight\\"><pre><span class=\\"kn\\">import</span> <span class=\\"nn\\">pprint</span><span class=\\"k\\">print</span> <span class=\\"s\\">&quot;Hello World&quot;</span></pre></div>"}, {"type": "text", "detail": "text"}]', 2, '2015-04-23 16:59:00'),
(4, 'title4', '[{"type":"code","detail":"<div class=\\"highlight\\"><pre><span class=\\"kn\\">import</span> <span class=\\"nn\\">pprint</span><span class=\\"k\\">print</span> <span class=\\"s\\">&quot;Hello World&quot;</span></pre></div>"},{"type":"text", "detail":"text"}]', 2, '2015-04-21 16:59:30'),
(34, 'test', '[{"type": "text", "detail": "tset"}]', 20, '2015-05-03 14:11:26'),
(36, 'test2', '[{"type": "text", "detail": "This is just a test."}, {"type": "code", "detail": "<div class=\\"highlight\\"><pre><span class=\\"kn\\">import</span> <span class=\\"nn\\">pprint</span>\\n<span class=\\"n\\">pprint</span><span class=\\"p\\">(</span><span class=\\"s\\">&quot;hello world&quot;</span><span class=\\"p\\">)</span>\\n</pre></div>\\n"}]', 20, '2015-05-06 23:13:31');

-- --------------------------------------------------------

--
-- 表的结构 `article_catagory`
--

CREATE TABLE IF NOT EXISTS `article_catagory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `article_catagory`
--

INSERT INTO `article_catagory` (`id`, `name`) VALUES
(1, 'catagory1'),
(2, 'catagory2'),
(20, 'test');

-- --------------------------------------------------------

--
-- 表的结构 `article_comment`
--

CREATE TABLE IF NOT EXISTS `article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(32) NOT NULL,
  `datetime` datetime NOT NULL,
  `content` longtext NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_comment_a00c1b00` (`article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `article_comment`
--

INSERT INTO `article_comment` (`id`, `nick`, `datetime`, `content`, `article_id`) VALUES
(1, 'nick1', '2015-04-25 16:59:56', 'comment content1', 1),
(2, 'nick2', '2015-04-26 17:00:33', 'comment content2', 1),
(3, 'nick3', '2015-04-27 17:01:13', 'comment content3', 2),
(4, 'nick4', '2015-04-27 17:01:48', 'comment content4', 2),
(5, 'nick5', '2015-04-28 17:03:06', 'comment content 5', 3),
(6, 'nick6', '2015-04-27 17:03:19', 'comment content6', 3),
(7, 'nick7', '2015-04-27 17:03:48', 'comment content7', 4),
(8, 'nick8', '2015-04-27 17:04:08', 'comment content8', 4),
(11, 'nicolas', '2015-05-06 23:47:21', 'test email', 36),
(12, 'nicolas', '2015-05-06 23:48:10', 'test email', 36),
(13, 'nicolas', '2015-05-06 23:51:31', 'test email qq', 36),
(14, 'nicolas', '2015-05-06 23:57:22', 'test gmail', 36),
(15, 'nicolas', '2015-05-06 23:58:47', 'test', 36),
(16, 'nicolas', '2015-05-06 23:59:06', 'test', 36),
(17, 'nicolas', '2015-05-07 00:05:50', 'fasdf', 36),
(18, 'nicolas', '2015-05-07 00:06:00', 'tasef', 34),
(19, 'nicolas', '2015-05-07 00:06:31', 'fasd', 34),
(20, 'nicolas', '2015-05-07 00:14:40', 'fsda', 34),
(21, 'nicolas', '2015-05-07 00:16:52', 'fadsf', 34),
(22, 'nicolas', '2015-05-07 00:18:15', 'fads', 34),
(23, 'nicolas', '2015-05-07 00:20:32', 'fasd', 34);

-- --------------------------------------------------------

--
-- 表的结构 `article_reply`
--

CREATE TABLE IF NOT EXISTS `article_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(32) NOT NULL,
  `owner` varchar(32) NOT NULL,
  `datetime` datetime NOT NULL,
  `content` longtext NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_reply_69b97d17` (`comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `article_reply`
--

INSERT INTO `article_reply` (`id`, `nick`, `owner`, `datetime`, `content`, `comment_id`) VALUES
(1, 'nick9', 'nick1', '2015-04-26 17:06:39', 'reply content1', 1),
(2, 'nick10', 'nick1', '2015-04-27 17:07:08', 'reply content2', 1),
(3, 'nick11', 'nick2', '2015-04-26 17:07:22', 'reply content3', 2),
(4, 'nick12', 'nick2', '2015-04-26 17:07:38', 'reply content4', 2),
(5, 'nick13', 'nick3', '2015-04-26 17:07:54', 'reply content5', 3),
(6, 'nick14', 'nick3', '2015-04-26 17:08:12', 'reply content6', 3),
(7, 'nick7', 'nick4', '2015-04-26 17:08:39', 'reply content7', 4),
(8, 'nick8', 'nick4', '2015-04-26 17:09:00', 'reply content8', 4),
(9, 'nick9', 'nick5', '2015-04-26 17:09:14', 'reply content9', 5),
(10, 'nick10', 'nick5', '2015-04-26 17:09:34', 'reply content10', 5),
(11, 'nick11', 'nick6', '2015-04-26 17:09:49', 'reply content11', 6),
(12, 'nick12', 'nick6', '2015-04-26 17:10:04', 'reply content12', 6),
(13, 'nick13', 'nick7', '2015-04-26 17:10:18', 'reply content13', 7),
(14, 'nick14', 'nick7', '2015-04-26 17:10:31', 'reply content14', 7),
(15, 'nick15', 'nick8', '2015-04-26 17:10:43', 'reply content15', 8),
(16, 'nick16', 'nick8', '2015-04-26 17:11:08', 'reply content16', 8),
(18, 'htrger', 'nick12', '2015-05-03 14:06:46', 'fasdfds', 2);

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add reply', 8, 'add_reply'),
(23, 'Can change reply', 8, 'change_reply'),
(24, 'Can delete reply', 8, 'delete_reply'),
(25, 'Can add comment', 9, 'add_comment'),
(26, 'Can change comment', 9, 'change_comment'),
(27, 'Can delete comment', 9, 'delete_comment'),
(31, 'Can add article', 11, 'add_article'),
(32, 'Can change article', 11, 'change_article'),
(33, 'Can delete article', 11, 'delete_article'),
(34, 'Can add catagory', 12, 'add_catagory'),
(35, 'Can change catagory', 12, 'change_catagory'),
(36, 'Can delete catagory', 12, 'delete_catagory');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$TFmfTCGtDYXc$OGd+MiVYTZG3xYT7IZPBU4r3XDKeJlUm3UeyB9vfDP4=', '2015-05-07 17:26:06', 1, 'nicolas', '', '', 'nicolas.lshuang@gmail.com', 1, 1, '2015-04-14 23:27:51');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_user_groups`
--


-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `django_admin_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'reply', 'article', 'reply'),
(9, 'comment', 'article', 'comment'),
(11, 'article', 'article', 'article'),
(12, 'catagory', 'article', 'catagory');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-04-14 23:24:58'),
(2, 'auth', '0001_initial', '2015-04-14 23:24:58'),
(3, 'admin', '0001_initial', '2015-04-14 23:24:58'),
(4, 'article', '0001_initial', '2015-04-14 23:24:58'),
(5, 'sessions', '0001_initial', '2015-04-14 23:24:58'),
(6, 'sites', '0001_initial', '2015-04-14 23:24:58'),
(7, 'article', '0002_auto_20150421_2208', '2015-04-21 22:09:22'),
(8, 'article', '0002_auto_20150423_1328', '2015-04-23 19:41:50'),
(9, 'article', '0003_merge', '2015-04-23 19:41:50'),
(10, 'article', '0004_auto_20150424_2225', '2015-04-24 22:25:26'),
(11, 'article', '0005_auto_20150424_2319', '2015-04-24 23:20:05');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ec6807a6b85da6ef5d6f8b2da9348958', 'ZTdlMWEzNmJmMjc1MzU1NjQ5OTQ3NDk4MDNmZWFhMTIxMzRmZDk4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2015-05-21 17:26:06'),
('955cccd8a2d67f7eeb1ddbf2fb62a02d', 'NTFhNTZmMjNmNzIxNzAzMzdhYTNlMzRjYWFlNDU3OTJjZTk1MWYwNzqAAn1xAS4=\n', '2015-05-20 09:08:32'),
('fc586cff05c58511cbaf46987b85ea70', 'NTFhNTZmMjNmNzIxNzAzMzdhYTNlMzRjYWFlNDU3OTJjZTk1MWYwNzqAAn1xAS4=\n', '2015-05-20 09:09:03'),
('7e92253582f9a6b6e9021fe237dc685b', 'NTFhNTZmMjNmNzIxNzAzMzdhYTNlMzRjYWFlNDU3OTJjZTk1MWYwNzqAAn1xAS4=\n', '2015-05-20 23:13:35');

-- --------------------------------------------------------

--
-- 表的结构 `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');
