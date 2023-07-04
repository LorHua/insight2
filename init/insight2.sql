/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : localhost:3306
 Source Schema         : insight2

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 03/06/2023 15:53:38
*/

CREATE DATABASE if not exists insight2 character set utf8;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'crediteaseitsec';
GRANT All privileges ON *.* TO 'root'@'localhost';
USE insight2;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apptype` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `sec_level` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `check_time` double NOT NULL,
  `offonline_time` double NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  `sec_owner` int(11) NOT NULL,
  `sensitive_data_count` int(11) NOT NULL,
  `sensitive_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secure_level` int(11) NOT NULL,
  `business_cata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `downtime` int(11) NOT NULL,
  `is_open` int(11) NOT NULL,
  `is_interface` int(11) NOT NULL,
  `is_https` int(11) NOT NULL,
  `eid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `crontab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `op_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `app_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES (1, '5ef18f7f10e58fa3f8889c43', '漏洞整改系统后台', 20, 40, 40, 1, 10, '', 1685776815.90376, 1685776815.90376, 1685776815.90376, 1685776815.90376, 1, 0, '', 0, '', 0, 1, 0, 1, '', '', '');
INSERT INTO `app` VALUES (2, '5ee1988ef59da6a8b48a7cea', '漏洞整改系统', 20, 20, 20, 1, 10, '', 1685776815.82516, 1685776815.7210178, 1685776815.7210178, 1685776815.7210178, 1, 30, '', 0, '', 20, 0, 0, 0, '', '', '');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` int(11) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish_time` double NOT NULL,
  `publish_datetime` datetime(0) NOT NULL,
  `modify_time` double NOT NULL,
  `status` int(11) NOT NULL,
  `cover` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type` int(11) NOT NULL,
  `raw_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md_raw_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '5de76148152e93ac81d8000e', 'Zookeeper未授权访问漏洞', 'Zookeeper未授权访问漏洞', 10, 'admin@example.cn', 1685776815, '2023-06-03 14:57:57', 1685776815, 1, '', '', 1, '', '| **漏洞类型** | **影响组件** | **危害程度**        |\r\n| ------------ | ------------ | ------------------- |\r\n| 未授权访问   | zookeeper    | 高危                |\r\n| **CVE**      | **发现时间** | **对应poc**         |\r\n| 无           | 无           | Zookeeper_unauth.py |\r\n\r\n## 漏洞描述\r\n\r\n#### 影响版本\r\n\r\n&emsp;&emsp;&emsp;&emsp;全版本\r\n\r\n#### 检查项目\r\n\r\n&emsp;&emsp;&emsp;&emsp;Zookeeper未授权访问\r\n\r\n#### 相关链接\r\n\r\n&emsp;&emsp;&emsp;&emsp;https://yq.aliyun.com/articles/616751\r\n\r\n&emsp;&emsp;&emsp;&emsp;http://zookeeper.apache.org/doc/r3.1.2/zookeeperProgrammers.html#sc_ZooKeeperAccessControl\r\n\r\n## 漏洞详情\r\n\r\n&emsp;&emsp;&emsp;&emsp;zookeeper是分布式协同管理工具，常用来管理系统配置信息，提供分布式协同服务。\r\n\r\n&emsp;&emsp;&emsp;&emsp;使用时只要知道zookeeper服务端的IP和Port，任务用户或者客户端根本不需要任何的认证就可以连上zookeeper的服务端，并且可以对znode进行增删等操作。这样数据是非常不安全的，极易被攻击和篡改。但zookeeper服务端目前不支持连接时认证。\r\n\r\n&emsp;&emsp;&emsp;&emsp;为了保障ZooKeeper的数据安全，提供了一套完整的ACL(Access Control List)权限控制机制来保障数据的安全。 \r\n\r\n## 修复建议\r\n\r\n&emsp;&emsp;&emsp;&emsp;使用zookeeper提供的ADL权限控制机制，详细请参考：\r\n\r\n&emsp;&emsp;&emsp;&emsp;https://www.cnblogs.com/ilovena/p/9484522.html', '<p>| <strong>漏洞类型<\\/strong> | <strong>影响组件<\\/strong> | <strong>危害程度<\\/strong>        |\n| ------------ | ------------ | ------------------- |\n| 未授权访问   | zookeeper    | 高危                |\n| <strong>CVE<\\/strong>      | <strong>发现时间<\\/strong> | <strong>对应poc<\\/strong>         |\n| 无           | 无           | <a href=\"http://Zookeeper_unauth.py\" rel=\"nofollow\">Zookeeper_unauth.py<\\/a> |<\\/p>\n<h2>漏洞描述<\\/h2>\n影响版本\n<p>    全版本<\\/p>\n检查项目\n<p>    Zookeeper未授权访问<\\/p>\n相关链接\n<p>    <a href=\"https://yq.aliyun.com/articles/616751\" rel=\"nofollow\">https://yq.aliyun.com/articles/616751<\\/a><\\/p>\n<p>    <a href=\"http://zookeeper.apache.org/doc/r3.1.2/zookeeperProgrammers.html#sc_ZooKeeperAccessControl\" rel=\"nofollow\">http://zookeeper.apache.org/doc/r3.1.2/zookeeperProgrammers.html#sc_ZooKeeperAccessControl<\\/a><\\/p>\n<h2>漏洞详情<\\/h2>\n<p>    zookeeper是分布式协同管理工具，常用来管理系统配置信息，提供分布式协同服务。<\\/p>\n<p>    使用时只要知道zookeeper服务端的IP和Port，任务用户或者客户端根本不需要任何的认证就可以连上zookeeper的服务端，并且可以对znode进行增删等操作。这样数据是非常不安全的，极易被攻击和篡改。但zookeeper服务端目前不支持连接时认证。<\\/p>\n<p>    为了保障ZooKeeper的数据安全，提供了一套完整的ACL(Access Control List)权限控制机制来保障数据的安全。 <\\/p>\n<h2>修复建议<\\/h2>\n<p>    使用zookeeper提供的ADL权限控制机制，详细请参考：<\\/p>\n<p>    <a href=\"https://www.cnblogs.com/ilovena/p/9484522.html\" rel=\"nofollow\">https://www.cnblogs.com/ilovena/p/9484522.html<\\/a><\\/p>');
INSERT INTO `article` VALUES (2, '5de76148152e93ac81d8000c', 'ZabbixGuest账户未禁用', 'ZabbixGuest账户未禁用', 10, 'admin@example.cn', 1685776815, '2023-06-03 14:57:57', 1685776815, 1, '', '', 1, '', '| **漏洞类型** | **影响组件** | **危害程度**           |\r\n| ------------ | ------------ | ---------------------- |\r\n| 未授权访问   | Zabbix       | 中危                   |\r\n| **CVE**      | **发现时间** | **对应poc**            |\r\n| 无           | 无           | zabbix_guest_enable.py |\r\n\r\n## 漏洞描述\r\n\r\n#### 影响版本\r\n\r\n&emsp;&emsp;&emsp;&emsp;全版本\r\n\r\n#### 检查项目\r\n\r\n&emsp;&emsp;&emsp;&emsp;Guest账户是否启用\r\n\r\n#### 相关链接\r\n\r\n&emsp;&emsp;&emsp;&emsp;无\r\n\r\n## 漏洞详情\r\n\r\n&emsp;&emsp;&emsp;&emsp;zabbix是一个基于WEB界面的提供分布式系统监视以及网络监视功能的企业级的开源解决方案。\r\n\r\n&emsp;&emsp;&emsp;&emsp;zabbix能监视各种网络参数，保证服务器系统的安全运营；并提供灵活的通知机制以让系统管理员快速定位/解决存在的各种问题。\r\n\r\n&emsp;&emsp;&emsp;&emsp;zabbix在安装后默认guest账号开放，密码为空登录，只能看到zabbix后台，存在安全隐患，需要将guest账户禁用。\r\n\r\n## 修复建议\r\n\r\n&emsp;&emsp;&emsp;&emsp;禁用guest账户', '<p>| <strong>漏洞类型<\\/strong> | <strong>影响组件<\\/strong> | <strong>危害程度<\\/strong>           |\n| ------------ | ------------ | ---------------------- |\n| 未授权访问   | Zabbix       | 中危                   |\n| <strong>CVE<\\/strong>      | <strong>发现时间<\\/strong> | <strong>对应poc<\\/strong>            |\n| 无           | 无           | <a href=\"http://zabbix_guest_enable.py\" rel=\"nofollow\">zabbix_guest_enable.py<\\/a> |<\\/p>\n<h2>漏洞描述<\\/h2>\n影响版本\n<p>    全版本<\\/p>\n检查项目\n<p>    Guest账户是否启用<\\/p>\n相关链接\n<p>    无<\\/p>\n<h2>漏洞详情<\\/h2>\n<p>    zabbix是一个基于WEB界面的提供分布式系统监视以及网络监视功能的企业级的开源解决方案。<\\/p>\n<p>    zabbix能监视各种网络参数，保证服务器系统的安全运营；并提供灵活的通知机制以让系统管理员快速定位/解决存在的各种问题。<\\/p>\n<p>    zabbix在安装后默认guest账号开放，密码为空登录，只能看到zabbix后台，存在安全隐患，需要将guest账户禁用。<\\/p>\n<h2>修复建议<\\/h2>\n<p>    禁用guest账户<\\/p>');

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_open` int(11) NOT NULL,
  `is_https` int(11) NOT NULL,
  `apptype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asset
-- ----------------------------
INSERT INTO `asset` VALUES (1, '647ae474796bf233ccc2644e', 1, 'dev.example.com', 'dev.example.com', '10', 1, 1, '10', 0, 1685776815.0837734, 1685776815.0837734);
INSERT INTO `asset` VALUES (2, '647ae474796bf233ccc2644f', 2, 'sit.example.cn', 'pb.example.cn', '10', 1, 1, '10', 0, 1685776815.0837734, 1685776815.0837734);
INSERT INTO `asset` VALUES (3, '647ae9af105c00d2b32cba4d', 0, '微信银行', 'wx.com.cn', '10', 1, 1, '10', 0, 1685776815.0837734, 1685776815.0837734);

-- ----------------------------
-- Table structure for authmode
-- ----------------------------
DROP TABLE IF EXISTS `authmode`;
CREATE TABLE `authmode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enable` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authmode
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '5de76127152e93ac81d7edce', '技术分享', 1685776815.06172);
INSERT INTO `category` VALUES (2, '5de76127152e93ac81d7edd1', '内部系统说明文档', 1685776815.07003);
INSERT INTO `category` VALUES (3, '5de76127152e93ac81d7edd2', '部门安全规范制度', 1685776815.07267);
INSERT INTO `category` VALUES (4, '5de76127152e93ac81d7edd3', '漏洞知识库', 1685776815.07571);
INSERT INTO `category` VALUES (5, '5de76127152e93ac81d7edd4', '公司安全规范制度', 1685776815.07829);
INSERT INTO `category` VALUES (6, '5de76127152e93ac81d7edd5', '漏洞解决方案', 1685776815.0808);

-- ----------------------------
-- Table structure for crontab
-- ----------------------------
DROP TABLE IF EXISTS `crontab`;
CREATE TABLE `crontab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `eid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `crontab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relate_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enable` int(11) NOT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exec_count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `log` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  `last_time` double NOT NULL,
  `next_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crontab
-- ----------------------------

-- ----------------------------
-- Table structure for crontablog
-- ----------------------------
DROP TABLE IF EXISTS `crontablog`;
CREATE TABLE `crontablog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `crontab_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `start_time` double NOT NULL,
  `end_time` double NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crontablog
-- ----------------------------

-- ----------------------------
-- Table structure for extension
-- ----------------------------
DROP TABLE IF EXISTS `extension`;
CREATE TABLE `extension`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `config_template` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of extension
-- ----------------------------

-- ----------------------------
-- Table structure for extensionlog
-- ----------------------------
DROP TABLE IF EXISTS `extensionlog`;
CREATE TABLE `extensionlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_id` int(11) NOT NULL,
  `is_auto` int(11) NOT NULL,
  `op_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of extensionlog
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'odguz8c0bf9tj65va1lsywnq', '资讯科技部', 'IT部门',1685770531.8030846, 1685770531.8030846);

-- ----------------------------
-- Table structure for center
-- ----------------------------
DROP TABLE IF EXISTS `center`;
CREATE TABLE `center`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `center_owner_id`(`owner_id`) USING BTREE,
  INDEX `center_department_id`(`department_id`) USING BTREE,
  CONSTRAINT `center_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `center_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of center
-- ----------------------------
INSERT INTO `center` VALUES (1, 'g9drzmly0no4qkpct6uwsbe3', '研发中心', '研发中心描述', 1, 0, 1, 1685770531.8030846, 1685770531.8030846);


-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `center_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `update_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_owner_id`(`owner_id`) USING BTREE,
  INDEX `group_center_id`(`center_id`) USING BTREE,
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `group_ibfk_2` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (1, '647addf93024bd1f97074aba', '研发管理组', '研发管理组描述', 1, 0, 1, 1685770531.8030846, 1685770531.8030846);
INSERT INTO `group` VALUES (2, '647addf93024bd1f97074abb', '平台开发一组', '平台开发一组描述', 1, 0, 1, 1685770531.8030846, 1685770531.8030846);
INSERT INTO `group` VALUES (3, '647ae400796bf233ccc2643c', '平台开发二组', '平台开发二组描述', 1, 0, 1, 1685775360.1087263, 1685775360.1087263);
INSERT INTO `group` VALUES (4, '647ae400796bf233ccc2643d', '应用开发一组', '应用开发一组描述', 1, 0, 1, 1685770531.8030846, 1685770531.8030846);
INSERT INTO `group` VALUES (5, '647ae400796bf233ccc2643e', '应用开发二组', '应用开发二组描述', 1, 0, 1, 1685775360.1087263, 1685775360.1087263);
INSERT INTO `group` VALUES (6, '647ae400796bf233ccc2643f', '应用开发三组', '应用开发三组描述', 1, 0, 1, 1685775360.1087263, 1685775360.1087263);
INSERT INTO `group` VALUES (7, '647ae400796bf233ccc2643g', '应用开发四组', '应用开发四组描述', 1, 0, 1, 1685770531.8030846, 1685770531.8030846);
INSERT INTO `group` VALUES (8, '647ae400796bf233ccc2643h', '应用开发五组', '应用开发五组描述', 1, 0, 1, 1685775360.1087263, 1685775360.1087263);

-- ----------------------------
-- Table structure for groupuser
-- ----------------------------
DROP TABLE IF EXISTS `groupuser`;
CREATE TABLE `groupuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `groupuser_user_id`(`user_id`) USING BTREE,
  INDEX `groupuser_group_id`(`group_id`) USING BTREE,
  INDEX `groupuser_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `groupuser_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `groupuser_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `groupuser_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groupuser
-- ----------------------------
INSERT INTO `groupuser` VALUES (1, '5ec6379fff8390854aea563e', 1, 1, 1, 1685770531.8030846);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token_enable` int(11) NOT NULL,
  `is_del` int(11) NOT NULL COMMENT '是否禁用',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `enable` int(11) NOT NULL COMMENT '启用开关',
  `ldap_online` int(11) NOT NULL,
  `ldap_offline_time` double NOT NULL,
  `auth_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证来源',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `group_id` int(11) NOT NULL COMMENT '组别ID',
  `create_time` double NOT NULL COMMENT '创建时间',
  `update_time` double NOT NULL COMMENT '更新时间',
  `active_time` double NOT NULL COMMENT '启用时间',
  `login_time` double NOT NULL COMMENT '登录时间',
  `total_points` int(11) NOT NULL COMMENT '总分数',
  `frozen_points` int(11) NOT NULL COMMENT '冻结分数',
  `available_points` int(11) NOT NULL COMMENT '可用分数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_username`(`username`) USING BTREE,
  INDEX `user_role_id`(`role_id`) USING BTREE,
  INDEX `user_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '5ec6379fff8390854aea563c', 'admin', '', '', '', 1, 0, '', '5a5b38e564f273246cc0cc7a02f3f675', 1, 0, 0, 'LOCAL', 1, 1, 1685770531.8030846, 1685770531.8030846, 1685777966.2040966, 0, 0, 0, 0);
INSERT INTO `user` VALUES (2, '647aea31105c00d2b32cba4e', '001010459', '', '', '', 1, 0, '', '5a5b38e564f273246cc0cc7a02f3f675', 1, 0, 0, 'LOCAL', 5, 3, 1685776945.7590842, 1685776945.7590842, 1685776945.7590842, 0, 0, 0, 0);


-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int(11) NOT NULL,
  `accesses` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL,
  `default` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '5ec6379fff8390854aea5639', '超级管理员', 0, 'action.app.AppAdd,action.app.AppDel,action.app.AppGet,action.app.AppList,action.app.AppExConfig,action.article.ArticleUpsert,action.article.ArticleDel,action.category.CategoryUpsert,action.category.CategoryDel,action.assets.AssetAdd,action.assets.AssetDel,action.assets.AssetGet,action.assets.AssetList,action.assets.AssetAll,action.assets.AssetImport,action.auditing.AuditingIgnore,action.auditing.AuditingReject,action.auditing.AuditingUndo,action.auditing.AuditingConfirm,action.auditing.AuditingFixed,action.authmode.AuthModeUpsert,action.authmode.AuthModeDel,action.authmode.AuthModeList,action.authmode.AuthModeAll,action.authmode.AuthModeTest,action.crontab.CronTabAdd,action.crontab.CronTabDel,action.crontab.CronTabEnable,action.crontab.CronTabReset,action.crontab.CronTabGet,action.crontab.CronTabList,action.crontab.CronTabnRun,action.crontab.CrontabCalendar,action.crontab.CronTabLogList,action.docs.LogList,action.docs.InitDB,action.docs.ExampleData,action.system.SystemConfigGet,action.system.SystemConfig,action.system.SystemMailConfig,action.system.SystemVulConfig,action.extension.ExtensionUpload,action.extension.ExtensionDel,action.extension.ExtensionEnable,action.extension.ExtensionList,action.extension.ExtensionDownload,action.extension.ExtensionConfig,action.extension.ExtensionLogAdd,action.extension.ExtensionLogList,action.extension.ExtensionCrontabCalendar,action.group.GroupUpsert,action.group.GroupDel,action.group.GroupOwnerSet,action.group.GroupList,action.group.GroupChildList,action.groupuser.GroupUserUpsert,action.groupuser.GroupUserDel,action.groupuser.GroupUserList,action.point.PointFrozen,action.point.PointUnFrozen,action.point.PointReward,action.point.PointList,action.point.PointLog,action.role.RoleAdd,action.role.RoleDefault,action.role.RoleDel,action.role.RoleList,action.user.UserAdd,action.user.UserDel,action.user.UserList,action.user.LdapSearch,action.user.UserClear,action.vul.VulDelay,action.vul.VulSendNotificationEmail,action.vul.VulList,action.vul.VulExport,action.vul.VulImport,action.vullog.VulLogDel,action.vullog.VulLogList', '', 0, 0);
INSERT INTO `role` VALUES (2, '5ec6379fff8390854aea563b', '安全审计员', 2, '', '只能看', 1, 0);
INSERT INTO `role` VALUES (3, '647ae68c796bf233ccc26458', '漏洞录入员', 4, 'action.vul.VulImport', '从后管提交漏洞', 0, 0);
INSERT INTO `role` VALUES (4, '647ae505796bf233ccc26454', '分组管理员', 6, '', '主管', 0, 0);
INSERT INTO `role` VALUES (5, '647ae519796bf233ccc26455', '资产负责人', 8, '', '项目经理', 0, 0);
INSERT INTO `role` VALUES (6, '647ae57a796bf233ccc26456', '整改责任人', 10, '', '开发', 0, 0);



-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_to_id`(`to_id`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`to_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for messagepoint
-- ----------------------------
DROP TABLE IF EXISTS `messagepoint`;
CREATE TABLE `messagepoint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_points` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `frozen_points` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `available_points` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messagepoint
-- ----------------------------

-- ----------------------------
-- Table structure for systemsettings
-- ----------------------------
DROP TABLE IF EXISTS `systemsettings`;
CREATE TABLE `systemsettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_auth_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vul_setting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `global_setting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `point_setting` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemsettings
-- ----------------------------
INSERT INTO `systemsettings` VALUES (1, '5ec6379fff8390854aea563f', '', '25', '', '88888888', '', '', NULL, '', NULL, '{\"group_member_limit\": \"10\", \"isCreateGroup\": \"1\", \"isSendEmail\": \"1\"}', '{\"one_level_point\": 1, \"three_level_point\": 1, \"times_level_point\": 1, \"other_level_point\": 1, \"two_level_point\": 1, \"ti_level_point\": 1}', NULL, 'v1.0.0');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for vul
-- ----------------------------
DROP TABLE IF EXISTS `vul`;
CREATE TABLE `vul`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vul_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vul_type` int(11) NOT NULL,
  `vul_level` int(11) NOT NULL,
  `self_rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vul_desc_type` int(11) NOT NULL,
  `vul_poc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vul_poc_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vul_solution` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vul_solution_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_user_id` int(11) NOT NULL,
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(11) NOT NULL,
  `submit_time` double NOT NULL,
  `audit_time` double NOT NULL,
  `notice_time` double NOT NULL,
  `update_time` double NOT NULL,
  `fix_time` double NOT NULL,
  `vul_status` int(11) NOT NULL,
  `asset_level` int(11) NOT NULL,
  `real_rank` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `risk_score` int(11) NOT NULL,
  `left_risk_score` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `vul_source` int(11) NOT NULL,
  `send_msg` int(11) NOT NULL,
  `is_retest` int(11) NOT NULL,
  `layer` int(11) NOT NULL,
  `delay_days` int(11) NOT NULL,
  `delay_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vul
-- ----------------------------
INSERT INTO `vul` VALUES (1, '5ef3306e10e58fa3f8889c8f', 'shiro反序列化漏洞', 20, 0, '17', 0, '> 漏洞链接\n\nhttp://e.test.example.net	\n\n> 漏洞说明\n\n使用了低版本的 apache shiro\n\n使用了默认key：kPH+bIxk5D2deZiIxcaaaA===\n\n> 漏洞证明\n\n参考利用工具：\n\nhttps://github.com/sv3nbeast/ShiroScan\n\n\n\n> 修复建议：\n\n1.升级shiro到1.5.3及以上版本\n\n2.关闭remremberMe\n\n3.修改默认AES key', '<p>> 漏洞链接<\\/p>\n<p>http://e.test.example.net<\\/p>\n<p>> 漏洞说明<\\/p>\n<p>使用了低版本的 apache shiro<\\/p>\n<p>使用了默认key：kPH+bIxk5D2deZiIxcaaaA===<\\/p>\n<p>> 漏洞证明<\\/p>\n<p>参考利用工具：<\\/p>\n<p>https://github.com/sv3nbeast/ShiroScan<\\/p>\n<p>> 修复建议：<\\/p>\n<p>1.升级shiro到1.5.3及以上版本<\\/p>\n<p>2.关闭remremberMe<\\/p>\n<p>3.修改默认AES key<\\/p>', '', '', '', 0, '', 1, 1592995950.64715, 1592995967.37974, 0, 1592995950.64707, 0, 40, 0, 17, 0, 0, 0, 1, 10, 0, 0, 10, 0, '');

-- ----------------------------
-- Table structure for vullog
-- ----------------------------
DROP TABLE IF EXISTS `vullog`;
CREATE TABLE `vullog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vul_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vullog
-- ----------------------------
INSERT INTO `vullog` VALUES (1, '647ae646796bf233ccc26457', 1, 'shiro反序列化漏洞', 1, 'admin', '单个漏洞查询', ' ', 1685775942.8710916);

SET FOREIGN_KEY_CHECKS = 1;
