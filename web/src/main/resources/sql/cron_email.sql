/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : cron_email

 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 02/25/2017 19:17:48 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `QRTZ_CRON_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('ClusterScheduler', 'task1', 'group1', '0 * * * * ?', 'Asia/Shanghai'), ('ClusterScheduler', 'task11', 'group1', '0 * * * * ?', 'Asia/Shanghai'), ('ClusterScheduler', 'totalTest', 'test', '0 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `QRTZ_JOB_DETAILS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('ClusterScheduler', 'task1', 'group1', null, 'com.dark.service.cron.SyncJobFactory', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372001a636f6d2e6461726b2e6d6f64656c2e5363686564756c654a6f62650d652a2692f95402000a4c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e00094c0004656349647400134c6a6176612f6c616e672f496e74656765723b4c0009676d744372656174657400104c6a6176612f7574696c2f446174653b4c0009676d744d6f6469667971007e000b4c0006697353796e637400134c6a6176612f6c616e672f426f6f6c65616e3b4c00086a6f6247726f757071007e00094c00076a6f624e616d6571007e00094c000d7363686564756c654a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000673746174757371007e0009787074000b30202a202a202a202a203f74000474657374737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000b7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000015a2869fb037871007e0015737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174000667726f7570317400057461736b317372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e0012000000000000000a740001317800), ('ClusterScheduler', 'task11', 'group1', null, 'com.dark.service.cron.SyncJobFactory', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372001a636f6d2e6461726b2e6d6f64656c2e5363686564756c654a6f62650d652a2692f95402000a4c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e00094c0004656349647400134c6a6176612f6c616e672f496e74656765723b4c0009676d744372656174657400104c6a6176612f7574696c2f446174653b4c0009676d744d6f6469667971007e000b4c0006697353796e637400134c6a6176612f6c616e672f426f6f6c65616e3b4c00086a6f6247726f757071007e00094c00076a6f624e616d6571007e00094c000d7363686564756c654a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000673746174757371007e0009787074000b30202a202a202a202a203f70737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000b7070737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174000667726f7570317400067461736b31317372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e0011000000000000000a740001307800), ('ClusterScheduler', 'totalTest', 'test', null, 'com.dark.service.cron.SyncJobFactory', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372001a636f6d2e6461726b2e6d6f64656c2e5363686564756c654a6f62650d652a2692f95402000a4c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c000b6465736372697074696f6e71007e00094c0004656349647400134c6a6176612f6c616e672f496e74656765723b4c0009676d744372656174657400104c6a6176612f7574696c2f446174653b4c0009676d744d6f6469667971007e000b4c0006697353796e637400134c6a6176612f6c616e672f426f6f6c65616e3b4c00086a6f6247726f757071007e00094c00076a6f624e616d6571007e00094c000d7363686564756c654a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000673746174757371007e0009787074000b30202a202a202a202a203f70737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000d7070737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578700174000474657374740009746f74616c546573747372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c75657871007e0011000000000000000b740001307800);
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `QRTZ_LOCKS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('ClusterScheduler', 'STATE_ACCESS'), ('ClusterScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `QRTZ_SCHEDULER_STATE`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('ClusterScheduler', '192.168.0.1031488019709830', '1488021467316', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `QRTZ_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('ClusterScheduler', 'task1', 'group1', 'task1', 'group1', null, '1487562660000', '1487562633712', '5', 'PAUSED', 'CRON', '1486736718000', '0', null, '0', ''), ('ClusterScheduler', 'task11', 'group1', 'task11', 'group1', null, '1488020400000', '-1', '5', 'PAUSED', 'CRON', '1488020369000', '0', null, '0', ''), ('ClusterScheduler', 'totalTest', 'test', 'totalTest', 'test', null, '1488020400000', '-1', '5', 'PAUSED', 'CRON', '1488020374000', '0', null, '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `SCHEDULE_JOB`
-- ----------------------------
DROP TABLE IF EXISTS `SCHEDULE_JOB`;
CREATE TABLE `SCHEDULE_JOB` (
  `schedule_job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `job_group` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `is_sync` varchar(1) NOT NULL,
  `ec_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_job_id`),
  UNIQUE KEY `sj_name_group` (`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SCHEDULE_JOB`
-- ----------------------------
BEGIN;
INSERT INTO `SCHEDULE_JOB` VALUES ('10', 'task11', 'group1', '0', '0 * * * * ?', '1', '11', 'test', '2017-02-10 22:25:19', '2017-02-20 14:57:06'), ('11', 'totalTest', 'test', '0', '0 * * * * ?', '1', '13', null, null, '2017-02-23 15:33:44');
COMMIT;

-- ----------------------------
--  Table structure for `cron_meta_datasource`
-- ----------------------------
DROP TABLE IF EXISTS `cron_meta_datasource`;
CREATE TABLE `cron_meta_datasource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据源ID',
  `name` varchar(50) NOT NULL COMMENT '数据源名称',
  `driver_class` varchar(100) NOT NULL COMMENT '数据源驱动类',
  `jdbc_url` varchar(500) NOT NULL COMMENT '数据源连接字符串(JDBC)',
  `user` varchar(50) NOT NULL COMMENT '数据源登录用户名',
  `password` varchar(100) NOT NULL COMMENT '数据源登录密码',
  `queryer_class` varchar(100) NOT NULL COMMENT '获取报表引擎查询器类名',
  `pool_class` varchar(100) NOT NULL COMMENT '报表引擎查询器使用的数据源连接池类名',
  `options` varchar(1000) NOT NULL COMMENT '数据源配置选项(JSON格式）',
  `comment` varchar(100) DEFAULT NULL COMMENT '说明备注',
  `gmt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='数据源配置信息表';

-- ----------------------------
--  Records of `cron_meta_datasource`
-- ----------------------------
BEGIN;
INSERT INTO `cron_meta_datasource` VALUES ('20', 'cronEmail', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3306/cron_email?characterEncoding=UTF-8', 'root', 'bobcat', 'com.dark.engine.query.MySqlQueryer', 'com.dark.engine.dbpool.DruidDataSourcePool', '{\"initialSize\":3,\"maxActive\":20,\"minIdle\":1,\"maxWait\":60000,\"timeBetweenEvictionRunsMillis\":60000,\"minEvictableIdleTimeMillis\":300000,\"testWhileIdle\":true,\"testOnBorrow\":false,\"testOnReturn\":false,\"maxOpenPreparedStatements\":20,\"removeAbandoned\":true,\"removeAbandonedTimeout\":1800,\"logAbandoned\":true}', 'test', '2017-02-24 19:44:41', '2017-02-25 18:50:01');
COMMIT;

-- ----------------------------
--  Table structure for `email_config`
-- ----------------------------
DROP TABLE IF EXISTS `email_config`;
CREATE TABLE `email_config` (
  `ec_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_id` int(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `receivers` varchar(200) DEFAULT NULL,
  `email_cc` varchar(200) DEFAULT NULL,
  `email_bcc` varchar(200) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `back_user` varchar(20) DEFAULT NULL,
  `gmt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ec_id`),
  KEY `f_backuser` (`back_user`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='邮件模板表';

-- ----------------------------
--  Records of `email_config`
-- ----------------------------
BEGIN;
INSERT INTO `email_config` VALUES ('11', '11', '3173579082@qq.com', '854338217@qq.com', '', '', '【动态】测试邮件', 'anddark', '2017-02-15 23:26:59', '2017-02-25 18:59:08'), ('13', '36', '3173579082@qq.com', '854338217@qq.com', '', '', '【静态】测试邮件', null, '2017-02-23 15:23:49', '2017-02-25 18:58:57');
COMMIT;

-- ----------------------------
--  Table structure for `template_config`
-- ----------------------------
DROP TABLE IF EXISTS `template_config`;
CREATE TABLE `template_config` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `save_path` varchar(100) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `content` text,
  `back_user` varchar(20) DEFAULT NULL,
  `sql_sentence` varchar(2000) DEFAULT NULL,
  `sql_source_id` int(10) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `gmt_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tc_id`),
  KEY `f_backuser` (`back_user`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
--  Records of `template_config`
-- ----------------------------
BEGIN;
INSERT INTO `template_config` VALUES ('11', '动态模板', null, null, null, '表格数据测试：\n<table cellspacing=\"0\" bordercolordark=\"#efefef\" bordercolorlight=\"#333333\" border=\"1\">\n    <tbody>\n    <tr bgcolor=\"#cccccc\">\n        <td>名称</td>\n        <td>备注</td>\n    </tr>\n        #foreach($rows in $table1)\n        <tr>\n            #foreach($row in $rows)\n                <td>$row</td>\n            #end\n        </tr>\n        #end\n    </tbody>\n</table>\n<br>\n非表格数据测试：\n#foreach($rows in $table2)\n  <tr>\n	#foreach($row in $rows)\n	<td>$row</td>\n	#end\n  </tr>\n#end', 'anddark', 'select name, comment from template_config LIMIT 10;\nselect count(*) from template_config;', '20', '动态模板，使用数据源查询来的数据', '2017-02-15 23:30:18', '2017-02-25 19:17:09'), ('36', '静态模板', null, null, null, '<p>\n	stestsdfaf asdf&nbsp;\n</p>\n<p style=\"text-align:center;\">\n	fasfsadfds\n</p>', null, null, null, '静态模板测试，不带后台参数', '2017-02-16 14:31:16', '2017-02-25 18:58:19');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;