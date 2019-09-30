/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`my_blog_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `my_blog_db`;

/*Table structure for table `generator_test` */

DROP TABLE IF EXISTS `generator_test`;

CREATE TABLE `generator_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `test` varchar(100) NOT NULL COMMENT '测试字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `generator_test` */

/*Table structure for table `jdbc_test` */

DROP TABLE IF EXISTS `jdbc_test`;

CREATE TABLE `jdbc_test` (
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `name` varchar(100) DEFAULT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jdbc_test` */

insert  into `jdbc_test`(`type`,`name`) values ('com.zaxxer.hikari.HikariDataSource','hikari数据源');
insert  into `jdbc_test`(`type`,`name`) values ('org.apache.commons.dbcp2.BasicDataSource','dbcp2数据源');
insert  into `jdbc_test`(`type`,`name`) values ('test','测试类');
insert  into `jdbc_test`(`type`,`name`) values ('类别2','测试类2');

/*Table structure for table `tb_admin_user` */

DROP TABLE IF EXISTS `tb_admin_user`;

CREATE TABLE `tb_admin_user` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin_user` */

insert  into `tb_admin_user`(`admin_user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e','szy',0);

/*Table structure for table `tb_blog` */

DROP TABLE IF EXISTS `tb_blog`;

CREATE TABLE `tb_blog` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext NOT NULL COMMENT '博客内容',
  `blog_category_id` int(11) NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) NOT NULL COMMENT '博客标签',
  `blog_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
  `blog_views` bigint(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `enable_comment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog` */

insert  into `tb_blog`(`blog_id`,`blog_title`,`blog_sub_url`,`blog_cover_image`,`blog_content`,`blog_category_id`,`blog_category_name`,`blog_tags`,`blog_status`,`blog_views`,`enable_comment`,`is_deleted`,`create_time`,`update_time`) values (1,'我是szy','about','/admin/dist/img/rand/33.jpg','## About me\n\n我是szy，一名Java开发者，技术一般，经历平平，但是也一直渴望进步，同时也努力活着，为了人生不留遗憾，也希望能够一直做着自己喜欢的事情，得闲时分享心得、分享一些浅薄的经验，等以后老得不能再老了，就说故事已经讲完了,不去奢求圆满。\n\n相信浏览这段话的你也知道，学习是一件极其枯燥而无聊的过程，甚至有时候显得很无助，我也想告诉你，成长就是这样一件残酷的事情，任何成功都不是一蹴而就，需要坚持、需要付出、需要你的毅力，短期可能看不到收获，因为破茧成蝶所耗费的时间不是一天。\n\n## Contact\n\n- 我的邮箱：2449207463@qq.com\n- QQ技术交流群：796794009\n- 我的网站：http://13blog.site\n\n## Quote\n\n- Steve Jobs\n\n> Stay hungry,Stay foolish\n\n- Kahlil Gibran\n\n>The FIRST TIME WHEN I saw her being meek that she might attain height.<br>\nThe SECOND TIME WHEN I saw her limping BEFORE the crippled.<br>\nThe third TIME WHEN she was given TO choose BETWEEN the hard AND the easy, AND she chose the easy.<br>\nThe fourth TIME WHEN she COMMITTED a wrong, AND comforted herself that others also COMMIT wrong.<br>\nThe fifth TIME WHEN she forbore FOR weakness, AND attributed her patience TO strength.<br>\nThe sixth TIME WHEN she despised the ugliness of a face, AND knew NOT that it was ONE of her own masks.<br>\nAND the seventh TIME WHEN she sang a song of praise, AND deemed it a virtue.',20,'About','世界上有一个很可爱的人,现在这个人就在看这句话',1,219,0,0,'2017-03-12 00:31:15','2018-11-12 00:31:15');

/*Table structure for table `tb_blog_category` */

DROP TABLE IF EXISTS `tb_blog_category`;

CREATE TABLE `tb_blog_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) NOT NULL COMMENT '分类的图标',
  `category_rank` int(11) NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_blog_category` */

/*Table structure for table `tb_blog_comment` */

DROP TABLE IF EXISTS `tb_blog_comment`;

CREATE TABLE `tb_blog_comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联的blog主键',
  `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert  into `tb_blog_comment`(`comment_id`,`blog_id`,`commentator`,`email`,`website_url`,`comment_body`,`comment_create_time`,`commentator_ip`,`reply_body`,`reply_create_time`,`comment_status`,`is_deleted`) values (26,4,'十三','224683568@qq.com','','第一条评论','2019-05-13 10:12:19','','','2019-05-12 21:13:31',1,0);

/*Table structure for table `tb_blog_tag` */

DROP TABLE IF EXISTS `tb_blog_tag`;

CREATE TABLE `tb_blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `tb_blog_tag_relation` */

DROP TABLE IF EXISTS `tb_blog_tag_relation`;

CREATE TABLE `tb_blog_tag_relation` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(20) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_config` */

INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('footerAbout', 'diandi blog. have fun.', '2018-11-11 20:33:23', '2019-09-23 10:45:29');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('footerCopyRight', '2019 szy', '2018-11-11 20:33:31', '2019-09-23 10:45:29');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('footerICP', '浙ICP备17008806号-3', '2018-11-11 20:33:27', '2019-09-23 10:45:29');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('footerPoweredBy', 'https://github.com/MicroSZY', '2018-11-11 20:33:36', '2019-09-23 10:45:29');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('footerPoweredByURL', 'https://github.com/MicroSZY', '2018-11-11 20:33:39', '2019-09-23 10:45:29');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('websiteDescription', '点滴博客是SpringBoot2+Thymeleaf+Mybatis建造的个人博客网站.SpringBoot实战博客源码.个人博客搭建', '2018-11-11 20:33:04', '2019-09-23 10:46:19');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('websiteIcon', '/admin/dist/img/diandi.png', '2018-11-11 20:33:11', '2019-09-23 10:46:19');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('websiteLogo', '/admin/dist/img/diandi.png', '2018-11-11 20:33:08', '2019-09-23 10:46:19');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('websiteName', '点 滴', '2018-11-11 20:33:01', '2019-09-23 10:46:18');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('yourAvatar', '/admin/dist/img/13.png', '2018-11-11 20:33:14', '2019-09-30 13:22:38');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('yourEmail', '853323110@qq.com', '2018-11-11 20:33:17', '2019-09-30 13:22:38');
INSERT INTO `my_blog_db`.`tb_config`(`config_name`, `config_value`, `create_time`, `update_time`) VALUES ('yourName', 'szy', '2018-11-11 20:33:20', '2019-09-30 13:22:38');

/*Table structure for table `tb_link` */

DROP TABLE IF EXISTS `tb_link`;

CREATE TABLE `tb_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` varchar(50) NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) NOT NULL COMMENT '网站链接',
  `link_description` varchar(100) NOT NULL COMMENT '网站描述',
  `link_rank` int(11) NOT NULL DEFAULT '0' COMMENT '用于列表排序',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_test` */

DROP TABLE IF EXISTS `tb_test`;

CREATE TABLE `tb_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `test_info` varchar(50) NOT NULL COMMENT '测试内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_test` */

insert  into `tb_test`(`id`,`test_info`) values (1,'SpringBoot-MyBatis测试');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
