/*
Navicat MySQL Data Transfer

Source Server         : 200
Source Server Version : 50641
Source Host           : 10.40.40.200:3306
Source Database       : etl_trans

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2018-11-03 14:56:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_etl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_admin`;
CREATE TABLE `sys_etl_admin` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `mag_type` int(2) NOT NULL DEFAULT '0' COMMENT '类型 0-普通管理员/1-超级管理员',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of sys_etl_admin
-- ----------------------------
INSERT INTO `sys_etl_admin` VALUES ('dfde0f72-af48-40a9-8c27-2dd06627ee8b', '1', 'admin', '03b80bfa16faedc0a402a6205b75f436');

-- ----------------------------
-- Table structure for `sys_etl_all_field`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_all_field`;
CREATE TABLE `sys_etl_all_field` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键',
  `table_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '表名id',
  `name` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段名称',
  `pri_key` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主键字段 0-否/1-是',
  `comment` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '注释',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_entity_id` (`table_id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='etl数据源对应的所有字段';

-- ----------------------------
-- Records of sys_etl_all_field
-- ----------------------------
INSERT INTO `sys_etl_all_field` VALUES ('016ef8a6-6eac-43d6-bacd-052054f30f8d', '1272543d-6d99-4733-b71b-4a501d6037ea', 'status', '0', '是否有效 0-是/1-否/2-原表已删除', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('04d60678-a3d3-460f-98cd-5d98ddead060', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'status', '0', '是否有效 0-是/1-否', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('052dd4cf-62b0-4cf9-bb71-5b26458f6965', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'create_time', '0', '创建时间', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('08503339-0022-4732-8334-73f4194fe3cf', '77ca5133-f82b-4990-b04d-961168c193bd', 'local_db_name', '0', '本地对应的数据库', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('08e35830-4a27-48a8-a944-a175f6380f19', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'create_time', '0', '创建时间', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('0a3a79d8-bc33-4301-a4fc-dc761c487a3e', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'table_id', '0', '表名id', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('0a4515f8-21fc-4bac-a928-55430f35470b', 'e1be06f5-6ab6-42b9-8046-f7567845d59b', 'pwd', '0', '密码', '1541226470450');
INSERT INTO `sys_etl_all_field` VALUES ('0a929483-eda5-402a-b4df-0facf9b7edd6', '77ca5133-f82b-4990-b04d-961168c193bd', 'update_time', '0', '修改时间', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('0ccbc4e5-fa20-4c26-ac7a-31d9eae04136', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'storage_root_path', '0', '本地存储根目录', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('0cfaf07c-663a-47df-a1a4-528d84e4f8cc', '1272543d-6d99-4733-b71b-4a501d6037ea', 'need_gen_ktr_file', '0', '是否需要重新生成ktr文件 0-不需要/1-需要', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('1073af82-7b32-4fff-8106-cd3d3be06ee6', 'e1be06f5-6ab6-42b9-8046-f7567845d59b', 'id', '1', '主键', '1541226470450');
INSERT INTO `sys_etl_all_field` VALUES ('128f4789-b9fd-4c32-a46a-9d546a9ad86c', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'name', '0', '数据源名称，唯一', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('161bd008-ce0c-4271-b4ac-977d3048c5c0', '1bef7824-b2e1-46e8-b8a2-9739d97159bd', 'pwd', '0', '密码', '1541226483620');
INSERT INTO `sys_etl_all_field` VALUES ('17f9729b-d1cc-4b24-8381-a9d7f90c53e8', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'storage_root_path', '0', '本地存储根目录', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('184b7acc-6c4e-4cc8-96d0-d910e4d8949f', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'id', '1', '主键', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('19c746ab-9f93-440e-bfd1-aac2282d5a52', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'file_name', '0', '文件名', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('1de8d53e-8ec0-4a48-96d5-310a9297df1b', 'f848e779-94f3-431b-ba8d-36aa7f4c6691', 'name', '0', '项目名称', '1541226483727');
INSERT INTO `sys_etl_all_field` VALUES ('20188cd0-dcb4-4e0b-8022-0e775b1991e3', '77ca5133-f82b-4990-b04d-961168c193bd', 'db_pwd', '0', '数据库用户密码', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('222739e6-6d8d-492f-9332-7cbb951b00ab', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'file_status', '0', '文件状态 -1-已扫描/0-已切分/1-未上传/2-已上传', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('2501d744-8541-4461-b0c1-5611b66a3c5b', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'db_username', '0', '数据库用户名', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('25adc5f0-0943-43c6-8b0e-857bd22d1672', 'c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'status', '0', '是否已删除oss上的超时备份文件 0-否/1-是', '1541226483682');
INSERT INTO `sys_etl_all_field` VALUES ('276a06f7-135b-411b-94db-a65d0e049565', '1bef7824-b2e1-46e8-b8a2-9739d97159bd', 'username', '0', '用户名', '1541226483620');
INSERT INTO `sys_etl_all_field` VALUES ('297047a0-7799-466b-ae06-db0f4bd9b272', '1272543d-6d99-4733-b71b-4a501d6037ea', 'exist_sys_time', '0', '是否系统时间和默认索引 0-无/1-有', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('2c1e3d10-1eff-460a-81f9-c66d93d111b5', '77ca5133-f82b-4990-b04d-961168c193bd', 'sys_db_pwd', '0', '数据库系统用户密码', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('2cd56dd9-5025-4b36-83a6-ee4ca7571257', '1272543d-6d99-4733-b71b-4a501d6037ea', 'sync_time', '0', '同步结构时间', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('2d86bacf-7d6d-4be9-acc8-247f726ff93c', '77ca5133-f82b-4990-b04d-961168c193bd', 'db_ip', '0', '数据库ip', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('2dc94744-2078-4324-b9d1-73ca3eb3a6bf', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'db_ip', '0', '数据库ip', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('2e8cf2ec-5392-4217-94cf-88152ea835e9', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'type', '0', '字段类型', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('2fcdae40-1b4f-4447-81fb-06cd281def3c', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'id', '1', 'id', '1541226470319');
INSERT INTO `sys_etl_all_field` VALUES ('2ff74c15-ef58-4847-9e54-d1eb5a300c04', 'f848e779-94f3-431b-ba8d-36aa7f4c6691', 'status', '0', '是否有效 0-是/1-否', '1541226483727');
INSERT INTO `sys_etl_all_field` VALUES ('349e3350-2c0e-49bb-95e9-f6788135f3c9', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'file_path', '0', '文件路径', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('359bd85e-ea5b-4383-a13a-02969e2f9c77', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'precisions', '0', '字段精度', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('36df1e99-430b-48a7-918c-0a105dcc1722', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'upload_time', '0', '上传到oss的时间', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('3749a1c7-06f2-4149-9c89-6f67e6b09376', 'f848e779-94f3-431b-ba8d-36aa7f4c6691', 'id', '1', '主键', '1541226483727');
INSERT INTO `sys_etl_all_field` VALUES ('3825ae30-3cfb-47ac-8fba-30259b92b8b8', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'len', '0', '字段长度', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('3a5c4594-5167-44bf-b78b-c6622ca0f14d', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'file_size', '0', '文件大小（b）', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('3a75e4c2-bcbd-47b8-a6cb-eb1f811255c3', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'create_time', '0', '创建时间', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('3a8dd50f-26e4-486b-bf19-724c0034abf5', 'c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'id', '1', 'id', '1541226483682');
INSERT INTO `sys_etl_all_field` VALUES ('3c341905-ca5f-481a-9b8c-98cf06b95cfb', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'update_time', '0', '修改时间', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('3d64fdeb-e705-44a5-885e-4358bb215298', '77ca5133-f82b-4990-b04d-961168c193bd', 'db_username', '0', '数据库用户名', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('3db22143-c536-486b-aba4-cdbe65cc5564', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'id', '1', '主键', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('3e0a3cac-3c2c-46f5-ae16-6468682cd9e1', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'create_time', '0', '上传时间', '1541226470319');
INSERT INTO `sys_etl_all_field` VALUES ('41d8c38a-25c8-437b-a5c6-dd3872c08544', '77ca5133-f82b-4990-b04d-961168c193bd', 'name', '0', '数据源名称，唯一', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('4235d734-bad8-4ad4-b8e0-fccd3fa878a5', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'name', '0', '字段名称', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('428e7fd8-2638-44c9-a610-0248695ebf5f', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'project_id', '0', '项目id', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('432d130d-d5d2-40e6-b543-fc70d9a640ea', '1272543d-6d99-4733-b71b-4a501d6037ea', 'name', '0', '表名', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('439d8eec-35fc-49b9-a768-ae4c14bcb34e', 'c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'storage_root_path', '0', '本地存储根目录', '1541226483682');
INSERT INTO `sys_etl_all_field` VALUES ('44f1127b-2409-4e2a-9d2e-2192492eac75', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'create_time', '0', '创建时间', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('457d84e7-bf61-47f0-af46-397bbf9a5a4a', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'required_col', '0', '是否必填0-否/1-是', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('46bc8f34-76be-4e43-a45e-c5741b0f4edc', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'data_sync_time', '0', '数据同步时间', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('472e9a44-6d0e-4847-b492-856d68878077', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'pri_key', '0', '是否为主键字段 0-否/1-是', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('4b2f3ca8-fe2c-4b2e-885b-1e04a6c98837', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'status', '0', '是否有效 0-是/1-否/2-原表已删除', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('5038662c-e893-4d59-99f5-a841678248f0', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'file_size', '0', '文件大小（b）', '1541226470319');
INSERT INTO `sys_etl_all_field` VALUES ('51ddc8bd-1608-4d35-81ce-7fa06dfcbdc6', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'id', '1', '主键', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('56038cdd-0bc7-422e-a321-c1f970aa5667', '1bef7824-b2e1-46e8-b8a2-9739d97159bd', 'id', '1', '主键', '1541226483620');
INSERT INTO `sys_etl_all_field` VALUES ('56b1f5ae-3598-40e3-8255-e0250e6b8140', '77ca5133-f82b-4990-b04d-961168c193bd', 'alive', '0', '数据源是否存活 0-否/1-是', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('5989c163-69df-4f9f-b278-8ce3366d2dcc', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'table_id', '0', '表名id', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('5b7281eb-323e-4474-9330-776a93f739f6', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'local_db_name', '0', '本地对应的数据库', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('5b949272-d1d6-47fe-b9b0-03c765cb48cc', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'required_col', '0', '是否必填0-否/1-是', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('5dfff081-b257-4c56-bb0e-a850716833eb', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'status', '0', '是否有效 0-是/1-否', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('5f453116-6fee-49e7-9812-0a8ddf5a4681', '1272543d-6d99-4733-b71b-4a501d6037ea', 'update_time', '0', '更新时间', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('5fe3e3bb-dc7a-4a83-93fb-2848df038907', 'f848e779-94f3-431b-ba8d-36aa7f4c6691', 'create_time', '0', '创建时间', '1541226483727');
INSERT INTO `sys_etl_all_field` VALUES ('630d9c4e-62c3-4163-85e0-c83dc641c429', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'len', '0', '字段长度', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('634ae509-177b-4381-aa77-7e7dbeab9e8b', '77ca5133-f82b-4990-b04d-961168c193bd', 'status', '0', '是否有效 0-是/1-否', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('647e8c95-7b93-4141-9c63-16122de9a71d', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'update_time', '0', '修改时间', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('65f0c1cd-a941-47c7-a7d0-f306d7895341', '77ca5133-f82b-4990-b04d-961168c193bd', 'create_time', '0', '创建时间', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('6704664f-9871-4b31-b000-7c401b6eade2', 'e1be06f5-6ab6-42b9-8046-f7567845d59b', 'username', '0', '用户名', '1541226470450');
INSERT INTO `sys_etl_all_field` VALUES ('69033d8a-bde7-4960-90d0-b8496f40b160', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'upload_time', '0', '上传到oss的时间', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('6c150ac2-5c97-43a3-83e0-4d0629b2244c', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'alive', '0', '数据源是否存活 0-否/1-是', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('7044c2ef-87f4-4850-b347-5776c91bd484', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'exist_sys_time', '0', '是否系统时间和默认索引 0-无/1-有', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('72f8a85e-9b01-4055-9bf2-fb9c969d1647', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'file_name', '0', '文件名', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('75d69631-dfc9-40b5-8f8b-d0bc7cbb9fbe', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'file_name', '0', '文件名称', '1541226470319');
INSERT INTO `sys_etl_all_field` VALUES ('77c1394d-4fcc-4330-9047-05be814faa9d', 'c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'file_name', '0', '文件名称', '1541226483682');
INSERT INTO `sys_etl_all_field` VALUES ('78f6243d-36ad-4642-be72-8535ab11e22a', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'name', '0', '字段名称', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('794b6a04-46c2-4f5a-8fd9-50316964c874', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'sync_time', '0', '同步时间', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('7a298d0c-1a83-436b-b2f4-87d165204ebd', '1272543d-6d99-4733-b71b-4a501d6037ea', 'id', '1', '主键', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('7c4189a2-e5db-4fa6-9065-c0afcfb51c37', '1272543d-6d99-4733-b71b-4a501d6037ea', 'data_sync_time', '0', '数据同步时间', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('81c928fb-d6f8-42ee-b22f-291cbd7a18fc', 'ef331f15-4f2d-4e51-820a-6f4361bd8a78', 'name', '0', '项目名称', '1541226470463');
INSERT INTO `sys_etl_all_field` VALUES ('847c1028-8959-4e85-9876-7d40ee909fbf', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'type', '0', '数据库类型Mysql、Oracle、MSSQL', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('85af604a-2ae2-4262-b341-eb7e1e3a91bf', '1272543d-6d99-4733-b71b-4a501d6037ea', 'key_chg', '0', '主键是否变更 0-否/1-是', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('8695d96f-a297-4a8a-9cf0-fd66a4a4ffdc', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'sync_time', '0', '同步结构时间', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('86ca52aa-51ab-4e18-9888-93e8ae78aa0f', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'sys_db_username', '0', '数据库系统用户名', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('87148e28-826f-47eb-92d6-7c6b3baa63bc', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'position', '0', '字段顺序', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('8b462493-eb2d-4b33-9775-da95ad6f8773', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'sys_db_pwd', '0', '数据库系统用户密码', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('8ba9266f-52bb-4dd2-9d68-726f2a28b4c0', 'ef331f15-4f2d-4e51-820a-6f4361bd8a78', 'create_time', '0', '创建时间', '1541226470463');
INSERT INTO `sys_etl_all_field` VALUES ('8c46d6ef-b12d-4a65-8bc1-736c5bc93bf2', '77ca5133-f82b-4990-b04d-961168c193bd', 'sys_db_username', '0', '数据库系统用户名', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('8d155725-29dc-4ddc-b7ea-854ffc944f21', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'file_size', '0', '文件大小（b）', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('8db0a5e9-a3cb-4c17-8e54-400e749277c6', '1272543d-6d99-4733-b71b-4a501d6037ea', 'create_time', '0', '创建时间', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('916e81a0-826b-4c44-9d1a-cfad032c23d2', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'create_time', '0', '创建时间', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('93ff64a3-914c-4605-b5b7-18c5083d7203', '77ca5133-f82b-4990-b04d-961168c193bd', 'db_port', '0', '数据库端口', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('96768be0-3939-4d22-a6c6-4d5c44e7882d', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'update_time', '0', '修改时间', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('96a3690d-b49b-47c4-b374-df4ea0eb6e18', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'position', '0', '字段顺序', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('9ea3a2c5-5ac6-44a8-877b-d072abbd65be', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'db_name', '0', '数据库名称', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('9f90d4d5-c657-4a80-be56-b111d18e7966', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'id', '1', '主键', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('a012d7ef-c612-45f6-b099-939fb9da5f18', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'type', '0', '字段类型', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('a05e1da7-de51-444e-9047-e34a184969cd', 'c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'create_time', '0', '上传时间', '1541226483682');
INSERT INTO `sys_etl_all_field` VALUES ('a25cf6db-1bbd-4780-8290-0b404848c5bf', '1272543d-6d99-4733-b71b-4a501d6037ea', 'ds_id', '0', '数据源id', '1541226470342');
INSERT INTO `sys_etl_all_field` VALUES ('a502c9ef-f77c-4db4-929f-cc59926fab13', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'db_port', '0', '数据库端口', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('a975f247-6286-486b-a11a-f3ce4d30a897', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'precisions', '0', '字段精度', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('aaba2359-c20e-4d2b-8d1b-a9c6af5ea841', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'file_path', '0', '文件路径', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('ab18bc02-0d9a-4e16-aff3-9abcc0f3139b', 'ef331f15-4f2d-4e51-820a-6f4361bd8a78', 'id', '1', '主键', '1541226470463');
INSERT INTO `sys_etl_all_field` VALUES ('b0c44678-7552-4c04-b23a-59298e3fc475', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'need_gen_ktr_file', '0', '是否需要重新生成ktr文件 0-不需要/1-需要', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('b0f04e21-8a05-40ea-b128-95760397e7ad', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'prj_id', '0', '项目id', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('b15377ab-1e4c-48bc-b7ed-457df36106b4', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'key_chg', '0', '主键是否变更 0-否/1-是', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('b7953354-d517-4376-badb-500112700341', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'client_ip_address', '0', '客户端ip地址', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('b9afc34b-7500-499a-b784-7f7fdc549af6', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'sync_time', '0', '同步时间', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('bcdd638c-692c-402c-97c6-6a637189a03d', '77ca5133-f82b-4990-b04d-961168c193bd', 'sync_time', '0', '同步时间', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('be61f7b2-f659-46bf-8140-14440b51829b', 'c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'file_size', '0', '文件大小（b）', '1541226483682');
INSERT INTO `sys_etl_all_field` VALUES ('bebbf718-07b2-4ee7-a0eb-9dde4a0d4209', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'update_time', '0', '更新时间', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('c04847b3-7fd0-451f-9a6f-7f521b5a4e26', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'root_name', '0', '根路径名称', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('c2160a4e-9eaf-41e8-8902-ce0200c89b44', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'date_path', '0', '日期文件夹 eg:20180724', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('c434ce48-261d-4aea-8c8b-99341349f6f7', '77ca5133-f82b-4990-b04d-961168c193bd', 'prj_id', '0', '项目id', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('c5c7ec1a-ce52-4be6-adf8-c8fd4cc0a00b', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'file_status', '0', '文件状态 -1-已扫描/0-已切分/1-未上传/2-已上传', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('c5c9ea85-d789-45ef-899c-e3fc868ee0ac', '1bef7824-b2e1-46e8-b8a2-9739d97159bd', 'mag_type', '0', '类型 0-普通管理员/1-超级管理员', '1541226483620');
INSERT INTO `sys_etl_all_field` VALUES ('c750d28c-5b40-4aaa-808e-f857f8dcdd07', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'identity_col', '0', '标识列 0：否/1：是', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('c8644b07-2398-49db-a1b1-78b1a79cc042', '77ca5133-f82b-4990-b04d-961168c193bd', 'id', '1', '主键', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('cccde76d-0e8e-4173-9b40-9c3afc7d25e9', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'storage_root_path', '0', '本地存储根目录', '1541226470319');
INSERT INTO `sys_etl_all_field` VALUES ('cd2c145a-a86e-406f-a6db-4e28508254c1', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'ds_id', '0', '数据源id', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('cd415ae3-a9c6-466c-8405-36444a90b06c', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'id', '1', '主键', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('cdfea213-5fbd-4bcd-b457-fd1261e91543', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'identity_col', '0', '标识列 0：否/1：是', '1541226470366');
INSERT INTO `sys_etl_all_field` VALUES ('d6900867-63dd-41a2-b8e3-2460c2352dd3', 'ff6e5698-fc58-4807-9698-50e783cc3da6', 'pri_key', '0', '是否为主键字段 0-否/1-是', '1541226483742');
INSERT INTO `sys_etl_all_field` VALUES ('d90d8a79-c8af-46bb-8ae0-6233d56afc06', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'project_id', '0', '项目id', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('d9255832-634c-4079-9bd2-7b922debaca1', '77ca5133-f82b-4990-b04d-961168c193bd', 'type', '0', '数据库类型Mysql、Oracle、MSSQL', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('e0793482-fa9a-4906-9c15-2eaf150e8b11', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'id', '1', '主键', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('e3dc810b-64cb-466d-afa2-e223edfe40b1', '4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'client_ip_address', '0', '客户端ip地址', '1541226483636');
INSERT INTO `sys_etl_all_field` VALUES ('e44d783c-f56b-4658-bbed-46be9c72830c', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'db_pwd', '0', '数据库用户密码', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('e4af76ec-d26b-4078-b208-8264334f7bf6', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'status', '0', '是否有效 0-是/1-否', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('e665615e-a95a-405a-bef8-94fec265f448', 'e1be06f5-6ab6-42b9-8046-f7567845d59b', 'mag_type', '0', '类型 0-普通管理员/1-超级管理员', '1541226470450');
INSERT INTO `sys_etl_all_field` VALUES ('ed1e22bf-9e80-4c87-b26d-b5f117973c40', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'root_name', '0', '根路径名称', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('edce186a-4304-4c00-87d9-e682445aab83', '77ca5133-f82b-4990-b04d-961168c193bd', 'db_name', '0', '数据库名称', '1541226470417');
INSERT INTO `sys_etl_all_field` VALUES ('ef531a75-7763-4dd0-8026-216522de00ca', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'create_time', '0', '创建时间', '1541226483659');
INSERT INTO `sys_etl_all_field` VALUES ('f194f5f4-d409-4bae-b29d-e5c1ac203de2', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'status', '0', '是否已删除oss上的超时备份文件 0-否/1-是', '1541226470319');
INSERT INTO `sys_etl_all_field` VALUES ('f1b47609-e8fd-4bb1-a70b-bd1d7784506e', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'date_path', '0', '日期文件夹 eg:20180724', '1541226470393');
INSERT INTO `sys_etl_all_field` VALUES ('f30c7849-bd24-412c-bbdb-a26e21fbcfee', 'eb026d5f-9882-4b08-aa37-099f4efc2c43', 'sync_time', '0', '同步时间', '1541226483697');
INSERT INTO `sys_etl_all_field` VALUES ('fbc2c844-2c4e-4ed7-acce-a4b185a08a9f', 'ef331f15-4f2d-4e51-820a-6f4361bd8a78', 'status', '0', '是否有效 0-是/1-否', '1541226470463');
INSERT INTO `sys_etl_all_field` VALUES ('fd475d20-3737-4e36-8cf3-009643889332', '8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'name', '0', '表名', '1541226483659');

-- ----------------------------
-- Table structure for `sys_etl_all_table`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_all_table`;
CREATE TABLE `sys_etl_all_table` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `ds_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据源id',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名',
  `comment` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表注释',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_table_name` (`name`,`ds_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl数据源对应的所有数据表';

-- ----------------------------
-- Records of sys_etl_all_table
-- ----------------------------
INSERT INTO `sys_etl_all_table` VALUES ('0db6791d-137f-4dee-a53f-394c6abe2b88', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_db_file', '数据库备份文件', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('1272543d-6d99-4733-b71b-4a501d6037ea', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_table', '业务实体表', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('1bef7824-b2e1-46e8-b8a2-9739d97159bd', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_admin', '管理员表', '1541226483591');
INSERT INTO `sys_etl_all_table` VALUES ('3d74a996-21d6-41c2-99c0-e9d18efa9ef5', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_field', '实体字段记录表', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('42d334dd-4d38-4f59-a52d-cc518a21d843', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_file', '文件', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('4f9f63b3-90ee-426c-8386-1d3920e7f5ba', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_file', '文件', '1541226483591');
INSERT INTO `sys_etl_all_table` VALUES ('77ca5133-f82b-4990-b04d-961168c193bd', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_data_source', '数据源', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('8a7fa0cc-4050-45d8-a25d-8998d29aa0af', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_table', '业务实体表', '1541226483591');
INSERT INTO `sys_etl_all_table` VALUES ('c26bf0ec-35c1-45ab-b52d-fb98e0129775', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_db_file', '数据库备份文件', '1541226483591');
INSERT INTO `sys_etl_all_table` VALUES ('e1be06f5-6ab6-42b9-8046-f7567845d59b', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_admin', '管理员表', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('eb026d5f-9882-4b08-aa37-099f4efc2c43', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_data_source', '数据源', '1541226483591');
INSERT INTO `sys_etl_all_table` VALUES ('ef331f15-4f2d-4e51-820a-6f4361bd8a78', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'sys_project', 'ETL项目表', '1541226470286');
INSERT INTO `sys_etl_all_table` VALUES ('f848e779-94f3-431b-ba8d-36aa7f4c6691', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_project', 'ETL项目表', '1541226483591');
INSERT INTO `sys_etl_all_table` VALUES ('ff6e5698-fc58-4807-9698-50e783cc3da6', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', 'sys_field', '实体字段记录表', '1541226483591');

-- ----------------------------
-- Table structure for `sys_etl_data_source`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_data_source`;
CREATE TABLE `sys_etl_data_source` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `source_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据源名称，唯一',
  `db_type` int(1) NOT NULL DEFAULT '0' COMMENT '数据库类型0-mysql/1-oracle/2-mssql',
  `db_ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库ip',
  `db_port` int(11) NOT NULL DEFAULT '0' COMMENT '数据库端口',
  `db_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库服务名称',
  `db_user_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库用户名',
  `db_pwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据库用户密码',
  `alive` int(1) NOT NULL DEFAULT '0' COMMENT '数据源是否存活 0-否/1-是',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效 0-否/1-是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sn` (`source_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl数据源';

-- ----------------------------
-- Records of sys_etl_data_source
-- ----------------------------
INSERT INTO `sys_etl_data_source` VALUES ('1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'one', '0', '10.40.40.200', '3306', 'one', 'root', 'root', '1', '1541226470264', '1');
INSERT INTO `sys_etl_data_source` VALUES ('b92b829b-866c-4b02-b190-1c1c5a6fd911', 'two', '0', '10.40.40.200', '3306', 'two', 'root', 'root', '1', '1541226483578', '1');

-- ----------------------------
-- Table structure for `sys_etl_entity`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_entity`;
CREATE TABLE `sys_etl_entity` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `prj_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目id',
  `src_tab_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原表id',
  `src_tab_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原表名',
  `des_tab_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标表id',
  `des_tab_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标表名',
  `src_primary_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原表主键字段',
  `des_primary_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标表主键字段',
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `etl_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '作业名称',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `repeat` int(2) NOT NULL DEFAULT '0' COMMENT '是否重复 0-否/1-是',
  `schedule_type` int(2) NOT NULL DEFAULT '0' COMMENT '定时类型  1-间隔/2-天/3-周/4-月',
  `interval_second` int(11) NOT NULL DEFAULT '0' COMMENT '间隔秒',
  `interval_minute` int(11) NOT NULL DEFAULT '30' COMMENT '间隔分',
  `fixed_hour` int(11) NOT NULL DEFAULT '12' COMMENT '固定时',
  `fixed_minute` int(11) NOT NULL DEFAULT '0' COMMENT '固定分钟',
  `fixed_weekday` int(11) NOT NULL DEFAULT '0' COMMENT '固定周',
  `fixed_day` int(11) NOT NULL DEFAULT '1' COMMENT '固定日',
  `is_exec` int(2) NOT NULL DEFAULT '0' COMMENT '是否在执行ETL传输 0-否/1-是',
  `is_api_exec` int(2) NOT NULL DEFAULT '0' COMMENT '是否在执行API传输 0-否/1-是',
  `last_trans_time` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '上次传输时间',
  `condition` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '检索条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl实体映射表';

-- ----------------------------
-- Records of sys_etl_entity
-- ----------------------------
INSERT INTO `sys_etl_entity` VALUES ('20bc7463-3629-448d-9369-5631ea394715', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', '42d334dd-4d38-4f59-a52d-cc518a21d843', 'sys_file', '', 'sys_file', 'id', 'id', '', '1541226608272', '1541226608272', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');
INSERT INTO `sys_etl_entity` VALUES ('3452ff33-4418-4b6e-8aec-49c253ac6c44', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', '1272543d-6d99-4733-b71b-4a501d6037ea', 'sys_table', '', 'sys_table', 'id', 'id', '', '1541226633400', '1541226633400', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');
INSERT INTO `sys_etl_entity` VALUES ('76c544f5-a2ce-4433-8761-d09ece065778', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', '0db6791d-137f-4dee-a53f-394c6abe2b88', 'sys_db_file', '', 'sys_db_file', 'id', 'id', '', '1541226582631', '1541226582631', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');
INSERT INTO `sys_etl_entity` VALUES ('9d60f02f-a995-425a-999d-ffe9b94fa84a', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', '77ca5133-f82b-4990-b04d-961168c193bd', 'sys_data_source', '', 'sys_data_source', 'id', 'id', '', '1541226569784', '1541226569784', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');
INSERT INTO `sys_etl_entity` VALUES ('c4f977e5-0081-4508-80a7-e95b567c3c4f', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', 'e1be06f5-6ab6-42b9-8046-f7567845d59b', 'sys_admin', '1bef7824-b2e1-46e8-b8a2-9739d97159bd', 'sys_admin', 'id', 'id', '', '1541226549778', '1541226549778', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');
INSERT INTO `sys_etl_entity` VALUES ('d8778449-cdf9-46ee-935f-86f2ed39d08e', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', '3d74a996-21d6-41c2-99c0-e9d18efa9ef5', 'sys_field', '', 'sys_field', 'id', 'id', '', '1541226594695', '1541226594695', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');
INSERT INTO `sys_etl_entity` VALUES ('e62e8e7e-dc45-432e-b0f1-9fbcd3ee5288', '12988f7a-4342-4b9d-b0ff-e66068de9e2a', 'ef331f15-4f2d-4e51-820a-6f4361bd8a78', 'sys_project', '', 'sys_project', 'id', 'id', '', '1541226621863', '1541226621863', '0', '1', '30', '0', '12', '0', '0', '1', '1', '0', '1970-01-01 00:00:00', '');

-- ----------------------------
-- Table structure for `sys_etl_field`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_field`;
CREATE TABLE `sys_etl_field` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `entity_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '映射实体id，对应etl_entity表的id字段',
  `src_field_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原字段名',
  `des_field_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标字段名',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_esd` (`entity_id`,`src_field_name`,`des_field_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl字段映射表';

-- ----------------------------
-- Records of sys_etl_field
-- ----------------------------
INSERT INTO `sys_etl_field` VALUES ('00b1b180-756e-41c8-9ad4-9b35a0e41763', '20bc7463-3629-448d-9369-5631ea394715', 'file_name', 'file_name', '1541226776899');
INSERT INTO `sys_etl_field` VALUES ('09361b2f-8dd6-4135-a7f4-6e4df3849b2c', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'db_port', 'db_port', '1541226673115');
INSERT INTO `sys_etl_field` VALUES ('12c16923-7865-49e2-8eff-9416cd6a4044', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'prj_id', 'prj_id', '1541226687787');
INSERT INTO `sys_etl_field` VALUES ('15f4d194-3c44-40a8-bf80-a8db62baa770', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'table_id', 'table_id', '1541226755115');
INSERT INTO `sys_etl_field` VALUES ('177c4aa6-1a06-48ca-adf1-942788ce8ccb', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'db_ip', 'db_ip', '1541226669075');
INSERT INTO `sys_etl_field` VALUES ('190bdeee-2a78-4dbe-8acd-9b7cb3be4bd1', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'precisions', 'precisions', '1541226743355');
INSERT INTO `sys_etl_field` VALUES ('19e4742e-44b6-4770-a862-40692163229e', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'status', 'status', '1541226833288');
INSERT INTO `sys_etl_field` VALUES ('1b00bc45-c88e-4fc0-8326-5461b669181c', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'data_sync_time', 'data_sync_time', '1541226820787');
INSERT INTO `sys_etl_field` VALUES ('24d84524-91a0-4546-b19e-317d02061461', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'sync_time', 'sync_time', '1541226752962');
INSERT INTO `sys_etl_field` VALUES ('254eb3ea-b3b0-4d73-acdf-7d9730140f90', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'id', 'id', '1541226825740');
INSERT INTO `sys_etl_field` VALUES ('2a21f618-af8d-43f1-902f-45e24a8e2e86', 'c4f977e5-0081-4508-80a7-e95b567c3c4f', 'id', 'id', '1541226648982');
INSERT INTO `sys_etl_field` VALUES ('2aa1e724-c190-4b3d-bc2f-b25cd7d89feb', '20bc7463-3629-448d-9369-5631ea394715', 'create_time', 'create_time', '1541226772531');
INSERT INTO `sys_etl_field` VALUES ('2b724e9d-f45f-43a3-813f-17a1351d9d15', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'create_time', 'create_time', '1541226667116');
INSERT INTO `sys_etl_field` VALUES ('2b8fad95-585a-490d-b37d-aec2bb73c167', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'create_time', 'create_time', '1541226819117');
INSERT INTO `sys_etl_field` VALUES ('2dcffe67-72d4-40ed-927e-e2d02d8b25bd', '20bc7463-3629-448d-9369-5631ea394715', 'file_path', 'file_path', '1541226781267');
INSERT INTO `sys_etl_field` VALUES ('2ef9fb19-9f02-4c77-a8f5-38e3351ece12', '20bc7463-3629-448d-9369-5631ea394715', 'storage_root_path', 'storage_root_path', '1541226795164');
INSERT INTO `sys_etl_field` VALUES ('3422c8c3-0d9b-45a2-8a1c-715fa4a4e02b', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'update_time', 'update_time', '1541226838002');
INSERT INTO `sys_etl_field` VALUES ('34e030a9-ed15-4182-871c-097640f4e801', '20bc7463-3629-448d-9369-5631ea394715', 'file_size', 'file_size', '1541226783018');
INSERT INTO `sys_etl_field` VALUES ('36b314c6-0104-4af1-ad1f-002160b25345', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'status', 'status', '1541226690259');
INSERT INTO `sys_etl_field` VALUES ('3d266c38-f8b9-4a02-a617-7b4ed83720a3', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'local_db_name', 'local_db_name', '1541226682898');
INSERT INTO `sys_etl_field` VALUES ('43037e87-5cdc-4cf8-bf92-355a52a3c1c5', 'c4f977e5-0081-4508-80a7-e95b567c3c4f', 'username', 'username', '1541226655459');
INSERT INTO `sys_etl_field` VALUES ('4385fe4f-3cb0-46df-bbec-db84680d8b67', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'required_col', 'required_col', '1541226748034');
INSERT INTO `sys_etl_field` VALUES ('469ec631-bef9-4283-8fce-22805d84ffa4', '20bc7463-3629-448d-9369-5631ea394715', 'id', 'id', '1541226786874');
INSERT INTO `sys_etl_field` VALUES ('47b2b107-5a82-4b77-9331-78fda20131d0', '20bc7463-3629-448d-9369-5631ea394715', 'file_status', 'file_status', '1541226784882');
INSERT INTO `sys_etl_field` VALUES ('4ca050cb-3d19-4e21-ad37-dcc2bb367538', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'update_time', 'update_time', '1541226703442');
INSERT INTO `sys_etl_field` VALUES ('4f60e7eb-ea66-420a-93e5-7c05d87cb7d7', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'create_time', 'create_time', '1541226731069');
INSERT INTO `sys_etl_field` VALUES ('4faf108e-05ef-49bc-a4d2-04899c5cf47d', '76c544f5-a2ce-4433-8761-d09ece065778', 'storage_root_path', 'storage_root_path', '1541226721827');
INSERT INTO `sys_etl_field` VALUES ('4fbbcdc8-4972-4f5d-a071-f6368bc31fbc', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'db_pwd', 'db_pwd', '1541226675796');
INSERT INTO `sys_etl_field` VALUES ('507fbf9f-a1f3-4a31-ba70-c00e14aaf500', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'len', 'len', '1541226736845');
INSERT INTO `sys_etl_field` VALUES ('5127a7c2-6a5a-43cf-baf4-fe3c482dc98a', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'sys_db_pwd', 'sys_db_pwd', '1541226696170');
INSERT INTO `sys_etl_field` VALUES ('549e05a6-e76c-4a50-b115-045809984bfd', 'e62e8e7e-dc45-432e-b0f1-9fbcd3ee5288', 'status', 'status', '1541226809427');
INSERT INTO `sys_etl_field` VALUES ('553b6c2f-e390-499b-97ff-241c44d44a20', '20bc7463-3629-448d-9369-5631ea394715', 'date_path', 'date_path', '1541226774867');
INSERT INTO `sys_etl_field` VALUES ('55440caa-3f0d-4cd1-9033-d7d7f06dc5ee', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'sync_time', 'sync_time', '1541226692650');
INSERT INTO `sys_etl_field` VALUES ('588c0ac3-e7f1-41b3-833e-e5c5c9955173', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'name', 'name', '1541226738827');
INSERT INTO `sys_etl_field` VALUES ('5f0c8a29-6e35-49d4-8ebc-cfd071139e47', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'exist_sys_time', 'exist_sys_time', '1541226824051');
INSERT INTO `sys_etl_field` VALUES ('5fc3b84b-4a49-469a-a1e8-4c4411b30f2a', 'e62e8e7e-dc45-432e-b0f1-9fbcd3ee5288', 'create_time', 'create_time', '1541226805286');
INSERT INTO `sys_etl_field` VALUES ('625d2260-984e-43f5-936f-31cb770e7dbb', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'name', 'name', '1541226685200');
INSERT INTO `sys_etl_field` VALUES ('7239cc17-ef50-473c-8331-83fd98b69397', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'sys_db_username', 'sys_db_username', '1541226698810');
INSERT INTO `sys_etl_field` VALUES ('75a49e17-09f1-42f1-aa7b-4da02554415f', 'e62e8e7e-dc45-432e-b0f1-9fbcd3ee5288', 'name', 'name', '1541226811414');
INSERT INTO `sys_etl_field` VALUES ('86ba83b1-3195-4ce5-b902-d2a765b93583', '20bc7463-3629-448d-9369-5631ea394715', 'project_id', 'project_id', '1541226788954');
INSERT INTO `sys_etl_field` VALUES ('89b05a8a-f8e5-416e-af51-4ea56d4de61a', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'db_username', 'db_username', '1541226678211');
INSERT INTO `sys_etl_field` VALUES ('8cf7d6ed-f669-4715-9873-ce000d1686a9', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'need_gen_ktr_file', 'need_gen_ktr_file', '1541226831307');
INSERT INTO `sys_etl_field` VALUES ('97743032-2b1b-4a8d-abbb-f056241df0ae', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'update_time', 'update_time', '1541226759171');
INSERT INTO `sys_etl_field` VALUES ('9cb2589f-111a-4a96-b0ed-ee4ad4c08ae5', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'sync_time', 'sync_time', '1541226835938');
INSERT INTO `sys_etl_field` VALUES ('9cb9b7a7-9692-4752-9a92-1650ec0a8f5d', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'name', 'name', '1541226829275');
INSERT INTO `sys_etl_field` VALUES ('ae157603-709f-4210-b6e5-2025939e3bca', 'e62e8e7e-dc45-432e-b0f1-9fbcd3ee5288', 'id', 'id', '1541226807259');
INSERT INTO `sys_etl_field` VALUES ('b2046741-8645-4fe7-83b0-f514d81b4c5a', 'c4f977e5-0081-4508-80a7-e95b567c3c4f', 'mag_type', 'mag_type', '1541226651851');
INSERT INTO `sys_etl_field` VALUES ('b245b517-df8b-4ad2-b09c-9991fade1d69', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'db_name', 'db_name', '1541226670995');
INSERT INTO `sys_etl_field` VALUES ('b4db14f4-a2f4-41fb-bafa-20f000a1fb93', '20bc7463-3629-448d-9369-5631ea394715', 'client_ip_address', 'client_ip_address', '1541226770078');
INSERT INTO `sys_etl_field` VALUES ('b9f91668-a469-457c-bc02-256a0e7a1a07', '20bc7463-3629-448d-9369-5631ea394715', 'root_name', 'root_name', '1541226791628');
INSERT INTO `sys_etl_field` VALUES ('be34f5a3-9b37-4155-af8d-5960c442fc76', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'id', 'id', '1541226680843');
INSERT INTO `sys_etl_field` VALUES ('bedcf21e-5649-45db-a499-3e768fb43669', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'position', 'position', '1541226741163');
INSERT INTO `sys_etl_field` VALUES ('c7b95a4b-8d6d-47f4-bd3e-38b1efa4c0c9', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'type', 'type', '1541226757051');
INSERT INTO `sys_etl_field` VALUES ('cb7ae1d3-f763-44f5-866e-cdee74d7a4e1', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'type', 'type', '1541226701163');
INSERT INTO `sys_etl_field` VALUES ('d941ff25-c4b0-46eb-88f0-64c4f86b247f', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'key_chg', 'key_chg', '1541226827435');
INSERT INTO `sys_etl_field` VALUES ('da27eb4a-2ccf-4d94-86cb-c01afafe53ff', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'identity_col', 'identity_col', '1541226734732');
INSERT INTO `sys_etl_field` VALUES ('df3fe47d-51a1-4f4e-983d-21890b15e372', '76c544f5-a2ce-4433-8761-d09ece065778', 'create_time', 'create_time', '1541226711294');
INSERT INTO `sys_etl_field` VALUES ('e10e4bff-e469-4486-851f-e905f4e9cf1b', '20bc7463-3629-448d-9369-5631ea394715', 'upload_time', 'upload_time', '1541226798827');
INSERT INTO `sys_etl_field` VALUES ('e12ca027-200e-4e51-9e52-74ae47b6efa7', '76c544f5-a2ce-4433-8761-d09ece065778', 'id', 'id', '1541226718459');
INSERT INTO `sys_etl_field` VALUES ('e3de6810-e033-451d-90de-c694f8c0fe45', 'c4f977e5-0081-4508-80a7-e95b567c3c4f', 'pwd', 'pwd', '1541226653539');
INSERT INTO `sys_etl_field` VALUES ('e735ada8-6a45-4d5f-9523-0c7596ef5d91', '76c544f5-a2ce-4433-8761-d09ece065778', 'status', 'status', '1541226720123');
INSERT INTO `sys_etl_field` VALUES ('e74ae44d-54d9-4139-9f49-f981e1edda9e', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'id', 'id', '1541226732804');
INSERT INTO `sys_etl_field` VALUES ('ed4f3d1e-2073-4a1d-b834-d7591c081df8', '3452ff33-4418-4b6e-8aec-49c253ac6c44', 'ds_id', 'ds_id', '1541226822403');
INSERT INTO `sys_etl_field` VALUES ('f13b551a-41a2-4382-a25b-ddd9c487357f', '76c544f5-a2ce-4433-8761-d09ece065778', 'file_size', 'file_size', '1541226716324');
INSERT INTO `sys_etl_field` VALUES ('f1edb956-cbe7-4cd1-9ecc-6e1690532efc', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'status', 'status', '1541226750195');
INSERT INTO `sys_etl_field` VALUES ('f99c53ea-7053-4ddb-86a5-266e9e60d2ea', 'd8778449-cdf9-46ee-935f-86f2ed39d08e', 'pri_key', 'pri_key', '1541226746032');
INSERT INTO `sys_etl_field` VALUES ('fdf3d013-9f4b-4893-9df0-ddff8fc8cb97', '9d60f02f-a995-425a-999d-ffe9b94fa84a', 'alive', 'alive', '1541226664765');
INSERT INTO `sys_etl_field` VALUES ('fe4ac7dd-c631-4a39-bab5-b3daeb45c9f7', '76c544f5-a2ce-4433-8761-d09ece065778', 'file_name', 'file_name', '1541226713005');

-- ----------------------------
-- Table structure for `sys_etl_project`
-- ----------------------------
DROP TABLE IF EXISTS `sys_etl_project`;
CREATE TABLE `sys_etl_project` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `prj_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `src_db_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '源数据id',
  `des_db_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '目标数据源id',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否有效 0-是/1-否',
  `create_time` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='etl项目表';

-- ----------------------------
-- Records of sys_etl_project
-- ----------------------------
INSERT INTO `sys_etl_project` VALUES ('12988f7a-4342-4b9d-b0ff-e66068de9e2a', '测试项目', '1ec31d3e-f54e-46fe-9288-e6c9bec3b28e', 'b92b829b-866c-4b02-b190-1c1c5a6fd911', '0', '1541226498567');
