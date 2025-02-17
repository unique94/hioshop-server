/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : hiolabs

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 01/02/2024 16:29:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hiolabs_ad
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_ad`;
CREATE TABLE `hiolabs_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0商品，1链接',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_time` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `enabled` (`enabled`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_ad
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_ad` VALUES (28, 0, '', -1, 'http://yanxuan.nosdn.127.net/ed50cbf7fab10b35f676e2451e112130.jpg', 1894780212, 1, 1, 0);
INSERT INTO `hiolabs_ad` VALUES (30, 0, '', -1, 'http://yanxuan.nosdn.127.net/0251bd141f5b55bd4311678750a6b344.jpg', 1894780212, 1, 2, 0);
INSERT INTO `hiolabs_ad` VALUES (31, 0, '', -1, 'http://yanxuan.nosdn.127.net/19b1375334f2e19130a3ba0e993d7e91.jpg', 1894780212, 1, 3, 0);
INSERT INTO `hiolabs_ad` VALUES (32, 0, '', -1, 'http://yanxuan.nosdn.127.net/b2de2ebcee090213861612909374f9f8.jpg', 1894780212, 1, 4, 0);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_address
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_address`;
CREATE TABLE `hiolabs_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `country_id` smallint(6) NOT NULL DEFAULT '0',
  `province_id` smallint(6) NOT NULL DEFAULT '0',
  `city_id` smallint(6) NOT NULL DEFAULT '0',
  `district_id` smallint(6) NOT NULL DEFAULT '0',
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_address
-- ----------------------------


-- ----------------------------
-- Table structure for hiolabs_admin
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_admin`;
CREATE TABLE `hiolabs_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password_salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `last_login_ip` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `last_login_time` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_admin
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_admin` VALUES (14, 'qilelab.com', '8bb5ed5c86cfe460277d11223c26a744', 'HIOLABS', '::ffff:127.0.0.1', 1681967830, 0);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_cart
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_cart`;
CREATE TABLE `hiolabs_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_aka` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_weight` double(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重量',
  `add_price` decimal(10,2) DEFAULT '0.00' COMMENT '加入购物车时的价格',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_specifition_name_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格属性组成的字符串，用来显示用',
  `goods_specifition_ids` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'product表对应的goods_specifition_ids',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `list_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `freight_template_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板',
  `is_on_sale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `is_fast` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for hiolabs_category
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_category`;
CREATE TABLE `hiolabs_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `front_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `show_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `front_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `p_height` int(11) NOT NULL DEFAULT '0',
  `is_category` tinyint(1) NOT NULL DEFAULT '0',
  `is_channel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1036009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_category
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_category` VALUES (1005000, '书房雅尚', '', '书房雅尚', 0, 1, 1, 1, 'http://yanxuan.nosdn.127.net/a45c2c262a476fea0b9fc684fed91ef5.png', 'http://nos.netease.com/yanxuan/f0d0e1a542e2095861b42bf789d948ce.jpg', 'L1', '书房雅尚', 155, 1, 1);
INSERT INTO `hiolabs_category` VALUES (1005001, '时年贺寿', '', '时年贺寿', 0, 2, 2, 1, 'http://yanxuan.nosdn.127.net/ad8b00d084cb7d0958998edb5fee9c0a.png', 'http://nos.netease.com/yanxuan/88855173a0cfcfd889ee6394a3259c4f.jpg', 'L1', '时年贺寿', 155, 1, 1);
INSERT INTO `hiolabs_category` VALUES (1005002, '访友贽敬', '', '访友贽敬', 0, 3, 3, 1, 'http://yanxuan.nosdn.127.net/11abb11c4cfdee59abfb6d16caca4c6a.png', 'http://nos.netease.com/yanxuan/935f1ab7dcfeb4bbd4a5da9935161aaf.jpg', 'L1', '访友贽敬', 155, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_except_area
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_except_area`;
CREATE TABLE `hiolabs_except_area` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `area` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '0位默认，',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_except_area
-- ----------------------------

-- ----------------------------
-- Table structure for hiolabs_except_area_detail
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_except_area_detail`;
CREATE TABLE `hiolabs_except_area_detail` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `except_area_id` int(11) NOT NULL DEFAULT '0',
  `area` int(11) NOT NULL DEFAULT '0' COMMENT '0位默认，',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for hiolabs_footprint
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_footprint`;
CREATE TABLE `hiolabs_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_footprint
-- ----------------------------

-- ----------------------------
-- Table structure for hiolabs_formid
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_formid`;
CREATE TABLE `hiolabs_formid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `form_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `use_times` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for hiolabs_freight_template
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_freight_template`;
CREATE TABLE `hiolabs_freight_template` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '运费模板名称',
  `package_price` decimal(5,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '包装费用',
  `freight_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0按件，1按重量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_freight_template
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_freight_template` VALUES (15, '中通', 0.00, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_freight_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_freight_template_detail`;
CREATE TABLE `hiolabs_freight_template_detail` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `area` int(11) NOT NULL DEFAULT '0' COMMENT '0位默认，',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -- ----------------------------
-- -- Records of hiolabs_freight_template_detail
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_freight_template_detail` VALUES (113, 15, 47, 0, 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_freight_template_group
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_freight_template_group`;
CREATE TABLE `hiolabs_freight_template_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认，area:0',
  `area` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '0位默认，',
  `start` int(11) NOT NULL DEFAULT '1',
  `start_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add` int(11) NOT NULL DEFAULT '1',
  `add_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `free_by_number` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0没有设置',
  `free_by_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '0没设置',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -- ----------------------------
-- -- Records of hiolabs_freight_template_group
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_freight_template_group` VALUES (47, 18, 1, '0', 1, 0.00, 1, 0.00, 0, 0.00, 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_goods
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_goods`;
CREATE TABLE `hiolabs_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_on_sale` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_number` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sell_volume` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售量',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `retail_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.00' COMMENT '零售价格',
  `min_retail_price` decimal(10,2) DEFAULT '0.00',
  `cost_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.00',
  `min_cost_price` decimal(10,2) DEFAULT '0.00',
  `goods_brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '100',
  `is_index` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `goods_unit` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品单位',
  `https_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '商品https图',
  `list_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品列表图',
  `freight_template_id` int(11) DEFAULT '0',
  `freight_type` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_gallery` tinyint(1) DEFAULT '0',
  `has_done` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cat_id` (`category_id`) USING BTREE,
  KEY `goods_number` (`goods_number`) USING BTREE,
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1181001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_goods
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_goods` VALUES (1155000, 1005000, 1, '德高以致远', 1, 11, '', '399.00', 399.00, '300.00', 300.00, '书房-德高以致远', '<p><img src=\"http://yanxuan.nosdn.127.net/162f14bce2afba3a484ce8fb5da1e58b.jpg\" _src=\"http://yanxuan.nosdn.127.net/162f14bce2afba3a484ce8fb5da1e58b.jpg\" style=\"\"/></p>', 12, 1, 1, '件', 'http://yanxuan.nosdn.127.net/7335f6e807e8507994710bca848de2d8.jpg', 'http://yanxuan.nosdn.127.net/d7d6ef1f1865991077384761b4521dce.png', 0, 0, 0, 1, 0);
INSERT INTO `hiolabs_goods` VALUES (1181000, 1005000, 1, '宁静致远', 2, 18, '', '999', 999.00, '900', 900.00, '画作-宁静致远', '<p><img src=\"http://yanxuan.nosdn.127.net/3ddfe10db43f7df33ba82ae7570ada80.jpg\"></p><p><img src=\"http://yanxuan.nosdn.127.net/7682b7930b4776ce032f509c24a74a1e.jpg\"></p>', 1, 1, 0, '件', 'http://yanxuan.nosdn.127.net/6f3e94fa4b44341bda5a73224d605896.jpg', 'http://yanxuan.nosdn.127.net/1f67b1970ee20fd572b7202da0ff705d.png', 19, 0, 0, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_goods_gallery`;
CREATE TABLE `hiolabs_goods_gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `img_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '5',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_goods_gallery
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_goods_gallery` VALUES (681, 1009024, 'http://yanxuan.nosdn.127.net/5c1d28e86ccb89980e6054a49571cdec.jpg', '', 5, 1);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_goods_specification`;
CREATE TABLE `hiolabs_goods_specification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `specification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `is_delete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `specification_id` (`specification_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品对应规格表值表';

-- -- ----------------------------
-- -- Records of hiolabs_goods_specification
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_goods_specification` VALUES (6, 1006051, 1, '红色', '', 0);
-- INSERT INTO `hiolabs_goods_specification` VALUES (7, 1009024, 1, '棕色', '', 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_keywords
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_keywords`;
CREATE TABLE `hiolabs_keywords` (
  `keyword` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '100',
  `scheme _url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键词的跳转链接',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='热闹关键词表';

-- ----------------------------
-- Table structure for hiolabs_notice
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_notice`;
CREATE TABLE `hiolabs_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_notice
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_notice` VALUES (8, '完全开源小程序商城 - github搜索：海风小店', 1764950399, 0);
INSERT INTO `hiolabs_notice` VALUES (9, '可测试支付流程，但不发货不退款', 1764950399, 0);
INSERT INTO `hiolabs_notice` VALUES (111, '如果可以，请在github点个star，谢谢', 1764950399, 0);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_order
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_order`;
CREATE TABLE `hiolabs_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '101：未付款、102：已取消、103已取消(系统)、201：已付款、202：订单取消，退款中、203：已退款、301：已发货、302：已收货、303：已收货(系统)、401：已完成、801：拼团中,未付款、802：拼团中,已付款',
  `offline_pay` tinyint(3) unsigned DEFAULT '0' COMMENT '线下支付订单标志',
  `shipping_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0未发货，1已发货',
  `print_status` tinyint(1) NOT NULL DEFAULT '0',
  `pay_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `print_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `postscript` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `admin_memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '免邮的商品的邮费，这个在退款时不能退给客户',
  `pay_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pay_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `change_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '0没改价，不等于0改过价格，这里记录原始的价格',
  `actual_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际需要支付的金额',
  `order_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款时间',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `dealdone_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成交时间，用户评论或自动好评时间',
  `freight_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送费用',
  `express_value` decimal(10,2) NOT NULL DEFAULT '480.00' COMMENT '顺丰保价金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '需电联客户请优先派送勿放快递柜',
  `order_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单类型：0普通，1秒杀，2团购，3返现订单,7充值，8会员',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_status` (`order_status`) USING BTREE,
  KEY `shipping_status` (`shipping_status`) USING BTREE,
  KEY `pay_status` (`pay_status`) USING BTREE,
  KEY `pay_id` (`pay_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -- ----------------------------
-- -- Records of hiolabs_order
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_order` VALUES (1325, '20191005104128963425', 1048, 300, 0, 0, 0, 2, '测试', 0, 3, 38, 422, '测试地址', '1、懒人椅【1】 ', '13333232323', '', NULL, 0.00, '', '4200000443201911295307326072', 0.10, 0.10, 0.10, 0.10, 1574995288, 1574995362, 0, 0, 0, 0, 480.00, '需电联客户请优先派送勿放快递柜', 0, 0);
-- INSERT INTO `hiolabs_order` VALUES (1326, '20191005104213170448', 1048, 102, 0, 0, 0, 0, '测试', 0, 3, 38, 422, '测试地址', '1、懒人椅【1】 2、懒人椅【1】 ', '13333232323', '', NULL, 0.00, '', '0', 0.30, 0.30, 0.30, 0.30, 1574995333, 0, 0, 0, 0, 0, 480.00, '需电联客户请优先派送勿放快递柜', 0, 0);
-- INSERT INTO `hiolabs_order` VALUES (1327, '20191005104259977005', 1048, 401, 0, 1, 0, 2, '测试', 0, 3, 38, 422, '测试地址', '1、懒人椅【1】 ', '13333232323', '', NULL, 0.00, '', '4200000439201911293966737453', 0.10, 0.10, 0.10, 0.10, 1574995379, 1574995383, 1574995431, 1582790143, 0, 0, 480.00, '需电联客户请优先派送勿放快递柜', 0, 0);
-- INSERT INTO `hiolabs_order` VALUES (1328, '20191005133123894325', 1048, 300, 0, 0, 0, 2, '测试', 0, 3, 38, 422, '测试地址', '1、懒人椅【1】 ', '13333232323', '', NULL, 0.00, '', '4200000432201911295554286798', 0.01, 0.01, 0.01, 0.01, 1575005483, 1575005486, 0, 0, 0, 0, 480.00, '需电联客户请优先派送勿放快递柜', 0, 0);
-- INSERT INTO `hiolabs_order` VALUES (1329, '20191005133306961145', 1048, 102, 0, 0, 0, 0, '测试', 0, 3, 38, 422, '测试地址', '1、懒人椅【4】 ', '13333232323', '', NULL, 0.00, '', '0', 0.04, 0.04, 0.04, 0.04, 1575005586, 0, 0, 0, 0, 0, 480.00, '需电联客户请优先派送勿放快递柜', 0, 0);
-- INSERT INTO `hiolabs_order` VALUES (1330, '20191005170626623520', 1048, 300, 1, 0, 0, 2, '测试', 0, 3, 38, 422, '测试地址', '1、懒人椅【1】 ', '13333232323', '', NULL, 0.00, '', '4200000422201911290938060299', 0.01, 0.01, 0.01, 0.01, 1575018386, 1575018391, 0, 0, 0, 0, 480.00, '需电联客户请优先派送勿放快递柜', 0, 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_order_express
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_order_express`;
CREATE TABLE `hiolabs_order_express` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `shipper_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `shipper_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `shipper_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流公司代码',
  `logistic_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `traces` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流跟踪信息',
  `is_finish` tinyint(1) NOT NULL DEFAULT '0',
  `request_count` int(11) DEFAULT '0' COMMENT '总查询次数',
  `request_time` int(11) DEFAULT '0' COMMENT '最近一次向第三方查询物流信息时间',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `express_type` tinyint(1) NOT NULL DEFAULT '0',
  `region_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '快递的地区编码，如杭州571',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单物流信息表，发货时生成';

-- ----------------------------
-- Records of hiolabs_order_express
-- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_order_express` VALUES (124, 1327, 1, '顺丰速运', 'SF', '291182981232', '[{\"time\":\"2019-11-29 16:52:15\",\"status\":\"[昆明市]在官网\\\"运单资料&签收图\\\",可查看签收人信息\"},{\"time\":\"2019-11-29 16:52:14\",\"status\":\"[昆明市]代签收(鸣翠园西区丰 ),感谢使用顺丰,期待再次为您服务（主单总件数：1件）\"},{\"time\":\"2019-11-29 13:37:14\",\"status\":\"[昆明市]快件交给严飞，正在派送途中（联系电话：15974746645）\"},{\"time\":\"2019-11-29 13:15:25\",\"status\":\"[昆明市]快件交给杨芳芳，正在派送途中（联系电话：18687021407）\"},{\"time\":\"2019-11-29 13:14:58\",\"status\":\"[昆明市]正在派送途中,请您准备签收(派件人:杨芳芳,电话:18687021407)\"},{\"time\":\"2019-11-29 13:11:55\",\"status\":\"[昆明市]快件到达 【昆明市北京路营业点】\"},{\"time\":\"2019-11-29 10:58:05\",\"status\":\"[昆明市]快件已发车\"},{\"time\":\"2019-11-29 10:57:59\",\"status\":\"[昆明市]快件在【昆明官渡集散中心】已装车,准备发往 【昆明市北京路营业点】\"},{\"time\":\"2019-11-29 08:21:55\",\"status\":\"[昆明市]快件到达 【昆明官渡集散中心】\"},{\"time\":\"2019-11-29 07:09:00\",\"status\":\"[昆明市]快件到达【昆明】，准备发往【昆明官渡集散中心】\"},{\"time\":\"2019-11-29 04:22:00\",\"status\":\"[杭州市]快件在【杭州飞往昆明航班上】已起飞\"},{\"time\":\"2019-11-28 22:56:21\",\"status\":\"[杭州市]快件在【全国航空枢纽（萧山】已装车,准备发往 【昆明官渡集散中心】\"},{\"time\":\"2019-11-28 19:48:38\",\"status\":\"[杭州市]快件到达 【全国航空枢纽（萧山】\"},{\"time\":\"2019-11-28 16:44:12\",\"status\":\"[舟山市]快件已发车\"},{\"time\":\"2019-11-28 16:02:46\",\"status\":\"[舟山市]快件在【舟山定海集散点】已装车,准备发往 【全国航空枢纽（萧山】\"},{\"time\":\"2019-11-28 15:48:13\",\"status\":\"[舟山市]快件到达 【舟山定海集散点】\"},{\"time\":\"2019-11-28 14:48:50\",\"status\":\"[舟山市]快件已发车\"},{\"time\":\"2019-11-28 14:44:17\",\"status\":\"[舟山市]快件在【舟山市普陀区水产城营业点】已装车,准备发往 【舟山定海集散点】\"},{\"time\":\"2019-11-28 14:34:14\",\"status\":\"[舟山市]顺丰速运 已收取快件\"},{\"time\":\"2019-11-28 14:31:15\",\"status\":\"[舟山市]顺丰速运 已收取快件\"}]', 1, 1, 1574995466, 1574995431, 1575017535, 0, '0');
-- INSERT INTO `hiolabs_order_express` VALUES (125, 1330, 5, '圆通速递', 'YTO', 'YT2880409397161', '', 0, 0, 0, 1575036264, 0, 4, '140天津');
-- INSERT INTO `hiolabs_order_express` VALUES (126, 1399, 1, '顺丰速运', 'SF', '123123', '', 0, 0, 0, 1681799932, 0, 0, '0');
-- INSERT INTO `hiolabs_order_express` VALUES (127, 1345, 1, '顺丰速运', 'SF', 'sda', '', 0, 0, 0, 1681897187, 0, 0, '0');
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_order_goods`;
CREATE TABLE `hiolabs_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_aka` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_specifition_name_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `goods_specifition_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `list_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除标志',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1577 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_order_goods
-- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_order_goods` VALUES (1472, 1325, 1009024, '日式和风懒人沙发', '懒人椅', 246, 1, 0.10, '棕色', '7', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- INSERT INTO `hiolabs_order_goods` VALUES (1473, 1326, 1009024, '日式和风懒人沙发', '懒人椅', 246, 1, 0.10, '棕色', '7', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- INSERT INTO `hiolabs_order_goods` VALUES (1474, 1326, 1009024, '日式和风懒人沙发', '懒人椅', 251, 1, 0.20, '蓝色', '77', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- INSERT INTO `hiolabs_order_goods` VALUES (1475, 1327, 1009024, '日式和风懒人沙发', '懒人椅', 246, 1, 0.10, '棕色', '7', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- INSERT INTO `hiolabs_order_goods` VALUES (1476, 1328, 1009024, '日式和风懒人沙发', '懒人椅', 246, 1, 0.01, '棕色', '7', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- INSERT INTO `hiolabs_order_goods` VALUES (1477, 1329, 1009024, '日式和风懒人沙发', '懒人椅', 246, 4, 0.01, '棕色', '7', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- INSERT INTO `hiolabs_order_goods` VALUES (1478, 1330, 1009024, '日式和风懒人沙发', '懒人椅', 246, 1, 0.01, '棕色', '7', 'http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png', 1029, 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_product
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_product`;
CREATE TABLE `hiolabs_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_specification_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_sn` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_number` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `retail_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本',
  `goods_weight` double(6,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `has_change` tinyint(1) NOT NULL DEFAULT '0',
  `goods_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -- ----------------------------
-- -- Records of hiolabs_product
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_product` VALUES (1, 1181000, '46', 'Y100300', 100, 999.00, 900.00, 4.00, 0, '母亲节礼物-舒适安睡组合1', 1, 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_region
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_region`;
CREATE TABLE `hiolabs_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '方位，根据这个定运费',
  `area_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '方位代码',
  `far_area` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '偏远地区',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `region_type` (`type`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4047 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_region
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_region` VALUES (1, 0, '中国', 0, 0, 10, 'QG', 0);
INSERT INTO `hiolabs_region` VALUES (2, 1, '北京市', 1, 0, 4, 'HB', 0);
INSERT INTO `hiolabs_region` VALUES (3, 1, '天津市', 1, 0, 4, 'HB', 0);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_search_history
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_search_history`;
CREATE TABLE `hiolabs_search_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `from` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '搜索来源，如PC、小程序、APP等',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '搜索时间',
  `user_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -- ----------------------------
-- -- Records of hiolabs_search_history
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_search_history` VALUES (6137, '日式', '', 1574995119, '1029');
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_settings
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_settings`;
CREATE TABLE `hiolabs_settings` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `autoDelivery` tinyint(1) NOT NULL DEFAULT '0',
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProvinceName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CityName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ExpAreaName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discovery_img_height` int(11) NOT NULL DEFAULT '0',
  `discovery_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `countdown` int(11) NOT NULL DEFAULT '0' COMMENT '10分钟倒计时',
  `reset` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- -- ----------------------------
-- -- Records of hiolabs_settings
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_settings` VALUES (1, 1, '海鸥实验室', '13599888877', '浙江省', '舟山市', '普陀区', '嘉绿景苑', 418, '', 1000265, 123, 12, 1362, 1681966809, 1);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_shipper
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_shipper`;
CREATE TABLE `hiolabs_shipper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递公司名称',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递公司代码',
  `sort_order` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `MonthCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CustomerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `hiolabs_shipper_id_uindex` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='快递公司';

-- -- ----------------------------
-- -- Records of hiolabs_shipper
-- -- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_shipper` VALUES (3, '中通快递', 'ZTO', 3, NULL, NULL, 0);
-- COMMIT;

-- ----------------------------
-- Table structure for hiolabs_show_settings
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_show_settings`;
CREATE TABLE `hiolabs_show_settings` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `banner` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '滚动banner',
  `channel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启menu,几个图标',
  `index_banner_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页的img图片是否显示',
  `notice` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hiolabs_show_settings
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_show_settings` VALUES (1, 1, 1, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_specification
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_specification`;
CREATE TABLE `hiolabs_specification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='规格表，存的是各种规格，如规格，重量，颜色，包装等';

-- ----------------------------
-- Records of hiolabs_specification
-- ----------------------------
-- BEGIN;
-- INSERT INTO `hiolabs_specification` VALUES (1, '规格', 1, '例如：5条装等');
-- INSERT INTO `hiolabs_specification` VALUES (2, '包装', 2, '');
-- INSERT INTO `hiolabs_specification` VALUES (3, '重量', 3, '');
-- COMMIT;


-- ----------------------------
-- Table structure for hiolabs_user_level
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_user_level`;
CREATE TABLE `hiolabs_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户等级名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '用户等级描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户等级表';

-- ----------------------------
-- Records of hiolabs_user_level
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_user_level` VALUES (1, '普通用户', '普通用户');
INSERT INTO `hiolabs_user_level` VALUES (2, '理事', '理事');
COMMIT;



-- ----------------------------
-- Table structure for hiolabs_user
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_user`;
CREATE TABLE `hiolabs_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` int(10) unsigned NOT NULL DEFAULT '0',
  `register_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `register_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `weixin_openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `name_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5590 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- ----------------------------
-- Table structure for hiolabs_director
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_director`;
CREATE TABLE `hiolabs_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '理事姓名',
  `position` varchar(60) NOT NULL DEFAULT '' COMMENT '职位',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `introduction` text COMMENT '介绍',
  `sort_order` int(11) DEFAULT '1000' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='理事信息表';

-- ----------------------------
-- Records of hiolabs_director
-- ----------------------------
BEGIN;
INSERT INTO `hiolabs_director` VALUES (1, '赵本', '国学理事长', 'http://yanxuan.nosdn.127.net/39695757fe860202cf2455614576adf4.jpg', '赵本，男，1980年出生，毕业于清华大学，现任赵本公司总经理。', 1000, 1, 1681903302);
INSERT INTO `hiolabs_director` VALUES (2, '钱往', '艾沃克公司总经理', 'http://yanxuan.nosdn.127.net/4973ea5a10f2c52ca2e2d416f1e7898d.jpg', '钱往，男，1958年出生，毕业于清华大学，现任艾沃克公司总经理。', 1000, 1, 1681903302);
INSERT INTO `hiolabs_director` VALUES (3, '孙行', 'mmsr董事', 'http://yanxuan.nosdn.127.net/22807c5a25e0d8d49fd46da143c1b23f.jpg', '孙行，男，1934年出生，毕业于清华大学，现任赵本公司总经理。', 1000, 1, 1681903302);
INSERT INTO `hiolabs_director` VALUES (4, '李梅', '劳工学校校长', 'http://yanxuan.nosdn.127.net/1ee354a7e3cf58a6317fced4107cd6a1.jpg', '李梅，男，1956年出生，毕业于清华大学，现任赵本公司总经理。', 1000, 1, 1681903302);
INSERT INTO `hiolabs_director` VALUES (5, '瑶五', '国学理事长', 'http://yanxuan.nosdn.127.net/8f4ed88b7550586de659a767bb409799.jpg', '瑶五，男，2000年出生，毕业于清华大学，现任赵本公司总经理。', 1000, 1, 1681903302);
COMMIT;

-- ----------------------------
-- Table structure for hiolabs_user_balance
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_user_balance`;
CREATE TABLE `hiolabs_user_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '用户ID',
  `user_level_id` int(11) NOT NULL DEFAULT '1' COMMENT '用户等级ID',
  `user_level_name` varchar(255) NOT NULL DEFAULT '普通用户' COMMENT '用户等级名称',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '储值余额',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '成为当前等级的时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_level_id` (`user_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户等级关系表';

-- ----------------------------
-- Table structure for hiolabs_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `hiolabs_balance_log`;
CREATE TABLE `hiolabs_balance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL COMMENT '用户ID',
  `order_id` mediumint(8) unsigned DEFAULT NULL COMMENT '订单ID',
  `amount` decimal(10,2) NOT NULL COMMENT '变动金额',
  `type` tinyint(3) NOT NULL COMMENT '类型：1充值，2消费，3退款',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注说明',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='储值余额变动记录表';

SET FOREIGN_KEY_CHECKS = 1;