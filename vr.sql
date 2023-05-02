/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : vr

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 03/05/2023 02:58:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL COMMENT '主键ID',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `gender` tinyint(1) NOT NULL COMMENT '性别,0未知,1男,2女性别',
  `birth_date` datetime DEFAULT NULL COMMENT '出生日期',
  `is_locked` tinyint(1) NOT NULL COMMENT '是否锁定',
  `is_enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `last_login_ip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后登录IP',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `last_updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后修改人',
  `last_updated_date` datetime DEFAULT NULL COMMENT '最后修改日期',
  `delete_flag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for vr
-- ----------------------------
DROP TABLE IF EXISTS `vr`;
CREATE TABLE `vr` (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缩略图',
  `scenes` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '当前场景',
  `rotate_speed` tinyint(1) DEFAULT NULL COMMENT '旋转速度,0慢,1中,2快',
  `is_watermark` tinyint(1) DEFAULT NULL COMMENT '去水印,0否,1是',
  `is_auto_rotate` tinyint(1) DEFAULT NULL COMMENT '自动旋转,0否,1是',
  `is_automatic_jump` tinyint(1) DEFAULT NULL COMMENT '自动跳转后跳转,0否,1是',
  `is_asteroid_opening` tinyint(1) DEFAULT NULL COMMENT '小行星开场,0否,1是',
  `is_expand_scenes` tinyint(1) DEFAULT NULL COMMENT '是否展开场景预览,0否,1是',
  `views` int DEFAULT NULL COMMENT '浏览量',
  `is_vr_glasses` tinyint(1) DEFAULT NULL COMMENT '是否显示VR眼镜,0否,1是',
  `is_gyro` tinyint(1) DEFAULT NULL COMMENT '是否显示陀螺仪,0否,是',
  `is_home` tinyint(1) DEFAULT NULL COMMENT '是否显示主页,0否,是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='全景';

-- ----------------------------
-- Records of vr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for vr_scenes
-- ----------------------------
DROP TABLE IF EXISTS `vr_scenes`;
CREATE TABLE `vr_scenes` (
  `vr_scenes_id` int NOT NULL COMMENT '主键ID',
  `vr_id` int NOT NULL COMMENT '全景ID',
  `hlookat` float(10,2) DEFAULT NULL COMMENT '初始视角hlookat值',
  `vlookat` float(10,2) DEFAULT NULL COMMENT '初始视角vlookat值',
  `fov` float(10,2) DEFAULT NULL COMMENT '初始视角fov值',
  `map_id` int DEFAULT NULL COMMENT '户型图ID',
  `map_img_x` float(10,2) DEFAULT NULL COMMENT '户型图X值',
  `map_img_y` float(10,2) DEFAULT NULL COMMENT '户型图Y值',
  `status` tinyint(1) DEFAULT NULL COMMENT '全景合成状态：0合成中,1合成成功,2合成失败',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认,0否,1是',
  `created_date` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `last_updated_by` datetime DEFAULT NULL COMMENT '最后修改人',
  `last_updated_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `delete_flag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`vr_scenes_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of vr_scenes
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
