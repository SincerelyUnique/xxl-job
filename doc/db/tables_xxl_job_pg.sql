/*
 Navicat Premium Dump SQL

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 170000 (170000)
 Source Host           : localhost:5432
 Source Catalog        : infradb
 Source Schema         : zeus

 Target Server Type    : PostgreSQL
 Target Server Version : 170000 (170000)
 File Encoding         : 65001

 Date: 13/10/2024 00:16:21
*/


-- ----------------------------
-- Sequence structure for xxl_job_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_group_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_group_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_group_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for xxl_job_info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_info_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_info_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_info_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for xxl_job_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_log_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_log_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for xxl_job_log_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_log_report_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_log_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_log_report_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for xxl_job_logglue_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_logglue_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_logglue_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_logglue_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for xxl_job_registry_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_registry_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_registry_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_registry_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for xxl_job_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "zeus"."xxl_job_user_id_seq";
CREATE SEQUENCE "zeus"."xxl_job_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "zeus"."xxl_job_user_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_group";
CREATE TABLE "zeus"."xxl_job_group" (
  "id" int4 NOT NULL DEFAULT nextval('"zeus".xxl_job_group_id_seq'::regclass),
  "app_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "address_type" int2 NOT NULL DEFAULT 0,
  "address_list" text COLLATE "pg_catalog"."default",
  "update_time" timestamp(6)
)
;
ALTER TABLE "zeus"."xxl_job_group" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_group"."app_name" IS '执行器AppName';
COMMENT ON COLUMN "zeus"."xxl_job_group"."title" IS '执行器名称';
COMMENT ON COLUMN "zeus"."xxl_job_group"."address_type" IS '执行器地址类型：0=自动注册、1=手动录入';
COMMENT ON COLUMN "zeus"."xxl_job_group"."address_list" IS '执行器地址列表，多地址逗号分隔';

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_group" ("id", "app_name", "title", "address_type", "address_list", "update_time") VALUES (1, 'xxl-job-executor-sample', '示例执行器', 1, 'http://192.168.0.110:9998/', '2024-10-12 21:56:25.032');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_info";
CREATE TABLE "zeus"."xxl_job_info" (
  "id" int4 NOT NULL DEFAULT nextval('"zeus".xxl_job_info_id_seq'::regclass),
  "job_group" int4 NOT NULL DEFAULT 0,
  "job_desc" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6),
  "author" varchar(64) COLLATE "pg_catalog"."default",
  "alarm_email" varchar(255) COLLATE "pg_catalog"."default",
  "schedule_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "schedule_conf" varchar(128) COLLATE "pg_catalog"."default",
  "misfire_strategy" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "executor_route_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_block_strategy" varchar(50) COLLATE "pg_catalog"."default",
  "executor_timeout" int4 NOT NULL DEFAULT 0,
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default",
  "glue_updatetime" timestamp(6),
  "child_jobid" varchar(255) COLLATE "pg_catalog"."default",
  "trigger_status" int2 NOT NULL DEFAULT 0,
  "trigger_last_time" int8 NOT NULL DEFAULT 0,
  "trigger_next_time" int8 NOT NULL DEFAULT 0
)
;
ALTER TABLE "zeus"."xxl_job_info" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_info"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "zeus"."xxl_job_info"."author" IS '作者';
COMMENT ON COLUMN "zeus"."xxl_job_info"."alarm_email" IS '报警邮件';
COMMENT ON COLUMN "zeus"."xxl_job_info"."schedule_type" IS '调度类型';
COMMENT ON COLUMN "zeus"."xxl_job_info"."schedule_conf" IS '调度配置，值含义取决于调度类型';
COMMENT ON COLUMN "zeus"."xxl_job_info"."misfire_strategy" IS '调度过期策略';
COMMENT ON COLUMN "zeus"."xxl_job_info"."executor_route_strategy" IS '执行器路由策略';
COMMENT ON COLUMN "zeus"."xxl_job_info"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "zeus"."xxl_job_info"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "zeus"."xxl_job_info"."executor_block_strategy" IS '阻塞处理策略';
COMMENT ON COLUMN "zeus"."xxl_job_info"."executor_timeout" IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN "zeus"."xxl_job_info"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "zeus"."xxl_job_info"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "zeus"."xxl_job_info"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "zeus"."xxl_job_info"."glue_remark" IS 'GLUE备注';
COMMENT ON COLUMN "zeus"."xxl_job_info"."glue_updatetime" IS 'GLUE更新时间';
COMMENT ON COLUMN "zeus"."xxl_job_info"."child_jobid" IS '子任务ID，多个逗号分隔';
COMMENT ON COLUMN "zeus"."xxl_job_info"."trigger_status" IS '调度状态：0-停止，1-运行';
COMMENT ON COLUMN "zeus"."xxl_job_info"."trigger_last_time" IS '上次调度时间';
COMMENT ON COLUMN "zeus"."xxl_job_info"."trigger_next_time" IS '下次调度时间';

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_info" ("id", "job_group", "job_desc", "add_time", "update_time", "author", "alarm_email", "schedule_type", "schedule_conf", "misfire_strategy", "executor_route_strategy", "executor_handler", "executor_param", "executor_block_strategy", "executor_timeout", "executor_fail_retry_count", "glue_type", "glue_source", "glue_remark", "glue_updatetime", "child_jobid", "trigger_status", "trigger_last_time", "trigger_next_time") VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);
INSERT INTO "zeus"."xxl_job_info" ("id", "job_group", "job_desc", "add_time", "update_time", "author", "alarm_email", "schedule_type", "schedule_conf", "misfire_strategy", "executor_route_strategy", "executor_handler", "executor_param", "executor_block_strategy", "executor_timeout", "executor_fail_retry_count", "glue_type", "glue_source", "glue_remark", "glue_updatetime", "child_jobid", "trigger_status", "trigger_last_time", "trigger_next_time") VALUES (2, 1, '测试任务1', '2024-10-12 21:55:24.024', '2024-10-12 22:19:32.279', 'jalen', '', 'CRON', '* 0/1 * * * ?', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2024-10-12 21:55:24.024', '', 0, 0, 0);
INSERT INTO "zeus"."xxl_job_info" ("id", "job_group", "job_desc", "add_time", "update_time", "author", "alarm_email", "schedule_type", "schedule_conf", "misfire_strategy", "executor_route_strategy", "executor_handler", "executor_param", "executor_block_strategy", "executor_timeout", "executor_fail_retry_count", "glue_type", "glue_source", "glue_remark", "glue_updatetime", "child_jobid", "trigger_status", "trigger_last_time", "trigger_next_time") VALUES (3, 1, 'python task', '2024-10-12 22:24:14.162', '2024-10-12 23:34:21.523', 'jalen', '', 'CRON', '* 1 * * * ?', 'DO_NOTHING', 'FIRST', '', 'aaa bbb ccc ddd', 'SERIAL_EXECUTION', 0, 0, 'GLUE_PYTHON', '#!/usr/bin/python
# -*- coding: UTF-8 -*-
import time
import sys

print "xxl-job: hello python"

print "脚本位置：", sys.argv[0]
print "任务参数：", sys.argv[1]
print "分片序号：", sys.argv[2]
print "分片总数：", sys.argv[3]

print "Good bye!"
exit(0)
', 'GLUE代码初始化', '2024-10-12 22:24:14.162', '', 0, 0, 0);
INSERT INTO "zeus"."xxl_job_info" ("id", "job_group", "job_desc", "add_time", "update_time", "author", "alarm_email", "schedule_type", "schedule_conf", "misfire_strategy", "executor_route_strategy", "executor_handler", "executor_param", "executor_block_strategy", "executor_timeout", "executor_fail_retry_count", "glue_type", "glue_source", "glue_remark", "glue_updatetime", "child_jobid", "trigger_status", "trigger_last_time", "trigger_next_time") VALUES (4, 1, 'd', '2024-10-12 23:46:11.417', '2024-10-12 23:46:11.417', 'a', '', 'FIX_RATE', '60', 'DO_NOTHING', 'FIRST', '', '111 222 sss', 'SERIAL_EXECUTION', 0, 0, 'GLUE_SHELL', '#!/bin/bash
echo "xxl-job: hello shell"

echo "脚本位置：$0"
echo "任务参数：$1"
echo "分片序号 = $2"
echo "分片总数 = $3"

echo "Good bye!"
exit 0
', 'GLUE代码初始化', '2024-10-12 23:46:11.417', '', 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_lock";
CREATE TABLE "zeus"."xxl_job_lock" (
  "lock_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "zeus"."xxl_job_lock" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_lock"."lock_name" IS '锁名称';

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_lock" ("lock_name") VALUES ('schedule_lock');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_log";
CREATE TABLE "zeus"."xxl_job_log" (
  "id" int8 NOT NULL DEFAULT nextval('"zeus".xxl_job_log_id_seq'::regclass),
  "job_group" int4 NOT NULL DEFAULT 0,
  "job_id" int4 NOT NULL DEFAULT 0,
  "executor_address" varchar(255) COLLATE "pg_catalog"."default",
  "executor_handler" varchar(255) COLLATE "pg_catalog"."default",
  "executor_param" varchar(512) COLLATE "pg_catalog"."default",
  "executor_sharding_param" varchar(20) COLLATE "pg_catalog"."default",
  "executor_fail_retry_count" int4 NOT NULL DEFAULT 0,
  "trigger_time" timestamp(6),
  "trigger_code" int4 NOT NULL DEFAULT 0,
  "trigger_msg" text COLLATE "pg_catalog"."default",
  "handle_time" timestamp(6),
  "handle_code" int4 NOT NULL DEFAULT 0,
  "handle_msg" text COLLATE "pg_catalog"."default",
  "alarm_status" int2 NOT NULL DEFAULT 0
)
;
ALTER TABLE "zeus"."xxl_job_log" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_log"."job_group" IS '执行器主键ID';
COMMENT ON COLUMN "zeus"."xxl_job_log"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "zeus"."xxl_job_log"."executor_address" IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN "zeus"."xxl_job_log"."executor_handler" IS '执行器任务handler';
COMMENT ON COLUMN "zeus"."xxl_job_log"."executor_param" IS '执行器任务参数';
COMMENT ON COLUMN "zeus"."xxl_job_log"."executor_sharding_param" IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN "zeus"."xxl_job_log"."executor_fail_retry_count" IS '失败重试次数';
COMMENT ON COLUMN "zeus"."xxl_job_log"."trigger_time" IS '调度-时间';
COMMENT ON COLUMN "zeus"."xxl_job_log"."trigger_code" IS '调度-结果';
COMMENT ON COLUMN "zeus"."xxl_job_log"."trigger_msg" IS '调度-日志';
COMMENT ON COLUMN "zeus"."xxl_job_log"."handle_time" IS '执行-时间';
COMMENT ON COLUMN "zeus"."xxl_job_log"."handle_code" IS '执行-状态';
COMMENT ON COLUMN "zeus"."xxl_job_log"."handle_msg" IS '执行-日志';
COMMENT ON COLUMN "zeus"."xxl_job_log"."alarm_status" IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (8, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:40:08.64', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (10, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:40:08.64', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (1, 1, 1, NULL, 'demoJobHandler', '', NULL, 0, '2024-10-12 21:23:08.118', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (5, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:34:51.355', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting error(Connection refused (Connection refused)), for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (2, 1, 1, NULL, 'demoJobHandler', '', NULL, 0, '2024-10-12 21:24:04.73', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (9, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:40:08.641', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (3, 1, 1, 'http://192.168.0.110:8081/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:26:25.09', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8081/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8081/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8081/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (6, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:35:11.785', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting error(Connection refused (Connection refused)), for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (4, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:34:06.905', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting error(Connection refused (Connection refused)), for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (7, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:36:00.16', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (11, 1, 1, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:40:35.551', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (12, 1, 2, 'http://192.168.0.110:8082/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:55:58.76', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:8082/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:8082/<br>code：500<br>msg：xxl-job remoting fail, StatusCode(404) invalid. for url : http://192.168.0.110:8082/run', NULL, 0, NULL, 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (20, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:04.018', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:19:59.341', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (21, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:05.015', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:20:09.39', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (13, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:56:32.722', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 21:56:49.212', 200, '', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (14, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 21:56:52.06', 200, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 21:57:02.187', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (16, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:00.026', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:19:19.151', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (17, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:01.012', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:19:29.199', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (18, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:02.011', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:19:39.243', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (19, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:03.014', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:19:49.315', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (22, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:06.011', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:20:19.428', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (23, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:07.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:20:29.462', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (24, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:08.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:20:39.476', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (15, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:18:59.004', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:19:09.113', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (27, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:11.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:21:09.601', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (28, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:12.005', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:21:19.669', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (29, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:13.016', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:21:29.697', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (30, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:14.011', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:21:39.745', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (31, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:15.011', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:21:49.775', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (32, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:16.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:21:59.814', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (33, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:17.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:22:09.842', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (34, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:18.012', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:22:19.871', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (35, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:19.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:22:29.895', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (36, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:20.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:22:39.933', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (37, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:21.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:22:49.973', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (26, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:10.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:20:59.565', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (41, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:25.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:23:30.136', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (42, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:26.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:23:40.185', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (43, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:27.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:23:50.217', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (44, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:28.013', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:00.259', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (45, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:29.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:10.28', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (46, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:30.01', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:20.322', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (47, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:31.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:30.328', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (48, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:32.015', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:40.385', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (49, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:33.023', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:50.405', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (50, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:34.041', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:25:00.431', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (51, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:35.005', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:25:10.456', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (40, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:24.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:23:20.073', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (25, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:09.008', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:20:49.524', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (38, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:22.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:23:00.015', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (39, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:23.009', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:23:10.04', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (53, 1, 3, 'http://192.168.0.110:9998/', '', '', NULL, 0, '2024-10-12 22:24:20.3', 200, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:24:20.57', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (52, 1, 2, 'http://192.168.0.110:9998/', 'demoJobHandler', '', NULL, 0, '2024-10-12 22:19:36.007', 200, '任务触发类型：Cron触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 22:25:20.486', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (54, 1, 3, 'http://192.168.0.110:9998/', '', '', NULL, 0, '2024-10-12 22:29:49.033', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 22:50:12.42', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (55, 1, 3, 'http://192.168.0.110:9998/', '', '', NULL, 0, '2024-10-12 22:48:21.861', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 22:50:12.435', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (56, 1, 3, 'http://192.168.0.110:9998/', '', 'aaa bbb ccc ddd', NULL, 0, '2024-10-12 23:37:35.205', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 23:39:40.27', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (57, 1, 3, 'http://192.168.0.110:9998/', '', 'aaa bbb ccc ddd', NULL, 0, '2024-10-12 23:40:47.282', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 23:40:52.243', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (58, 1, 3, 'http://192.168.0.110:9998/', '', 'aaa bbb ccc ddd', NULL, 0, '2024-10-12 23:41:14.305', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 23:41:19.56', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (59, 1, 3, 'http://192.168.0.110:9998/', '', 'aaa bbb ccc ddd', NULL, 0, '2024-10-12 23:42:44.942', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 23:43:53.315', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (60, 1, 3, 'http://192.168.0.110:9998/', '', 'aaa bbb ccc ddd', NULL, 0, '2024-10-12 23:44:52.315', 200, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 23:44:55.2', 500, 'script exit value(-1) is failed', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (61, 1, 4, 'http://192.168.0.110:9998/', '', '111 222 sss', NULL, 0, '2024-10-12 23:46:19.487', 200, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 23:46:35.833', 200, '', 0);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (62, 1, 4, 'http://192.168.0.110:9998/', '', '111 222 sss', NULL, 0, '2024-10-12 23:49:22.583', 500, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：500<br>msg：xxl-job remoting error(Read timed out), for url : http://192.168.0.110:9998/run', '2024-10-12 23:52:00.706', 200, '', 2);
INSERT INTO "zeus"."xxl_job_log" ("id", "job_group", "job_id", "executor_address", "executor_handler", "executor_param", "executor_sharding_param", "executor_fail_retry_count", "trigger_time", "trigger_code", "trigger_msg", "handle_time", "handle_code", "handle_msg", "alarm_status") VALUES (63, 1, 4, 'http://192.168.0.110:9998/', '', '111 222 sss', NULL, 0, '2024-10-12 23:54:42.018', 200, '任务触发类型：手动触发<br>调度机器：192.168.0.110<br>执行器-注册方式：手动录入<br>执行器-地址列表：[http://192.168.0.110:9998/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.0.110:9998/<br>code：200<br>msg：null', '2024-10-12 23:59:08.8', 200, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_log_report";
CREATE TABLE "zeus"."xxl_job_log_report" (
  "id" int4 NOT NULL DEFAULT nextval('"zeus".xxl_job_log_report_id_seq'::regclass),
  "trigger_day" timestamp(6),
  "running_count" int4 NOT NULL DEFAULT 0,
  "suc_count" int4 NOT NULL DEFAULT 0,
  "fail_count" int4 NOT NULL DEFAULT 0,
  "update_time" timestamp(6)
)
;
ALTER TABLE "zeus"."xxl_job_log_report" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_log_report"."trigger_day" IS '调度-时间';
COMMENT ON COLUMN "zeus"."xxl_job_log_report"."running_count" IS '运行中-日志数量';
COMMENT ON COLUMN "zeus"."xxl_job_log_report"."suc_count" IS '执行成功-日志数量';
COMMENT ON COLUMN "zeus"."xxl_job_log_report"."fail_count" IS '执行失败-日志数量';

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_log_report" ("id", "trigger_day", "running_count", "suc_count", "fail_count", "update_time") VALUES (4, '2024-10-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO "zeus"."xxl_job_log_report" ("id", "trigger_day", "running_count", "suc_count", "fail_count", "update_time") VALUES (1, '2024-10-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO "zeus"."xxl_job_log_report" ("id", "trigger_day", "running_count", "suc_count", "fail_count", "update_time") VALUES (2, '2024-10-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO "zeus"."xxl_job_log_report" ("id", "trigger_day", "running_count", "suc_count", "fail_count", "update_time") VALUES (3, '2024-10-10 00:00:00', 0, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_logglue";
CREATE TABLE "zeus"."xxl_job_logglue" (
  "id" int4 NOT NULL DEFAULT nextval('"zeus".xxl_job_logglue_id_seq'::regclass),
  "job_id" int4 NOT NULL DEFAULT 0,
  "glue_type" varchar(50) COLLATE "pg_catalog"."default",
  "glue_source" text COLLATE "pg_catalog"."default",
  "glue_remark" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "add_time" timestamp(6),
  "update_time" timestamp(6)
)
;
ALTER TABLE "zeus"."xxl_job_logglue" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_logglue"."job_id" IS '任务，主键ID';
COMMENT ON COLUMN "zeus"."xxl_job_logglue"."glue_type" IS 'GLUE类型';
COMMENT ON COLUMN "zeus"."xxl_job_logglue"."glue_source" IS 'GLUE源代码';
COMMENT ON COLUMN "zeus"."xxl_job_logglue"."glue_remark" IS 'GLUE备注';

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_registry";
CREATE TABLE "zeus"."xxl_job_registry" (
  "id" int4 NOT NULL DEFAULT nextval('"zeus".xxl_job_registry_id_seq'::regclass),
  "registry_group" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "registry_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6)
)
;
ALTER TABLE "zeus"."xxl_job_registry" OWNER TO "postgres";

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_registry" ("id", "registry_group", "registry_key", "registry_value", "update_time") VALUES (1, 'EXECUTOR', 'xxl-job-executor-sample', 'http://192.168.0.110:9999/', '2024-10-12 21:32:46.665');
INSERT INTO "zeus"."xxl_job_registry" ("id", "registry_group", "registry_key", "registry_value", "update_time") VALUES (2, 'EXECUTOR', 'xxl-job-executor-sample', 'http://192.168.0.110:9998/', '2024-10-13 00:09:09.298');
COMMIT;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS "zeus"."xxl_job_user";
CREATE TABLE "zeus"."xxl_job_user" (
  "id" int4 NOT NULL DEFAULT nextval('"zeus".xxl_job_user_id_seq'::regclass),
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role" int2 NOT NULL DEFAULT 0,
  "permission" varchar(255) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "zeus"."xxl_job_user" OWNER TO "postgres";
COMMENT ON COLUMN "zeus"."xxl_job_user"."username" IS '账号';
COMMENT ON COLUMN "zeus"."xxl_job_user"."password" IS '密码';
COMMENT ON COLUMN "zeus"."xxl_job_user"."role" IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN "zeus"."xxl_job_user"."permission" IS '权限：执行器ID列表，多个逗号分割';

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
BEGIN;
INSERT INTO "zeus"."xxl_job_user" ("id", "username", "password", "role", "permission") VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_group_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_info_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_log_id_seq"', 63, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_log_report_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_logglue_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_registry_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"zeus"."xxl_job_user_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_group" ADD CONSTRAINT "xxl_job_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_info" ADD CONSTRAINT "xxl_job_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_lock" ADD CONSTRAINT "xxl_job_lock_pkey" PRIMARY KEY ("lock_name");

-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE INDEX "I_handle_code" ON "zeus"."xxl_job_log" USING btree (
  "handle_code" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "I_trigger_time" ON "zeus"."xxl_job_log" USING btree (
  "trigger_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_log" ADD CONSTRAINT "xxl_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_log_report
-- ----------------------------
CREATE UNIQUE INDEX "i_trigger_day" ON "zeus"."xxl_job_log_report" USING btree (
  "trigger_day" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_log_report" ADD CONSTRAINT "xxl_job_log_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_logglue" ADD CONSTRAINT "xxl_job_logglue_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE INDEX "i_g_k_v" ON "zeus"."xxl_job_registry" USING btree (
  "registry_group" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "registry_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_registry" ADD CONSTRAINT "xxl_job_registry_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table xxl_job_user
-- ----------------------------
CREATE UNIQUE INDEX "i_username" ON "zeus"."xxl_job_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE "zeus"."xxl_job_user" ADD CONSTRAINT "xxl_job_user_pkey" PRIMARY KEY ("id");
