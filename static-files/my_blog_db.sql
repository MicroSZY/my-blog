/*
 Navicat Premium Data Transfer

 Source Server         : tencent
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 132.232.115.11:3306
 Source Schema         : my_blog_db

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 06/11/2019 23:09:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user`  (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
INSERT INTO `tb_admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'szy', 0);

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog`  (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客内容',
  `blog_category_id` int(11) NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '博客标签',
  `blog_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-草稿 1-发布',
  `blog_views` bigint(20) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `enable_comment` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------
INSERT INTO `tb_blog` VALUES (1, 'mysql获取两个时间之间的小时列表和日期列表', '', 'http://132.232.115.11/admin/dist/img/rand/27.jpg', '1.获取两个时间之间的所有小时列表\n```sql\nSELECT\n@num := @num + 1 AS num,\nDATE_FORMAT(ADDDATE( #{startTime} , INTERVAL @num HOUR ), \'%Y-%m-%d %H\' ) AS date\nFROM\nlg_dict,\n( SELECT @num := -1 ) t\nWHERE\nADDDATE( #{startTime}, INTERVAL @num HOUR ) <= DATE_FORMAT( #{endTime} , \'%Y-%m-%d %H\' )\n```\n\n2.获取两个时间之间的所有日期列表\n```sql\nSELECT\nDATE_FORMAT( ADDDATE( #{startTime} , INTERVAL @d + 1 DAY ), \'%Y-%m-%d\' ) AS date,\n@d := @d + 1 DAY\nFROM lg_dict,\n( SELECT @d := -1 ) temp\nWHERE\nADDDATE( #{startTime}, INTERVAL @d DAY ) <= DATE_FORMAT( #{endTime} , \'%Y-%m-%d\' )\nORDER BY DAY\n```', 1, '随笔', 'sql', 1, 6, 0, 0, '2019-09-30 20:55:26', '2019-09-30 20:55:26');
INSERT INTO `tb_blog` VALUES (2, 'WebMvcConfigurationSupport和WebMvcConfigurer的区别', '', 'http://132.232.115.11/admin/dist/img/rand/37.jpg', 'spring 拦截器配置类，继承WebMvcConfigurationSupport是自带 \n```java\n@EnableWebMvc\n```\n注解的，会对jackson的全局配置产生影响，WebMvcConfigurer   加上\n```java\n@EnableWebMvc\n```\n就是 WebMvcConfigurationSupport', 1, '随笔', 'springBoot', 1, 5, 0, 0, '2019-09-30 21:02:25', '2019-09-30 21:02:25');
INSERT INTO `tb_blog` VALUES (3, 'idea项目启动报错：Error running \'ServiceStarter\'', '', 'http://132.232.115.11/admin/dist/img/rand/16.jpg', '报错内容:\nError running \'ServiceStarter\': Command line is too long. Shorten command line for ServiceStarter or also for Application default configuration.\n\n解法:\n修改项目下 .idea\\workspace.xml，找到标签\n```xml\n<component name=\"PropertiesComponent\">\n```\n在标签里加一行\n```xml\n<property name=\"dynamic.classpath\" value=\"true\" />\n```', 1, '随笔', 'idea', 1, 4, 0, 0, '2019-09-30 21:05:14', '2019-09-30 21:05:14');
INSERT INTO `tb_blog` VALUES (4, '我是szy', 'about', 'http://132.232.115.11/admin/dist/img/rand/33.jpg', '## About me\n\n我是szy，一名Java开发者，技术一般，经历平平，但是也一直渴望进步，同时也努力活着，为了人生不留遗憾，也希望能够一直做着自己喜欢的事情，得闲时分享心得、分享一些浅薄的经验，等以后老得不能再老了，就说故事已经讲完了,不去奢求圆满。\n\n相信浏览这段话的你也知道，学习是一件极其枯燥而无聊的过程，甚至有时候显得很无助，我也想告诉你，成长就是这样一件残酷的事情，任何成功都不是一蹴而就，需要坚持、需要付出、需要你的毅力，短期可能看不到收获，因为破茧成蝶所耗费的时间不是一天。\n\n## Contact\n\n- 我的邮箱：853323110@qq.com\n- QQ技术交流群：暂无\n- 我的网站：http://www.tech-diandi.com\n\n## Quote\n\n- Steve Jobs\n\n> Stay hungry,Stay foolish\n\n- Kahlil Gibran\n\n>The FIRST TIME WHEN I saw her being meek that she might attain height.<br>\nThe SECOND TIME WHEN I saw her limping BEFORE the crippled.<br>\nThe third TIME WHEN she was given TO choose BETWEEN the hard AND the easy, AND she chose the easy.<br>\nThe fourth TIME WHEN she COMMITTED a wrong, AND comforted herself that others also COMMIT wrong.<br>\nThe fifth TIME WHEN she forbore FOR weakness, AND attributed her patience TO strength.<br>\nThe sixth TIME WHEN she despised the ugliness of a face, AND knew NOT that it was ONE of her own masks.<br>\nAND the seventh TIME WHEN she sang a song of praise, AND deemed it a virtue.', 1, '随笔', '世界上有一个很可爱的人,现在这个人就在看这句话', 1, 223, 0, 0, '2017-03-12 00:31:15', '2018-11-12 00:31:15');

-- ----------------------------
-- Table structure for tb_blog_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_category`;
CREATE TABLE `tb_blog_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类的图标',
  `category_rank` int(11) NOT NULL DEFAULT 1 COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_category
-- ----------------------------
INSERT INTO `tb_blog_category` VALUES (1, '随笔', '/admin/dist/img/category/06.png', 11, 0, '2019-09-30 20:53:00');

-- ----------------------------
-- Table structure for tb_blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_comment`;
CREATE TABLE `tb_blog_comment`  (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联的blog主键',
  `commentator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '评论提交时间',
  `commentator_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '回复时间',
  `comment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tag`;
CREATE TABLE `tb_blog_tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_tag
-- ----------------------------
INSERT INTO `tb_blog_tag` VALUES (1, 'sql', 0, '2019-09-30 20:55:29');
INSERT INTO `tb_blog_tag` VALUES (2, 'springBoot', 0, '2019-09-30 20:58:34');
INSERT INTO `tb_blog_tag` VALUES (3, 'netty', 0, '2019-09-30 20:58:52');
INSERT INTO `tb_blog_tag` VALUES (4, 'idea', 0, '2019-09-30 21:05:15');
INSERT INTO `tb_blog_tag` VALUES (5, '世界上有一个很可爱的人', 0, '2019-09-30 21:18:04');
INSERT INTO `tb_blog_tag` VALUES (6, '现在这个人就在看这句话', 0, '2019-09-30 21:18:04');

-- ----------------------------
-- Table structure for tb_blog_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tag_relation`;
CREATE TABLE `tb_blog_tag_relation`  (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(20) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_tag_relation
-- ----------------------------
INSERT INTO `tb_blog_tag_relation` VALUES (4, 4, 5, '2019-09-30 21:18:05');
INSERT INTO `tb_blog_tag_relation` VALUES (5, 4, 6, '2019-09-30 21:18:05');
INSERT INTO `tb_blog_tag_relation` VALUES (8, 1, 1, '2019-09-30 21:19:39');
INSERT INTO `tb_blog_tag_relation` VALUES (10, 3, 4, '2019-10-16 14:47:24');
INSERT INTO `tb_blog_tag_relation` VALUES (11, 2, 2, '2019-10-16 14:49:06');

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config`  (
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`config_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES ('footerAbout', 'diandi blog. have fun.', '2018-11-11 20:33:23', '2019-11-06 11:29:56');
INSERT INTO `tb_config` VALUES ('footerCopyRight', '2019 szy', '2018-11-11 20:33:31', '2019-11-06 11:29:57');
INSERT INTO `tb_config` VALUES ('footerICP', '浙ICP备17008806号-3', '2018-11-11 20:33:27', '2019-11-06 11:29:57');
INSERT INTO `tb_config` VALUES ('footerPoweredBy', 'https://github.com/MicroSZY', '2018-11-11 20:33:36', '2019-11-06 11:29:57');
INSERT INTO `tb_config` VALUES ('footerPoweredByURL', 'https://github.com/MicroSZY', '2018-11-11 20:33:39', '2019-11-06 11:29:57');
INSERT INTO `tb_config` VALUES ('websiteDescription', '点滴博客是SpringBoot2+Thymeleaf+Mybatis建造的个人博客网站.SpringBoot实战博客源码.个人博客搭建', '2018-11-11 20:33:04', '2019-09-23 10:46:19');
INSERT INTO `tb_config` VALUES ('websiteIcon', '/admin/dist/img/diandi.png', '2018-11-11 20:33:11', '2019-09-23 10:46:19');
INSERT INTO `tb_config` VALUES ('websiteLogo', '/admin/dist/img/diandi.png', '2018-11-11 20:33:08', '2019-09-23 10:46:19');
INSERT INTO `tb_config` VALUES ('websiteName', '点 滴', '2018-11-11 20:33:01', '2019-09-23 10:46:18');
INSERT INTO `tb_config` VALUES ('yourAvatar', '/admin/dist/img/13.png', '2018-11-11 20:33:14', '2019-09-30 13:22:38');
INSERT INTO `tb_config` VALUES ('yourEmail', '853323110@qq.com', '2018-11-11 20:33:17', '2019-09-30 13:22:38');
INSERT INTO `tb_config` VALUES ('yourName', 'szy', '2018-11-11 20:33:20', '2019-09-30 13:22:38');

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link`  (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站链接',
  `link_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站描述',
  `link_rank` int(11) NOT NULL DEFAULT 0 COMMENT '用于列表排序',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
