/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : meeting_room

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-04-18 22:47:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', '$2y$10$x2FsLsDqwO/U2433mF9pLOHxT8AkcuYeSDHqA5trqKvqZPHERPzOS', null, '2017-04-06 09:40:36');

-- ----------------------------
-- Table structure for applies
-- ----------------------------
DROP TABLE IF EXISTS `applies`;
CREATE TABLE `applies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL COMMENT '申请的会议室ID',
  `start_time` int(11) NOT NULL COMMENT '申请的开始时间',
  `end_time` int(11) NOT NULL COMMENT '申请的结束时间',
  `people_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '预约者姓名',
  `people_tel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系方式',
  `meeting_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会议标题',
  `meeting_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会议概要',
  `pass` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否通过申请',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT '不通过的原因',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of applies
-- ----------------------------
INSERT INTO `applies` VALUES ('18', '20', '1491802200', '1491809400', 'wxj', '18839136666', '开会', '交流会', '1', null, '2017-04-10 13:00:28', '2017-04-10 15:59:12');
INSERT INTO `applies` VALUES ('19', '20', '1491809400', '1491816600', 'www', '12345678900', '交流会', '开交流会', '2', '不行', '2017-04-10 13:18:48', '2017-04-10 15:59:25');
INSERT INTO `applies` VALUES ('22', '20', '1491814800', '1491818400', 'qq', 'qqq', 'qqqq', 'qqqqq', '0', null, '2017-04-10 16:01:33', '2017-04-10 16:01:33');
INSERT INTO `applies` VALUES ('23', '20', '1491823800', '1491831000', 'wwwww', '23423423', 'qweqw', 'qweqweqweqw', '0', null, '2017-04-10 16:07:57', '2017-04-10 16:07:57');
INSERT INTO `applies` VALUES ('24', '12', '1492579800', '1492587000', 'wxj', '18839136081', '开会', '就是开会', '0', null, '2017-04-18 21:33:33', '2017-04-18 21:33:33');
INSERT INTO `applies` VALUES ('25', '20', '1492586700', '1492594200', 'w', 'www', 'www', 'wwwww', '0', null, '2017-04-18 22:40:12', '2017-04-18 22:40:12');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2017_04_05_102332_create_admins_table', '1');
INSERT INTO `migrations` VALUES ('4', '2017_04_06_140657_create_rooms_table', '2');
INSERT INTO `migrations` VALUES ('6', '2017_04_08_173508_create_applies_table', '3');
INSERT INTO `migrations` VALUES ('7', '2017_04_11_154330_create_notices_table', '4');
INSERT INTO `migrations` VALUES ('8', '2017_04_17_163722_create_terms_table', '5');

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告主题颜色',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('3', '提示111', '<p>提示111</p>', 'warning', '2017-04-12 16:20:36', '2017-04-14 13:16:27');
INSERT INTO `notices` VALUES ('4', '提示222', '<p>提示222</p>', 'info', '2017-04-12 16:20:44', '2017-04-14 13:17:19');
INSERT INTO `notices` VALUES ('5', '最新的公告', '<p>来来来,发一篇最新的公告</p>', 'danger', '2017-04-12 16:20:47', '2017-04-14 16:03:29');

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会议室名称',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT '会议室地点',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '会议室简介',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES ('20', '会议室1', '力行楼方形会议室呵呵', '呵呵呵呵666', '2017-04-06 15:23:08', '2017-04-07 06:29:00');
INSERT INTO `rooms` VALUES ('12', '会议室2', '力行楼方形会议室呵呵', '呵呵呵呵666', '2017-04-06 15:23:08', '2017-04-07 06:29:00');
INSERT INTO `rooms` VALUES ('13', '会议室3', '力行楼方形会议室呵呵', '呵呵呵呵666', '2017-04-06 15:23:08', '2017-04-07 06:29:00');
INSERT INTO `rooms` VALUES ('14', '会议室4', '力行楼方形会议室呵呵', '呵呵呵呵666', '2017-04-06 15:23:08', '2017-04-07 06:29:00');
INSERT INTO `rooms` VALUES ('15', '会议室5', '学术报告厅', '学术报告', '2017-04-06 15:23:20', '2017-04-06 15:23:20');
INSERT INTO `rooms` VALUES ('16', '会议室6', '力行楼方形会议室呵呵', '呵呵呵呵666', '2017-04-06 15:23:08', '2017-04-07 06:29:00');

-- ----------------------------
-- Table structure for terms
-- ----------------------------
DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `termName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学期名称',
  `startTime` int(11) NOT NULL COMMENT '开始日期',
  `weekCount` int(11) NOT NULL COMMENT '学期总周数',
  `default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认学期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of terms
-- ----------------------------
INSERT INTO `terms` VALUES ('14', '2017第一学期', '1487520000', '25', '0', '2017-04-18 22:36:53', '2017-04-18 22:36:53');
INSERT INTO `terms` VALUES ('13', '2017第二学期', '1505059200', '25', '0', '2017-04-18 21:30:24', '2017-04-18 21:30:33');
SET FOREIGN_KEY_CHECKS=1;
