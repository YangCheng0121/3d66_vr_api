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

 Date: 21/04/2023 18:19:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL COMMENT '主键ID',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` tinyint(1) NOT NULL COMMENT '性别,0未知,1男,2女性别',
  `birth` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `is_enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  `last_login_ip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `created_date` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `last_updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `last_updated_date` datetime NULL DEFAULT NULL COMMENT '最后修改日期',
  `delete_flag` tinyint(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for vr
-- ----------------------------
DROP TABLE IF EXISTS `vr`;
CREATE TABLE `vr`  (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缩略图',
  `scenes` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '当前场景',
  `rotate_speed` tinyint(1) NULL DEFAULT NULL COMMENT '旋转速度,0慢,1中,2快',
  `is_watermark` tinyint(1) NULL DEFAULT NULL COMMENT '去水印,0否,1是',
  `is_auto_rotate` tinyint(1) NULL DEFAULT NULL COMMENT '自动旋转,0否,1是',
  `is_automatic_jump` tinyint(1) NULL DEFAULT NULL COMMENT '自动跳转后跳转,0否,1是',
  `is_asteroid_opening` tinyint(1) NULL DEFAULT NULL COMMENT '小行星开场,0否,1是',
  `is_expand_scenes` tinyint(1) NULL DEFAULT NULL COMMENT '是否展开场景预览,0否,1是',
  `views` int NULL DEFAULT NULL COMMENT '浏览量',
  `is_vr_glasses` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示VR眼镜,0否,1是',
  `is_gyro` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示陀螺仪,0否,是',
  `is_home` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示主页,0否,是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全景' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vr
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
