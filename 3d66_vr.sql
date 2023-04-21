/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.17
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 192.168.1.17:3306
 Source Schema         : 3d66_vr

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 21/04/2023 18:40:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ll_offline_vr
-- ----------------------------
DROP TABLE IF EXISTS `ll_offline_vr`;
CREATE TABLE `ll_offline_vr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `vr_id` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `offline_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '0 未完成 1 已完成 2 离线包已删除',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_offline_vr_log
-- ----------------------------
DROP TABLE IF EXISTS `ll_offline_vr_log`;
CREATE TABLE `ll_offline_vr_log`  (
  `id` int(11) NOT NULL,
  `offline_id` int(11) NULL DEFAULT NULL COMMENT '离线记录id',
  `vr_img_id` int(11) NULL DEFAULT NULL COMMENT '离线图片id',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '0 未同步到本地 1 已同步到本地',
  `vr_id` int(11) NULL DEFAULT NULL COMMENT 'vr id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr`;
CREATE TABLE `ll_vr`  (
  `vr_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `vr_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `vr_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作品名',
  `vr_class_id` int(10) NOT NULL DEFAULT 0 COMMENT '分类id',
  `vr_explain` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作品说明',
  `vr_music_id` int(10) NOT NULL DEFAULT 0 COMMENT '音乐id',
  `vr_show_info_id` int(10) NOT NULL DEFAULT 0 COMMENT '作者信息id',
  `author_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者名称',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `wechat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二维码',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区',
  `author_info` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `is_hide` tinyint(1) NOT NULL DEFAULT 1 COMMENT '隐藏(0=>否 1=>是)',
  `open_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '公开审核状态(0=>待审核 1=>审核通过 2=>审核不通过，3=>审核中)',
  `is_company_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '企业库展示(0=>否 1=>是)',
  `is_remove_watermark` tinyint(1) NOT NULL DEFAULT 0 COMMENT '去除水印(0=>否 1=>是)',
  `is_encrypt` tinyint(1) NOT NULL DEFAULT 0 COMMENT '加密(0=>否 1=>是)',
  `encrypt_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加密密码',
  `top_ad` varchar(501) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告文案',
  `share_end_time` int(10) NOT NULL DEFAULT 0 COMMENT '分享结束时间',
  `vr_views` int(10) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `limit_time_views` int(10) NOT NULL DEFAULT 0 COMMENT '限时浏览数',
  `is_star_open` tinyint(1) NOT NULL DEFAULT 0 COMMENT '星星开场(0=>否 1=>是)',
  `is_show_views` tinyint(1) NOT NULL DEFAULT 0 COMMENT '浏览量展示(0=>否 1=>是)',
  `is_autorotation` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动旋转(0=>否 1=>是)',
  `is_scene_list` tinyint(1) NOT NULL DEFAULT 0 COMMENT '场景列表(0=>否 1=>是)',
  `map_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '户型图类型(0=>户型图 1=>沙盘 2=>俯视图 3=>平面图)',
  `map_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '户型图',
  `map_img_size_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '户型图尺寸类型(0=>高度大 1=>宽度大)',
  `ground_mask_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地面遮罩图',
  `img_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '全景合成状态：0-合成中、1-合成成功、2-合成失败',
  `is_index_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页列表显示',
  `is_index_vr_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首页全景显示(唯一)',
  `is_info_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示联系方式(0=>否 1=>是)',
  `is_off` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否下架成功(1:下架了 0:还没有下架)',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `off_time` int(10) NOT NULL DEFAULT 0 COMMENT '下架时间',
  `refused_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开放审核不通过原因',
  `off_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下架原因',
  `upload_channel` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上传渠道：0-web、1-溜云库',
  `upload_source` tinyint(1) NULL DEFAULT 0 COMMENT '上传来源：0-个人中心、1-溜云库本地管理、2-溜云库工具箱',
  `studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '企业id',
  `is_read` int(10) NOT NULL DEFAULT 0 COMMENT '合成状态是否已读（0未读，1已读）',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '分组id',
  `lng` float(10, 5) NOT NULL DEFAULT 0.00000 COMMENT '经纬度经度',
  `lat` float(10, 5) NOT NULL DEFAULT 0.00000 COMMENT '经纬度纬度',
  `show_map` tinyint(1) NULL DEFAULT 0 COMMENT '是否显示地图',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否软删，1是0否',
  `to_studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '对方企业id',
  `language` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1中文，2英文，0跟随浏览器语言',
  `is_appoin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否预约，0不预约，1预约',
  `is_vr_img` tinyint(1) NULL DEFAULT 0 COMMENT '0 非用户自定义 1 用户自定义',
  `is_offline_new` tinyint(1) NULL DEFAULT 1 COMMENT '0 否 1 是',
  `is_vr_eye` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启vr眼镜 0 开启 1 关闭',
  `is_gyro` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启手机陀螺仪 0 开始 1关闭',
  PRIMARY KEY (`vr_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_addTime`(`add_time`) USING BTREE,
  INDEX `idx_studioId`(`studio_id`) USING BTREE,
  INDEX `idx_classId_openStatus`(`vr_class_id`, `open_status`) USING BTREE,
  INDEX `idx_musicId`(`vr_music_id`) USING BTREE,
  INDEX `idx_openstatus_isdelete_ishide_isinfoshow_isoff`(`open_status`, `is_delete`, `is_hide`, `is_info_show`, `is_off`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2365807 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_appoin
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_appoin`;
CREATE TABLE `ll_vr_appoin`  (
  `appoin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `vr_id` int(11) NOT NULL DEFAULT 0 COMMENT 'vr_id',
  `appoin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预约人姓名',
  `appoin_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预约人联系电话',
  `appoin_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '需求描述',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未读，1已读',
  PRIMARY KEY (`appoin_id`) USING BTREE,
  INDEX `idx_vr_id`(`vr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预约管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_author_view
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_author_view`;
CREATE TABLE `ll_vr_author_view`  (
  `count_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID(自增)',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `views` int(10) NOT NULL DEFAULT 0 COMMENT '浏览量(人气值)',
  `total_time` int(11) NOT NULL DEFAULT 0 COMMENT '统计时间',
  PRIMARY KEY (`count_id`) USING BTREE,
  INDEX `idx_UserId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景作者人气值排行' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for ll_vr_class
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_class`;
CREATE TABLE `ll_vr_class`  (
  `vr_class_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名',
  `order_sort` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '显示(0=>否 1=>是)',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`vr_class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_company_copy
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_company_copy`;
CREATE TABLE `ll_vr_company_copy`  (
  `copy_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) NOT NULL DEFAULT 0 COMMENT '复制人的user_id',
  `to_studio_id` int(11) NOT NULL DEFAULT 0 COMMENT '复制给的user_id',
  `new_vr_id` int(11) NOT NULL DEFAULT 0 COMMENT '对方企业号',
  `vr_id` int(11) NOT NULL DEFAULT 0 COMMENT '老vr_id',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`copy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业复制全景记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_copy_log
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_copy_log`;
CREATE TABLE `ll_vr_copy_log`  (
  `copy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `old_vr_id` int(11) NOT NULL DEFAULT 0 COMMENT '旧Vrid',
  `new_vr_id` int(11) NOT NULL DEFAULT 0 COMMENT '新vr_id',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '复制时间',
  PRIMARY KEY (`copy_id`) USING BTREE,
  INDEX `Idx_addTime`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景复制记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_cover
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_cover`;
CREATE TABLE `ll_vr_cover`  (
  `cover_id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_id` int(11) NOT NULL DEFAULT 0 COMMENT 'vr_id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `cover_pic_id` int(11) NOT NULL DEFAULT 0 COMMENT '背景开场封面id',
  `cover_bgc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开场背景颜色',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '新增时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '编辑时间',
  `stay_time` int(3) NOT NULL DEFAULT 0 COMMENT '停留时间',
  `display_position` tinyint(1) NOT NULL DEFAULT 1 COMMENT '定位，1居中，2全屏，默认1',
  `web_is_user` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'web是否在使用，1使用中，0未使用',
  `mobile_is_iser` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile是否在使用，1使用中，0未使用',
  `studio_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业id',
  PRIMARY KEY (`cover_id`) USING BTREE,
  INDEX `idx_vr_id`(`vr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开场封面' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_cover_img
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_cover_img`;
CREATE TABLE `ll_vr_cover_img`  (
  `cover_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图路径',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`cover_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景作者个人主页封面图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_cover_open_pic
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_cover_open_pic`;
CREATE TABLE `ll_vr_cover_open_pic`  (
  `cover_pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `studio_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业id',
  `web_cover` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'pc封面图地址',
  `mobile_cover` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机封面图地址',
  `web_cover_md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'pcmd5',
  `mobile_cover_md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机md5',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '新增时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`cover_pic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3343 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景开场封面' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_group
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_group`;
CREATE TABLE `ll_vr_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户的user_id',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组名称',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`group_id`) USING BTREE,
  INDEX `idx_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_help
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_help`;
CREATE TABLE `ll_vr_help`  (
  `help_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `nav_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '导航名',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父类id',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章链接',
  `order_sort` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `title_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章描述',
  `is_nav_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否导航栏显示(0 否 1 是)',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示(0 否 1 是)',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`help_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景经验教程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_img
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_img`;
CREATE TABLE `ll_vr_img`  (
  `vr_img_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vr_id` int(10) NOT NULL DEFAULT 0 COMMENT '全景id',
  `img_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片名称',
  `img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '素材图片',
  `res_thumb_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '素材缩略图',
  `hlookat` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '初始视角hlookat值',
  `vlookat` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '初始视角vlookat值',
  `fov` float(10, 2) NOT NULL DEFAULT 120.00 COMMENT '初始视角fov值',
  `map_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '户型图ID',
  `map_img_x` int(10) NOT NULL DEFAULT 0 COMMENT '户型图X值',
  `map_img_y` int(10) NOT NULL DEFAULT 0 COMMENT '户型图Y值',
  `res_parameter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '全景图片参数',
  `img_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '全景合成状态：0-合成中、1-合成成功、2-合成失败',
  `is_first_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '首张图片(0=>否 1=>是)',
  `error_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '生成失败原因',
  `order_sort` int(4) NOT NULL DEFAULT 10 COMMENT '排序',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '企业id',
  `img_md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片的MD5值',
  `upload_channel` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上传方式：0-本地上传、1-素材库上传',
  `vr_res_id` int(10) NOT NULL DEFAULT 0 COMMENT '素材库id，映射 ll_vr_res.vr_res_id 字段，只有在素材库上传才有效',
  `generate_time` int(10) NULL DEFAULT 0 COMMENT '全景开始合成时间',
  `scene_group_id` int(10) NOT NULL DEFAULT 0 COMMENT '场景分组id',
  `point_add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标记点添加时间',
  PRIMARY KEY (`vr_img_id`) USING BTREE,
  INDEX `idx_sceneGroupId`(`scene_group_id`) USING BTREE,
  INDEX `idx_addTime`(`add_time`) USING BTREE,
  INDEX `idx_vrId`(`vr_id`) USING BTREE,
  INDEX `idx_mapId`(`map_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7760428 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_img_sub
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_img_sub`;
CREATE TABLE `ll_vr_img_sub`  (
  `vr_img_id` int(11) NOT NULL DEFAULT 0,
  `vr_id` int(11) NOT NULL DEFAULT 0,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `used_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vr_img_id`) USING BTREE,
  INDEX `idx_vr_id`(`vr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vr_img子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_key
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_key`;
CREATE TABLE `ll_vr_key`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vr网页嵌入key表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_library
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_library`;
CREATE TABLE `ll_vr_library`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `library_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件夹名称',
  `is_default` tinyint(1) NOT NULL DEFAULT 2 COMMENT '是否默认（1：是；2：否）',
  `is_del` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否删除(1:未删除；2：已删除)',
  `add_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE COMMENT '用户ID'
) ENGINE = InnoDB AUTO_INCREMENT = 2099 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'VR 素材文件夹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_log
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_log`;
CREATE TABLE `ll_vr_log`  (
  `count_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID(自增)',
  `vr_id` int(11) NOT NULL DEFAULT 0 COMMENT '作品id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户ip',
  `view_time` int(11) NOT NULL DEFAULT 0 COMMENT '浏览时间',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`count_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7644 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作品浏览日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_map
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_map`;
CREATE TABLE `ll_vr_map`  (
  `map_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '户型图ID',
  `vr_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '全景ID',
  `map_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '户型图类型(0=>户型图 1=>沙盘 2=>俯视图 3=>平面图)',
  `map_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '户型图地址',
  `map_img_size_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '户型图尺寸类型(0=>高度大 1=>宽度大)',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`map_id`) USING BTREE,
  INDEX `idx_vr_id`(`vr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '户型图表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_music
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_music`;
CREATE TABLE `ll_vr_music`  (
  `vr_music_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `music_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '音乐名称',
  `music_path` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '音乐路径',
  `music_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '音乐作者',
  `order_sort` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除(0=>否 1=>是)',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '企业id',
  `class_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`vr_music_id`) USING BTREE,
  INDEX `idx_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43556 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '音乐库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_music_class
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_music_class`;
CREATE TABLE `ll_vr_music_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '分类名',
  `sort` tinyint(2) NULL DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_new_func_tag
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_new_func_tag`;
CREATE TABLE `ll_vr_new_func_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新功能枚举',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `add_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `us_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新功能标识记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_res
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_res`;
CREATE TABLE `ll_vr_res`  (
  `vr_res_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `res_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '素材名称',
  `res_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '素材图片',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `res_thumb_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '企业id',
  `res_md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '素材文件的MD5值',
  `res_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 场景素材是否正常生成成功，1成功，0失败',
  `res_parameter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '全景参数',
  `library_id` int(11) NOT NULL DEFAULT 0 COMMENT '素材文件ID，ll_vr_library表ID',
  `anti_theft_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '防盗水印的内容',
  PRIMARY KEY (`vr_res_id`) USING BTREE,
  INDEX `idx_userId`(`user_id`) USING BTREE,
  INDEX `idx_studioId`(`studio_id`) USING BTREE,
  INDEX `idx_res_md5`(`res_md5`(6), `anti_theft_text`(10)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1788405 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '素材' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_scene_group
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_scene_group`;
CREATE TABLE `ll_vr_scene_group`  (
  `scene_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_id` int(11) NOT NULL DEFAULT 0 COMMENT '全景id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '场景名称',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '分组排序',
  `old_group_id` int(11) NOT NULL DEFAULT 0 COMMENT '旧分组id',
  PRIMARY KEY (`scene_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '场景分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_share_url
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_share_url`;
CREATE TABLE `ll_vr_share_url`  (
  `share_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vr_id` int(11) NOT NULL COMMENT 'vr作品id',
  `add_time` int(11) NOT NULL COMMENT 'vr添加时间',
  `end_time` int(11) NOT NULL COMMENT 'vr过期时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 否 1是 删除',
  `sign` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid 分享生成的唯一值',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 不显示 1 显示',
  PRIMARY KEY (`share_id`) USING BTREE,
  INDEX `vr_id_index`(`vr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阅后即焚记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_show_info
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_show_info`;
CREATE TABLE `ll_vr_show_info`  (
  `show_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `author_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '作者名称',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `wechat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二维码',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区',
  `author_info` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认(0=>否 1=>是)',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '企业id',
  `is_logo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示二维码(查询历史二维码) 0 开启 1 关闭',
  `is_qrcode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示微信二维码(查询历史二维码) 0 开启 1关闭',
  PRIMARY KEY (`show_info_id`) USING BTREE,
  INDEX `idx_userId`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 534 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '展示信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_show_info_setting
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_show_info_setting`;
CREATE TABLE `ll_vr_show_info_setting`  (
  `set_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vr_id` int(10) NOT NULL COMMENT 'vr_id',
  `is_tel_list` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表页电话显示（0隐藏1显示）',
  `is_wechat_list` tinyint(1) NOT NULL DEFAULT 1 COMMENT '列表页微信显示（0隐藏1显示）',
  `is_author_share` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享页作者显示（0隐藏1显示）',
  `is_tel_share` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享页电话显示（0隐藏1显示）',
  `is_autorotate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '自动旋转（0否1是）',
  `autorotate_speed` tinyint(1) NOT NULL DEFAULT 6 COMMENT '旋转速度（8/6/4，每圈35/75/95秒）',
  `is_play_music` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否播放音乐（0否1是）',
  `is_planet_open` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否小行星开场（0否1是）',
  `thumbs_open` tinyint(1) NOT NULL DEFAULT 0 COMMENT '全景预览（0否1是）',
  `home_open` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '个人主页（0否1是）',
  `is_wechat_share` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分享微信页显示（0隐藏1显示）',
  `details_view` tinyint(1) NOT NULL DEFAULT 0 COMMENT '详情页显示浏览量（0隐藏1显示）',
  `rotate_next` tinyint(1) NOT NULL DEFAULT 0 COMMENT '旋转一圈跳转下一全景（0否1是）',
  `is_vr_eye` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启vr眼镜 0 开启 1 关闭',
  `is_gyro` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启手机陀螺仪 0 开启 1关闭',
  `is_anti_theft_watermark` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否开启防盗水印，0：否，1：是',
  `anti_theft_text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '防盗水印的内容',
  PRIMARY KEY (`set_id`) USING BTREE,
  INDEX `idx_vrId`(`vr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 521 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作者信息功能设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_spot
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_spot`;
CREATE TABLE `ll_vr_spot`  (
  `vr_spot_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vr_id` int(10) NOT NULL DEFAULT 0 COMMENT '全景id',
  `vr_img_id` int(10) NOT NULL DEFAULT 0 COMMENT '图片id',
  `spot_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '热点名',
  `spot_icon` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '热点图标',
  `spot_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '热点类型(0=>场景切换 1=>超链接 2=>图片 3=>文字 4=>视频)',
  `spot_ath` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '热点ath值',
  `spot_atv` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '热点atv值',
  `spot_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '热点详情内容(根据类型不同改变)',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `hide_name` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏标题，1为隐藏标题，0为不隐藏',
  `is_custom` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 系统热点 1 自定义热点',
  `is_line_video` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 在线视频 1 本地视频',
  `sort` int(5) NOT NULL DEFAULT 0 COMMENT '排序字段',
  `vr_video_id` int(11) NOT NULL DEFAULT 0 COMMENT '本地视频id',
  PRIMARY KEY (`vr_spot_id`) USING BTREE,
  INDEX `idx_vrId`(`vr_id`) USING BTREE,
  INDEX `idx_typeDetail`(`spot_type`, `spot_detail`(6)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2917723 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景热点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_spot_desc
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_spot_desc`;
CREATE TABLE `ll_vr_spot_desc`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `spot_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vr_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `vr_index`(`vr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_spot_icon
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_spot_icon`;
CREATE TABLE `ll_vr_spot_icon`  (
  `icon_id` int(11) NOT NULL AUTO_INCREMENT,
  `icon_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'icon地址信息',
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `add_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`icon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义热点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_user_default_music
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_user_default_music`;
CREATE TABLE `ll_vr_user_default_music`  (
  `user_default_music_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `vr_music_id` int(10) NOT NULL DEFAULT 0 COMMENT '音乐id',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `studio_id` int(10) NOT NULL DEFAULT 0 COMMENT '企业id',
  PRIMARY KEY (`user_default_music_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户默认音乐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_user_vip
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_user_vip`;
CREATE TABLE `ll_vr_user_vip`  (
  `user_vip_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `is_lifelong_vip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '终身vip(0=>否 1=>是)',
  `vip_end_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'vip结束时间',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `is_give` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否后台赠送（0充值开通，1后台赠送，2充值赠送）',
  `vip_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'vip是否到期(0否,还处于vip状态，1是, 不是vip)',
  PRIMARY KEY (`user_vip_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景vip用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_video
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_video`;
CREATE TABLE `ll_vr_video`  (
  `vr_video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名称',
  `video_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频路径',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 否 1 是',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `user_id` int(11) NOT NULL,
  `size` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`vr_video_id`) USING BTREE,
  INDEX `userid_k`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vr视频表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_video_log
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_video_log`;
CREATE TABLE `ll_vr_video_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vr_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '0 否 1 是',
  `spot_id` int(11) NOT NULL COMMENT '热点id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vr_k`(`vr_id`) USING BTREE,
  INDEX `ve_k`(`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_vip_order
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_vip_order`;
CREATE TABLE `ll_vr_vip_order`  (
  `vip_order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户ip',
  `cz_ddh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `monitor_code` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易监控码',
  `trade_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付返回码',
  `buyer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付账号(第三方)',
  `vip_package_id` int(10) NOT NULL DEFAULT 0 COMMENT '套餐id',
  `package_fee` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '套餐价格',
  `package_dollar` decimal(10, 2) NOT NULL COMMENT '套餐美金',
  `vip_month` int(10) NOT NULL DEFAULT 0 COMMENT '开通vip时长(月)',
  `is_lifelong_vip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '终身vip(0=>否 1=>是)',
  `coupon_id` int(10) NOT NULL DEFAULT 0 COMMENT '优惠券id',
  `coupon_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '代金券使用类别（0：VIP充值代金券，1：幸运大抽奖券，2，赠点券，3：溜币充值代金券，4：云渲染充值代金券，5：全场充值通用 , 6：溜云库溜币充值代金券，7 : 商城商品优惠劵 ,8：商城满减券,9：免费渲染券）',
  `coupon_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠券(代金券)',
  `coupon_zd` int(10) NOT NULL DEFAULT 0 COMMENT '优惠券(送增点)',
  `pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际支付价格',
  `pay_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态(0-未支付，1-已支付，2-待支付，3-已扫码，4-退款，5-删除)',
  `pay_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付类型(0=>p++微信  1=>p++支付宝 2=>支付宝pc端 3=>paypal)',
  `price_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '金额类型(0=>人民币 1=>美金)',
  `cz_source` tinyint(1) NOT NULL DEFAULT 0 COMMENT '充值来源(0=>vip站点充值, 1=>溜云库客户端充值)',
  `pay_time` int(10) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `entrance` tinyint(4) NOT NULL DEFAULT 0 COMMENT '入口(2.logo下拉弹窗)',
  `is_first` tinyint(10) NOT NULL DEFAULT 0 COMMENT '是否首单',
  `payment_id` int(11) NOT NULL DEFAULT 0 COMMENT 'payment 支付表id',
  `invoice_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发票状态（0=>\'未开\',1=>\'已开\'）',
  `invoice_status_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '发票状态（0待开票，1已申请，2开票成功（查看开票），3开票失败，4已开票）',
  `page_source` tinyint(2) NULL DEFAULT 0 COMMENT '1 去掉水印窗口 2 顶部广告窗口 3 底部遮罩窗口 4 复制作品窗口 5 联系方式设置窗口 6 分享设置窗口 7 离线下载窗口 8 回收站页 9 音乐库页 10 预约管理页11 广告设置窗口12 联系方式设置窗口13 在线预约窗口 14 分享设置窗口15 去水印窗口16 背景音乐窗口17 全景站点头部导航栏',
  PRIMARY KEY (`vip_order_id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `idx_payTime`(`pay_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vip订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_vip_package
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_vip_package`;
CREATE TABLE `ll_vr_vip_package`  (
  `vip_package_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `package_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '套餐名',
  `package_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '套餐价格',
  `package_dollar` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '套餐美金',
  `default_package` tinyint(1) NOT NULL COMMENT '是否默认选中套餐（0=>否 1=>是）',
  `package_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '套包附加说明',
  `is_lifelong_vip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '终身vip(0=>否 1=>是)',
  `vip_month` int(10) NOT NULL DEFAULT 0 COMMENT '开通vip时长(月)',
  `order_sort` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '显示(0=>否 1=>是)',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `original_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价格',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`vip_package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vip套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_vip_user_gift
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_vip_user_gift`;
CREATE TABLE `ll_vr_vip_user_gift`  (
  `z_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID(唯一)',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `vip_end_time` int(10) NOT NULL DEFAULT 0 COMMENT 'vip结束时间',
  `z_value` tinyint(1) NOT NULL DEFAULT 0 COMMENT '赠送值',
  `admin_id` int(8) NOT NULL DEFAULT 0 COMMENT '操作人',
  `user_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户消息',
  `z_reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '赠送原因',
  `z_time` int(11) NOT NULL DEFAULT 0 COMMENT '赠送时间',
  `is_pass` smallint(6) NOT NULL DEFAULT 1 COMMENT '赠送审核状态(0=>审核中 1=>审核通过 2=>审核不通过)',
  `activity_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动id',
  `z_time_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '赠送时间类型, 1年, 2月, 3日, 4终身版',
  `order_id` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联订单id',
  `order_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单类型. 1溜币充值',
  PRIMARY KEY (`z_id`) USING BTREE,
  INDEX `census_admin_gift`(`z_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2626 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景贵族赠送' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_vip_user_recall
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_vip_user_recall`;
CREATE TABLE `ll_vr_vip_user_recall`  (
  `recall_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID(唯一)',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  `admin_id` int(8) NOT NULL DEFAULT 0 COMMENT '操作人',
  `user_msg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户消息',
  `recall_reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '取消原因',
  `recall_time` int(11) NOT NULL DEFAULT 0 COMMENT '取消时间',
  `is_pass` smallint(6) NOT NULL DEFAULT 1 COMMENT '取消审核状态(0=>审核中 1=>审核通过 2=>审核不通过)',
  PRIMARY KEY (`recall_id`) USING BTREE,
  INDEX `census_admin_gift`(`recall_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2445 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景贵族取消' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ll_vr_visitor
-- ----------------------------
DROP TABLE IF EXISTS `ll_vr_visitor`;
CREATE TABLE `ll_vr_visitor`  (
  `visitor_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '被访问用户id',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问用户昵称(查看者昵称)',
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问用户头像(查看者头像)',
  `visitor_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '访问用户id(查看者id)',
  `visitor_time` int(11) NOT NULL DEFAULT 0 COMMENT '访问时间',
  PRIMARY KEY (`visitor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全景作者个人主页访问日志' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
