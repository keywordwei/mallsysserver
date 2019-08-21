-- --------------------------------------------------------
-- 主机:                           106.14.121.224
-- 服务器版本:                        5.7.20 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 mallmanasys 的数据库结构
CREATE DATABASE IF NOT EXISTS `mallmanasys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `mallmanasys`;

-- 导出  表 mallmanasys.prosecondarycategory 结构
CREATE TABLE IF NOT EXISTS `prosecondarycategory` (
  `secondaryId` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) NOT NULL,
  `secondaryCategoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`secondaryId`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  mallmanasys.prosecondarycategory 的数据：~90 rows (大约)
/*!40000 ALTER TABLE `prosecondarycategory` DISABLE KEYS */;
INSERT INTO `prosecondarycategory` (`secondaryId`, `category_id`, `secondaryCategoryName`) VALUES
	(25, 44, 'T恤'),
	(26, 44, '牛仔裤'),
	(27, 44, '休闲裤'),
	(28, 44, '衬衫'),
	(29, 44, '衫短裤'),
	(30, 44, 'POLO衫'),
	(31, 44, '羽绒服'),
	(32, 44, '棉服'),
	(33, 44, '西服'),
	(34, 44, '中山装'),
	(35, 44, '潮牌唐装'),
	(36, 44, '运动裤'),
	(37, 44, '背心羊毛衫'),
	(38, 44, '西裤'),
	(39, 45, '连衣裙'),
	(40, 45, '半身裙'),
	(41, 45, 'T恤'),
	(42, 45, '衬衫'),
	(43, 45, '雪纺衫'),
	(44, 45, '短外套'),
	(45, 45, '卫衣'),
	(46, 45, '针织衫'),
	(47, 45, '小西装'),
	(48, 45, '风衣'),
	(49, 45, '休闲裤'),
	(50, 45, '牛仔裤'),
	(51, 45, '短裤'),
	(52, 45, '羽绒服'),
	(53, 46, '手机'),
	(54, 46, '电脑'),
	(55, 46, '数码相机'),
	(56, 46, '手机壳'),
	(57, 46, '手机存储卡'),
	(58, 46, '数据线'),
	(59, 46, '充电器'),
	(60, 46, '耳机'),
	(61, 46, '手机电池'),
	(62, 46, '蓝牙耳机'),
	(63, 46, '手机支架'),
	(64, 46, '拍照配件'),
	(65, 47, '小说'),
	(66, 47, '散文'),
	(67, 47, '青春文学'),
	(68, 47, '传记'),
	(69, 47, '动漫'),
	(70, 47, '悬疑推理'),
	(71, 47, '科幻武侠'),
	(72, 47, '世界名著'),
	(73, 48, '插座'),
	(74, 48, '保温杯'),
	(75, 48, '炒锅'),
	(76, 48, '台灯'),
	(77, 48, '电视'),
	(78, 48, '冰箱'),
	(79, 49, '跑步机'),
	(80, 49, '动感单车'),
	(81, 49, '健身车'),
	(82, 49, '收腹机'),
	(83, 49, '瑜伽用品'),
	(84, 49, '哑铃'),
	(85, 49, '仰卧板'),
	(86, 49, '踏步机'),
	(87, 49, '甩脂机'),
	(88, 49, '倒立机'),
	(89, 50, '钢琴'),
	(90, 50, '电钢琴'),
	(91, 50, '电子琴'),
	(92, 50, '吉他'),
	(93, 50, '尤克里里'),
	(94, 50, '打击乐器'),
	(95, 50, '西洋管弦'),
	(96, 50, '民族乐器'),
	(97, 50, '乐器配件'),
	(98, 52, '礼盒'),
	(99, 52, '美白防晒'),
	(100, 52, '面膜'),
	(101, 52, '洁面爽肤水'),
	(102, 52, '精华眼霜乳液'),
	(103, 52, '面霜卸妆'),
	(104, 52, '唇膏'),
	(105, 53, '箱包'),
	(106, 53, '钱包'),
	(107, 53, '眼镜框'),
	(108, 53, '太阳镜'),
	(109, 53, '饰品配件'),
	(110, 53, '机器人'),
	(111, 54, '蜂蜜'),
	(112, 53, '其他'),
	(117, 54, '水果'),
	(118, 47, '编程');
/*!40000 ALTER TABLE `prosecondarycategory` ENABLE KEYS */;

-- 导出  表 mallmanasys.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `authName` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `authTime` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menus` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  mallmanasys.role 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`roleId`, `roleName`, `createTime`, `authName`, `authTime`, `menus`) VALUES
	(37, '超级管理员', '2019-08-17 16:51:32', 'root', '2019-08-17 16:52:35', 'all#/home#/products#/products/category#/products/product#/user#/role#/charts#/charts/bar#/charts/line#/charts/pie#/address'),
	(38, '前端攻城狮', '2019-08-17 16:53:30', 'root', '2019-08-17 16:54:56', '/home#/products#/products/category#/products/product#/charts#/charts/bar#/charts/line#/charts/pie#/address'),
	(39, '后台开发', '2019-08-17 16:53:56', 'root', '2019-08-17 16:57:11', '/home#/products#/products/category#/products/product#/charts#/charts/bar#/charts/line#/charts/pie#/address'),
	(40, '图形算法', '2019-08-17 16:54:05', 'root', '2019-08-17 16:57:20', '/home#/products#/products/category#/products/product#/charts#/charts/bar#/charts/line#/charts/pie#/address'),
	(41, '算法攻城狮', '2019-08-17 16:54:23', 'root', '2019-08-18 02:21:38', '/home#/products#/products/category#/products/product#/charts#/charts/bar#/charts/line#/charts/pie#/address'),
	(47, '游客', '2019-08-17 17:18:24', 'root', '2019-08-17 17:18:33', '/home'),
	(48, 'CTO', '2019-08-17 17:18:55', 'root', '2019-08-17 17:19:02', 'all#/home#/products#/products/category#/products/product#/user#/role#/charts#/charts/bar#/charts/line#/charts/pie#/address');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 导出  表 mallmanasys.staff 结构
CREATE TABLE IF NOT EXISTS `staff` (
  `staffId` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名唯一',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '电话号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '邮箱',
  `roleId` int(11) DEFAULT '0' COMMENT '用户权限',
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '注册时间',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '头像',
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  mallmanasys.staff 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`staffId`, `username`, `password`, `phone`, `email`, `roleId`, `createTime`, `avatar`) VALUES
	(15, 'root', '63a9f0ea7bb98050796b649e85481845', '13888888888', '2639384916@qq.com', 37, '2019-08-17 16:08:04', 'djwater-1565865953418-1566126743778.png'),
	(16, 'weiqin', '5e543256c480ac577d30f76f9120eb74', '13888888887', '2638476@qq.com', 38, '2019-08-17 16:10:33', 'bg-1565869303504.jpg'),
	(20, '魏琴', '1d959e9061737b2e01fd1057c504617b', '13878888888', '2638476@qq.com', 39, '2019-08-17 16:33:05', 'bg-1565869303504.jpg'),
	(22, 'weiq', '81dc9bdb52d04dc20036dbd8313ed055', '13886888887', '123@12.com', 40, '2019-08-17 16:39:52', 'bg-1565869303504.jpg'),
	(23, 'qwqqq', '5e543256c480ac577d30f76f9120eb74', '13882888886', '2638476@163.com', 47, '2019-08-18 01:14:09', 'bg-1565869303504.jpg'),
	(24, 'youke', '89a91084f8aca0a0f373eb331fdece44', '13388888887', '123@sicnu.edu', 47, '2019-08-18 02:11:54', 'bg-1565869303504.jpg');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- 导出  表 mallmanasys.t_category 结构
CREATE TABLE IF NOT EXISTS `t_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  mallmanasys.t_category 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `t_category` DISABLE KEYS */;
INSERT INTO `t_category` (`category_id`, `category_name`) VALUES
	(44, '男装'),
	(45, '女装'),
	(46, '数码'),
	(47, '书籍教材'),
	(48, '电器'),
	(49, '体育健身'),
	(50, '乐器'),
	(52, '美妆'),
	(53, '其他'),
	(54, '食品');
/*!40000 ALTER TABLE `t_category` ENABLE KEYS */;

-- 导出  表 mallmanasys.t_sale_goods 结构
CREATE TABLE IF NOT EXISTS `t_sale_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_img` mediumtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '商品图片',
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品标题',
  `goods_details` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品详情',
  `goods_price` double(10,2) NOT NULL COMMENT '商品的价格',
  `goods_contact_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品联系电话',
  `goods_category_id` int(11) NOT NULL COMMENT '商品种类id',
  `goods_contact_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品联系QQ',
  `goods_publish_time` int(11) NOT NULL COMMENT '商品发布时间',
  `goods_by_user_id` int(11) NOT NULL COMMENT '商品发布人的id',
  `goods_hot` int(11) NOT NULL COMMENT '商品点击量',
  `goods_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品分类名称',
  `goods_status` int(11) DEFAULT NULL COMMENT '商品有效时间',
  `goods_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品描述',
  `goods_first_categoryName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  mallmanasys.t_sale_goods 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `t_sale_goods` DISABLE KEYS */;
INSERT INTO `t_sale_goods` (`goods_id`, `goods_img`, `goods_title`, `goods_details`, `goods_price`, `goods_contact_phone`, `goods_category_id`, `goods_contact_qq`, `goods_publish_time`, `goods_by_user_id`, `goods_hot`, `goods_category_name`, `goods_status`, `goods_description`, `goods_first_categoryName`) VALUES
	(21, 'djmaviv2-1566128553519.png#djmoutain-1566128591592.png#djwater-1566128627649.png', '“御”Mavic 2 专业版 哈苏相机', '<p></p><p></p><div class="media-wrap video-wrap"><video controls="" class="media-wrap video-wrap" poster="http://localhost:7777/upload/djimavic-1565866009039.png" src="http://106.14.121.224:7777/upload/djimavic-1565866002208.mp4"></video></div><p></p><p></p><p></p><p></p>', 10888.00, '13882968799', 46, '2639384810', 20190816, 16, 96, '数码相机', 0, '高瞻远瞩，以小见大', '数码'),
	(22, 'djiroboat-1566129607879.png#djirobomaster-1566129685840.png', '机甲大师 RoboMaster S1', '<p></p><div class="media-wrap video-wrap"><video controls="" class="media-wrap video-wrap" poster="http://106.14.121.224:7777/upload/djimavicair-1565866779818.png" src="http://106.14.121.224:7777/upload/djimavicair-1565866777979.mp4"></video></div><p></p>', 3499.00, '13877778888', 53, '25498699', 20190816, 16, 48, '机器人', 0, '寓教于乐，开启编程、机器人控制及人工智能相关知识的学习之旅', '其他'),
	(23, 'djwater-1565865953418.png', '灵眸 Osmo 口袋云台相机', '<p></p><div class="media-wrap video-wrap"><video controls="" class="media-wrap video-wrap" poster="http://106.14.121.224:7777/upload/djshot-1565867227025.png" src="http://106.14.121.224:7777/upload/djshot-1565867226072.mp4"></video></div><p></p>', 2499.00, '13772968794', 46, '3689456', 20190816, 16, 7, '数码相机', 0, 'DJI 大疆迄今为止最小的三轴机械增稳云台相机', '数码'),
	(24, 'mpen1-1565867856520.png#huaweimate30-1565867862718.png#pc-kv-v3-1565867868542.png', 'HUAWEI Mate 20 X (5G)', '<p></p><div class="media-wrap video-wrap"><video controls="" class="media-wrap video-wrap" poster="http://106.14.121.224:7777/upload/huaweiadvitisement-1565867903843.png" src="http://106.14.121.224:7777/upload/huaweiadvitisement-1565867903473.mp4"></video></div><p></p>', 6666.00, '13666666798', 46, '36487565', 20190816, 16, 17, '手机', 0, '5G旗舰芯片', '数码'),
	(25, '1-1565868963502.png#3-1565868966574.png#4-1565868970045.png#5-1565868972376.png#2-1565868975612.png', '蜂蜜', '<p style="text-align:center;"><span style="background-color:#000000"><span style="font-size:24px"><span style="color:#c0392b">好吃又好看！</span></span></span></p>', 66.00, '13555987979', 54, '9874564543', 20190816, 16, 0, '蜂蜜', 0, '甜不腻', '食品'),
	(26, 'bg-1565869303504.jpg#otherschool-1565869324492.jpg#other-1565869328841.jpg', 'nature', '<p style="text-align:center;">😉😉😉😉😉😉😉</p>', 0.00, '13489788789', 53, '798645124', 20190816, 16, 12, '饰品配件', 0, 'nature', '其他'),
	(27, 'O1CN011O4ekp8NF4bP8P2_!!3149921652 (1)-1565922181420.jpg#O1CN011O4ekpZ58GSFMVl_!!3149921652-1565922184342.jpg#背带裤-1565922188935.jpg#O1CN011O4ekosI5j4ieMp_!!3149921652-1565922192640.jpg', '工装感背带裤', '<p style="text-align:center;"><span style="font-size:18px"><span style="background-color:#110202"><span style="color:#ce2222">工装棉布的质感 </span></span></span></p><p style="text-align:center;"><span style="font-size:18px"><span style="background-color:#110202"><span style="color:#ce2222">想起童年时期的马里奥材质实在耐穿耐洗</span></span></span></p><p style="text-align:center;"><span style="font-size:18px"><span style="background-color:#110202"><span style="color:#ce2222"> 属于懒人的专属单品搭配衬衫T恤卫衣 </span></span></span></p><p style="text-align:center;"><span style="font-size:18px"><span style="background-color:#110202"><span style="color:#ce2222">都显得生动活泼宽松的版型 显瘦 包容性强背带裤给人的感觉总是透着洒脱与</span></span></span></p><p style="text-align:center;"><span style="font-size:18px"><span style="background-color:#110202"><span style="color:#ce2222">深色可能会存在掉色，但是颜色不会退浅</span></span></span></p><p style="text-align:center;">👏👏👏👏👏😎😎😎😎😎😎</p>', 98.00, '19879451227', 45, '5653299', 20190816, 16, 12, '休闲裤', 0, '日系宽松少女马里奥连体裤 设计感大口袋工装感背带裤 春秋款 女', '女装'),
	(28, 'TB2gtFfFeuSBuNjSsziXXbq8pXa_!!692056538-1565922718554.jpg#TB2yG_5E7KWBuNjy1zjXXcOypXa_!!692056538-1565922721192.jpg#TB26.z9xviSBuNkSnhJXXbDcpXa_!!692056538-1565922725430.jpg#O1CN01wUW4J81yAS18gHz9i_!!0-item_pic-1565922729563.jpg', ' OL气质风黑白两色裙子', '<p style="text-align:left;"><em><span style="color:#cdf01b">这是今年夏季自制的zui后一个款，那jue对是zhong磅推出，chao级有质感；</span></em>🤣🤣🙌</p><p style="text-align:left;"><em><span style="color:#cdf01b">对于质量大可放心，面料用的是聚酯纤维合成的西装面料，比起普通的雪纺面料厚一点点，</span></em></p><p style="text-align:left;"><em><span style="color:#cdf01b">如果面料太薄衣服没有型哦；</span></em>👏</p><p style="text-align:left;"><em><span style="color:#cdf01b">版型是通过三条裙子结合而成，把优点结合，尽量呈现一条比较简洁大气的连衣裙；</span></em></p>', 139.00, '13282968876', 45, '2638794', 20190816, 16, 0, '连衣裙', 0, 'UPP2019夏自制西装领超级显瘦连衣裙 OL气质风黑白两色裙子', '女装'),
	(30, 'O1CN01iSuq2T24ubcpowpjm_!!2751617451.jpg_60x60q90-1566029961640.jpg#O1CN01svDCq524ubcvgeN46_!!0-item_pic.jpg_60x60q90-1566029964369.jpg#O1CN014HfZim24ubcesZGc6_!!2751617451.jpg_60x60q90-1566029967854.jpg#O1CN019NwDHE24ubceboTv2_!!2751617451.jpg_60x60q90-1566029970193.jpg', '正宗无锡阳山水蜜桃新鲜水果', '<p></p><p></p><div class="media-wrap image-wrap align-center" style="text-align:center"><img size="1" _root="[object Object]" src="http://106.14.121.224:7777/upload/O1CN014HfZim24ubcesZGc6_!!2751617451.jpg_60x60q90-1566030051810.jpg" width="100px" height="100px" style="width:100px;height:100px"/></div><p></p><p></p>', 188.00, '13788888888', 54, '543543', 20190817, 16, 0, '水果', 0, '15个包邮整箱应当季时令5斤左右', '食品'),
	(31, 'TB2E0kewBjTBKNjSZFDXXbVgVXa_!!2406931838-0-item_pic.jpg_430x430q90-1566031616003.jpg#TB2Sgoxq3MPMeJjy1XdXXasrXXa_!!2406931838.jpg_430x430q90-1566031619988.jpg#TB2tBvBmWmgSKJjSsplXXaICpXa_!!2406931838.jpg_60x60q90-1566031624347.jpg', '你不知道的JavaScript', '<p><span style="color:#656565"><span style="font-size:14px"><span style="background-color:#ffffff">“你不知道的JavaScript”系列就是要让不求甚解的JavaScript开发者迎难而上，深入语言内部，弄清楚JavaScript每一个零部件的用途。本书介绍了该系列的两个主题：“类型和语法”以及“异步和性能”。掌握了这些知识之后，无论什么技术、框架和流行词语，你都能轻松理解。</span></span></span></p>', 138.00, '13666879978', 47, '78948946', 20190817, 15, 0, '编程', 0, 'JavaScript并发编程', '书籍教材');
/*!40000 ALTER TABLE `t_sale_goods` ENABLE KEYS */;

-- 导出  表 mallmanasys.t_user 结构
CREATE TABLE IF NOT EXISTS `t_user` (
  `user_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `user_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户邮箱',
  `user_status` int(255) NOT NULL DEFAULT '0' COMMENT '用户是否认证的状态',
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  mallmanasys.t_user 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`user_id`, `user_name`, `user_pwd`, `user_email`, `user_status`, `user_img`) VALUES
	(15, 'root', 'root', '2639384916@qq.com', 0, 'djwater-1565865953418-1566126743778.png'),
	(16, 'weiqin', '5e543256c480ac577d30f76f9120eb74', '2638476@qq.com', 0, 'bg-1565869303504.jpg'),
	(20, '魏琴', 'weiqin', '2638476@qq.com', 0, 'bg-1565869303504.jpg'),
	(22, 'weiq', '81dc9bdb52d04dc20036dbd8313ed055', '123@12.com', 0, 'bg-1565869303504.jpg'),
	(23, 'qwqqq', '5e543256c480ac577d30f76f9120eb74', '2638476@163.com', 0, 'bg-1565869303504.jpg'),
	(24, 'youke', 'youke', '123@sicnu.edu', 0, 'bg-1565869303504.jpg');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
