/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 50633
 Source Host           : localhost
 Source Database       : seezoon-framework

 Target Server Type    : MySQL
 Target Server Version : 50633
 File Encoding         : utf-8

 Date: 04/19/2018 16:14:48 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `demo_test`
-- ----------------------------
DROP TABLE IF EXISTS `demo_test`;
CREATE TABLE `demo_test` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `demo_test`
-- ----------------------------
BEGIN;
INSERT INTO `demo_test` VALUES ('73732982e99e452080c6c4c9c0d56700', '1', '1', '1', '2018-03-31 17:35:18', '1', '2018-03-31 17:35:18', null), ('8f6aad7cf16d44b3b9c88531fd9845c3', 'hello world', '110', '1', '2018-03-31 16:03:33', '1', '2018-03-31 16:03:33', null), ('94e6dd74ac9a476b9f4ccdbf5aa838f6', 'hello world', '110', '1', '2018-03-31 16:16:06', '1', '2018-03-31 16:16:06', null), ('a4684c01e4e04ccd900fc36bab5d3208', 'hello world', '110', '1', '2018-04-02 23:50:11', '1', '2018-04-02 23:50:11', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parent_id` varchar(32) NOT NULL COMMENT '父部门',
  `parent_ids` varchar(2000) NOT NULL COMMENT '父ids，按层级逗号分隔',
  `name` varchar(100) NOT NULL COMMENT '部门名称',
  `sort` int(10) NOT NULL COMMENT '排序',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `sys_dict_parent_id` (`parent_id`),
  KEY `sys_dict_parent_ids` (`parent_ids`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='机构表';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('12edb119120949bfb8717a5136c00bdd', 'fd3df3592662424ebbea1c4f92bbf4a0', '0,fd3df3592662424ebbea1c4f92bbf4a0', '总经办', '10', '1', '2018-04-17 20:51:02', '1', '2018-04-17 20:51:02', ''), ('fd3df3592662424ebbea1c4f92bbf4a0', '0', '0,', '上征科技有限公司', '10', '1', '2018-04-17 20:50:54', '1', '2018-04-17 20:50:54', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `type` varchar(50) NOT NULL COMMENT '字典类型',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` char(1) NOT NULL COMMENT '是否启用1：是，0：否',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `sys_dict_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='机构表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('305454e07215411a8019998f49f6574d', 'yes_no', '1', '是', '12', '1', '1', '2018-04-05 18:30:36', '1', '2018-04-07 17:38:00', ''), ('7696b22fec6548bbaf034a2d91889c07', 'yes_no', '0', '否', '11', '1', '1', '2018-04-06 08:43:50', '1', '2018-04-06 08:43:50', ''), ('9320f1dabe1948c3af76d0ae89bb6a1f', 'sys_user_type', '0', '系统管理员', '10', '1', '1', '2018-04-07 16:48:51', '1', '2018-04-15 00:13:37', ''), ('fd59350df7314c3d94cfd686d8fa1032', 'sys_user_type', '1', '普通用户', '10', '1', '1', '2018-04-07 16:49:04', '1', '2018-04-15 00:13:41', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `content_type` varchar(100) NOT NULL COMMENT '文件类型',
  `file_size` int(11) NOT NULL,
  `relative_path` varchar(200) NOT NULL COMMENT '地址',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `sys_create_time` (`create_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `parent_id` varchar(32) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(10) NOT NULL COMMENT '排序',
  `href` varchar(200) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '目标',
  `type` varchar(2) NOT NULL COMMENT '0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('0cbc3253fc1148c894cc954acfebdd92', '2112b91ae0ce4f8db8af99d304bca35c', '0,2b3712ac51b3440589a64bd6b12440832112b91ae0ce4f8db8af99d304bca35c', '删除', '10', null, null, '2', null, '1', 'sys:menu:delete', '1', '2018-04-19 14:47:47', '1', '2018-04-19 14:47:47', null), ('0f030bf647b146e6873a3bb177d6fa90', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '角色管理', '2', '/pages/sys/role.html', 'main', '1', 'fa fa-fw fa-user-secret', '1', 'sys:role:qry', '1', '2018-04-15 00:07:38', '1', '2018-04-19 14:32:29', null), ('0f42afb2182f423f8f203276058d1fe2', '11691595d4324f2f88d1f883d18f4e04', '0,2b3712ac51b3440589a64bd6b124408311691595d4324f2f88d1f883d18f4e04', '删除', '10', null, null, '2', null, '1', 'sys:dict:delete', '1', '2018-04-19 15:00:12', '1', '2018-04-19 15:14:36', null), ('11691595d4324f2f88d1f883d18f4e04', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '字典管理', '5', '/pages/sys/dict.html', 'main', '1', 'fa fa-fw fa-database', '1', 'sys:dict:qry', '1', '2018-04-15 00:09:12', '1', '2018-04-19 14:56:03', null), ('2112b91ae0ce4f8db8af99d304bca35c', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '菜单管理', '4', '/pages/sys/menu.html', 'main', '1', 'fa fa-fw fa-tasks', '1', 'sys:menu:qry', '1', '2018-04-15 00:08:16', '1', '2018-04-19 14:46:59', null), ('2b3712ac51b3440589a64bd6b1244083', '0', '0,', '系统管理', '2', null, null, '0', 'fa fa-fw fa-cogs', '1', '', '1', '2018-04-15 00:05:08', '1', '2018-04-16 20:41:55', null), ('3266e16218e94fb28d8c6342c4ddbc61', '0f030bf647b146e6873a3bb177d6fa90', '0,2b3712ac51b3440589a64bd6b12440830f030bf647b146e6873a3bb177d6fa90', '添加', '10', null, null, '2', null, '1', 'sys:role:save', '1', '2018-04-19 14:36:23', '1', '2018-04-19 14:36:23', null), ('3693fa53ff7c4146abc444230e5eb4b4', 'b916f2a5c9b84b98be54f829010ab5c8', '0,2b3712ac51b3440589a64bd6b1244083b916f2a5c9b84b98be54f829010ab5c8', '修改', '2', null, null, '2', null, '1', 'sys:user:update', '1', '2018-04-16 21:48:05', '1', '2018-04-16 21:48:05', null), ('4845ecff299945679383569e97f863c4', '11691595d4324f2f88d1f883d18f4e04', '0,2b3712ac51b3440589a64bd6b124408311691595d4324f2f88d1f883d18f4e04', '修改', '10', null, null, '2', null, '1', 'sys:dict:update', '1', '2018-04-19 15:00:01', '1', '2018-04-19 15:00:01', null), ('50646379e4ec4c299cde89f5eee3ca16', 'b916f2a5c9b84b98be54f829010ab5c8', '0,2b3712ac51b3440589a64bd6b1244083b916f2a5c9b84b98be54f829010ab5c8', '删除', '10', null, null, '2', null, '1', 'sys:user:delete', '1', '2018-04-16 21:51:02', '1', '2018-04-16 21:51:02', null), ('5333b205d4044feab756c6ac6561ab05', '2112b91ae0ce4f8db8af99d304bca35c', '0,2b3712ac51b3440589a64bd6b12440832112b91ae0ce4f8db8af99d304bca35c', '修改', '10', null, null, '2', null, '1', 'sys:menu:update', '1', '2018-04-19 14:47:34', '1', '2018-04-19 14:47:34', null), ('69baa5b46caf433093ff69ed533a8c0e', '0f030bf647b146e6873a3bb177d6fa90', '0,2b3712ac51b3440589a64bd6b12440830f030bf647b146e6873a3bb177d6fa90', '删除', '10', null, null, '2', null, '1', 'sys:role:delete', '1', '2018-04-19 14:36:48', '1', '2018-04-19 14:36:48', null), ('7ba079aaa4054300aeabd0e4c3055bf8', '87bfa91d5d78468695adea15b6e20b38', '0,2b3712ac51b3440589a64bd6b124408387bfa91d5d78468695adea15b6e20b38', '修改', '10', null, null, '2', null, '1', 'sys:param:update', '1', '2018-04-19 15:06:27', '1', '2018-04-19 15:06:27', null), ('7e644586cd144c9bb2f9819ad9a64718', '2112b91ae0ce4f8db8af99d304bca35c', '0,2b3712ac51b3440589a64bd6b12440832112b91ae0ce4f8db8af99d304bca35c', '添加', '10', null, null, '2', null, '1', 'sys:menu:save', '1', '2018-04-19 14:47:12', '1', '2018-04-19 14:47:12', null), ('8059bd699a4444a0aaa2e103b0daada2', '87bfa91d5d78468695adea15b6e20b38', '0,2b3712ac51b3440589a64bd6b124408387bfa91d5d78468695adea15b6e20b38', '添加', '10', null, null, '2', null, '1', 'sys:param:save', '1', '2018-04-19 15:05:58', '1', '2018-04-19 15:05:58', null), ('87bfa91d5d78468695adea15b6e20b38', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '系统参数', '10', '/pages/sys/param.html', 'main', '1', 'fa fa-fw fa-houzz', '1', 'sys:param:qry', '1', '2018-04-15 00:10:05', '1', '2018-04-19 14:56:03', null), ('8e175bbb35494b6e9c74b64ab6ec0ce0', 'b916f2a5c9b84b98be54f829010ab5c8', '0,2b3712ac51b3440589a64bd6b1244083b916f2a5c9b84b98be54f829010ab5c8', '添加', '1', null, null, '2', null, '1', 'sys:user:save', '1', '2018-04-16 21:47:42', '1', '2018-04-16 21:47:42', null), ('a25c853c31db4361914c824a0773cc07', '0f030bf647b146e6873a3bb177d6fa90', '0,2b3712ac51b3440589a64bd6b12440830f030bf647b146e6873a3bb177d6fa90', '修改', '10', null, null, '2', null, '1', 'sys:role:update', '1', '2018-04-19 14:36:37', '1', '2018-04-19 14:36:37', null), ('a2a24773907f4f43856f7bbd2a9df767', '87bfa91d5d78468695adea15b6e20b38', '0,2b3712ac51b3440589a64bd6b124408387bfa91d5d78468695adea15b6e20b38', '删除', '10', null, null, '2', null, '0', 'sys:param:delete', '1', '2018-04-19 15:06:39', '1', '2018-04-19 15:13:53', null), ('a33f081dcb7a439b96dad4e7a1e89e27', '11691595d4324f2f88d1f883d18f4e04', '0,2b3712ac51b3440589a64bd6b124408311691595d4324f2f88d1f883d18f4e04', '添加', '10', null, null, '2', null, '1', 'sys:dict:save', '1', '2018-04-19 14:59:49', '1', '2018-04-19 14:59:49', null), ('b916f2a5c9b84b98be54f829010ab5c8', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '用户管理', '1', '/pages/sys/user.html', 'main', '1', 'fa fa-fw fa-user', '1', 'sys:user:qry', '1', '2018-04-15 00:05:46', '1', '2018-04-16 21:54:12', null), ('b9f8b111a6c34a2a8ce42e280f7e3a33', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '文件管理', '10', '/pages/sys/file.html', 'main', '1', 'fa fa-fw fa-file', '1', 'sys:file:qry', '1', '2018-04-15 21:44:01', '1', '2018-04-19 14:56:03', null), ('c27147c97283488f8787aea546e55f30', 'ec9045a36aab42bf9d33a0587ab956a7', '0,2b3712ac51b3440589a64bd6b1244083ec9045a36aab42bf9d33a0587ab956a7', '添加', '10', null, null, '2', null, '1', 'sys:dept:save', '1', '2018-04-19 14:40:21', '1', '2018-04-19 14:40:21', null), ('e3b5184f60534bd4a3843e916fd361e8', 'ec9045a36aab42bf9d33a0587ab956a7', '0,2b3712ac51b3440589a64bd6b1244083ec9045a36aab42bf9d33a0587ab956a7', '删除', '10', null, null, '2', null, '1', 'sys:dept:delete', '1', '2018-04-19 14:40:54', '1', '2018-04-19 14:40:54', null), ('eb4d200652b44122ad10fb98dbbc4cf5', 'b9f8b111a6c34a2a8ce42e280f7e3a33', '0,2b3712ac51b3440589a64bd6b1244083b9f8b111a6c34a2a8ce42e280f7e3a33', '上传', '10', null, null, '2', null, '1', 'sys:file:upload', '1', '2018-04-19 15:09:07', '1', '2018-04-19 15:09:07', null), ('ec9045a36aab42bf9d33a0587ab956a7', '2b3712ac51b3440589a64bd6b1244083', '0,2b3712ac51b3440589a64bd6b1244083', '部门管理', '3', '/pages/sys/dept.html', 'main', '1', 'fa fa-fw fa-cubes', '1', 'sys:dept:qry', '1', '2018-04-15 00:06:37', '1', '2018-04-19 14:39:14', null), ('f6c0677f7e004d75aba2984c70122640', 'ec9045a36aab42bf9d33a0587ab956a7', '0,2b3712ac51b3440589a64bd6b1244083ec9045a36aab42bf9d33a0587ab956a7', '修改', '10', null, null, '2', null, '1', 'sys:dept:update', '1', '2018-04-19 14:40:36', '1', '2018-04-19 14:40:36', null), ('f95bcb9b445549d5910e904476185ebf', 'b9f8b111a6c34a2a8ce42e280f7e3a33', '0,2b3712ac51b3440589a64bd6b1244083b9f8b111a6c34a2a8ce42e280f7e3a33', '删除', '10', null, null, '2', null, '1', 'sys:file:delete', '1', '2018-04-19 15:07:51', '1', '2018-04-19 15:07:51', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `param_key` varchar(50) NOT NULL COMMENT '键',
  `param_value` varchar(100) NOT NULL COMMENT '值',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_param_type` (`param_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `data_scope` char(1) NOT NULL COMMENT '数据范围,0:全部，1：本部门，2：本部门及以下，3.本人',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型，业务扩展用',
  `status` varchar(1) DEFAULT NULL COMMENT '状态1：正常，0：禁用',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_login_name` (`login_name`) USING BTREE,
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '12edb119120949bfb8717a5136c00bdd', 'admin', '2a576f34b098c24b4406bf0d5fa7cd31493f94df58ebe5b978435d1d5e5eab7a', 'rNBdNtjuefmwLGzXjHoN', '管理员', '121212', '/2018/04/16/e82d1a7bdb7343e7a27b4f1ecc9dae0c.jpg', '21221@qq.com', '0', '1', '1', '2017-12-29 14:22:04', '1', '2018-04-17 20:51:12', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_bak`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_bak`;
CREATE TABLE `sys_user_bak` (
  `id` varchar(32) NOT NULL COMMENT '编号',
  `dept_id` varchar(32) DEFAULT NULL COMMENT '部门',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `salt` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮件',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型，业务扩展用',
  `status` varchar(1) DEFAULT NULL COMMENT '状态1：正常，0：禁用',
  `create_by` varchar(32) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_dept_id` (`dept_id`) USING BTREE,
  KEY `sys_user_login_name` (`login_name`) USING BTREE,
  KEY `sys_user_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) NOT NULL COMMENT '用户编号',
  `role_id` varchar(32) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

SET FOREIGN_KEY_CHECKS = 1;
