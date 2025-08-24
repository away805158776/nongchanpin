/*
 Navicat Premium Dump SQL

 Source Server         : mysql8.0
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3308
 Source Schema         : 0431

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 23/08/2025 12:23:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `link_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `link_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系地址',
  `link_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_id` bigint NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收货地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (8, 'user', '浙江省杭州市', '15888888888', 25);
INSERT INTO `address` VALUES (9, 'user', '浙江省金华市', '15888888888', 25);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (6, 'http://localhost:9999/files/1731760909506', NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `count` int NULL DEFAULT NULL COMMENT '商品数量',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `goods_user`(`goods_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (30, 23, 25, 1, '2025-08-09 05:00:08');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (8, '水果类', '103');
INSERT INTO `category` VALUES (9, '蔬菜类', '104');
INSERT INTO `category` VALUES (11, '稻谷类', '106');
INSERT INTO `category` VALUES (12, '其他类', '107');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (14, '水果农产品', 'http://localhost:9999/files/1731759591345', '22', '25', '2025-08-09 05:00:08');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品描述',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品编号',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `discount` double(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `store` int NULL DEFAULT NULL COMMENT '库存',
  `praise` int NULL DEFAULT 0 COMMENT '点赞数',
  `sales` int NULL DEFAULT 0 COMMENT '销量',
  `category_id` bigint NULL DEFAULT NULL COMMENT '分类id',
  `imgs` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `recommend` tinyint(1) NULL DEFAULT NULL COMMENT '是否推荐：0不推荐，1推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (22, '水果农产品', '水果农产品', 'B-01', 20.00, 0.90, 95, 0, 1, 8, '[\"http://localhost:9999/files/1731759591345\",\"http://localhost:9999/files/1731759610690\",\"http://localhost:9999/files/1731759610725\",\"http://localhost:9999/files/1731759610677\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (23, '水果农产品', '水果农产品', 'B-02', 20.00, 0.90, 99, 0, 1, 8, '[\"http://localhost:9999/files/1731760077130\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (24, '水果农产品', '水果农产品', 'B-03', 20.00, 0.90, 100, 0, 0, 8, '[\"http://localhost:9999/files/1731759773264\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (25, '蔬菜农产品', '蔬菜农产品', 'A-01', 20.00, 0.90, 98, 0, 1, 9, '[\"http://localhost:9999/files/1731759808625\",\"http://localhost:9999/files/1731759813851\",\"http://localhost:9999/files/1731759813865\",\"http://localhost:9999/files/1731759813884\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (26, '蔬菜农产品', '蔬菜农产品', 'B-01', 10.00, 0.90, 98, 0, 0, 9, '[\"http://localhost:9999/files/1731759842147\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (27, '蔬菜农产品', '蔬菜农产品', 'B-02', 10.00, 0.90, 100, 0, 0, 9, '[\"http://localhost:9999/files/1731759886658\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (28, '蔬菜农产品', '蔬菜农产品', 'B-03', 10.00, 0.90, 100, 0, 0, 9, '[\"http://localhost:9999/files/1731759951559\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (35, '稻谷农产品', '稻谷农产品', 'B-101', 50.00, 0.50, 99, 0, 1, 11, '[\"http://localhost:9999/files/1731760016764\"]', '2025-08-09 05:00:08', 1);
INSERT INTO `goods` VALUES (36, '水果农产品', '水果农产品', 'C-101', 50.00, 0.20, 98, 0, 0, 8, '[\"http://localhost:9999/files/1731759996688\"]', '2025-08-09 05:00:08', NULL);
INSERT INTO `goods` VALUES (37, '1', '1', '1', 1.00, 1.00, 1, 0, 0, 8, NULL, '2025-08-09 05:00:08', NULL);
INSERT INTO `goods` VALUES (38, '2', '2', '2', 2.00, 2.00, 2, 0, 0, 8, NULL, '2025-08-09 05:00:08', NULL);
INSERT INTO `goods` VALUES (39, '3', '3', '3', 3.00, 3.00, 3, 0, 0, 8, NULL, '2025-08-09 05:00:08', NULL);
INSERT INTO `goods` VALUES (40, '4', '4', '4', 4.00, 4.00, 4, 0, 0, 8, NULL, '2025-08-09 05:00:08', NULL);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单商品关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (30, 21, 25, 1);
INSERT INTO `order_goods` VALUES (31, 22, 22, 1);
INSERT INTO `order_goods` VALUES (32, 22, 23, 1);
INSERT INTO `order_goods` VALUES (33, 23, 35, 1);

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 434 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (385, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (386, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (387, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (388, '删除权限菜单：菜单管理', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (389, '删除权限菜单：角色管理', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (390, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (391, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (392, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (393, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (394, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (395, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (396, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (397, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (398, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (399, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (400, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (401, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (402, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (403, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (404, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (405, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (406, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (407, '更新用户：user ', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (408, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (409, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (410, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (411, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (412, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (413, '更新用户：admin ', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (414, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (415, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (416, '更新用户账户：user ', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (417, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (418, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (419, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (420, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (421, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (422, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (423, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (424, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (425, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (426, '用户 user 登录系统', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (427, 'user 用户重置密码', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (428, 'user 用户重置密码', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (429, 'user 用户重置密码', '2025-08-09 05:00:08', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (430, '用户 admin 登录系统', '2025-08-09 05:00:08', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (431, '用户 user 登录系统', '2025-08-10 21:28:40', 'user', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (432, '用户 admin 登录系统', '2025-08-10 21:32:24', 'admin', '0:0:0:0:0:0:0:1');
INSERT INTO `t_log` VALUES (433, '用户 user 登录系统', '2025-08-10 21:33:17', 'user', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父ID',
  `foreign_id` bigint NULL DEFAULT 0 COMMENT '关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (32, '真心喜欢！', 'user', '2025-08-09 05:00:08', NULL, 22);
INSERT INTO `t_message` VALUES (33, '真心喜欢！', 'user', '2025-08-09 05:00:08', NULL, 26);
INSERT INTO `t_message` VALUES (34, '真心喜欢！', 'user', '2025-08-09 05:00:08', NULL, 22);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (4, '第一条公告', '测试公告！', '2025-08-09 05:00:08');
INSERT INTO `t_notice` VALUES (5, '第二条公告', '测试公告！', '2025-08-09 05:00:08');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `user_id` bigint NULL DEFAULT NULL COMMENT '下单人id',
  `link_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `link_address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '送货地址',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待付款' COMMENT '状态',
  `create_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (21, '20241116210610680955', 18.00, 25, 'user', '15888888888', '浙江省杭州市', '待收货', '2025-08-09 05:00:08');
INSERT INTO `t_order` VALUES (22, '20241116210653994361', 36.00, 25, 'user', '15888888888', '浙江省杭州市', '待付款', '2025-08-09 05:00:08');
INSERT INTO `t_order` VALUES (23, '20241116211049940717', 25.00, 25, 'user', '15888888888', '浙江省杭州市', '待发货', '2025-08-09 05:00:08');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 's-data' COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123124 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '权限菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '首页', '首页', '/home', 's-home');
INSERT INTO `t_permission` VALUES (2, '用户管理', '用户管理', '/user', 'user-solid');
INSERT INTO `t_permission` VALUES (3, '农产品管理', '农产品管理', '/goods', 'apple');
INSERT INTO `t_permission` VALUES (4, '分类管理', '商品分类管理', '/category', 'tickets');
INSERT INTO `t_permission` VALUES (5, '订单管理', '订单管理', '/order', 'check');
INSERT INTO `t_permission` VALUES (6, '地址管理', '收货地址管理', '/address', 's-data');
INSERT INTO `t_permission` VALUES (7, '公告管理', '公告管理', '/notice', 'data-board');
INSERT INTO `t_permission` VALUES (8, '轮播图管理', '轮播图管理', '/banner', 'picture');
INSERT INTO `t_permission` VALUES (9, '日志管理', '日志管理', '/log', 'notebook-2');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `permission` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', '所有权限', '[1,2,3,4,5,6,7,8,9]');
INSERT INTO `t_role` VALUES (2, '普通用户', '部分权限', '[]');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `account` decimal(10, 2) NULL DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username` ASC, `nick_name` ASC, `email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '123456', '管理员', '110@qq.com', '15888888888', '1731765311277', '[1]', '浙江省杭州市', 18, 0.00);
INSERT INTO `t_user` VALUES (22, 'user3', '123456', 'user3', '110@qq.com', '15888888888', '1731162296930', '[2]', '浙江省杭州市', 18, 0.00);
INSERT INTO `t_user` VALUES (23, 'user2', '123456', 'user2', '110@qq.com', '15888888888', '1731162296930', '[2]', '浙江省杭州市', 18, 0.00);
INSERT INTO `t_user` VALUES (25, 'user', '123456', 'user', '110@qq.com', '15888888888', '1731760214748', '[2]', '浙江省杭州市', 18, 100.00);
INSERT INTO `t_user` VALUES (26, 'user4', '123456', 'user4', '110@qq.com', '15888888888', '1731162296930', '[2]', '浙江省杭州市', 28, 0.00);

SET FOREIGN_KEY_CHECKS = 1;
