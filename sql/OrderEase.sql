/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : takeaway

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 15/12/2024 21:14:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货地址',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (2, '上海西路121号', '张先生', '13988997788', 4);
INSERT INTO `address` VALUES (3, '南京西路1229号', '张先生', '13988779988', 4);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1697680497604-QQ截图20230330090301.png', 'ADMIN', '13899886688', 'admin@xm.com');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 'http://localhost:9090/files/1697682519971-微信截图_20231019102729.png', 8);
INSERT INTO `banner` VALUES (2, 'http://localhost:9090/files/1697771538925-微信截图_20231019102827.png', 6);

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '序号',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'logo',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简介',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业执照',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '审核状态',
  `time_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商家表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES (6, 'kawka', '123', '卡旺卡', 'http://localhost:9090/files/1697616929202-商家1.png', 'BUSINESS', '138778889988', '卡旺卡，奶茶真香', '安徽省合肥市政务区银泰4楼', 'http://localhost:9090/files/1697616984491-微信截图_20231018161554.png', '通过', '9:00-23:00', '奶茶饮品');
INSERT INTO `business` VALUES (7, 'rx', '123', '瑞西简餐', 'http://localhost:9090/files/1697702490266-微信截图_20231018160304.png', 'BUSINESS', '13877889977', '美味在此，速速来尝', '安徽合肥市', 'http://localhost:9090/files/1697702470254-微信截图_20231018161611.png', '通过', '9:00-22:00', '轻食简餐');
INSERT INTO `business` VALUES (8, 'hug', '123', '汉堡王', 'http://localhost:9090/files/1697774479049-微信截图_20231020115918.png', 'BUSINESS', '13966998866', '汉堡王，量大还好吃！', '北京东路110号', 'http://localhost:9090/files/1697774297044-微信截图_20231018161554.png', '通过', '9:00-21:00', '炸鸡汉堡');
INSERT INTO `business` VALUES (9, 'mw', '123', '美味小馆', 'http://localhost:9090/files/1697781509193-微信截图_20231018160234.png', 'BUSINESS', '13788668899', '美味小馆，你想吃的都在这里', '南京西路120号', 'http://localhost:9090/files/1697774544634-微信截图_20231018161554.png', '通过', '8:00-23:00', '特色美味');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '耶耶奶茶', 6);
INSERT INTO `category` VALUES (2, '暖心茶饮', 8);
INSERT INTO `category` VALUES (3, '芒果奶昔', 6);
INSERT INTO `category` VALUES (4, '轻食沙拉', 7);
INSERT INTO `category` VALUES (5, '汉堡/卷', 8);
INSERT INTO `category` VALUES (6, '醇香牛乳', 6);
INSERT INTO `category` VALUES (7, '家常小菜', 9);
INSERT INTO `category` VALUES (8, '地方特色', 9);
INSERT INTO `category` VALUES (9, '美味小食', 8);
INSERT INTO `category` VALUES (10, '带你吃鸡', 8);
INSERT INTO `category` VALUES (11, '三明治', 7);
INSERT INTO `category` VALUES (12, '荞麦面', 7);
INSERT INTO `category` VALUES (13, '香辣卤味', 9);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (16, 9, 4, '2024-09-27 22:59:59');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论',
  `star` double(10, 1) NULL DEFAULT 0.0 COMMENT '评分',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `business_id` int NULL DEFAULT NULL COMMENT '商家iD',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `order_id` int NULL DEFAULT NULL COMMENT '订单ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, '123', 5.0, 4, 9, NULL, 6, '2024-09-14 13:46:14');
INSERT INTO `comment` VALUES (3, '非常难吃', 1.0, 4, 9, NULL, 11, '2024-10-12 16:55:11');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原材料',
  `taste` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '口味',
  `specs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上架日期',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '上架' COMMENT '上架状态',
  `discount` double(11, 1) NULL DEFAULT 1.0 COMMENT '折扣',
  `business_id` int NULL DEFAULT NULL COMMENT '商家ID',
  `category_id` int NULL DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '香喷喷奶茶', 12.90, 'http://localhost:9090/files/1697679909984-微信截图_20231019092553.png', '香喷喷奶茶', '纯牛乳、芋圆、绿茶', '香浓', '1杯', '2023-10-19', '上架', 1.0, 6, 3);
INSERT INTO `goods` VALUES (2, '桂花芒果奶茶紫薯芋泥套餐', 13.90, 'http://localhost:9090/files/1697689063312-微信截图_20231019092635.png', '桂花奶茶，香浓可口', '桂花、纯牛奶、绿茶', '香浓', '1杯', '2023-10-19', '下架', 0.9, 6, 3);
INSERT INTO `goods` VALUES (3, '手做米布丁奶茶', 15.90, 'http://localhost:9090/files/1697689101909-微信截图_20231019092704.png', '微甜不腻，口感丰富', '铁观音、芋圆、纯牛乳', '微甜', '1杯', '2023-10-19', '上架', 1.0, 6, 1);
INSERT INTO `goods` VALUES (4, '鸭屎香手捣柠檬茶', 18.00, 'http://localhost:9090/files/1697689315459-微信截图_20231019092653.png', '悠然兰香，口味独特', '柠檬、鸭屎香茶', '鸭屎香', '1杯', '2023-10-19', '上架', 1.0, 6, 1);
INSERT INTO `goods` VALUES (5, '香辣炸鸡', 22.00, 'http://localhost:9090/files/1697970803413-QQ截图20231022181626.png', '炸鸡香酥脆', '鸡肉', '香辣味', '1个', '2023-10-20', '上架', 1.0, 8, 5);
INSERT INTO `goods` VALUES (6, '秘制炸鸡', 28.90, 'http://localhost:9090/files/1697969815254-QQ截图20231022181557.png', '炸鸡香酥脆', '鸡肉', '香辣味', '1个', '2023-10-20', '上架', 1.0, 8, 10);
INSERT INTO `goods` VALUES (7, '藤椒半边鸡', 19.80, 'http://localhost:9090/files/1697969790979-QQ截图20231022181541.png', '炸鸡香酥脆', '鸡肉', '香辣味', '1个', '2023-10-20', '上架', 1.0, 8, 10);
INSERT INTO `goods` VALUES (8, '新奥尔良鸡腿堡', 32.00, 'http://localhost:9090/files/1697969285794-微信截图_20231020115918.png', '汉堡香喷喷', '鸡肉、面包、蔬菜', '香辣味', '1个', '2023-10-20', '上架', 1.0, 8, 5);
INSERT INTO `goods` VALUES (9, '牛肉汉堡', 29.00, 'http://localhost:9090/files/1697969279767-微信截图_20231020120109.png', '汉堡香喷喷', '牛肉、面包、蔬菜', '孜然味', '1个', '2023-10-20', '上架', 0.9, 8, 5);
INSERT INTO `goods` VALUES (10, '鸡肉汉堡', 25.00, 'http://localhost:9090/files/1697969273672-QQ截图20231022180706.png', '汉堡香喷喷', '鸡肉、面包、蔬菜', '香辣味', '1个', '2023-10-20', '上架', 0.8, 8, 5);
INSERT INTO `goods` VALUES (13, '塔塔奶茶', 19.00, 'http://localhost:9090/files/1697969981602-QQ截图20231022181936.png', '暖暖的很贴心', '奶、茶', '香浓', '1杯', '2023-10-22', '上架', 0.7, 8, 2);
INSERT INTO `goods` VALUES (14, '嘻嘻奶茶', 18.00, 'http://localhost:9090/files/1697970584516-QQ截图20231022182940.png', '奶茶暖心也暖胃', '奶、茶', '香浓', '1杯', '2023-10-22', '上架', 0.6, 8, 2);
INSERT INTO `goods` VALUES (15, '美味鸡米花', 19.00, 'http://localhost:9090/files/1697970878280-QQ截图20231022183405.png', '美味小食，好吃停不下来', '鸡肉', '香辣味', '1份', '2023-10-22', '上架', 0.9, 8, 9);
INSERT INTO `goods` VALUES (16, '美味鸡块', 19.00, 'http://localhost:9090/files/1697970939172-QQ截图20231022183424.png', '酥脆可口，一口一个', '鸡肉', '甜辣味', '1份', '2023-10-22', '上架', 0.8, 8, 9);
INSERT INTO `goods` VALUES (17, '虾仁营养荞麦面', 24.00, 'http://localhost:9090/files/1697971252369-QQ截图20231022183935.png', '低卡低脂肪，健身搭配', '荞麦面', '清淡', '1碗', '2023-10-22', '上架', 0.8, 7, 12);
INSERT INTO `goods` VALUES (18, '酱香荞麦面', 25.00, 'http://localhost:9090/files/1697971308832-QQ截图20231022184014.png', '低卡低脂肪，健身搭配', '荞麦面', '清淡', '1碗', '2023-10-22', '上架', 0.8, 7, 12);
INSERT INTO `goods` VALUES (19, '鸡肉低卡荞麦面', 22.98, 'http://localhost:9090/files/1697971252369-QQ截图20231022183935.png', '低卡低脂肪，健身搭配', '荞麦面', '清淡', '1碗', '2023-10-22', '上架', 0.8, 7, 12);
INSERT INTO `goods` VALUES (20, '美味三明治', 16.00, 'http://localhost:9090/files/1697971512706-QQ截图20231022184312.png', '低卡三明治，营养又美味', '面包，鸡蛋，蔬菜', '香浓', '1份', '2023-10-22', '上架', 0.8, 7, 11);
INSERT INTO `goods` VALUES (21, '怕卡尼卡三明治', 19.00, 'http://localhost:9090/files/1697971421059-QQ截图20231022184302.png', '低卡三明治，营养又美味', '面包，鸡蛋，蔬菜', '香浓', '1份', '2023-10-22', '上架', 0.8, 7, 11);
INSERT INTO `goods` VALUES (22, '甜叔叔三明治', 19.00, 'http://localhost:9090/files/1697971507385-QQ截图20231022184324.png', '低卡三明治，营养又美味', '面包，鸡蛋，蔬菜', '香浓', '1份', '2023-10-22', '上架', 0.8, 7, 11);
INSERT INTO `goods` VALUES (23, '乌梅子酱沙拉', 19.60, 'http://localhost:9090/files/1697971696323-QQ截图20231022184546.png', '美味沙拉，健康营养', '蔬菜', '清淡', '1份', '2023-10-22', '上架', 0.9, 7, 4);
INSERT INTO `goods` VALUES (24, '美味沙拉', 19.60, 'http://localhost:9090/files/1697971598883-QQ截图20231022184559.png', '美味沙拉，健康营养', '蔬菜', '清淡', '1份', '2023-10-22', '上架', 0.9, 7, 4);
INSERT INTO `goods` VALUES (25, '卡卡尼沙拉', 18.00, 'http://localhost:9090/files/1697971691411-QQ截图20231022184629.png', '美味沙拉，健康营养', '蔬菜', '清淡', '1份', '2023-10-22', '上架', 0.9, 7, 4);
INSERT INTO `goods` VALUES (26, '家常美味小炒', 22.00, 'http://localhost:9090/files/1697971968567-QQ截图20231022185142.png', '家常美味，特别下饭', '蔬菜', '香辣', '1份', '2023-10-22', '上架', 0.9, 9, 7);
INSERT INTO `goods` VALUES (27, '麻婆豆腐', 22.00, 'http://localhost:9090/files/1697971963819-QQ截图20231022185125.png', '家常美味，特别下饭', '蔬菜', '香辣', '1份', '2023-10-22', '上架', 0.9, 9, 7);
INSERT INTO `goods` VALUES (28, '清炒木耳山药', 22.00, 'http://localhost:9090/files/1697971811920-QQ截图20231022184952.png', '家常美味，特别下饭', '蔬菜', '香辣', '1份', '2023-10-22', '上架', 0.9, 9, 7);
INSERT INTO `goods` VALUES (29, '特色卤味好吃不贵', 22.00, 'http://localhost:9090/files/1697972242355-QQ截图20231022185416.png', '家常美味，特别下饭', '蔬菜', '香辣', '1份', '2023-10-22', '上架', 0.9, 9, 13);
INSERT INTO `goods` VALUES (30, '原味特色卤味', 22.00, 'http://localhost:9090/files/1697972203437-QQ截图20231022185405.png', '家常美味，特别下饭', '蔬菜', '香辣', '1份', '2023-10-22', '上架', 0.9, 9, 13);
INSERT INTO `goods` VALUES (31, '家常特色卤味', 19.00, 'http://localhost:9090/files/1697972179307-QQ截图20231022185352.png', '特色卤味，特别下饭', '卤味', '香辣', '1份', '2023-10-22', '上架', 0.9, 9, 13);
INSERT INTO `goods` VALUES (32, '特色小吃3', 22.00, 'http://localhost:9090/files/1697972400489-QQ截图20231022185820.png', '爽口小吃', '小麦面', '香浓', '1份', '2023-10-22', '上架', 0.7, 9, 8);
INSERT INTO `goods` VALUES (33, '特色小吃2', 22.00, 'http://localhost:9090/files/1697972310756-QQ截图20231022185754.png', '爽口小吃', '小麦面', '香浓', '1份', '2023-10-22', '上架', 0.7, 9, 8);
INSERT INTO `goods` VALUES (34, '特色小吃1', 22.00, 'http://localhost:9090/files/1697972394693-QQ截图20231022185805.png', '爽口小吃', '小麦面', '香浓', '1份', '2023-10-22', '上架', 0.7, 9, 8);
INSERT INTO `goods` VALUES (35, '芋泥波波奶茶', 18.00, 'http://localhost:9090/files/1697972529472-QQ截图20231022190130.png', '香喷喷奶茶', '纯牛乳、芋圆、绿茶', '香浓', '1杯', '2023-10-19', '上架', 0.8, 6, 6);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '秋天的第一杯奶茶，一起来分享吧', '秋天的第一杯奶茶，一起来分享吧', '2023-10-20', 'admin');
INSERT INTO `notice` VALUES (2, '哇塞！汉堡分量限时5折起，快来抢购吧！', '哇塞！汉堡分量限时5折起，快来抢购吧！', '2023-10-20', 'admin');
INSERT INTO `notice` VALUES (3, '今天天气很不错，来杯清爽的茶饮吧！', '今天天气很不错，来杯清爽的茶饮吧！', '2023-10-20', 'admin');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下单时间',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单状态',
  `business_id` int NULL DEFAULT NULL COMMENT '接单商家ID',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '送货地址',
  `user_id` int NULL DEFAULT NULL COMMENT '下单人ID',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总价',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `actual` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付款',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缩略图',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (6, '1833732237946597376', '2024-09-11 13:00:08', '支付宝', NULL, '已完成', 9, '张先生', '13988779988', '南京西路1229号', 4, 63.00, 6.30, 56.70, '', 'http://localhost:9090/files/1697972242355-QQ截图20231022185416.png', '特色卤味好吃不贵等3件商品');
INSERT INTO `orders` VALUES (9, '1834801628146577408', '2024-09-14 11:49:31', '支付宝', NULL, '待发货', 6, '张先生', '13988779988', '南京西路1229号', 4, 13.90, 1.39, 12.51, '', 'http://localhost:9090/files/1697689063312-微信截图_20231019092635.png', '桂花芒果奶茶紫薯芋泥套餐等1件商品');
INSERT INTO `orders` VALUES (10, '1834801720547094528', '2024-09-14 11:49:53', '支付宝', NULL, '已退款', 8, '张先生', '13988997788', '上海西路121号', 4, 25.00, 5.00, 20.00, '', 'http://localhost:9090/files/1697969273672-QQ截图20231022180706.png', '鸡肉汉堡等1件商品');
INSERT INTO `orders` VALUES (11, '1845018564981747712', '2024-10-12 16:27:58', '支付宝', NULL, '已完成', 9, '张先生', '13988779988', '南京西路1229号', 4, 19.00, 1.90, 17.10, '', 'http://localhost:9090/files/1697972179307-QQ截图20231022185352.png', '家常特色卤味等1件商品');

-- ----------------------------
-- Table structure for orders_item
-- ----------------------------
DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NULL DEFAULT NULL COMMENT '订单ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `num` int NULL DEFAULT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders_item
-- ----------------------------
INSERT INTO `orders_item` VALUES (1, 5, '特色小吃3', 'http://localhost:9090/files/1697972400489-QQ截图20231022185820.png', 15.40, 1);
INSERT INTO `orders_item` VALUES (2, 6, '特色卤味好吃不贵', 'http://localhost:9090/files/1697972242355-QQ截图20231022185416.png', 19.80, 1);
INSERT INTO `orders_item` VALUES (3, 6, '原味特色卤味', 'http://localhost:9090/files/1697972203437-QQ截图20231022185405.png', 19.80, 1);
INSERT INTO `orders_item` VALUES (4, 6, '家常特色卤味', 'http://localhost:9090/files/1697972179307-QQ截图20231022185352.png', 17.10, 1);
INSERT INTO `orders_item` VALUES (8, 9, '桂花芒果奶茶紫薯芋泥套餐', 'http://localhost:9090/files/1697689063312-微信截图_20231019092635.png', 12.51, 1);
INSERT INTO `orders_item` VALUES (9, 10, '鸡肉汉堡', 'http://localhost:9090/files/1697969273672-QQ截图20231022180706.png', 20.00, 1);
INSERT INTO `orders_item` VALUES (10, 11, '家常特色卤味', 'http://localhost:9090/files/1697972179307-QQ截图20231022185352.png', 17.10, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'zhang', '123', '张三', 'http://localhost:9090/files/1697621448622-微信截图_20231018172452.png', 'USER', '男', '13788668899');
INSERT INTO `user` VALUES (4, 'aaa', '123', '测试', 'http://localhost:9090/files/1728451620304-微信图片_20241009132639.jpg', 'USER', '男', '13788776677');

SET FOREIGN_KEY_CHECKS = 1;
