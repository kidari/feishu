DROP TABLE IF EXISTS user;

CREATE TABLE user
(
	id BIGINT(20) NOT NULL COMMENT '主键ID',
	name VARCHAR(30) NULL DEFAULT NULL COMMENT '姓名',
	age INT(11) NULL DEFAULT NULL COMMENT '年龄',
	email VARCHAR(50) NULL DEFAULT NULL COMMENT '邮箱',
	PRIMARY KEY (id)
);
--工作日信息表
DROP TABLE IF EXISTS work_date;

CREATE TABLE work_date
(
	id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	cal_date timestamp NULL COMMENT '日历时间',
	work_flag int NULL COMMENT '工作日标志（0工作日 1周末 2节假日）',
	PRIMARY KEY (id)
) ;
--打卡任务表
DROP TABLE IF EXISTS clock_task;

CREATE TABLE clock_task
(
	id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	name VARCHAR(50) NULL DEFAULT NULL COMMENT '打卡任务名称',
	task_date timestamp NULL COMMENT '打卡开始时间',
	task_status int NULL DEFAULT 0 COMMENT '打卡任务状态（0不推送 1推送）',
	today_status int NULL DEFAULT 0 COMMENT '今日打卡任务状态（0未打卡 1已打卡）',
	counts int NULL DEFAULT 0 COMMENT '计数统计',
	days int NULL DEFAULT 0 COMMENT '打卡累计天数',
	period int NULL DEFAULT 0 COMMENT '打卡周期（0表示无限）',
	PRIMARY KEY (id)
) ;
--打卡日志信息表
DROP TABLE IF EXISTS clock_info;

CREATE TABLE clock_info
(
	id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	clock_task_id BIGINT(20) NOT NULL COMMENT '打卡任务表ID',
	info_date timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '打卡时间',
	new_count int NULL DEFAULT 0 COMMENT '当天计数',
	PRIMARY KEY (id)
);
--倒计时任务表
DROP TABLE IF EXISTS count_down;

CREATE TABLE count_down
(
	id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	name VARCHAR(50) NULL DEFAULT NULL COMMENT '倒计时任务名称',
	task_date timestamp NULL COMMENT '倒计时任务开始时间',
	task_status int NULL DEFAULT 0 COMMENT '倒计时任务状态（0不推送 1推送）',
	week_count int NULL DEFAULT 0 COMMENT '工作日剩余计数',
	weekend_count int NULL DEFAULT 0 COMMENT '节假日剩余计数',
	day_count int NULL DEFAULT 0 COMMENT '已经过日期计数',
	PRIMARY KEY (id)
) ;
--机器人信息表
DROP TABLE IF EXISTS rob_detail;

CREATE TABLE rob_detail
(
	id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	name VARCHAR(50) NULL DEFAULT NULL COMMENT '机器人名称',
	url VARCHAR(200) NULL DEFAULT NULL COMMENT '机器人webhook地址',
	PRIMARY KEY (id)
) ;