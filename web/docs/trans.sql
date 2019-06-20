/*
Navicat MySQL Data Transfer

Source Server         : 10.10.10.51
Source Server Version : 50641
Source Host           : 10.10.10.51:3306
Source Database       : trans

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2019-06-20 14:43:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_etl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_admin`;
CREATE TABLE `sys_etl_admin` (
  `id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `mag_type` INT(2) NOT NULL DEFAULT '0' COMMENT '类型 0-普通管理员/1-超级管理员',
  `username` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of sys_etl_admin
-- ----------------------------
INSERT INTO `sys_etl_admin` VALUES ('dfde0f72-af48-40a9-8c27-2dd06627ee8b', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `sys_etl_all_field`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_all_field`;
CREATE TABLE `sys_etl_all_field` (
  `id` VARCHAR(40) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键',
  `table_id` VARCHAR(40) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '表名id',
  `NAME` VARCHAR(150) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段名称',
  `pri_key` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主键字段 0-否/1-是',
  `comment` VARCHAR(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '注释',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_entity_id` (`table_id`,`NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='etl数据源对应的所有字段';

-- ----------------------------
-- Records of sys_etl_all_field
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_etl_all_table`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_all_table`;
CREATE TABLE `sys_etl_all_table` (
  `id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `ds_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据源id',
  `NAME` VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名',
  `comment` VARCHAR(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表注释',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_table_name` (`NAME`,`ds_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl数据源对应的所有数据表';

-- ----------------------------
-- Records of sys_etl_all_table
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_etl_data_source`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_data_source`;
CREATE TABLE `sys_etl_data_source` (
  `id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `source_name` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据源名称，唯一',
  `db_type` INT(1) NOT NULL DEFAULT '0' COMMENT '数据库类型0-mysql/1-oracle/2-mssql',
  `db_ip` VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库ip',
  `db_port` INT(11) NOT NULL DEFAULT '0' COMMENT '数据库端口',
  `db_name` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库服务名称',
  `db_user_name` VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库用户名',
  `db_pwd` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库用户密码',
  `alive` INT(1) NOT NULL DEFAULT '0' COMMENT '数据源是否存活 0-否/1-是',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` INT(1) NOT NULL DEFAULT '1' COMMENT '是否有效 0-否/1-是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sn` (`source_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl数据源';

-- ----------------------------
-- Records of sys_etl_data_source
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_etl_entity`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_entity`;
CREATE TABLE `sys_etl_entity` (
  `id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `prj_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目id',
  `src_tab_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原表id',
  `src_tab_name` VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原表名',
  `des_tab_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标表id',
  `des_tab_name` VARCHAR(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标表名',
  `src_primary_key` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原表主键字段',
  `des_primary_key` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标表主键字段',
  `description` VARCHAR(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `etl_id` VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作业名称',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `repeat` INT(2) NOT NULL DEFAULT '0' COMMENT '是否重复 0-否/1-是',
  `schedule_type` INT(2) NOT NULL DEFAULT '0' COMMENT '定时类型  1-间隔/2-天/3-周/4-月',
  `interval_second` INT(11) NOT NULL DEFAULT '0' COMMENT '间隔秒',
  `interval_minute` INT(11) NOT NULL DEFAULT '30' COMMENT '间隔分',
  `fixed_hour` INT(11) NOT NULL DEFAULT '12' COMMENT '固定时',
  `fixed_minute` INT(11) NOT NULL DEFAULT '0' COMMENT '固定分钟',
  `fixed_weekday` INT(11) NOT NULL DEFAULT '0' COMMENT '固定周',
  `fixed_day` INT(11) NOT NULL DEFAULT '1' COMMENT '固定日',
  `is_exec` INT(2) NOT NULL DEFAULT '0' COMMENT '是否在执行ETL传输 0-否/1-是',
  `is_api_exec` INT(2) NOT NULL DEFAULT '0' COMMENT '是否在执行API传输 0-否/1-是',
  `last_trans_time` VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '上次传输时间',
  `condition` VARCHAR(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '检索条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl实体映射表';

-- ----------------------------
-- Records of sys_etl_entity
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_etl_field`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_field`;
CREATE TABLE `sys_etl_field` (
  `id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `entity_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '映射实体id，对应etl_entity表的id字段',
  `src_field_name` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原字段名',
  `des_field_name` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标字段名',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_esd` (`entity_id`,`src_field_name`,`des_field_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl字段映射表';

-- ----------------------------
-- Records of sys_etl_field
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_etl_project`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_project`;
CREATE TABLE `sys_etl_project` (
  `id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `prj_name` VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `src_db_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '源数据id',
  `des_db_id` VARCHAR(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标数据源id',
  `status` INT(1) NOT NULL DEFAULT '0' COMMENT '是否有效 0-是/1-否',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl项目表';

-- ----------------------------
-- Records of sys_etl_project
-- ----------------------------
