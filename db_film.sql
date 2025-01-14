/*
 Navicat MySQL Data Transfer

 Source Server         : J1ong
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : db_film

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 03/09/2019 17:18:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员联系电话',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '出生年月日',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员头像',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'admin', '男', '13414850215', '1999-9-9', '/images/admin/admin.gif');

-- ----------------------------
-- Table structure for t_cinema
-- ----------------------------
DROP TABLE IF EXISTS `t_cinema`;
CREATE TABLE `t_cinema`  (
  `cinema_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院id',
  `cinema_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院名称',
  `cinema_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院电话',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在市',
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在区县',
  `specified_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院详细地址',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cinema
-- ----------------------------
INSERT INTO `t_cinema` VALUES (1, '横店电影城(庆丰店)', '13498476301', '广东', '广州', '白云区', '白云区庆丰广场路财智广场2楼');
INSERT INTO `t_cinema` VALUES (2, '尚影影院', '13745454545', '广东', '广州', '白云区', '白云区石夏路288号金铂广场7楼');
INSERT INTO `t_cinema` VALUES (4, '烽禾影城(祈福新邨店)', '13409989898', '广东', '广州', '番禺区', '番禺区钟屏路钟福广场3层（祈福新村祈福医院旁）');
INSERT INTO `t_cinema` VALUES (5, '沙湾3D数字电影院', '13465102832', '广东', '广州', '番禺区', '番禺区沙湾镇大巷涌路沙湾文化中心2楼（沁芳园对面）');
INSERT INTO `t_cinema` VALUES (6, '大地影院(奥体高德美居店)', '13454729283', '广东', '广州', '天河区', '天河区奥体南路12号高德美居家居馆3楼（近天河百货）');
INSERT INTO `t_cinema` VALUES (7, '金逸国际影城(维家思店)', '13483743433', '广东', '广州', '天河区', '天河区黄埔大道西188号维家思广场3楼（富力盈隆广场对面）');
INSERT INTO `t_cinema` VALUES (8, 'FUN范影城(喜洋时代东圃店)', '13418226112', '广东', '广州', '天河区', '天河区东圃大马路4号四季时尚荟A栋1楼（近东圃购物中心）');
INSERT INTO `t_cinema` VALUES (14, '万达影院', '13498746534', NULL, NULL, NULL, '天河区长湴北街34号3楼');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `user_score` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户评分',
  `comment_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '用户评论内容',
  `comment_date` datetime(6) NULL DEFAULT NULL COMMENT '评论日期',
  `support_num` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '点赞数',
  `is_pass` int(1) NULL DEFAULT 0 COMMENT '评论是否通过审核',
  `support_user` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '点赞用户数组',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `t_comment_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_comment_ibfk_2`(`movie_id`) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (57, 1, 4, 9, '很好看，挺悲伤的，让我哭一会！', '2019-08-08 15:59:38.000000', 2, 1, '[1,53]');
INSERT INTO `t_comment` VALUES (58, 1, 7, 8, '很好看，有一起的吗？', '2019-08-08 16:05:46.000000', 2, 1, '[53,1]');

-- ----------------------------
-- Table structure for t_hall
-- ----------------------------
DROP TABLE IF EXISTS `t_hall`;
CREATE TABLE `t_hall`  (
  `hall_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `cinema_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名称',
  PRIMARY KEY (`hall_id`) USING BTREE,
  INDEX `t_hall_ibfk_1`(`cinema_id`) USING BTREE,
  CONSTRAINT `t_hall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hall
-- ----------------------------
INSERT INTO `t_hall` VALUES (30, 1, '1号激光厅');
INSERT INTO `t_hall` VALUES (32, 2, '1号激光厅');
INSERT INTO `t_hall` VALUES (34, 4, '1号激光厅');
INSERT INTO `t_hall` VALUES (35, 5, '1号激光厅');
INSERT INTO `t_hall` VALUES (36, 6, '1号激光厅');
INSERT INTO `t_hall` VALUES (37, 7, '1号激光厅');
INSERT INTO `t_hall` VALUES (38, 8, '1号激光厅');
INSERT INTO `t_hall` VALUES (40, 5, '2号激光厅');

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie`  (
  `movie_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影名称',
  `poster` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影海报',
  `director` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '导演',
  `actor` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主演',
  `movie_long` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影片长',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影语言版本',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '电影简介',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影类型',
  `public_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影上映时间',
  `wish_num` int(4) UNSIGNED NULL DEFAULT 0 COMMENT '想看人数',
  `score` decimal(4, 1) NULL DEFAULT NULL COMMENT '电影综合评分',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;


















-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `schedule_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `order_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下单手机',
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户下单时间',
  `ticket_num` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '购买电影票数',
  `ticket_total_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '电影票单价',
  `order_seat_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '座位信息',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `phone_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机取票码',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `t_order_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_order_ibfk_2`(`schedule_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `t_schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (73, 1, 69, '13414850282', '2019-5-6', 3, 168.00, '[25,26,35]', '1', '341593');
INSERT INTO `t_order` VALUES (75, 1, 53, '13414850282', '2019-5-7', 3, 294.00, '[26,25,35]', '1', '612368');
INSERT INTO `t_order` VALUES (79, 50, 50, '13672606065', '2019-5-10', 1, 56.00, '[35]', '0', '823445');
INSERT INTO `t_order` VALUES (80, 50, 60, '13672606065', '2019-5-10', 2, 90.00, '[25,24]', '0', '961831');
INSERT INTO `t_order` VALUES (81, 25, 55, '13877777766', '2019-5-10', 3, 168.36, '[25,35,36]', '0', '393432');
INSERT INTO `t_order` VALUES (82, 29, 53, '13482638273', '2019-5-10', 1, 98.00, '[27]', '0', '149857');
INSERT INTO `t_order` VALUES (84, 35, 53, '13457555444', '2019-5-10', 4, 392.00, '[24,5,15,14]', '0', '285591');
INSERT INTO `t_order` VALUES (85, 35, 60, '13457555444', '2019-5-10', 2, 90.00, '[26,36]', '0', '194678');
INSERT INTO `t_order` VALUES (86, 23, 70, '13478565555', '2019-5-11', 3, 168.00, '[25,26,35]', '1', '674698');
INSERT INTO `t_order` VALUES (87, 1, 53, '13414850282', '2019-5-11', 3, 294.00, '[45,46,36]', '0', '897439');
INSERT INTO `t_order` VALUES (88, 1, 54, '13414850282', '2019-5-11', 4, 176.00, '[25,26,36,35]', '0', '481319');
INSERT INTO `t_order` VALUES (90, 1, 64, '13414850282', '2019-7-5', 2, 156.00, '[15,16]', '0', '146745');
INSERT INTO `t_order` VALUES (91, 1, 68, '13414850282', '2019-7-12', 4, 136.00, '[25,26,36,35]', '1', '572118');
INSERT INTO `t_order` VALUES (92, 1, 64, '13414850282', '2019-7-15', 4, 312.00, '[35,26,36,25]', '1', '859679');
INSERT INTO `t_order` VALUES (93, 1, 64, '13414850282', '2019-7-15', 2, 156.00, '[34,37]', '0', '847345');
INSERT INTO `t_order` VALUES (94, 1, 87, '13414850282', '2019-7-15', 4, 308.00, '[25,26,36,35]', '1', '987546');
INSERT INTO `t_order` VALUES (95, 1, 82, '13414850282', '2019-7-15', 4, 260.00, '[25,26,36,35]', '1', '751292');
INSERT INTO `t_order` VALUES (96, 1, 87, '13414850282', '2019-7-15', 2, 154.00, '[45,46]', '0', '135615');
INSERT INTO `t_order` VALUES (97, 1, 87, '13414850282', '2019-7-15', 1, 77.00, '[37]', '1', '586315');
INSERT INTO `t_order` VALUES (98, 1, 87, '13414850282', '2019-7-15', 1, 77.00, '[34]', '1', '666362');
INSERT INTO `t_order` VALUES (99, 1, 67, '13414850282', '2019-7-24', 4, 264.00, '[25,27,46,34]', '1', '323495');
INSERT INTO `t_order` VALUES (100, 1, 80, '13414850282', '2019-7-25', 4, 152.00, '[16,26,25,15]', '1', '577429');
INSERT INTO `t_order` VALUES (101, 1, 80, '13414850282', '2019-8-6', 2, 76.00, '[35,36]', '1', '821579');

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule`  (
  `schedule_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '排片id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `cinema_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `hall_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名字',
  `show_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映日期',
  `show_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '电影售价',
  `seat_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '座位信息',
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `hall_id`(`hall_name`) USING BTREE,
  INDEX `t_schedule_ibfk_1`(`movie_id`) USING BTREE,
  INDEX `t_schedule_ibfk_2`(`cinema_id`) USING BTREE,
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES (50, 20, 5, '1号激光厅', '2019-5-22', '20:05', 56.00, '[35]');
INSERT INTO `t_schedule` VALUES (53, 13, 6, '1号激光厅', '2019-5-31', '12:05', 98.00, '[35,27,24,5,15,14,45,46,36]');
INSERT INTO `t_schedule` VALUES (54, 16, 4, '1号激光厅', '2019-7-10', '20:05', 44.00, '[25,26,36,35]');
INSERT INTO `t_schedule` VALUES (55, 19, 6, '1号激光厅', '2019-5-14', '16:05', 56.12, '[25,35,36]');
INSERT INTO `t_schedule` VALUES (56, 17, 8, '1号激光厅', '2019-5-16', '16:05', 38.10, '[]');
INSERT INTO `t_schedule` VALUES (59, 5, 6, '1号激光厅', '2019-5-24', '16:05', 76.00, NULL);
INSERT INTO `t_schedule` VALUES (60, 6, 2, '1号激光厅', '2019-5-22', '08:05', 45.00, '[25,24,26,36]');
INSERT INTO `t_schedule` VALUES (63, 4, 2, '1号激光厅', '2019-5-23', '08:05', 46.10, NULL);
INSERT INTO `t_schedule` VALUES (64, 8, 7, '1号激光厅', '2019-9-24', '12:05', 78.00, '[15,16,35,26,36,25,34,37]');
INSERT INTO `t_schedule` VALUES (67, 12, 6, '1号激光厅', '2019-11-18', '16:05', 66.00, '[25,27,46,34]');
INSERT INTO `t_schedule` VALUES (68, 15, 1, '1号激光厅', '2019-7-21', '16:05', 34.00, '[25,26,36,35]');
INSERT INTO `t_schedule` VALUES (69, 29, 5, '2号激光厅', '2019-5-20', '20:05', 56.00, '[25,26,35]');
INSERT INTO `t_schedule` VALUES (70, 20, 5, '1号激光厅', '2019-5-24', '16:05', 56.00, '[25,26,35]');
INSERT INTO `t_schedule` VALUES (74, 34, 4, '1号激光厅', '2019-6-26', '12:05', 78.90, NULL);
INSERT INTO `t_schedule` VALUES (75, 3, 6, '1号激光厅', '2019-5-21', '16:05', 36.70, NULL);
INSERT INTO `t_schedule` VALUES (76, 35, 4, '1号激光厅', '2019-5-24', '12:05', 76.00, NULL);
INSERT INTO `t_schedule` VALUES (77, 3, 2, '1号激光厅', '2019-5-31', '12:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (78, 13, 2, '1号激光厅', '2019-6-30', '20:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (79, 1, 7, '1号激光厅', '2019-7-11', '08:05', 45.00, '[]');
INSERT INTO `t_schedule` VALUES (80, 4, 8, '1号激光厅', '2019-8-14', '20:05', 38.00, '[16,26,25,15,35,36]');
INSERT INTO `t_schedule` VALUES (81, 37, 4, '1号激光厅', '2019-7-30', '12:05', 76.00, NULL);
INSERT INTO `t_schedule` VALUES (82, 16, 1, '1号激光厅', '2019-7-21', '20:05', 65.00, '[25,26,36,35]');
INSERT INTO `t_schedule` VALUES (83, 18, 2, '1号激光厅', '2019-7-30', '12:05', 34.00, NULL);
INSERT INTO `t_schedule` VALUES (84, 36, 7, '1号激光厅', '2019-11-22', '12:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (85, 37, 5, '2号激光厅', '2019-7-24', '20:05', 56.00, NULL);
INSERT INTO `t_schedule` VALUES (86, 33, 7, '1号激光厅', '2019-7-30', '16:05', 83.00, NULL);
INSERT INTO `t_schedule` VALUES (87, 13, 8, '1号激光厅', '2019-7-24', '16:05', 77.00, '[25,26,36,35,45,46,37,34]');
INSERT INTO `t_schedule` VALUES (88, 3, 6, '1号激光厅', '2019-7-23', '20:05', 53.00, NULL);
INSERT INTO `t_schedule` VALUES (89, 34, 5, '2号激光厅', '2019-7-31', '20:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (90, 10, 2, '1号激光厅', '2019-11-30', '12:05', 56.00, NULL);
INSERT INTO `t_schedule` VALUES (91, 18, 5, '2号激光厅', '2019-7-25', '20:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (92, 7, 1, '1号激光厅', '2019-8-31', '16:05', 89.00, NULL);
INSERT INTO `t_schedule` VALUES (93, 8, 6, '1号激光厅', '2019-9-30', '20:05', 49.00, '[]');
INSERT INTO `t_schedule` VALUES (94, 9, 2, '1号激光厅', '2019-7-30', '16:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (95, 5, 4, '1号激光厅', '2019-7-25', '12:05', 34.00, NULL);
INSERT INTO `t_schedule` VALUES (96, 35, 2, '1号激光厅', '2019-7-24', '16:05', 34.00, NULL);
INSERT INTO `t_schedule` VALUES (98, 38, 2, '1号激光厅', '2019-7-17', '16:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (99, 8, 7, '1号激光厅', '2019-9-30', '16:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (100, 8, 7, '1号激光厅', '2019-10-1', '20:05', 40.00, NULL);
INSERT INTO `t_schedule` VALUES (101, 4, 7, '1号激光厅', '2019-8-9', '20:05', 45.00, NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户出生年月日',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户签名',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'LyuJ1ong', '/images/avatar/man.jpg', '123456', '13414850282', '男', '2019-8-12', '我命由我不由天');
INSERT INTO `t_user` VALUES (19, '张三', '/images/avatar/1557241550286.jpg', '123', '13423232323', '男', '2019-4-8', '66666');
INSERT INTO `t_user` VALUES (23, '13478565555', '/images/avatar/monkey.png', '123456', '13478565555', '男', NULL, '加油');
INSERT INTO `t_user` VALUES (25, '13877777766', '/images/avatar/monkey.png', '123456', '13877777766', '男', NULL, '生而无畏');
INSERT INTO `t_user` VALUES (29, '13482638273', '/images/avatar/monkey.png', '123456', '13482638273', '女', NULL, '向前跑，用尽全部力气');
INSERT INTO `t_user` VALUES (30, '13428372632', '/images/avatar/monkey.png', '123456', '13428372632', '女', NULL, '生活不止眼前的枸杞，还有诗和远方');
INSERT INTO `t_user` VALUES (35, '13457555444', '/images/avatar/monkey.png', '123456', '13457555444', '男', NULL, 'to be');
INSERT INTO `t_user` VALUES (36, '13415656565', '/images/avatar/monkey.png', '123456', '13415656565', '女', NULL, 'Oh');
INSERT INTO `t_user` VALUES (37, '13428273363', '/images/avatar/monkey.png', '123456', '13428273363', '女', NULL, 'JavaScript');
INSERT INTO `t_user` VALUES (44, '小李', '/images/avatar/monkey.png', '123456', '13414232321', '男', NULL, '一起加油');
INSERT INTO `t_user` VALUES (46, '王大锤', '/images/avatar/1557241132762.jpg', '123456', '13412121211', '男', '1990-06-16', '开心就好');
INSERT INTO `t_user` VALUES (48, '大奔', '/images/avatar/monkey.png', '123456', '13414850215', '男', '2019-5-2', '777777');
INSERT INTO `t_user` VALUES (49, '13414851033', '/images/avatar/monkey.png', '123456', '13414851033', '女', NULL, '99999');
INSERT INTO `t_user` VALUES (50, '13672606065', '/images/avatar/monkey.png', '999999', '13672606065', '男', '', '7777777');
INSERT INTO `t_user` VALUES (51, '王五', '/images/avatar/1557474974747.jpg', '123456', '13478343221', '男', '2019-5-1', '66666666666666666666');
INSERT INTO `t_user` VALUES (52, '老王', '/images/avatar/monkey.png', '123', '13414850242', '女', '2019-7-8', '帅');
INSERT INTO `t_user` VALUES (53, '13411111111', '/images/avatar/monkey.png', '123456', '13411111111', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (54, '13499090909', '/images/avatar/monkey.png', '123456', '13499090909', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_wishmovie
-- ----------------------------
DROP TABLE IF EXISTS `t_wishmovie`;
CREATE TABLE `t_wishmovie`  (
  `wishMovie_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '想看电影id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  PRIMARY KEY (`wishMovie_id`) USING BTREE,
  INDEX `t_wishmovie_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_wishmovie_ibfk_2`(`movie_id`) USING BTREE,
  CONSTRAINT `t_wishmovie_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_wishmovie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wishmovie
-- ----------------------------
INSERT INTO `t_wishmovie` VALUES (74, 1, 20);
INSERT INTO `t_wishmovie` VALUES (76, 1, 9);
INSERT INTO `t_wishmovie` VALUES (77, 46, 13);
INSERT INTO `t_wishmovie` VALUES (78, 1, 17);
INSERT INTO `t_wishmovie` VALUES (79, 1, 33);
INSERT INTO `t_wishmovie` VALUES (82, 50, 13);
INSERT INTO `t_wishmovie` VALUES (83, 50, 5);
INSERT INTO `t_wishmovie` VALUES (84, 50, 8);
INSERT INTO `t_wishmovie` VALUES (85, 50, 29);
INSERT INTO `t_wishmovie` VALUES (86, 50, 12);
INSERT INTO `t_wishmovie` VALUES (87, 50, 6);
INSERT INTO `t_wishmovie` VALUES (88, 25, 20);
INSERT INTO `t_wishmovie` VALUES (89, 25, 29);
INSERT INTO `t_wishmovie` VALUES (90, 25, 34);
INSERT INTO `t_wishmovie` VALUES (91, 29, 29);
INSERT INTO `t_wishmovie` VALUES (92, 29, 9);
INSERT INTO `t_wishmovie` VALUES (93, 29, 34);
INSERT INTO `t_wishmovie` VALUES (95, 23, 3);
INSERT INTO `t_wishmovie` VALUES (96, 1, 35);
INSERT INTO `t_wishmovie` VALUES (110, 1, 15);
INSERT INTO `t_wishmovie` VALUES (112, 1, 13);
INSERT INTO `t_wishmovie` VALUES (115, 1, 12);
INSERT INTO `t_wishmovie` VALUES (116, 1, 8);
INSERT INTO `t_wishmovie` VALUES (117, 1, 7);
INSERT INTO `t_wishmovie` VALUES (118, 1, 10);

SET FOREIGN_KEY_CHECKS = 1;
