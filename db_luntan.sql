/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 5.7.18-log : Database - db_luntan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_luntan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_luntan`;

/*Table structure for table `campus_category` */

DROP TABLE IF EXISTS `campus_category`;

CREATE TABLE `campus_category` (
  `category_id` bigint(20) NOT NULL COMMENT '分类主键',
  `category_name` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '分类名',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父分类id',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `slug` varchar(30) NOT NULL COMMENT '缩略名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `icon` varchar(100) DEFAULT NULL COMMENT '分类图标\n',
  `status` char(1) CHARACTER SET utf8 DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_category` */

insert  into `campus_category`(`category_id`,`category_name`,`parent_id`,`order_num`,`slug`,`description`,`type`,`icon`,`status`,`del_flag`,`create_time`,`create_user`,`update_time`,`update_user`) values 
(1,'最新资讯',0,0,'newest','最近的墙内容(菜单默认选择这个)','Y','system','0','\0','2022-12-30 20:11:41',1,'2023-01-01 22:23:49',1),
(123,'比赛实况',0,2,'friends','','N','system','0','\0','2021-10-15 10:32:00',NULL,'2023-04-07 19:30:12',1),
(1449212758636646402,'欧冠',123,1,'debunk','吐槽描述','N','system','0','\0','2021-10-16 11:17:01',NULL,'2023-01-01 22:26:29',1),
(1465662542308495361,'足球活动',0,3,'share','','N','system','0','\0','2021-11-30 20:42:35',NULL,'2022-12-26 17:57:48',1),
(1602336520042287105,'我创建的',1465662542308495361,2,'daily_sharing',NULL,'N','system','0','\0','2022-12-13 00:16:11',1,'2022-12-26 17:57:51',1),
(1602336520041231235,'我参与的',1465662542308495361,2,'daily_sharing',NULL,'N','system','0','\0','2022-12-13 00:16:11',1,'2022-12-26 17:57:51',1),
(1644302032332709889,'世界杯',123,2,'make_friends',NULL,'N','system','0','\0','2023-04-07 19:32:09',1,'2023-04-07 19:32:08',1),
(1644302999660847105,'购物广场',0,4,'buy_and_sell',NULL,'N','system','0','\0','2023-04-07 19:35:59',1,'2023-04-07 19:35:59',1),
(1644303286433800193,'热门',1644302999660847105,1,'want_to_buy',NULL,'N','system','0','\0','2023-04-07 19:37:08',1,'2023-04-07 19:37:07',1),
(1644303516352962562,'最新',1644302999660847105,2,'sell',NULL,'N','system','0','\0','2023-04-07 19:38:03',1,'2023-04-07 19:38:02',1),
/*Table structure for table `campus_comment` */

DROP TABLE IF EXISTS `campus_comment`;

CREATE TABLE `campus_comment` (
  `comment_id` bigint(20) NOT NULL COMMENT '评论主键',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级id',
  `one_level_id` bigint(20) DEFAULT '-1' COMMENT '所属的一级评论id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `to_user_id` bigint(20) DEFAULT '-1' COMMENT '所回复目标评论的用户id',
  `content_id` bigint(20) DEFAULT NULL COMMENT '内容id',
  `co_content` varchar(200) DEFAULT NULL COMMENT '评论内容',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论时的ip',
  `address` varchar(100) DEFAULT NULL COMMENT '评论时的地址',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_comment` */

insert  into `campus_comment`(`comment_id`,`parent_id`,`one_level_id`,`user_id`,`to_user_id`,`content_id`,`co_content`,`ip`,`address`,`del_flag`,`create_time`,`create_user`,`update_time`,`update_user`) values 
(11,0,-1,1594285543804383234,-1,1,'你好11','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(12,0,-1,1594285543804383234,-1,1,'你好12','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(13,0,-1,1594285543804383234,-1,1,'你好13','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(14,0,-1,1594285543804383234,-1,1,'你好14','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(15,0,-1,1594285543804383234,-1,1,'你好15','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(16,0,-1,1594285543804383234,-1,1,'你好16','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(17,0,-1,1594285543804383234,-1,1,'你好17','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(18,0,-1,1594285543804383234,-1,1,'你好18','127.0.0.1','内网IP','','2023-01-06 15:27:22',NULL,'2023-04-22 19:59:02',1),
(1629730765613047809,0,-1,1594285543804383234,-1,1629730419490693121,'世界','127.0.0.1','内网IP','','2023-02-26 14:31:08',1594285543804383234,'2023-04-22 19:59:02',1),
(1629730802099298306,1629730765613047809,1629730765613047809,1594285543804383234,-1,1629730419490693121,'hello world！','127.0.0.1','内网IP','','2023-02-26 14:31:17',1594285543804383234,'2023-04-22 19:59:02',1),
(1635847411633246209,1629730765613047809,1629730765613047809,1594285543804383234,-1,1629730419490693121,'123','127.0.0.1','内网IP','','2023-03-15 11:36:30',1594285543804383234,'2023-04-22 19:59:15',1),
(1636017759590830082,0,-1,1594285543804383234,-1,1629730419490693121,'1','127.0.0.1','内网IP','','2023-03-15 22:53:24',1594285543804383234,'2023-04-22 19:59:15',1),
(1636017766272356353,0,-1,1594285543804383234,-1,1629730419490693121,'2','127.0.0.1','内网IP','','2023-03-15 22:53:26',1594285543804383234,'2023-04-22 19:59:15',1),
(1636017772526063617,0,-1,1594285543804383234,-1,1629730419490693121,'3','127.0.0.1','内网IP','','2023-03-15 22:53:27',1594285543804383234,'2023-04-22 19:59:15',1),
(1636017800254607362,0,-1,1594285543804383234,-1,1629730419490693121,'4','127.0.0.1','内网IP','','2023-03-15 22:53:34',1594285543804383234,'2023-04-22 19:59:15',1),
(1636017809863757825,0,-1,1594285543804383234,-1,1629730419490693121,'5','127.0.0.1','内网IP','','2023-03-15 22:53:36',1594285543804383234,'2023-04-22 19:59:15',1),
(1636017819649069057,0,-1,1594285543804383234,-1,1629730419490693121,'6','127.0.0.1','内网IP','','2023-03-15 22:53:39',1594285543804383234,'2023-04-22 19:59:15',1),
(1636022008630497281,1636017819649069057,1636017819649069057,1594285543804383234,-1,1629730419490693121,'7','127.0.0.1','内网IP','','2023-03-15 23:10:17',1594285543804383234,'2023-04-22 19:59:15',1),
(1643078885163933697,0,-1,1594285543804383234,-1,1635923549986508801,'1','127.0.0.1','内网IP','','2023-04-04 10:31:48',1594285543804383234,'2023-04-22 19:59:15',1),
(1643640726665396227,1643078885163933697,1643078885163933697,1594285543804383234,-1,1635923549986508801,'2','127.0.0.1','内网IP','','2023-04-05 23:44:21',1594285543804383234,'2023-04-22 19:59:15',1),
(1643794139778953219,1643640726665396227,1643078885163933697,1594285543804383234,1594285543804383234,1635923549986508801,'3','127.0.0.1','内网IP','','2023-04-06 09:53:58',1594285543804383234,'2023-04-22 19:59:21',1),
(1643794182640545794,1643794139778953219,1643078885163933697,1594285543804383234,1594285543804383234,1635923549986508801,'4','127.0.0.1','内网IP','','2023-04-06 09:54:08',1594285543804383234,'2023-04-22 19:59:21',1),
(1643804468588101634,1643794182640545794,1643078885163933697,1594285543804383234,1594285543804383234,1635923549986508801,'5','127.0.0.1','内网IP','','2023-04-06 10:35:00',1594285543804383234,'2023-04-22 19:59:21',1),
(1649717750420377602,0,-1,1649715389631205378,-1,1649716958460284929,'真不错','127.0.0.1','内网IP','','2023-04-22 18:12:17',1649715389631205378,'2023-04-22 19:59:21',1),
(1649728483849818115,0,-1,1649726942417940482,-1,1649727932294680577,'可以呀','127.0.0.1','内网IP','','2023-04-22 18:54:56',1649726942417940482,'2023-04-22 19:59:21',1),
(1649729517351489539,0,-1,1649729414364549121,-1,1649728915062018049,'确实','127.0.0.1','内网IP','','2023-04-22 18:59:02',1649729414364549121,'2023-04-22 19:59:21',1),
(1649744758655307778,0,-1,1649740877917474817,-1,1649743644950155265,'球球了姐妹们，真的想','127.0.0.1','内网IP','\0','2023-04-22 19:59:36',1649740877917474817,'2023-04-22 19:59:34',1),
(1656563460411473922,0,-1,1649740877917474817,-1,1656510184605249538,'哈哈哈','127.0.0.1','内网IP','\0','2023-05-11 15:34:41',1649740877917474817,'2023-05-11 15:34:40',NULL),
(1656563714540158978,0,-1,1649740877917474817,-1,1656510184605249538,'太倒霉了','127.0.0.1','内网IP','\0','2023-05-11 15:35:42',1649740877917474817,'2023-05-11 15:35:41',NULL),
(1656572869279727619,1656563714540158978,1656563714540158978,1649740877917474817,-1,1656510184605249538,'真不错','127.0.0.1','内网IP','\0','2023-05-11 16:12:04',1649740877917474817,'2023-05-11 16:12:03',NULL),
(1656572896391708674,1656572869279727619,1656563714540158978,1649740877917474817,1649740877917474817,1656510184605249538,'哈哈哈很好','127.0.0.1','内网IP','\0','2023-05-11 16:12:11',1649740877917474817,'2023-05-11 16:12:10',NULL),
(1659370710024761347,0,-1,1649740877917474817,-1,1649742369252593665,'哈哈哈','127.0.0.1','内网IP','\0','2023-05-19 09:29:42',1649740877917474817,'2023-05-19 09:29:41',NULL),
(1691120045142265859,0,-1,1649740877917474817,-1,1649743644950155265,'不错','127.0.0.1','内网IP','','2023-08-15 00:10:13',1649740877917474817,'2023-08-15 00:10:18',NULL),
(1692093267744624643,0,-1,1649740877917474817,-1,1649743644950155265,'餐厨','127.0.0.1','内网IP','','2023-08-17 16:37:27',1649740877917474817,'2023-08-17 16:37:31',NULL),
(1692355590187102210,0,-1,1649740877917474817,-1,1692355500265418754,'测试一下','127.0.0.1','内网IP','','2023-08-18 09:59:50',1649740877917474817,'2023-08-18 10:05:39',NULL),
(1692358895827116035,0,-1,1649740877917474817,-1,1649743644950155265,'我测试','127.0.0.1','内网IP','','2023-08-18 10:12:58',1649740877917474817,'2023-08-18 10:13:05',NULL),
(1692358920338628610,1692358895827116035,1692358895827116035,1649740877917474817,-1,1649743644950155265,'测试','127.0.0.1','内网IP','\0','2023-08-18 10:13:04',1649740877917474817,'2023-08-18 10:13:03',NULL),
(1692358964496261122,0,-1,1649740877917474817,-1,1692357151567110145,'你。。','127.0.0.1','内网IP','','2023-08-18 10:13:14',1649740877917474817,'2023-08-18 10:13:26',NULL),
(1692358986025623554,1692358964496261122,1692358964496261122,1649740877917474817,-1,1692357151567110145,'你。。','127.0.0.1','内网IP','\0','2023-08-18 10:13:19',1649740877917474817,'2023-08-18 10:13:19',NULL),
(1698358415790678019,0,-1,1649740877917474817,-1,1698224556105265153,'太好了','127.0.0.1','内网IP','\0','2023-09-03 23:32:55',1649740877917474817,'2023-09-03 23:32:54',NULL),
(1698358449638711298,1698358415790678019,1698358415790678019,1649740877917474817,-1,1698224556105265153,'真的很不错','127.0.0.1','内网IP','\0','2023-09-03 23:33:03',1649740877917474817,'2023-09-03 23:33:03',NULL),
(1698494872131969026,0,-1,1649740877917474817,-1,1692357151567110145,'您好','127.0.0.1','内网IP','\0','2023-09-04 08:35:09',1649740877917474817,'2023-09-04 08:35:08',NULL),
(1698566176235298818,0,-1,1649740877917474817,-1,1698564788453351425,'你写的文章这不错','127.0.0.1','内网IP','\0','2023-09-04 13:18:29',1649740877917474817,'2023-09-04 13:18:28',NULL),
(1716722210892128259,0,-1,1649740877917474817,-1,1698224556105265153,'确实不错','127.0.0.1','内网IP','','2023-10-24 15:44:05',1649740877917474817,'2023-10-24 15:44:21',NULL),
(1798666820065808387,0,-1,1798666727048728577,-1,1798624306965315585,'牛逼啊，多少钱？','127.0.0.1','内网IP','\0','2024-06-06 18:42:42',1798666727048728577,'2024-06-06 18:42:42',NULL);

/*Table structure for table `campus_content` */

DROP TABLE IF EXISTS `campus_content`;

CREATE TABLE `campus_content` (
  `content_id` bigint(20) NOT NULL COMMENT '内容主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类别id',
  `content` varchar(700) DEFAULT NULL COMMENT '发表的内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0审核,1正常,2下架,3拒绝（审核不通过）',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型：0文字,1图片,2视频',
  `file_count` int(11) DEFAULT NULL COMMENT '文件数量',
  `love_count` int(11) DEFAULT '0' COMMENT '点赞数量',
  `is_anonymous` tinyint(1) DEFAULT '0' COMMENT '0不匿名，1匿名',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_content` */

insert  into `campus_content`(`content_id`,`user_id`,`category_id`,`content`,`status`,`type`,`file_count`,`love_count`,`is_anonymous`,`remark`,`del_flag`,`create_time`,`create_user`,`update_time`,`update_user`) values 
(1656504969327964161,1649740877917474817,1449212758636646402,'测试匿名',0,0,0,0,0,NULL,'','2023-05-11 11:42:16',1649740877917474817,'2023-05-11 11:52:40',NULL),
(1656507759131521026,1649740877917474817,1449212758636646402,'测试匿名',0,0,0,0,0,NULL,'','2023-05-11 11:53:21',1649740877917474817,'2023-08-15 00:09:56',NULL),
(1656510184605249538,1649740877917474817,1449212758636646402,'测试匿名',1,0,0,1,1,NULL,'','2023-05-11 12:02:59',1649740877917474817,'2023-08-15 00:10:02',1),
(1659370330180202498,1649740877917474817,1449212758636646402,'测试',1,0,0,0,0,NULL,'','2023-05-19 09:28:11',1649740877917474817,'2023-08-15 00:09:59',1),
(1659370752517255169,1649740877917474817,1449212758636646402,'测试内容',1,0,0,0,0,NULL,'','2023-05-19 09:29:52',1649740877917474817,'2023-08-15 00:09:57',1),
(1692093317010919426,1649740877917474817,1449212758636646402,'您好',0,0,0,0,0,NULL,'','2023-08-17 16:37:39',1649740877917474817,'2023-08-17 16:37:41',NULL),
(1692345744318517249,1649740877917474817,1449212758636646402,'这不错',1,1,1,0,0,NULL,'','2023-08-18 09:20:42',1649740877917474817,'2023-08-18 09:29:19',1),
(1692347485780955138,1649740877917474817,1602336520042287105,'哈哈哈',1,1,1,0,0,NULL,'','2023-08-18 09:27:38',1649740877917474817,'2023-08-18 09:29:18',1),
(1692347820230561793,1649740877917474817,1602336520042287105,'可以的',0,1,1,0,0,NULL,'','2023-08-18 09:28:57',1649740877917474817,'2023-08-18 09:29:10',NULL),
(1692347974878674946,1649740877917474817,1449212758636646402,'可以',0,1,1,0,0,NULL,'','2023-08-18 09:29:34',1649740877917474817,'2023-08-18 09:38:05',NULL),
(1692352315530371073,1649740877917474817,1449212758636646402,'测试',0,1,1,0,0,NULL,'','2023-08-18 09:46:49',1649740877917474817,'2023-08-18 09:59:06',NULL),
(1692353045314101250,1649740877917474817,1449212758636646402,'测试',0,1,1,0,0,NULL,'','2023-08-18 09:49:43',1649740877917474817,'2023-08-18 09:59:05',NULL),
(1692354797887283202,1649740877917474817,1449212758636646402,'测试',1,1,1,0,0,NULL,'','2023-08-18 09:56:41',1649740877917474817,'2023-08-18 09:59:10',1),
(1692355327791443969,1649740877917474817,1602336520042287105,'测试测试',1,1,1,0,0,NULL,'','2023-08-18 09:58:47',1649740877917474817,'2023-08-18 09:59:08',1),
(1692355500265418754,1649740877917474817,1449212758636646402,'测试',1,1,1,0,1,NULL,'','2023-08-18 09:59:28',1649740877917474817,'2023-10-24 15:22:47',1),
(1692357151567110145,1649740877917474817,1602336520042287105,'你好，我测试一下',1,2,1,0,1,NULL,'','2023-08-18 10:06:02',1649740877917474817,'2023-09-05 09:16:03',1),
(1692364299713884162,1649740877917474817,1644309673171804161,'00',0,2,1,1,0,NULL,'','2023-08-18 10:34:26',1649740877917474817,'2023-10-24 15:23:20',1),
(1698224556105265153,1649740877917474817,1602336520042287105,'探索编程的奇妙世界：从初学者到程序员的成长之路\n\n在这个数字化时代，编程已经成为一门极具吸引力和实用性的技能。它不仅仅是计算机科学领域的基石，也渗透到了各个行业和日常生活中。无论您是想要进入软件开发行业，还是希望通过编程来解决问题和提高效率，这篇文章将带领您踏上编程之旅。\n\n编程的起源和意义\n编程的历史可以追溯到上个世纪，随着计算机的发展，人们开始意识到编写指令来操作计算机的重要性。编程不仅仅是为计算机提供指导，更是一种思维方式和解决问题的艺术。通过编程，我们可以将抽象的概念转化为具体的应用，实现创新和进步。\n\n',1,1,1,1,0,NULL,'','2023-09-03 14:41:00',1649740877917474817,'2024-04-10 16:45:03',1),

/*Table structure for table `campus_content_love` */

DROP TABLE IF EXISTS `campus_content_love`;

CREATE TABLE `campus_content_love` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `content_id` bigint(20) NOT NULL COMMENT '文章id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`,`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_content_love` */

insert  into `campus_content_love`(`user_id`,`content_id`,`create_time`) values 
(1594285543804383234,2,'2023-02-26 14:33:17'),
(1594285543804383234,1629730419490693121,'2023-03-29 16:29:37'),
(1594285543804383234,1635923549986508801,'2023-03-29 16:28:22'),
(1649726942417940482,1649727932294680577,'2023-04-22 18:54:45'),
(1649726942417940482,1649728915062018049,'2023-04-22 18:57:49'),
(1649729414364549121,1649728915062018049,'2023-04-22 18:58:53'),
(1649729414364549121,1649729113641340930,'2023-04-22 18:58:54'),
(1649740877917474817,1656510184605249538,'2023-05-11 15:35:18'),
(1649740877917474817,1692364299713884162,'2023-08-18 10:35:06'),
(1649740877917474817,1698224556105265153,'2023-09-03 14:41:56');

/*Table structure for table `campus_content_tag` */

DROP TABLE IF EXISTS `campus_content_tag`;

CREATE TABLE `campus_content_tag` (
  `content_id` bigint(20) NOT NULL COMMENT '内容id',
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`content_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_content_tag` */

insert  into `campus_content_tag`(`content_id`,`tag_id`) values 
(1,1),
(1,2),
(1,3),
(2,1),
(2,2);

/*Table structure for table `campus_file` */

DROP TABLE IF EXISTS `campus_file`;

CREATE TABLE `campus_file` (
  `file_id` bigint(20) NOT NULL,
  `content_id` bigint(20) DEFAULT NULL COMMENT '文章id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `url` varchar(300) CHARACTER SET utf8 NOT NULL COMMENT '储存url',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_file` */

insert  into `campus_file`(`file_id`,`content_id`,`user_id`,`url`,`create_time`) values 
(563189,1692354797887283202,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818095631A001.png','2023-08-18 09:56:31'),
(1692323208132,1692352315530371073,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818094648A001.png','2023-08-18 09:46:48'),
(1692323382406,1692353045314101250,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818094942A002.png','2023-08-18 09:49:42'),
(1692323926519,1692355327791443969,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818095846A001.png','2023-08-18 09:58:47'),
(1692323966993,1692355500265418754,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818095926A002.png','2023-08-18 09:59:27'),
(1692324358884,1692357151567110145,1649740877917474817,'/profile/CampusFile/2023/08/18/测试视频_20230818100558A001.mp4','2023-08-18 10:05:59'),
(1692326053699,1692364299713884162,1649740877917474817,'/profile/CampusFile/2023/08/18/QQ音乐下载页 - QQ音乐,音乐你的生活! 和另外 7 个页面 - 个人 - Microsoft​ Edge 2023-07-03 19-40-13_20230818103413A001.mp4','2023-08-18 10:34:14'),
(1693723238453,1698224556105265153,1649740877917474817,'/profile/CampusFile/2023/09/03/AltosAdventure_202381702046_20230903144038A001.png','2023-09-03 14:40:38'),
(1693804352768,1698564788453351425,1649740877917474817,'/profile/CampusFile/2023/09/04/AltosAdventure_202381702046_20230904131232A002.png','2023-09-04 13:12:33'),
(1712712059531,1777869362582515714,1649740877917474817,'/profile/CampusFile/2024/04/10/0_20240410092059A002.jpg','2024-04-10 09:21:00'),
(1712712255525,1777870182090797057,1649740877917474817,'/profile/CampusFile/2024/04/10/0_20240410092415A003.jpg','2024-04-10 09:24:16'),
(1712731419317,1777950605974171650,1649740877917474817,'/profile/CampusFile/2024/04/10/R-C_20240410144339A004.jpg','2024-04-10 14:43:39'),
(1712738773816,1777981414072262657,1649740877917474817,'/profile/CampusFile/2024/04/10/05_20240410164613A001.jpg','2024-04-10 16:46:14'),
(1712739216331,1777983275881865218,1649740877917474817,'/profile/CampusFile/2024/04/10/001_20240410165336A002.png','2024-04-10 16:53:36'),
(1712739331042,1777983781031256066,1649740877917474817,'/profile/CampusFile/2024/04/10/07_20240410165531A003.jpg','2024-04-10 16:55:31'),
(1712739453546,1777984264055693313,1649740877917474817,'/profile/CampusFile/2024/04/10/01_20240410165733A004.jpg','2024-04-10 16:57:34'),
(1712740394861,1777988204491055105,1649740877917474817,'/profile/CampusFile/2024/04/10/010_20240410171314A005.jpg','2024-04-10 17:13:15'),
(1717660424486,1798624306965315585,1649740877917474817,'/profile/CampusFile/2024/06/06/QQ截图20240606155334_20240606155344A001.jpg','2024-06-06 15:53:44'),
(1644638832884453378,1644638851867873282,1594285543804383234,'/profile/CampusFile/2023/04/08/cwrrlPaIykXB832c218354cd9fa1a558ca6c023c8abd_20230408175028A003.png','2023-04-08 17:50:32'),
(1644645888458756098,1644645933589467137,1594285543804383234,'/profile/CampusFile/2023/04/08/sfVlFJlCHq7Le04f4dbfb2306d5783d9ab6247d74fbb_20230408181830A004.jpg','2023-04-08 18:18:41'),
(1644645910021672962,1644645933589467137,1594285543804383234,'/profile/CampusFile/2023/04/08/c7Pex0d3zp3L832c218354cd9fa1a558ca6c023c8abd_20230408181835A005.png','2023-04-08 18:18:41'),
(1644708042641772545,1644708092667236354,1594285543804383234,'/profile/CampusFile/2023/04/08/0Voe3dAhPjRSe04f4dbfb2306d5783d9ab6247d74fbb_20230408222529A006.jpg','2023-04-08 22:25:41'),
(1644708059884556290,1644708092667236354,1594285543804383234,'/profile/CampusFile/2023/04/08/stJD3vUJf6D9fe8240824c1a162268048e10b12f239c_20230408222533A007.jpg','2023-04-08 22:25:41'),
(1644708077852954625,1644708092667236354,1594285543804383234,'/profile/CampusFile/2023/04/08/nSdnns1irWyc832c218354cd9fa1a558ca6c023c8abd_20230408222537A008.png','2023-04-08 22:25:41'),
(1649716924238958593,1649716958460284929,1649715389631205378,'/profile/CampusFile/2023/04/22/0d40c24b264aa511_20230422180859A001.jpg','2023-04-22 18:09:06'),
(1649728902583963650,1649728915062018049,1649726942417940482,'/profile/CampusFile/2023/04/22/7ae0120ec27dc3a7_20230422185635A001.jpg','2023-04-22 18:56:37'),
(1649741647995883522,1649741658980765697,1649740877917474817,'/profile/CampusFile/2023/04/22/c81f58c1d32bf67472b230359558de9_20230422194714A004.jpg','2023-04-22 19:47:15'),
(1649742264218832897,1649742369252593665,1649740877917474817,'/profile/CampusFile/2023/04/22/303f638820f3a86f40dbe3fe9360f96_20230422194941A005.jpg','2023-04-22 19:50:05'),
(1649742674857971713,1649742801601449985,1649740877917474817,'/profile/CampusFile/2023/04/22/eb996436581f4d4e7e8b48b8602634e_20230422195119A006.jpg','2023-04-22 19:51:48'),
(1649743521935413250,1649743644950155265,1649740877917474817,'/profile/CampusFile/2023/04/22/479721fff93476e6906273170dcaa43_20230422195441A007.jpg','2023-04-22 19:55:09'),
(1692345278503235586,1692345744318517249,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818091851A001.png','2023-08-18 09:27:00'),
(1692345739822223362,1692345744318517249,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818092041A001.png','2023-08-18 09:27:02'),
(1692347471440629762,1692347485780955138,1649740877917474817,'/profile/CampusFile/2023/08/18/AltosAdventure_202381702046_20230818092734A002.png','2023-08-18 09:28:15');

/*Table structure for table `campus_tag` */

DROP TABLE IF EXISTS `campus_tag`;

CREATE TABLE `campus_tag` (
  `tag_id` bigint(20) NOT NULL COMMENT '标签主键',
  `tag_name` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '标签名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8 DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `campus_tag` */

insert  into `campus_tag`(`tag_id`,`tag_name`,`description`,`status`,`del_flag`,`create_time`,`create_user`,`update_time`,`update_user`) values 
(1,'测试标签','测试','0','\0','2022-11-29 20:03:08',1,'2022-12-01 18:16:16',NULL),
(2,'梅西','利昂内尔·梅西（Lionel Messi）\n全名利昂内尔·安德烈斯·梅西·库西蒂尼（Lionel Andrés Messi Cuccitini）\n昵称莱奥·梅西（Leo Messi）','0','\0','2022-11-29 20:03:28',1,'2023-01-16 20:38:34',1),
(3,'蔡徐坤','中国内地男歌手、演员、原创音乐制作人、MV导演','0','\0','2023-01-16 20:12:20',1,'2023-01-16 20:13:54',1);

/*Table structure for table `social_user` */

DROP TABLE IF EXISTS `social_user`;

CREATE TABLE `social_user` (
  `social_user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '社会化用户表id\n',
  `uuid` varchar(255) DEFAULT NULL COMMENT '第三方系统的唯一ID',
  `source` varchar(255) DEFAULT NULL COMMENT '第三方用户来源',
  PRIMARY KEY (`social_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1638895499511939074 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='社会化用户表\n';

/*Data for the table `social_user` */

insert  into `social_user`(`social_user_id`,`uuid`,`source`) values 
(1638895499511939073,'okhHa4h4tIoygJFw3MV196_iTTck','WXAMP');

/*Table structure for table `social_user_auth` */

DROP TABLE IF EXISTS `social_user_auth`;

CREATE TABLE `social_user_auth` (
  `user_id` bigint(20) DEFAULT NULL,
  `social_user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `social_user_auth` */

insert  into `social_user_auth`(`user_id`,`social_user_id`) values 
(1594285543804383234,1638895499511939073);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `group_code` varchar(100) DEFAULT NULL COMMENT '所属分类的编码',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1637978359153885187 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`group_code`,`remark`,`del_flag`,`create_time`,`create_user`,`update_time`,`update_user`) values 
(1,'Mac本地文件路径','sys.local.profile.mac','~/uploadPath','Y','file_config',NULL,'\0','2022-11-10 14:06:44',1,'2022-11-10 14:07:49',NULL),
(2,'Linux本地文件路径','sys.local.profile.linux','/data/uploadPath','Y','file_config',NULL,'\0','2022-01-14 10:59:39',NULL,'2022-01-16 14:11:53',1),
(3,'Windows本地文件路径','sys.local.profile.win','D:\\uploadPath','Y','file_config',NULL,'\0','2022-01-14 11:00:39',NULL,'2022-01-16 14:11:53',1),
(4,'默认存储文件的bucket名称','sys.file.default.bucket','defaultBucket','Y','file_config',NULL,'\0','2022-01-14 11:03:10',NULL,'2022-01-16 14:11:54',NULL),
(5,'文件默认部署的环境地址','sys.server.deploy.host','http://localhost:8160','Y','file_config',NULL,'\0','2022-01-16 14:11:45',NULL,'2022-01-16 14:18:55',NULL),
(6,'文件访问是否用nginx映射','sys.file.visit.nginx','false','Y','file_config','true真，false假','\0','2022-01-16 14:40:00',NULL,'2022-01-16 14:40:20',NULL),
(7,'信息墙删除且对应文件也删除','sys.file.is.delete','false','Y','file_config','true墙和文件都删除，false文件转移到别的目录','\0','2022-01-17 14:29:11',NULL,'2022-01-18 15:02:14',NULL),
(8,'文件默认转移的bucket名称','sys.file.move.default.bucket','moveBucket','Y','file_config',NULL,'\0','2022-01-17 14:31:05',NULL,'2022-01-18 15:09:48',NULL),
(101,'阿里云邮件服务accessKeyId','sys.aliyun.mail.accessKeyId','','Y','mail_config',NULL,'\0','2022-01-19 10:04:08',NULL,'2022-01-19 10:49:30',NULL),
(102,'阿里云邮件服务accessKeySecret','sys.aliyun.mail.accessKeySecret','','Y','mail_config',NULL,'\0','2022-01-19 10:07:28',NULL,'2022-01-19 10:49:31',NULL),
(113,'smtp服务器地址','sys.email.smtp.host','smtp.qq.com','Y','mail_config',NULL,'\0','2022-01-19 10:33:50',NULL,'2022-01-24 11:28:13',NULL),
(114,'smtp服务端口','sys.email.smtp.port','465','Y','mail_config',NULL,'\0','2022-01-19 10:35:29',NULL,'2022-01-24 11:28:14',NULL),
(115,'邮箱的发送方邮箱','sys.email.send.account','3066693006@qq.com','Y','mail_config',NULL,'\0','2022-01-19 10:38:17',NULL,'2022-01-24 11:28:15',NULL),
(116,'邮箱的密码或者授权码','sys.email.password','qiwoefvuklkkddej','Y','mail_config',NULL,'\0','2022-01-19 10:07:31',NULL,'2022-01-19 12:02:57',1),
(117,'邮箱发送时的用户名','sys.email.name','致远','Y','mail_config',NULL,'\0','2022-01-19 11:10:47',NULL,'2022-01-24 11:28:19',NULL),
(202,'用户默认头像','sys.user.default.avatar','https://img0.baidu.com/it/u=1183896628,1403534286&fm=253&fmt=auto&app=138&f=PNG','Y','sys_config',NULL,'\0','2022-02-08 11:35:31',NULL,'2022-02-08 11:40:15',1),
(206,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','sys_config','初始化密码 123456','\0','2022-11-09 01:41:52',1,'2022-11-09 15:42:09',NULL),
(300,'验证码类型','sys.login.captchaType','math','Y','sys_config','math 数组计算 char 字符验证','\0','2022-11-10 09:32:40',1,'2022-11-30 12:14:30',NULL),
(301,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','sys_config','是否开启验证码功能（true开启，false关闭）','\0','2023-02-01 21:48:05',1,'2023-02-01 21:48:34',NULL),
(302,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','sys_config','是否开启注册用户功能（true开启，false关闭）','\0','2023-02-01 21:47:39',1,'2023-02-01 21:48:31',NULL),
(1621419076555640833,'绑定邮箱模板','campus.mail.bindTemplate','<h3>您好，#{[userName]}</h3><br />请在#{[expiration]}分内点击以下链接完成邮箱验证<br /><a href=\"#{[url]}\">#{[url]}</a>','Y','campus_config','#{[userName]}用户，#{[url]}邮箱验证的链接，#{[expiration]}，有效期','\0','2023-02-03 16:03:27',1,'2023-02-03 16:03:27',1),
(1621419076555640834,'用户匿名头像','campus.user.anonymous.image','https://gcore.jsdelivr.net/gh/oddfar/static/campus/image/anonymous.jpeg','Y','campus_config',NULL,'\0','2022-02-08 11:36:36',NULL,'2023-02-21 08:33:07',1),
(1637978152848654338,'微信小程序APPID','campus.wxmp.appid','xxxxxx','Y','campus_config',NULL,'\0','2023-03-21 08:43:18',1,'2023-04-08 23:46:37',1),
(1637978359153885186,'微信小程序SECRET','campus.wxmp.secret','xxxxxxxx','Y','campus_config',NULL,'\0','2023-03-21 08:44:08',1,'2023-04-08 23:46:41',1);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1621418087714918402 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`remark`,`create_time`,`create_user`,`update_time`,`update_user`,`del_flag`) values 
(1,1,'男','0','sys_user_sex',NULL,'default','Y','0','性别男',NULL,NULL,NULL,NULL,'\0'),
(2,2,'女','1','sys_user_sex',NULL,'default','N','0','性别女',NULL,NULL,NULL,NULL,'\0'),
(3,1,'是','Y','sys_yes_no',NULL,'success','N','0',NULL,'2022-11-06 06:37:31',1,'2022-11-06 06:39:34',1,'\0'),
(4,2,'否','N','sys_yes_no',NULL,'danger','N','0',NULL,'2022-11-06 06:37:42',1,'2022-11-06 06:39:34',1,'\0'),
(6,1,'正常','0','sys_normal_disable',NULL,'primary','Y','0','正常状态',NULL,NULL,NULL,NULL,'\0'),
(7,2,'停用','1','sys_normal_disable',NULL,'danger','N','0','停用状态',NULL,NULL,NULL,NULL,'\0'),
(41,1,'显示','0','sys_show_hide',NULL,'primary','N','0','显示菜单','2022-12-26 21:49:47',1,'2022-12-26 21:49:47',NULL,'\0'),
(42,2,'隐藏','1','sys_show_hide',NULL,'danger','N','0','隐藏菜单','2022-12-26 21:50:10',1,'2022-12-26 21:50:10',NULL,'\0'),
(101,1,'系统配置','sys_config','sys_config_group',NULL,'primary','N','0','配置群组的系统配置','2022-11-06 19:27:23',NULL,'2022-11-06 06:07:20',1,'\0'),
(102,2,'邮件配置','mail_config','sys_config_group',NULL,'primary','N','0',NULL,'2022-11-06 05:38:04',1,'2022-11-06 06:07:20',1,'\0'),
(103,3,'文件配置','file_config','sys_config_group',NULL,'primary','N','0',NULL,'2022-11-06 06:32:45',1,'2022-11-06 20:32:44',1,'\0'),
(1597931830248570882,1,'审核','0','campus_content_status',NULL,'warning','N','0',NULL,'2022-11-30 20:33:31',1,'2022-11-30 20:33:31',1,'\0'),
(1597931939476635650,2,'正常','1','campus_content_status',NULL,'success','N','0',NULL,'2022-11-30 20:33:57',1,'2022-11-30 20:33:57',1,'\0'),
(1597932004085694466,3,'下架','2','campus_content_status',NULL,'danger','N','0',NULL,'2022-11-30 20:34:13',1,'2022-11-30 20:34:12',1,'\0'),
(1597932393732341761,1,'不匿','0','campus_anonymous',NULL,'primary','N','0',NULL,'2022-11-30 20:35:45',1,'2022-11-30 20:35:45',NULL,'\0'),
(1597932469577940994,2,'匿名','1','campus_anonymous',NULL,'primary','N','0',NULL,'2022-11-30 20:36:04',1,'2022-11-30 20:36:03',NULL,'\0'),
(1599392185411743745,0,'文字','0','campus_content_type',NULL,'primary','N','0','','2022-12-04 21:16:27',1,'2022-12-04 21:16:26',1,'\0'),
(1599392255200768001,2,'图片','1','campus_content_type',NULL,'success','N','0',NULL,'2022-12-04 21:16:44',1,'2022-12-04 21:16:43',1,'\0'),
(1599392552258154497,3,'视频','2','campus_content_type',NULL,'info','N','0',NULL,'2022-12-04 21:17:54',1,'2022-12-04 21:17:54',1,'\0'),
(1609558539133521922,4,'拒绝','3','campus_content_status',NULL,'danger','N','0','审核不通过','2023-01-01 22:33:55',1,'2023-01-01 22:33:54',1,'\0'),
(1621418087714918401,10,'campus配置','campus_config','sys_config_group',NULL,'primary','N','0',NULL,'2023-02-03 15:59:31',1,'2023-02-03 15:59:31',NULL,'\0');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1599392072043900931 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`remark`,`create_time`,`create_user`,`update_time`,`update_user`,`del_flag`) values 
(1,'用户性别','sys_user_sex','0','用户性别列表','2023-03-09 17:31:52',NULL,'2022-11-06 01:10:21',1,'\0'),
(2,'系统是否','sys_yes_no','0','系统是否列表','2022-11-06 06:37:05',1,'2022-11-06 20:37:04',1,'\0'),
(3,'系统开关','sys_normal_disable','0','系统开关列表','2023-03-09 17:31:55',NULL,NULL,NULL,'\0'),
(4,'菜单状态','sys_show_hide','0','菜单状态列表','2022-12-26 21:49:15',1,'2022-12-26 21:49:15',NULL,'\0'),
(101,'配置群组','sys_config_group','0','配置群组','2022-11-06 05:32:37',1,'2022-11-06 19:32:37',1,'\0'),
(1597931685624774657,'校园墙内容状态','campus_content_status','0','校园墙内容状态','2022-11-30 20:32:57',1,'2022-11-30 20:32:56',NULL,'\0'),
(1597932303005351938,'是否匿名','campus_anonymous','0','校园信息墙是否匿名','2022-11-30 20:35:24',1,'2022-11-30 20:35:23',NULL,'\0'),
(1599392072043900930,'校园内类型','campus_content_type','0','0文字,1图片,2视频','2022-12-04 21:16:00',1,'2022-12-04 21:15:59',NULL,'\0');

/*Table structure for table `sys_log_login` */

DROP TABLE IF EXISTS `sys_log_login`;

CREATE TABLE `sys_log_login` (
  `info_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ipaddr` varchar(200) DEFAULT NULL,
  `login_location` varchar(1000) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `msg` varchar(1000) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_log_login` */

insert  into `sys_log_login`(`info_id`,`user_id`,`user_name`,`status`,`ipaddr`,`login_location`,`browser`,`os`,`msg`,`login_time`) values 
(1798622833145667586,1649740877917474817,'ling','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 15:47:55'),
(1798622869472534529,1649740877917474817,'ling','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 15:48:04'),
(1798623687143653377,1649740877917474817,'ling','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 15:51:18'),
(1798628389193318401,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 16:10:00'),
(1798628663630823425,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','退出成功','2024-06-06 16:11:05'),
(1798628701052403714,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 16:11:14'),
(1798629900774395906,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','退出成功','2024-06-06 16:16:00'),
(1798629938820927489,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 16:16:09'),
(1798652810901704705,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','退出成功','2024-06-06 17:47:02'),
(1798652855692677121,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 17:47:13'),
(1798654607439548418,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','退出成功','2024-06-06 17:54:10'),
(1798654642466181121,1,'java1234','0','127.0.0.1','内网IP','Chrome 12','Windows 10','登录成功','2024-06-06 17:54:19'),
(1798666727174557698,NULL,'jack','0','127.0.0.1','内网IP','Chrome 9','Windows 10','注册成功','2024-06-06 18:42:20'),
(1798666762343796738,1798666727048728577,'jack','0','127.0.0.1','内网IP','Chrome 9','Windows 10','登录成功','2024-06-06 18:42:28');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1597931148678365187 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`remark`,`del_flag`,`create_time`,`update_user`,`update_time`,`create_user`) values 
(1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','系统管理目录','\0','2022-10-05 15:28:43',1,'2022-11-14 14:41:50',NULL),
(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','系统监控目录','','2022-10-05 15:28:43',NULL,NULL,NULL),
(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','系统工具目录','','2022-10-05 15:28:43',NULL,NULL,NULL),
(4,'地址',0,10,'',NULL,'',0,0,'M','0','0','','guide','若依官网地址','','2022-10-05 15:28:43',1,'2022-11-21 17:11:40',NULL),
(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','用户管理菜单','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','角色管理菜单','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','菜单管理菜单','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','部门管理菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','岗位管理菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','字典管理菜单','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','参数设置菜单','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','通知公告菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','在线用户菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','定时任务菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','数据监控菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','服务监控菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','缓存监控菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','缓存列表菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','表单构建菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','代码生成菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','系统接口菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','操作日志菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','登录日志菜单','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','','\0','2022-10-05 15:28:43',NULL,NULL,NULL),
(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','','','2022-10-05 15:28:43',NULL,NULL,NULL),
(1597918884311171073,'校园信息墙',0,5,'campus',NULL,NULL,1,0,'M','0','0',NULL,'education','','\0','2022-11-30 19:42:05',NULL,'2022-11-30 19:42:04',1),
(1597929330846040066,'内容管理',1597918884311171073,2,'content','campus/content/index',NULL,1,0,'C','0','0','campus:content:list','content','','\0','2022-11-30 20:23:35',1,'2022-11-30 20:23:35',1),
(1597930331497922562,'评论管理',1597918884311171073,6,'comment','campus/comment/index',NULL,1,0,'C','0','0','campus:comment:list','comment','','\0','2022-11-30 20:27:34',1,'2022-11-30 20:27:33',1),
(1597930928431267841,'类别管理',1597918884311171073,3,'category','campus/category/index',NULL,1,0,'C','0','0','campus:category:list','category','','\0','2022-11-30 20:29:56',1,'2022-11-30 20:29:56',1);

/*Table structure for table `sys_resource` */

DROP TABLE IF EXISTS `sys_resource`;

CREATE TABLE `sys_resource` (
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `app_code` varchar(100) DEFAULT NULL COMMENT '应用编码',
  `resource_code` varchar(300) DEFAULT NULL COMMENT '资源编码',
  `resource_name` varchar(300) DEFAULT NULL COMMENT '资源名称',
  `class_name` varchar(100) DEFAULT NULL COMMENT '类名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名称',
  `modular_name` varchar(100) DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
  `url` varchar(300) DEFAULT NULL COMMENT '资源url',
  `http_method` varchar(10) DEFAULT NULL COMMENT 'http请求方法',
  `resource_biz_type` tinyint(4) DEFAULT '1' COMMENT '资源的业务类型：1-业务类，2-系统类',
  `required_permission_flag` char(1) DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`resource_id`) USING BTREE,
  KEY `RESOURCE_CODE_URL` (`resource_code`,`url`) USING BTREE COMMENT '资源code和url的联合索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='需要认证的接口资源controller';

/*Data for the table `sys_resource` */

insert  into `sys_resource`(`resource_id`,`app_code`,`resource_code`,`resource_name`,`class_name`,`method_name`,`modular_name`,`url`,`http_method`,`resource_biz_type`,`required_permission_flag`,`del_flag`,`create_user`,`create_time`,`update_user`,`update_time`) values 
(1798650228225462274,'school','school.sys_menu.get_info','菜单管理-查询','SysMenuController','getInfo','菜单管理','/system/menu/{menuId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462275,'campus','campus.comment.list','list','CommentController','list','评论管理','/admin/comment/list','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462276,'campus','campus.category.edit','修改分类','CategoryController','edit','分类管理','/admin/category','put',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462277,'school','school.sys_operlog.clean','操作日志-清空','SysOperlogController','clean','操作日志管理','/monitor/operlog/clean','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462278,'school','school.sys_api_resource.role_menu_tree_select','资源管理-加载对应角色资源列表树','SysApiResourceController','roleMenuTreeSelect','资源管理','/system/resource/roleApiTreeselect/{roleId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462279,'school','school.sys_role.select_auth_user_all','selectAuthUserAll','SysRoleController','selectAuthUserAll','角色管理','/system/role/authUser/selectAll','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462280,'campus','campus.user_action.image_upload','图片文件上传','UserActionController','imageUpload','用户操作api','/campus/imageUpload','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462281,'school','school.sys_dict_data.edit','字典数据管理-修改','SysDictDataController','edit','字典数据管理','/system/dict/data','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462282,'school','school.sys_menu.edit','菜单管理-修改','SysMenuController','edit','菜单管理','/system/menu','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228225462283,'campus','campus.user_account.send_reset_pwd_code','sendResetPwdCode','UserAccountController','sendResetPwdCode','用户账户操作api','/campus/pwd-code','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599618,'campus','campus.comment_info.to_comment','添加评论','CommentInfoController','toComment','评论api','/campus/toComment','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599619,'school','school.sys_logininfor.clean','登录日志-清空','SysLogininforController','clean','登录日志管理','/monitor/logininfor/clean','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599620,'school','school.sys_role.remove','remove','SysRoleController','remove','角色管理','/system/role/{roleIds}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599621,'school','school.sys_user.update','update','SysUserController','update','用户管理','/system/user','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599622,'campus','campus.content.page','分页','ContentController','page','内容管理','/admin/content/list','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599623,'school','school.sys_config.edit','参数配置管理-修改','SysConfigController','edit','参数配置管理','/system/config','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599624,'school','school.sys_user.export','export','SysUserController','export','用户管理','/system/user/export','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599625,'school','school.sys_api_resource.edit_role_resource','修改对应角色api资源','SysApiResourceController','editRoleResource','资源管理','/system/resource/roleApi','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599626,'school','school.sys_dict_type.get_info','字典类型管理-查询','SysDictTypeController','getInfo','字典类型管理','/system/dict/type/{dictId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599627,'school','school.sys_profile.update_pwd','个人信息管理-重置密码','SysProfileController','updatePwd','个人信息管理','/system/user/profile/updatePwd','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599628,'school','school.sys_user.reset_pwd','resetPwd','SysUserController','resetPwd','用户管理','/system/user/resetPwd','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599629,'campus','campus.campus_info.category_list','查询分类列表','CampusInfoController','categoryList','校园墙信息api','/campus/categoryList','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599630,'campus','campus.content_info.del_content','删除自己的校园墙','ContentInfoController','delContent','信息墙api','/campus/delContent/{contentId}','delete',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599631,'school','school.sys_menu.tree_select','菜单管理-获取菜单下拉树列表','SysMenuController','treeSelect','菜单管理','/system/menu/treeselect','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599632,'campus','campus.tag.add','add','TagController','add','标签管理','/admin/tag','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599633,'school','school.sys_login.login','登录方法','SysLoginController','login','登录路由','/login','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599634,'campus','campus.comment_info.get_comment','添加评论','CommentInfoController','getComment','评论api','/campus/getComment','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599635,'campus','campus.content_info.get_content_by_id','查询信息墙详细内容','ContentInfoController','getContentById','信息墙api','/campus/getContent','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599636,'school','school.sys_menu.add','菜单管理-新增','SysMenuController','add','菜单管理','/system/menu','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599637,'campus','campus.content_info.get_own_love_content','查询点赞的信息墙列表','ContentInfoController','getOwnLoveContent','信息墙api','/campus/getOwnLoveContent','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599638,'school','school.sys_role.export','export','SysRoleController','export','角色管理','/system/role/export','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599639,'school','school.sys_role.get_info','getInfo','SysRoleController','getInfo','角色管理','/system/role/{roleId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599640,'campus','campus.comment.add','add','CommentController','add','评论管理','/admin/comment','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599641,'campus','campus.tag.list','list','TagController','list','标签管理','/admin/tag/list','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599642,'school','school.sys_operlog.list','操作日志-分页','SysOperlogController','list','操作日志管理','/monitor/operlog/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599643,'school','school.sys_role.cancel_auth_user','cancelAuthUser','SysRoleController','cancelAuthUser','角色管理','/system/role/authUser/cancel','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599644,'school','school.sys_logininfor.remove','登录日志-删除','SysLogininforController','remove','登录日志管理','/monitor/logininfor/{infoIds}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599645,'campus','campus.content.get_info','获取校园墙内容','ContentController','getInfo','内容管理','/admin/content/{contentId}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599646,'school','school.sys_role.add','add','SysRoleController','add','角色管理','/system/role','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599647,'school','school.sys_user.auth_role','authRole','SysUserController','authRole','用户管理','/system/user/authRole/{userId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599648,'school','school.sys_user.page','page','SysUserController','page','用户管理','/system/user/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599649,'school','school.sys_role.list','list','SysRoleController','list','角色管理','/system/role/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599650,'school','school.sys_profile.profile','个人信息管理-查询','SysProfileController','profile','个人信息管理','/system/user/profile','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599651,'school','school.sys_operlog.remove','操作日志-删除','SysOperlogController','remove','操作日志管理','/monitor/operlog/{operIds}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599652,'school','school.sys_dict_type.list','字典类型管理-分页','SysDictTypeController','list','字典类型管理','/system/dict/type/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599653,'campus','campus.tag.remove','remove','TagController','remove','标签管理','/admin/tag/{tagIds}','delete',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599654,'school','school.sys_user.get_info','getInfo','SysUserController','getInfo','用户管理','/system/user/{userId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599655,'campus','campus.category.remove','删除分类','CategoryController','remove','分类管理','/admin/category/{categoryId}','delete',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599656,'campus','campus.user_account.send_mail','sendMail','UserAccountController','sendMail','用户账户操作api','/campus/bindMail','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599657,'school','school.sys_dict_data.page','字典数据管理-分页','SysDictDataController','page','字典数据管理','/system/dict/data/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599658,'school','school.sys_menu.role_menu_treeselect','菜单管理-加载对应角色菜单列表树','SysMenuController','roleMenuTreeselect','菜单管理','/system/menu/roleMenuTreeselect/{roleId}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599659,'campus','campus.category.add','新增分类','CategoryController','add','分类管理','/admin/category','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599660,'school','school.sys_menu.remove','菜单管理-删除','SysMenuController','remove','菜单管理','/system/menu/{menuId}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599661,'school','school.sys_config.add','参数配置管理-新增','SysConfigController','add','参数配置管理','/system/config','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599662,'school','school.sys_dict_data.add','字典数据管理-新增','SysDictDataController','add','字典数据管理','/system/dict/data','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599663,'campus','campus.comment_info.get_comment_children_list','查询一级评论的子评论','CommentInfoController','getCommentChildrenList','评论api','/campus/getCommentChildrenList','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599664,'school','school.sys_user.remove','remove','SysUserController','remove','用户管理','/system/user/{userIds}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599665,'school','school.sys_role.allocated_list','allocatedList','SysRoleController','allocatedList','角色管理','/system/role/authUser/allocatedList','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599666,'school','school.sys_dict_data.remove','字典数据管理-删除','SysDictDataController','remove','字典数据管理','/system/dict/data/{dictCodes}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599667,'campus','campus.content.remove','remove','ContentController','remove','内容管理','/admin/content/{contentIds}','delete',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599668,'campus','campus.comment_info.get_own_comment_list','分页查询自己发布或回复的评论列表','CommentInfoController','getOwnCommentList','评论api','/campus/getOwnComment','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599669,'campus','campus.content.edit','修改信息墙内容','ContentController','edit','内容管理','/admin/content/','put',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599670,'campus','campus.content_info.own_contents','查看自己的单个信息墙','ContentInfoController','ownContents','信息墙api','/campus/ownContents','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599671,'campus','campus.category.list','查询分类列表','CategoryController','list','分类管理','/admin/category/list','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599672,'campus','campus.comment.edit','edit','CommentController','edit','评论管理','/admin/comment','put',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599673,'campus','campus.comment_info.get_one_level_comment','查询一级评论','CommentInfoController','getOneLevelComment','评论api','/campus/getOneLevelComment','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599674,'campus','campus.user_account.change_pwd','changePwd','UserAccountController','changePwd','用户账户操作api','/campus/changePwd','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599675,'school','school.sys_user.change_status','changeStatus','SysUserController','changeStatus','用户管理','/system/user/changeStatus','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228271599676,'school','school.sys_user.add','add','SysUserController','add','用户管理','/system/user','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514178,'school','school.sys_dict_type.refresh_cache','字典类型管理-刷新','SysDictTypeController','refreshCache','字典类型管理','/system/dict/type/refreshCache','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514179,'school','school.sys_config.export','export','SysConfigController','export','参数配置管理','/system/config/export','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514180,'campus','campus.comment_info.get_comment_children','分页查询一级评论的子评论','CommentInfoController','getCommentChildren','评论api','/campus/getCommentChildren','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514181,'campus','campus.comment_info.del_own_comment','删除自己的评论','CommentInfoController','delOwnComment','评论api','/campus/delOwnComment','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514182,'school','school.sys_menu.list','菜单管理-分页','SysMenuController','list','菜单管理','/system/menu/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514183,'campus','campus.user_action.zan_content','点赞','UserActionController','zanContent','用户操作api','/campus/zan/{contentId}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514184,'school','school.sys_config.get_config_key','getConfigKey','SysConfigController','getConfigKey','参数配置管理','/system/config/configKey/{configKey:.+}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514185,'school','school.sys_config.page','参数配置管理-分页','SysConfigController','page','参数配置管理','/system/config/page','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514186,'school','school.sys_config.get_info','参数配置管理-查询id信息','SysConfigController','getInfo','参数配置管理','/system/config/{id}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514187,'campus','campus.content_info.get_content_list','查询信息墙内容列表','ContentInfoController','getContentList','信息墙api','/campus/contentList','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514188,'school','school.sys_profile.update_profile','个人信息管理-重置密码','SysProfileController','updateProfile','个人信息管理','/system/user/profile/update','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514189,'school','school.sys_role.change_status','changeStatus','SysRoleController','changeStatus','角色管理','/system/role/changeStatus','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514190,'school','school.sys_config.refresh_cache','参数配置管理-刷新缓存','SysConfigController','refreshCache','参数配置管理','/system/config/refreshCache','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514191,'school','school.sys_config.remove','参数配置管理-删除','SysConfigController','remove','参数配置管理','/system/config/{configIds}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514192,'campus','campus.content_info.to_content','发表信息墙','ContentInfoController','toContent','信息墙api','/campus/sendContent','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514193,'campus','campus.user_account.have_mail','haveMail','UserAccountController','haveMail','用户账户操作api','/campus/haveMail','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514194,'campus','campus.content_info.get_simple_hot_content','查询信息墙内容列表','ContentInfoController','getSimpleHotContent','信息墙api','/campus/simpleHotContent','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514195,'school','school.sys_dict_type.optionselect','字典类型管理-获取字典选择框列表','SysDictTypeController','optionselect','字典类型管理','/system/dict/type/optionselect','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514196,'campus','campus.category.list_select','查询分类列表选择器','CategoryController','listSelect','分类管理','/admin/category/listSelect','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514197,'campus','campus.index.get_static_data','getStaticData','IndexController','getStaticData','内容管理','/admin/static/data','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514198,'campus','campus.index.get_date_user','getDateUser','IndexController','getDateUser','内容管理','/admin/static/dateUser/{startTime}/{endTime}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514199,'campus','campus.user_action.video_upload','视频文件上传','UserActionController','videoUpload','用户操作api','/campus/videoUpload','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514200,'school','school.sys_dict_type.remove','字典类型管理-删除','SysDictTypeController','remove','字典类型管理','/system/dict/type/{dictIds}','delete',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514201,'campus','campus.campus_info.category_children','查询分类子列表','CampusInfoController','categoryChildren','校园墙信息api','/campus/categoryChildren/{categoryId}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514202,'school','school.sys_dict_data.get_info','字典数据管理-查询','SysDictDataController','getInfo','字典数据管理','/system/dict/data/{dictCode}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514203,'campus','campus.category.get_info','获取分类详细信息','CategoryController','getInfo','分类管理','/admin/category/{categoryId}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514204,'school','school.sys_dict_type.add','字典类型管理-新增','SysDictTypeController','add','字典类型管理','/system/dict/type','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514205,'school','school.sys_role.cancel_auth_user_all','cancelAuthUserAll','SysRoleController','cancelAuthUserAll','角色管理','/system/role/authUser/cancelAll','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514206,'school','school.sys_role.edit','edit','SysRoleController','edit','角色管理','/system/role','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514207,'school','school.sys_dict_data.export','export','SysDictDataController','export','字典数据管理','/system/dict/data/export','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514208,'campus','campus.content.add','添加信息墙内容','ContentController','add','内容管理','/admin/content/','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514209,'campus','campus.comment.get_info','getInfo','CommentController','getInfo','评论管理','/admin/comment/{commentId}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514210,'school','school.sys_logininfor.unlock','登录日志-解锁','SysLogininforController','unlock','登录日志管理','/monitor/logininfor/unlock/{userName}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514211,'campus','campus.comment.export','export','CommentController','export','评论管理','/admin/comment/export','post',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514212,'school','school.sys_logininfor.list','登录日志-分类列表','SysLogininforController','list','登录日志管理','/monitor/logininfor/list','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514213,'school','school.sys_dict_type.export','export','SysDictTypeController','export','字典类型管理','/system/dict/type/export','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514214,'school','school.sys_role.unallocated_list','unallocatedList','SysRoleController','unallocatedList','角色管理','/system/role/authUser/unallocatedList','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514215,'school','school.sys_login.get_info','获取用户信息','SysLoginController','getInfo','登录路由','/getInfo','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514216,'school','school.sys_profile.avatar','个人信息管理-头像上次','SysProfileController','avatar','个人信息管理','/system/user/profile/avatar','post',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514217,'campus','campus.tag.get_info','getInfo','TagController','getInfo','标签管理','/admin/tag/{tagId}','get',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514218,'school','school.sys_login.get_routers','获取路由信息','SysLoginController','getRouters','登录路由','/getRouters','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514219,'school','school.sys_dict_data.dict_type','字典数据管理-根据字典类型查询字典数据信息','SysDictDataController','dictType','字典数据管理','/system/dict/data/type/{dictType}','get',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514220,'campus','campus.tag.edit','edit','TagController','edit','标签管理','/admin/tag','put',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514221,'school','school.sys_dict_type.edit','字典类型管理-修改','SysDictTypeController','edit','字典类型管理','/system/dict/type','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514222,'campus','campus.comment.remove','remove','CommentController','remove','评论管理','/admin/comment/{commentIds}','delete',1,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46'),
(1798650228334514223,'school','school.sys_user.insert_auth_role','insertAuthRole','SysUserController','insertAuthRole','用户管理','/system/user/authRole','put',2,'N','\0',NULL,'2024-06-06 17:36:46',NULL,'2024-06-06 17:36:46');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1716729345025703938 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`menu_check_strictly`,`status`,`remark`,`del_flag`,`create_user`,`create_time`,`update_user`,`update_time`) values 
(1,'超级管理员','admin',1,1,'0','超级管理员','\0',NULL,'2022-10-05 15:28:43',NULL,NULL),
(2,'普通角色','common',2,1,'0','普通角色','',NULL,'2022-10-05 15:28:43',1,'2023-04-22 19:57:09'),
(1594285449147330561,'普通用户','campus:common',0,1,'0',NULL,'\0',1,'2022-11-20 19:04:06',1,'2023-04-22 19:56:57'),
(1628997165540274178,'审核员','campus:auditor',0,1,'0','审核信息墙内容，可以修改信息墙内容','\0',1,'2023-02-24 13:56:04',1,'2023-09-22 11:33:21'),
(1628997651572027394,'浏览用户','campus:glance',0,1,'0','只可浏览信息墙，点赞信息墙，不可发表墙和评论','\0',1,'2023-02-24 13:58:00',1,'2023-09-22 11:32:40'),
(1716729345025703937,'系统管理员','system_admin',1,1,'0','系统管理员','',1,'2023-10-24 16:12:26',NULL,NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(1628997165540274178,1597918884311171073),
(1628997165540274178,1597929330846040066),
(1628997165540274178,1597930331497922562),
(1628997651572027394,1597918884311171073),
(1628997651572027394,1597929330846040066),
(1628997651572027394,1597930331497922562);

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `resource_code` varchar(255) NOT NULL COMMENT '资源编码',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`role_id`,`resource_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色资源关联';

/*Data for the table `sys_role_resource` */

insert  into `sys_role_resource`(`resource_code`,`role_id`) values 
('campus.comment_info.get_own_comment_list',1594285449147330561),
('campus.comment_info.to_comment',1594285449147330561),
('campus.content_info.del_content',1594285449147330561),
('campus.content_info.get_own_love_content',1594285449147330561),
('campus.content_info.own_contents',1594285449147330561),
('campus.content_info.to_content',1594285449147330561),
('campus.user_action.image_upload',1594285449147330561),
('campus.user_action.video_upload',1594285449147330561),
('campus.user_action.zan_content',1594285449147330561),
('campus.content.edit',1628997165540274178),
('campus.content.get_info',1628997165540274178),
('campus.content.page',1628997165540274178),
('campus.content.remove',1628997165540274178),
('campus.content_info.del_content',1628997651572027394),
('campus.content_info.get_own_love_content',1628997651572027394),
('campus.content_info.own_contents',1628997651572027394),
('campus.user_action.zan_content',1628997651572027394);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1798666727048728578 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`login_ip`,`login_date`,`remark`,`create_user`,`create_time`,`update_user`,`update_time`,`del_flag`) values 
(1,'java1234','java1234','00','123@163.com','15888888887','0','/profile/avatar/2023/10/24/blob_20231024160331A001.jpeg','$2a$10$UAC2cQzSsuGdd94D79Lzo.rgBb/T/VfIkLTqEAyQNxHZibWdqh3P6','0','127.0.0.1','2024-06-06 17:54:19','管理员',0,'2022-10-05 15:28:43',1,'2024-06-06 17:54:19','\0'),
(1649740877917474817,'ling','ling','00','1277839@qq.com','17607605333','0','/profile/avatar/2024/03/29/blob_20240329165316A001.jpeg','$2a$10$Ma4n/7i0QvvQKEbyTlSdruVeXyeUYw4zRNPdrOqHCRu8s/s.mnkxu','0','127.0.0.1','2024-06-06 15:51:18',NULL,NULL,'2023-04-22 19:44:11',1649740877917474817,'2024-06-06 15:51:18','\0'),
(1777865711206002690,'111','111','00','','','0','','$2a$10$l7QWOg7Bg6IVGqJO9r0Ed.Jp1HLWGGoksf/g1d0QIrScG3Gsv.vsC','0','127.0.0.1','2024-04-10 09:06:41',NULL,NULL,'2024-04-10 09:06:31',1777865711206002690,'2024-04-10 09:06:41',''),
(1798666727048728577,'jack','jack','00','','','0','','$2a$10$8yxHY0jSBRHGVwk0rZP1n.zuqzHb6IMlF3vN2gaFp5ttV2yIqp9f.','0','127.0.0.1','2024-06-06 18:42:28',NULL,NULL,'2024-06-06 18:42:20',1798666727048728577,'2024-06-06 18:42:28','\0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1638895499486773250,1594285449147330561),
(1638913642586238978,1628997165540274178),
(1649726942417940482,1594285449147330561),
(1649740877917474817,1628997165540274178);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
