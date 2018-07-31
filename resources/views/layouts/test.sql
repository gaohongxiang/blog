-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: www_blockchant_cn
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ghx_articles`
--

DROP TABLE IF EXISTS `ghx_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题',
  `body` mediumtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'seo 友好路径',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `tutorial_id` int(10) unsigned NOT NULL,
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `follow_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `sort` int(10) unsigned NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_user_id_index` (`user_id`),
  KEY `articles_tutorial_id_index` (`tutorial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_articles`
--

LOCK TABLES `ghx_articles` WRITE;
/*!40000 ALTER TABLE `ghx_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_categories`
--

DROP TABLE IF EXISTS `ghx_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `tutorial_counts` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_categories`
--

LOCK TABLES `ghx_categories` WRITE;
/*!40000 ALTER TABLE `ghx_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_comments`
--

DROP TABLE IF EXISTS `ghx_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_comments`
--

LOCK TABLES `ghx_comments` WRITE;
/*!40000 ALTER TABLE `ghx_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_follows`
--

DROP TABLE IF EXISTS `ghx_follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_follows` (
  `user_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  KEY `follows_user_id_index` (`user_id`),
  KEY `follows_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_follows`
--

LOCK TABLES `ghx_follows` WRITE;
/*!40000 ALTER TABLE `ghx_follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_migrations`
--

DROP TABLE IF EXISTS `ghx_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_migrations`
--

LOCK TABLES `ghx_migrations` WRITE;
/*!40000 ALTER TABLE `ghx_migrations` DISABLE KEYS */;
INSERT INTO `ghx_migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_02_01_155342_add_new_field_to_users_table',1),(4,'2018_02_02_162002_create_skills_table',1),(5,'2018_02_05_140002_create_posts_table',1),(6,'2018_02_26_111637_create_follows_table',1),(7,'2018_02_26_221607_create_comments_table',1),(8,'2018_03_09_135724_add_member_level_to_users_table',1),(9,'2018_03_09_185101_create_visits_table',1),(10,'2018_03_10_003648_create_notifications_table',1),(11,'2018_03_10_003730_add_notification_count_to_users_table',1),(12,'2018_03_19_165413_create_tutorials_table',1),(13,'2018_03_19_200525_create_categories_table',1),(14,'2018_03_21_211831_create_articles_table',1);
/*!40000 ALTER TABLE `ghx_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_notifications`
--

DROP TABLE IF EXISTS `ghx_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_notifications`
--

LOCK TABLES `ghx_notifications` WRITE;
/*!40000 ALTER TABLE `ghx_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_password_resets`
--

DROP TABLE IF EXISTS `ghx_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_password_resets`
--

LOCK TABLES `ghx_password_resets` WRITE;
/*!40000 ALTER TABLE `ghx_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_posts`
--

DROP TABLE IF EXISTS `ghx_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `follow_count` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '100',
  `excerpt` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_title_index` (`title`),
  KEY `posts_user_id_index` (`user_id`),
  KEY `posts_skill_id_index` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_posts`
--

LOCK TABLES `ghx_posts` WRITE;
/*!40000 ALTER TABLE `ghx_posts` DISABLE KEYS */;
INSERT INTO `ghx_posts` VALUES (1,'Laravel安装与配置','## 安装\r\n\r\n安装laravel的要求\r\n- PHP >= 7.0.0\r\n- 开启PHP openSSL 扩展\r\n- 开启PHP PDO 扩展\r\n- 开启PHP mbstring 扩展\r\n- 开启PHP tokenizer 扩展\r\n- 开启PHP XML 扩展\r\n\r\n安装的三个方法\r\n\r\n#### laravel安装\r\n\r\n1、通过 Composer 安装 Laravel 安装器\r\n\r\n`composer global require \"laravel/installer\"`（全局，不用管安装在哪）\r\n\r\n2、快速搭建项目：\r\n\r\n`laravel new blog`\r\n\r\n进入要安装laravel的目录，通过 laravel new 命令即可在当前目录下创建一个新的 Laravel 应用，且包含所有 Laravel 依赖。该安装方法比通过 Composer 安装要快很多。\r\n\r\n若已经安装过旧版本的 Laravel 安装器，需要更新后才能安装最新的 Laravel 5.5 框架\r\n`composer global update`\r\n\r\n#### composer安装\r\n\r\n终端中通过 Composer 的 create-project 命令来安装 Laravel 应用\r\n\r\n`composer create-project --prefer-dist laravel/laravel blog`\r\n\r\n如果要下载安装 Laravel 其他版本应用，比如 5.4 版本，可以使用这个命令\r\n`composer create-project --prefer-dist laravel/laravel blog 5.4.*`\r\n\r\n#### 一键安装\r\n\r\n直接官网下载一键安装包，但是不建议（不安全）\r\n\r\n## 配置\r\n\r\n框架拉下来后需要根据自己的项目进行一些配置才能使用。\r\n\r\n### 配置访问方式\r\n\r\n目前访问项目是通过下面方式进行\r\n`localhost/laravel/public/index.php`（入口文件）\r\n但实际访问网站时是通过域名来访问的。比如`www.baidu.com`\r\n所以需要配置下访问的方式\r\n\r\n#### 域名劫持\r\n\r\n`C:\\Windows\\System32\\drivers\\etc`下的`hosts`文件增加`127.0.0.1	blog.com`关系对。访问blog.com的时候就会进入项目服务器根目录（如apache就会进入`htdocs`目录）\r\n\r\n#### 添加虚拟主机\r\n\r\n1、修改apache配置文件`httpd.conf`\r\n\r\n开启虚拟主机模块，并引入虚拟主机配置文件\r\n`LoadModule vhost_alias_module modules/mod_vhost_alias.so`\r\n`Include conf/extra/httpd-vhosts.conf`\r\n\r\n2、添加虚拟主机\r\n\r\napache的`httpd-vhosts.conf`文件，添加对应内容\r\n```\r\n<VirtualHost *:80>\r\n	#指定网站的根目录\r\n    DocumentRoot \"${SRVROOT}/htdocs/blog\"\r\n    #网站的域名\r\n    ServerName blog.com\r\n    #错误日志\r\n    ErrorLog \"logs/blog.com-error.log\"\r\n    #访问日志\r\n    CustomLog \"logs/blog.com-access.log\" common\r\n</VirtualHost>\r\n```\r\n\r\n3、重启apache服务\r\n\r\n命令行模式`net restart apache2.4`\r\n\r\n#### 隐藏入口文件\r\n\r\n上述操作完成后，输入域名就会找到服务器下网站的根目录的入口文件了，但找其他文件时每次都得输入入口文件，比较麻烦。所以，需要隐藏入口文件。\r\n\r\n##### apache服务器\r\n\r\n路由重写规则，通过`.htaccess`文件实现\r\n\r\n`.htaccess`文件必须要和入口文件`index.php`放在一起。（laravel框架自动生成了此文件，并且跟index.php在同一目录下）\r\n\r\n如果不生效的话，手动在此文件里写入下面内容，覆盖原内容\r\n```\r\nOptions +FollowSymLinks\r\nRewriteEngine On\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteRule ^ index.php [L]\r\n```\r\n\r\n配置`httpd.conf`文件\r\n\r\n1、开启Apache路由重写模块\r\n`LoadModule rewrite_module modules/mod_rewrite.so`\r\n2、允许路由重写\r\n`AllowOverride All`\r\n3、首页默认文件名\r\n`DirectoryIndex index.html index.php`\r\n4、重启apache服务\r\n\r\n##### Nginx服务器：\r\n```\r\nlocation / {\r\n    try_files $uri $uri/ /index.php?$query_string;\r\n}\r\n```\r\n\r\n### 配置数据库\r\n\r\nLaravel 框架的所有配置文件都存放在 config 目录下，所有的配置项都有注释。\r\n一般需要配置数据库的信息。`/config/database.php`\r\n\r\n生产环境：配置 `app/config/database.php`文件\r\n\r\n开发环境：配置`.env`文件\r\n\r\n>数据库信息非常重要，不会传来传去，所以，开发环境下配置`.env`文件（此文件不上传），供开发人员使用。\r\n>而生产环境直接配置 `app/config/database.php`即可。\r\n\r\n.env文件配置自己的数据库信息\r\n```\r\nDB_CONNECTION=mysql\r\nDB_HOST=127.0.0.1\r\nDB_PORT=3306\r\nDB_DATABASE=XXX\r\nDB_USERNAME=XXX\r\nDB_PASSWORD=XXX\r\n```\r\n\r\n### 配置目录的权限\r\n\r\n安装完 Laravel 后，需要配置一些目录的读写权限：storage 和 bootstrap/cache 目录对 Web 服务器指定的用户而言应该是可写的，否则 Laravel 应用将不能正常运行。如果你使用 Homestead 虚拟机做为开发环境，这些权限已经设置好了。\r\n\r\n### 配置应用key\r\n\r\nkey是32位字符串，是独一无二的，作用是为了安全。\r\n一般通过 Composer 或者 Laravel 安装器安装的话，该 key 的值已经通过 php artisan key:generate 命令生成好了。在`.env`文件中\r\n\r\n>.env是通过.env.example文件复制来的\r\n.env文件包含敏感信息，如数据库用户名及密码等，不要提交（git不管理此文件。`gitignore`文件里的东西git不管理）\r\n如果你是在一个团队中进行开发，则需要将 .env.example 文件随你的应用代码一起提交到源码控制中：将一些配置值以占位符的方式放置在 .env.example 文件中，这样其他开发者就会很清楚运行你的应用需要配置哪些环境变量。\r\n\r\n### 配置其他\r\n\r\n`config/app.php`文件配置`timezone`',1,3,0,0,0,100,'laravel安装','','2018-02-24 13:05:39','2018-02-24 13:05:39'),(2,'Linux 用户、群组和权限管理','## 群组的增删改查\r\n\r\n增加群组`groupadd`\r\n- 直接添加`groupadd 群组名`\r\n- 指定gid添加 `groupadd -g 指定的gid 群组名`\r\n- 添加系统用户组`groupadd -r 群组名`（gid<1000为系统用户组）\r\n\r\n查看群组\r\n\r\n>用户群组信息文件`/etc/group`\r\n`root:x:0:`分组名：分组密码：分组gid：加入分组的用户（可以是多个）\r\n\r\n- 直接查看 `cat /etc/group`（全部）、`tail -n 5 /etc/group`（后五行）\r\n- 查看指定用户的群组 `groups 用户名`\r\n\r\n修改群组`groupmod`\r\n- 修改指定群组的gid `groupmod -g 新的gid 群组名`\r\n- 修改指定群组的名称`groupmod -n 新的群组名 群组名`\r\n\r\n删除群组`groupdel`\r\n- `groupdel 群组名`\r\n\r\n\r\n## 用户的增删改查\r\n\r\n增加用户`useradd 用户名`\r\n- 创建用户时会自动创建一个和用户名相同的群组名称，作为用户的默认群组\r\n- 会创建一个 /home/用户名 的目录，用做用户的家目录\r\n\r\n查看用户\r\n>用户信息的文件`/etc/passwd`\r\n`root:x:0:0:root:/root:/bin/bash`\r\n`用户名：密码：用户id：用户所属分组id：全名：用户家目录：用户可以登录的shell`\r\n\r\n\r\n- 查看uid、gid `id 用户名`\r\n\r\n修改用户`usermod`\r\n- 修改用户家目录 `usermod -s /sbin/nologin 用户名`\r\n- 修改用户名`usermod -l 新用户名 旧用户名`\r\n- 修改默认群组`usermod -g 新群组 用户名`\r\n- 添加附加组`usermod -G 新群组 用户名`\r\n- 锁定用户`usermod -L 用户名`\r\n- 解锁用户\r\n	- `usermod -U 用户名`（产生没有密码的账户）\r\n	- `usermod -p 密码 用户名`（设置密码并解锁用户）\r\n\r\n删除用户`userdel`\r\n- 直接删除`userdel 用户名`直接删除，不会删除用户的家目录和邮件的数据。若修改了用户的默认群组，则不会删除群组。\r\n- 删除用户同时删除数据`userdel -r 用户名`需要注意，确保用户家目录下的数据已经备份或者是无用的数据。\r\n\r\n## 用户密码\r\n\r\n>用户密码文件`/etc/shadow`\r\n`bin:*:17110:0:99999:7:::`用户名：加密后的密码：最后一次更改密码的时间：密码不能被修改的天数：密码在多少天之内必须修改：密码到期之前几天给用户发提醒：密码过期后的宽限天数：用户失效日期：保留位置\r\n修改属性`passwd[选项]<用户名称>`\r\n交互方式修改密码属性`chage 用户名`按提示一步步操作即可\r\n\r\n- 重置密码`passwd`\r\n- 重置其他用户的密码`passwd 用户名`（只有root用户有权限设置）\r\n- 锁定/解锁密码`passwd -l/u 用户名`（只有root用户有权限设置）\r\n- 静默方式重置密码` echo 1 | passwd --stdin test`这种方式会将密码明文显示出来，所以一般都是脚本中批量初始化用户时使用\r\n\r\n## 用户切换\r\n`su` 切换用户\r\n- 此命令root 用户切换到其他用户的时候不需要密码，普通用户切换到其他用户的时候需要密码\r\n- 保留当前用户的环境变量。如root切换到test时还会保留root的环境变量\r\n\r\n`su -`切换用户\r\n- 普通用户切换到其他用户的时候需要密码\r\n- 使用新的环境变量。如root切换到test时使用test的环境变量\r\n\r\n`su - 用户 -C \"命令\"` 临时使用其他用户权限执行命令\r\n- 如 `su - root -C \"ls\"`  临时使用root用户权限执行ls命令（需要对方用户的密码）\r\n\r\n`sudo`切换用户\r\nsudo 是普通帐号用来执行管理员命令和切换到root帐号使用的。此方式能减少 root 用户的操作，尽可能的避免误操作。推荐\r\n>设置sudo权限\r\n1. 将普通用户加入到` wheel `群组 `usermod -G wheel 用户名`。\r\n- wheel 这个群组是从UNIX继承过来的，系统内置的一个比较特殊的群组，拥有这个群组权限的用户，就可以拥有 sudo 权限。\r\n- 注意，**分配群组需要 root 用户来操作**。\r\n2. 修改` /etc/sudoers` 配置文件。用文本编辑器编辑` /etc/sudoers` 这个文件，然后在 `root ALL=(ALL) ALL` 下面加上一行 `用户名 ALL=(ALL) ALL `\r\n\r\n用法：操作前加sudo关键字\r\n设置好权限后被设置的用户就可以执行只有 root 权限才可以执行的操作了。比如查看/etc/shadow 这个文件，`sudo cat /etc/shadow`。如果执行了一个越权的操作，忘记加sudo，可以直接打`sudo !!`。系统会自动转换为`sudo 上次操作命令`\r\n\r\n普通用户通过 sudo 命令切换到 root 用户\r\n- `sudo -s`这个命令相当于 `su root`，还会携带当前用户的环境变量。不需要知道 root 的密码。\r\n- `sudo -i`这个命令相当于 `su - root`，会初始化 root 用户的环境变量。不需要知道 root 的密码。',1,6,0,0,0,100,'Linux 用户、群组和权限管理','','2018-01-30 12:18:17','2018-01-30 12:18:17'),(3,'composer安装','>Composer 是 PHP 的一个包管理工具\r\n\r\ncomposer能解决的问题\r\n\r\n- 一个项目依赖于若干个库\r\n- 其中一些库依赖于其他库\r\n- 声明所依赖的东西\r\n\r\nComposer会找出需要安装的包，并安装它们（将它们下载到项目中）\r\n\r\n## 安装\r\n\r\n\r\n#### Linux下的安装：\r\n\r\n执行如下命令(安装composer)：\r\n`curl -sS https://getcomposer.org/installer | php`\r\n注意： 如果上述方法由于某些原因失败了，你还可以通过 php >下载安装器：\r\n`php -r \"readfile(\'https://getcomposer.org/installer\');\" | php`\r\n可以通过 --install-dir 选项指定 Composer 的安装目录\r\n`curl -sS https://getcomposer.org/installer | php -- --install-dir=/home`\r\n2、可以执行如下命令让 composer 在你的系统中进行全局调用：\r\n`mv composer.phar /usr/local/bin/composer`\r\n3、验证安装是否成功，执行如下命令\r\n`[root@localhost]#  composer`\r\n4、之后可以在任意文件下建一个composer.json，并填写如下命令：\r\n`{\"require\":{}}`\r\n然后可以在该文件夹下运行composer的相关命令了，\r\n如：`composer  install;`    `composer  update;`\r\n\r\n[慎用composer update](https://blog.csdn.net/wulove52/article/details/78392663)\r\n\r\n#### window下的安装：\r\n\r\n1. 下载composer.exe \r\n2. 下一步下一步直到结束\r\n3. 将PHP的路径添加到系统环境变量\r\n4. 将composer镜像调整为国内镜像\r\n\r\n将全部的镜像修改为国内镜像：\r\n`composer config -g repo.packagist composer https://packagist.phpcomposer.com`\r\n\r\n将当前项目的composer修改为国内镜像：\r\n`composer config repo.packagist composer https://packagist.phpcomposer.com`\r\n\r\n#### 安装可能出现的问题及解决方法\r\n\r\nQ：找不到模块\r\nA：修改`php.ini`文件的扩展路径\r\n`extension_dir = \"D:/FullStack/wamp/php7/ext\"`\r\n\r\nQ：缺少`feclient.dll`文件\r\nA：C:\\Windows\\SysWOW64目录下添加`feclient.dll`文件（网上下的）\r\n\r\n其他注意项（`php.ini`文件）\r\n- asp_tag 扩展要关闭\r\n- openSSL 扩展要开启\r\n- pdo_mysql 扩展要开启\r\n- extension=pdo_firebird 扩展要开启\r\n- extension=mbstring  扩展要开启\r\n- extension=interbase  扩展要开启',1,3,0,0,0,100,'composer安装','','2018-02-24 12:29:03','2018-02-24 12:29:40'),(4,'Linux 文件、目录和权限管理','linux下任何东西都是以文件目录形式来管理的。\r\n\r\n## 常规操作\r\n\r\n### 增\r\n\r\n##### 创建目录`mkdir`\r\n\r\n- `mkdir 目录名`\r\n- `mkdir -p 目录1/目录2/目录n`递归创建目录\r\n- `mkdir {目录1,目录2,目录n}`同时创建多个目录（一个级别）\r\n- `mkdir -p 目录1/目录2/{目录3,目录4}`递归创建目录并最后目录下建多个目录\r\n\r\n##### 创建文件\r\n\r\n- touch 创建一个空白的文件 `touch 文件名`\r\n- vi/vim创建文件并写入内容\r\n\r\n##### 复制文件或目录`cp`\r\n\r\n- `cp 指定文件 指定目录`复制指定文件到指定目录\r\n- `cp 指定文件 新的文件名`同目录下复制指定文件并重命名\r\n- `cp -r 指定目录 指定目录`复制指定目录到指定目录\r\n- `cp -r 指定目录 新的目录名`同目录下复制指定目录并重命名\r\n\r\n>***递归参数小提示：***\r\n一个命令如果先处理父级再处理子级，那么就用`-p`参数，意为parents，如递归创建目录，必须有父级目录才能创建子级目录。\r\n一个命令如果先处理子级再处理父级，那么就要`-r`参数，意为recursive，如递归删除、复制、移动等，都必须先处理最下一级才能向上进行。\r\n\r\n### 删\r\n\r\n- `rm 文件名`删除文件\r\n- `rm -r 目录名`删除目录（递归删除目录及目录下文件）\r\n- `rm -rf 目录名`强制删除目录（不给提示）\r\n\r\n>**`rm -rf / `永远都不要执行**\r\n\r\n### 查\r\n\r\n#### 查看文件内容\r\n\r\n##### cat \r\n-  `cat 文件名`从头开始显示文件内容\r\n\r\n##### head \r\n- `head -n 5 文件名`显示前五行\r\n\r\n##### tail \r\n- `tail -n 5 文件名`显示后五行\r\n- `tail -f 文件名`当文件内容增长时显示后续添加的数据\r\n \r\n#### 查看文件或目录的类型\r\n\r\n##### stat\r\n- `stat 文件名/目录名`查看文件或目录的类型\r\n\r\n#### 查找文件或目录\r\n\r\n##### whereis\r\n- 用来查找程序的二进制可执行文件、源码文件、man手册等在系统中的位置。\r\n- `whereis [选项] 文件/目录`\r\n\r\n##### which\r\n- 用来查询命令的绝对路径，which指令会在环境变量$PATH设置的目录里查找符合条件的文件。\r\n- `which [选项] 文件/目录`\r\n\r\n##### find\r\n- 查找文件或目录\r\n- `find path -option [ -print ] [ -exec -ok command ] {};`\r\n- `find / -name passwd`查找根目录下名字为passwd的文件\r\n- `find /etc -type f`找出etc下的普通文件\r\n- `find /var/log/ -type f -mtime +7`查找/var/logs目录中更改时间在7日以前的普通文件\r\n\r\n##### grep \r\n\r\n- 过滤内容\r\n- `grep [选项]... PATTERN [FILE]...`\r\n- `grep root /etc/passwd`查询所有包含 root 的用户信息\r\n- `grep ^root /etc/passwd`查询出所有 root 开头的用户信息\r\n- `grep -v root /etc/passwd`查询出不包含某个字符串的行\r\n\r\n#### 查看文件或目录时常用到的命令\r\n\r\n##### `pwd`查看当前所在路径\r\n\r\n路径分为绝对路径与相对路径\r\n\r\n- 绝对路径：Linux 的绝对路径是从 / 开始的路径，如 /etc/passwd\r\n- 相对路径：相对于当前工作目录的路径。\r\n- 命令接文件名的时候灵活运用绝对和相对路径\r\n\r\n#####  `ls`查看目录或文件\r\n- `ls [目录名]`目录名可选。加上表示查看指定目录下的目录或文件，不加表示查看当前目录下的目录或文件\r\n- `ls -a [目录名]`查看全部目录或文件包括隐藏文件\r\n- `ls -l [目录名]`列表方式查看目录或文件，别名`ll`\r\n- `ll -a [目录名]`列表方式查看全部目录或文件包括隐藏文件\r\n\r\n#####  `cd`（change directory）改变当前所在目录\r\n- `cd 目录名`回到指定目录\r\n- `cd  ..`回到上级目录\r\n- `cd ~`回到当前用户的家目录\r\n- `cd ~root`回到root用户的家目录\r\n- `cd -`直接回到上一次切换之前的目录\r\n\r\n>常用目录符号说明\r\n`.`代表当前目录\r\n`..`代表上级目录\r\n`~`（Esc下面的那个符号）代表当前用户所在的家目录\r\n`~test`代表test帐号所在的家目录\r\n`*`代表目录下的所有文件及目录\r\n\r\n### 改\r\n\r\n`mv`移动/重命名\r\n- `mv 文件/目录 指定目录`将文件或目录移动到指定的目录\r\n- `mv 文件/目录 同路径下文件/目录`同路径下表示将前面文件或目录重命名为后者\r\n\r\n>Linux下直接重命名只有mv的方式，cp方式可以把文件或目录复制的同时重命名\r\n\r\n## 文件与目录权限\r\n\r\nLinux 下的每一个文件及目录都有 拥有者 、 群组 、 其他人 三组权限\r\n\r\n### 文件和目录属性\r\n\r\n`ll`查看\r\n\r\n`-rw-r--r-- 1 root root 32 9月  18 09:32 test.txt`\r\n`drwxrwxr-x. 2 test test  149 4月  22 19:20 script`\r\n\r\n![文件及目录属性](http://pcen3n3o2.bkt.clouddn.com/%E6%96%87%E4%BB%B6%E7%9B%AE%E5%BD%95%E5%B1%9E%E6%80%A7.png)\r\n\r\n#### 第1组 `-rw-r--r--.`\r\n\r\n这一组是由11个字段组成，并且由五部分组成\r\n\r\n**第一部分**`-`代表**文件类型**，具体的含义：\r\n- `-` 代表文件\r\n- `d` 代表目录\r\n- `l` 代表链接\r\n- `b` 代表存储设备，如硬盘、U盘等\r\n- `c` 代表设备，比如鼠标、键盘等\r\n\r\n**第二部分**	`rw-`表示所属用户**（u）**的权限\r\n\r\n分别代表着 读、写、执行的权限，`-`代表着没有对应的权限。\r\n\r\n**第三部分** `r--`表示所属群组**（g）**的权限\r\n\r\n分别代表着 读、写、执行的权限，`-`代表着没有对应的权限。\r\n\r\n**第四部分** `r--`表示其他用户**（o）**的权限（也就是说任何用户都有的权限）\r\n\r\n分别代表着 读、写、执行的权限，`-`代表着没有对应的权限。\r\n\r\n>说明：`rwx分别代表读、写、执行 ugo分别代表所属用户、所属组、其他用户`\r\n\r\n**第五部分** `.`代表拥有 SELinux 安全属性。\r\n\r\n这个是 RHEL 专有的，并非所有 Linux 发行版本都会有\r\n\r\n上面的权限是针对一般用户，root 帐号并不被这个权限约束，因为root帐号是超级管理员，\r\n比较特殊的一个权限。\r\n\r\n**第2组 1** ：到此目录或文件的硬链接数\r\n\r\n**第3组 root** ：文件或目录的所属用户\r\n\r\n**第4组 root** ：文件或目录的所属群组\r\n\r\n**第5组 32** ：文件或目录的大小\r\n\r\n**第6组 9月 18 09:32** ：文件或目录的最后更新时间\r\n\r\n**第7组 test.txt** ：文件或目录的名称\r\n\r\n\r\n### 修改文件或目录属性\r\n\r\n##### 修改文件所属用户和群组`chown`\r\n- `chown [选项] 所有者:群组名 文件名`\r\n- `chown 新用户名：新群组名 文件/目录`修改指定文件或目录的所属用户和群组\r\n- `chown -R 新用户名：新群组名 文件/目录`递归修改指定目录下所有文件及目录的用户和群组\r\n\r\n##### 修改文件权限`chmod`\r\n\r\n- `u/g/o` +/- `rwx` 例：chmod -R +x 目录（目录及其下ugo全加x权限）\r\n- `u/g/o` = `rwx`例：chmod u=rwx,g=rx 文件（直接指定ugo权限）\r\n- 数字快速设置`r=4 w=2 x=1`例：chmod 777 目录\r\n\r\n>第一种适合于不知道原来权限但要求不动原来文件或目录权限，在其基础上增加或删除某个权限\r\n第二种适合指定用户或群组拥有指定权限\r\n第三种用数字方式指定用户或群组拥有指定权限\r\n\r\n### 文件及目录的预设权限\r\n\r\n新文件/目录被创建时，都有一个预设的权限，由文件创建掩码决定。\r\numask命令用来设置限制新建文件权限的掩码，用户每次注册进入系统时，umask命令都被执行， 并自动设置掩码mode来限制新文件/目录的权限。\r\n\r\n>`文件/目录的权限=最大权限-umask值`\r\n\r\n注：\r\n- 目录默认的最大权限是777（rwxrwxrwx）\r\n- 文件默认是没有执行权限的，最大权限为666（rw-rw-rw-）\r\n\r\n##### 查询默认的umask\r\n- `umask`结果：0022（第一个0不用管，从第二个值开始分别代表rwx值）\r\n- `umask -S`结果：u=rwx,g=rx,o=rx\r\n\r\n对应的默认权限（最大权限-默认限制权限）\r\n- 目录`rwxr-xr-x`755 \r\n- 文件`rw-r--r--`644 \r\n\r\n\r\n##### 预设权限设置\r\n\r\n>`umask rwx值`如：umask 002\r\n\r\n相应的默认权限\r\n\r\n- 目录 `rwxrwxr-x`775\r\n- 文件 `rw-rw-r--`664\r\n\r\n### 隐藏属性\r\nLinux中的隐藏属性用来更好的控制文件的安全性\r\n\r\n##### 查看隐藏属性`lsattr` \r\n- `lsattr -a`显示所有文件和目录\r\n- `lsattr -d`显示，目录名称，而非其内容\r\n- `lsattr -R`递归处理，将指定目录下的所有文件及子目录一并处理\r\n\r\n#####  设置隐藏属性`chattr`\r\n- `chattr +i 文件/目录`为文件/目录添加 i 属性。相应的去处i属性`chattr -i 文件/目录`i 属性：文件不能被修改（包括添加新的内容）、删除、创建链接，并且只有root帐号才可以设置这个属性\r\n- `chattr =a 文件/目录`为文件/目录添加 a 属性。 a 属性：文件只能增加内容，不能删除也不能修改，并且只有root帐号可以设置这个属性，设置后即使文件所有者也不可以修改和删除，可以用作比较重要的日志记录。',1,6,0,0,0,100,'Linux 文件、目录和权限管理','','2018-02-07 04:31:01','2018-02-07 04:50:58'),(5,'MySQL用户管理及远程登录','>前提：Linux操作系统\r\n\r\n## 初次登录\r\n\r\n为了提高安全性，MySQL 5.7 默认不再创建一个空密码的 root 用户，而且创建一个被锁定的 root 用户，并且将默认密码保存在日志文件中，所以要先用日志中的密码登录 MySQL 客户端，重置密码后解锁 root 用户。\r\n\r\n#### 查看MySQL的root用户密码\r\n\r\n命令行下输入`grep \'root@localhost\' /data/mysql/log/mysqld.log`\r\n\r\n结果中的 root@localhost 后面就是密码，使用此密码登录 MySQL 客户端\r\n\r\n#### 登录MySQL\r\n\r\n命令行：`mysql -u root -p`，输入查到的密码即可登录（输入密码是不显示的，按感觉输就好）\r\n\r\n#### 重置密码\r\n\r\n>命令:\r\n>`set password for \'username\'@\'host\' = password(\'newpassword\');`\r\n>或\r\n>  `alter user \'username\'@\'host\' identified by \'newpassword\';`\r\n\r\nmysql> `alter user \'root\'@\'localhost\' identified by \'1\';`\r\n或\r\nmysql>`set password for \'root\'@\'localhost\' = password(\'1\');`\r\n\r\n## MySQL的用户\r\n\r\n#### 查看用户\r\n\r\n>mysql>`select host,user from mysql.user;`\r\n\r\n等同于\r\n\r\nmysql>`use mysql;`\r\nmysql>`select host,user from user;`\r\n\r\n#### 创建用户\r\n\r\n>命令:`create user \'username\'@\'host\' identified by \'password\';`\r\n\r\n例：mysql>`create user \'www\'@\'%\' identified by \'123456\';`\r\n\r\n#### 删除用户\r\n\r\n> 命令: `drop user \'username\'@\'host\';`\r\n\r\n例：mysql>`drop user \'www\'@\'%\';`\r\n\r\n#### 修改用户登录ip\r\n\r\n>命令: `update tablename set host=\'hostname\' where user=\'username\'`\r\n\r\n例： mysql>`update user set host=\'%\' where user=\'www\';`\r\n\r\n`%`表示任何ip都可以登录\r\n\r\n## 授权远程登录\r\n\r\n**授权哪个用户拥有哪个数据库的哪个权限**\r\n\r\n>MySQL 必须开放远程登录的权限，才能远程登录\r\n>如果不开权限会报`Host \'XXX\' is not allowed to connect to this MySQL server`\r\n\r\n>前提：确定服务器上的防火墙没有阻止 3306 端口\r\n>MySQL 默认的端口是 3306 。如果在安装 MySQL 时指定了其他端口，请在防火墙中开启您指定的 MySQL 使用的端口号。\r\n\r\n#### 已有用户授权\r\n\r\n>命令:`grant privileges on databasename.tablename to \'username\'@\'host\';`\r\n\r\n例：mysql>`grant all privileges on www_blockchant_cn.* to www@\'127.0.0.1\'; `\r\n\r\n配置生效：mysql> `flush privileges;`\r\n\r\n#### 创建用户并授权\r\n\r\n>命令:`grant privileges on databasename.tablename to \'username\'@\'host identified by \'password\';`\r\n\r\n例：mysql>`grant all privileges on www_blockchant_cn.* to www@\'127.0.0.1\'  identified by \'123456\';`\r\n\r\n上面的语句表示将`www_blockchant_cn`数据库的所有权限授权给`www`这个用户，允许 `www` 用户在 `127.0.0.1` 这个IP进行远程登陆，并设置 `www` 用户的密码为 123456 \r\n\r\n配置生效：mysql> `flush privileges;`\r\n\r\n##### 参数释义\r\n\r\n- `privileges` - 用户的操作权限。如select,insert,update,delete,create,drop等。具体权限间用“`,`”半角逗号分隔。all privileges 表示赋予所有的权限给指定用户。\r\n- `databasename.tablename`表示上面的权限是针对于哪个表的。对全部数据库的全部表授权为“`*.*`”，对某一数据库的全部表授权为“`databasename.*`”，对某一数据库的某一表授权为“`databasename.tablename`”。\r\n- `username`表示你要给哪个用户授权，若此用户不存在会自动创建。\r\n- `host`表示允许远程连接的 IP 地址，如果想不限制链接的 IP 则设置为“`%`”即可。\r\n- `password` 为用户的密码。',1,7,0,0,0,100,'MySQL用户管理及远程登录','','2018-01-15 09:51:41','2018-07-25 09:54:44'),(6,'Linux软件包','在windows下安装软件，我们只需要有EXE文件，然后双击，下一步直接OK就可以了。但在linux下需要获取软件包并执行命令来安装。\r\n\r\nLinux软件包是文件包的一种，文件包还可以是普通的文件包（一般为单文件或目录的压缩包）。\r\n\r\n## 软件包介绍\r\n\r\n#### 软件包的分类\r\n\r\n**Linux下软件包一般分为二进制包和源码包两种形式。**\r\n\r\n二进制包里面包括了已经经过编译，可以马上运行的程序。是计算机认识的程序。你只需要下载和解包（安装）它们以后，就马上可以使用。相当于windows下的exe文件\r\n\r\n源码包里面包括了程序员写的原始程序代码，需要在自己的计算机上进行编译转化为二进制包，才能被计算机认识。源代码安装分`配置-编译-安装`三步，时间会比较长。\r\n\r\n#### 软件包的组成部分\r\n\r\n二进制程序，位于 /bin, /sbin, /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin 等目录中。\r\n库文件，位于 /lib, /usr/lib, /usr/local/lib 等目录中。Linux中库文件以 .so（动态链接库）或 .a（静态链接库）作为文件后缀名。\r\n配置文件，位于 /etc 目录中。\r\n帮助文件：手册, README, INSTALL (/usr/share/doc/)\r\n\r\n#### 软件包的命名规范\r\n\r\n**二进制包**：`name-version-release.os.arch.{rpm|deb|...}`\r\n\r\nname：程序名称\r\nversion：程序版本号\r\nrelease（发行号）：用于标识RPM包本身的发行号，与源程序release号无关\r\nos：即说明RPM包支持的操作系统版本。如el6（即rhel6）、centos6、suse11\r\narch：主机平台。如i686、x86_64、amd64、ppc、noarch（不依赖平台）\r\n例：bash-4.3.2-5.el6.x86_64.rpm\r\n\r\n**源码包**：`name-version.tar.{gz|bz2|...}`\r\n\r\nname：程序名称\r\nversion：版本号。又分为：major.minor.release\r\n例：bash-4.3.1.tar.gz\r\n\r\n注：软件名和软件包名的区别。软件名一般就是程序的名称，而软件包名会包含一些版本号、主机平台等信息\r\n\r\n>Linux系统对文件后缀名不敏感，后缀名只是方便人来识别的。要想知道文件的具体类型可以用file命令来查看`file 文件名`\r\n\r\n\r\n#### 获取并安装软件包\r\n\r\n每个LINUX的发行版都会维护一个自己的软件仓库，我们常用的几乎所有软件都在这里面。这里面的软件绝对安全，而且绝对的能正常安装。通常使用yum或apt即可从这些软件仓库来获取软件并安装。\r\n\r\n同时，国内的一些公司也有自己的开源软件仓库，如阿里源、网易源等。因为一些可知的原因，我们可以把默认的源切换国内源。\r\n\r\n若这些仓库中没有想要的软件就需要去软件的官网去下载软件包，用到wget工具下载，然后再来安装。若系统中没有wget工具可以执行`{yum|sudo apt} -y install wget`安装\r\n\r\n下面会详细讲解这一部分\r\n\r\n\r\n## 二进制包（binary code）\r\n\r\nLinux各发行版本软件包的格式不同，管理软件包的工具也有所不同。\r\n\r\n软件包管理工具的作用是提供在操作系统中安装，升级，卸载需要的软件的方法，并提供对系统中所有软件状态信息的查询。\r\n\r\n### rpm与yum\r\n\r\nRedhat Linux 家族（如CentOS、Opensuse、Fedora）使用`.rpm`二进制软件包格式，并使用rpm及其前端工具（如yum、dnf）为包管理器。\r\n\r\n#### rpm\r\n\r\n**rpm（RPM Package Manager） 是 Redhat Linux 家族的基础包管理系统**，它用于安装，升级，卸载和提供.rpm包的信息。*缺点是要手动解决依赖关系，较麻烦。*\r\n\r\n- 查询所有已经安装的软件包：`rpm -qa`\r\n- 查询指定软件包的内容：`rpm -qip 要查询的软件包`\r\n- 安装软件：`rpm -ivh 要安装的rpm软件包`i：安装，v：校验，h：显示安装进度\r\n- 升级软件：`rpm -Uvh 要升级的rpm软件包`U：升级\r\n- 删除软件：`rpm -e 要删除的rpm软件包`\r\n\r\n\r\n#### yum\r\n\r\n**Yum（ Yellow dog Updater, Modified）是一个rpm包管理系统的shell前端工具**，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软体包（相当于一次性把所有需要安装的N个rpm包统一下载安装）。它是一个非常受欢迎的、自由而强大的命令行包管理器。\r\n\r\n>`yum [options] [command] [package ...]`\r\noptions：参数，可选，可组合。\r\ncommand：要进行的操作。\r\npackage操作的对象。\r\n\r\n- 安装软件：`yum install -y 要安装的rpm软件包`多个软件包用`逗号`隔开\r\n- 显示所有已经安装和可以安装的程序包：`yum list`\r\n- 检测可升级的包：`yum check-update`\r\n- 更新软件：`yum update`更新全部软件包（也可加要更新的软件包）\r\n- 删除软件：`yum remove 要删除的rpm软件包`\r\n- 清除缓存：`yum clean all`yum仓库若更新，则本地缓存就没有意义了\r\n- 生成缓存：`yum makecache`下载远程yum的文件，在本地生成缓存\r\n\r\n**yum客户端安装程序流程**\r\n\r\n![Alt text](./yum客户端安装程序流程.jpg)\r\n\r\n\r\n\r\n#### yum 源\r\n\r\nyum仓库又称为yum源，是官方维护的软件仓库。yum仓库一般会支持ftp协议，http协议，文件协议。\r\n\r\ncentOS系统的yum源主配置文件为`/etc/yum.conf`此文件引入了其他配置文件。\r\n源列表文件：`/etc/yum.repos.d/CentOS-Base.repo`，源列表里面都是一些网址信息，每一条网址就是一个源，这个地址指向的数据标识着这台源服务器上有哪些软件可以安装使用。\r\n\r\n**epel源**\r\n\r\nRedhat家族除了官方维护的软件仓库外，还有一个基于Fedora的一个项目：EPEL (Extra Packages for Enterprise Linux)，为Redhat家族的操作系统提供额外的软件包。\r\n- 安装epel源`sudo yum install -y epel-release`\r\n- 安装完成后更新软件源的缓存`sudo yum makecache`\r\n\r\n**国内yum源**\r\n\r\n系统默认的yum源是国外的源，易受网速的限制。所以有必要把yum源换为国内的源。国内主要开源的开源镜像站点主要是网易原和阿里源\r\n\r\n更换国内yum源的方式：\r\n\r\n>进入源文件所在目录`cd /etc/yum.repos.d/`\r\n>备份源文件`mv CentOS-Base.repo CentOS-Base.repo.backup`\r\n>下载aliyun的yum源`wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo`\r\n>清除原缓存`yum clean all` \r\n>生成新缓存`yum makecache`\r\n\r\n\r\n\r\n\r\n### dpkg与apt\r\n\r\nDebian Linux 家族（如Ubuntu、Debian、Mint）使用`.deb`二进制软件包格式，并使用dpkg及其前端工具（如apt、Aptitude、Synaptic）为包管理器。\r\n\r\n**dpkg（Debian PacKaGe） 是 Debian Linux 家族的基础包管理系统**，它用于安装，升级，卸载和提供.deb包的信息。\r\n\r\n- 查询所有已经安装的软件包：`dpkg -I`\r\n- 查询指定软件包的内容：`dpkg --info 要查询的软件包`\r\n- 安装软件：`sudo dpkg -i 要安装的deb包`解决依赖`sudo apt-get -f install`\r\n- 升级软件：`sudo dpkg -i 要升级的deb包`\r\n- 删除软件：`dpkg -r 要删除的软件名`（保留其配置信息）`dpkg -P 要删除的软件名` （同时删除配置信息）\r\n\r\n\r\n**apt(Advanced Packaging Tool）是一个dpkg 包管理系统的前端工具**，能够从指定的服务器自动下载deb包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软体包（相当于一次性把所有需要安装的N个deb包统一下载安装）。它是一个非常受欢迎的、自由而强大的命令行包管理器。\r\napt-get\r\n\r\n- 安装软件：`sudo apt -y install 要安装的deb包`\r\n- 更新软件列表：`sudo apt update`\r\n- 更新软件：`sudo apt upgrade`\r\n- 删除软件：`sudo apt autoremove 要删除的deb包`\r\n\r\nsudo apt update会访问源列表里的每个网址，并读取软件列表，然后保存在本地电脑\r\nsudo apt upgrade会把本地已安装的软件，与刚下载的软件列表里对应软件进行对比，如果发现已安装的软件版本太低，就会提示你更新\r\n总而言之，update是更新软件列表，upgrade是更新软件。\r\n\r\n注意：如果源里面有系统更新，upgrade会升级系统。可能会造成原系统下命令失效，代码不能正常运行。线上项目一般不会更新系统。\r\n\r\n#### apt源\r\n\r\nUbuntu系统的源列表文件为`/etc/apt/sources.list`，源列表里面都是一些网址信息，每一条网址就是一个源，这个地址指向的数据标识着这台源服务器上有哪些软件可以安装使用。\r\n\r\n同样，系统默认的apt源是国外的源，所以我们需要将默认的源切换为国内源。\r\n常用的国内源有阿里源（这是中国官方源）、网易源、搜狐源、清华源、中科大源、浙大源等等\r\n\r\n更换国内apt源的两种方式：\r\n\r\n>**桌面方式**：\r\n应用程序->软件和更新->下载自->其他站点->找到相应源如阿里源->选择服务器->重新载入（系统的工作是更新缓存，写入一个源文件并启用）\r\n**命令行方式**：\r\n进入源文件目录`cd /etc/apt`\r\n备份源列表文件`sudo cp sources.list sources.list.bak`\r\n编辑源文件`sudo vim sources.list`\r\n删除文件内容，找到国内源，复制到此文件中\r\n更新缓存`sudo apt update`\r\n\r\n\r\n## 源码包（source code）\r\n\r\n有时候系统提供的二进制包不符合我们的使用需求，这时候就要自己下载源码包来编译安装。比如自己编译安装LNMP环境。\r\n\r\n>下载源码包->解压缩到指定目录->配置->编译->安装\r\n\r\n#### 下载源码包\r\n\r\n**wget**\r\n\r\nwget名称是 World Wide Web 与 get 的结合，它是一个从网络上指定的URL下载文件的工具，支持通过 HTTP、HTTPS、FTP 三个最常见的 TCP/IP协议下载，并可以使用 HTTP 代理。支持在用户退出系统的之后在继续后台执行，直到下载任务完成。支持递归下载。若系统中没有wget工具可以执行`{yum|sudo apt} -y install wget`安装\r\n\r\n语法：`wget[选项][参数]`\r\n- `wget url网址`下载单文件\r\n- `wget -O 保存的文件名 url网址`重命名\r\n- `wget -P url网址`下载到指定目录\r\n- `wget -c url网址`断点续传\r\n- `wget -b url网址`后台下载\r\n\r\n**lrzsz**\r\n\r\nrz，sz是Linux/Unix同Windows进行ZModem文件传输（上传下载）的命令行工具\r\n\r\n安装lrzsz工具包`yum  install lrzsz -y`\r\n\r\n上传命令：`rz`。为避免文件太大或乱码问题使用`rz -be`来上传\r\n下载命令：`sz`\r\n>注：普通用户上传下载若失败很有可能是权限不够，命令前加`sudo`即可\r\n#### 解压缩\r\n\r\ngzip、bzip是压缩工具。tar是一个打包工具。\r\n \r\n#### gzip\r\n\r\n- 压缩文件`gzip 文件名`结果：`文件名.gz`解压缩`gzip -d 文件名.gz`\r\n- 压缩目录 `gzip -r 目录名`解压缩`gzip -dr 目录名`\r\n>注意：压缩文件时同时删除原文件。压缩目录时实际不压缩目录，而是把目录下的每一个文件压缩成gz格式\r\n\r\n#### bzip\r\n\r\n跟gzip用法一样，区别是底层算法不同，压缩大小不同，压缩格式不同，而且bzip不能压缩目录\r\n\r\n#### tar\r\ntar是一个打包工具，本身自带了压缩的功能\r\n\r\n打包目录的方式\r\n\r\n##### 先打包目录再压缩\r\n\r\n1. `tar cvf 打包后的文件名.tar 要压缩的目录名`c参数：create v参数：显示过程 f参数：跟要打包的目录\r\n2. 压缩文件`gzip 打包后的文件名.tar`\r\n\r\n##### 打包及压缩（常用）\r\n\r\n打包并通过gizp方式压缩\r\n`tar czvf 压缩后的文件名.tar.gz 要压缩的目录名`z参数：指定gizp方式压缩（tar新版本不需要加？）\r\n解压缩`tar xzvf 压缩后的文件名.tar.gz`x参数：解压缩\r\n解压缩到指定目录`tar xzvf 压缩后的文件名.tar.gz -C 目标目录`C参数：指定目录\r\n\r\n打包并通过bzip2压缩\r\n`tar cjvf 压缩后的文件名.tar.bz2 要压缩的目录名`j参数：指定bizp2方式压缩\r\n解压缩`tar xjvf test.tar.bz2`\r\n解压缩到指定目录`tar xjvf 压缩后的文件名.tar.bz2 -C 目标目录`C参数：指定目录\r\n>实际场景中直接用tar命令来打包并压缩目录（z或j参数指定压缩的方式）\r\n>gizp命令用来把目录下的所有文件一个个压缩。\r\n>压缩文件用gizp或bizp2命令即可\r\n>压缩解压缩不仅可以用于软件包，普通文件包同样适用\r\n\r\n#### 配置、编译、安装\r\n\r\n这部分内容比较多，详见后续文章',1,6,0,0,0,100,'Linux软件包','','2018-02-14 15:29:51','2018-02-14 15:29:51'),(7,'Linux磁盘分区','## 分区\r\n\r\n>磁盘分区分为三步：磁盘分区、格式化磁盘、挂载磁盘\r\n\r\n### 介绍\r\n\r\n为什么要进行分区？\r\n\r\n- 操作系统在启动的时候会通过磁盘的引导来获得操作系统文件所在的分区，所以必须有一个可引导分区。这也就是为什么新买的硬盘不能直接用的原因。\r\n- 分区是可以提高管理效率，所有东西放在一个分区，OS管理起来效率比较低，因为每次要检索的东西太多了。\r\n\r\n现在的主流分区有 MBR 和 GPT\r\n\r\n#### MBR 主引导记录\r\n主引导记录（Master Boot Record，缩写：MBR），又叫做主引导扇区，\r\n是计算机开机后访问硬盘时所必须要读取的首个扇区。\r\n\r\n硬盘分区表占据主引导扇区的64个字节，\r\n可以对四个分区的信息进行描述，其中每个分区的信息占据16个字节。\r\n\r\n如果某一分区在硬盘分区表的信息如下：\r\n\r\n80 01 01 00 0B FE BF FC 3F 00 00 00 7E 86 BB 00\r\n\r\nMBR 只可以有4个分区，在实际使用中很多时候4个分区是不够使用的，所以更多的分区就要由扩展分区来实现，扩展分区可以有很多个\r\n\r\n\r\n#### GPT 分区\r\n\r\n全局唯一标识分区表（GUID Partition Table，缩写：GPT）\r\n是一个实体硬盘的分区表的结构布局的标准。它是可扩展固件接口（EFI）标准\r\n（被Intel用于替代个人计算机的BIOS）的一部分\r\n所以如果使用 GPT 分区如果要作为启动盘，主板必须支持 UEFI 才可以\r\n\r\n>在MBR硬盘中，分区信息直接存储于主引导记录（MBR）中（主引导记录中还存储着系统的引导程序）。\r\n但在GPT硬盘中，分区表的位置信息储存在GPT头中。但出于兼容性考虑，\r\n硬盘的第一个扇区仍然用作MBR，之后才是GPT头\r\n\r\n##### 查看磁盘状态`df`\r\n- `df`查询磁盘空间（默认）\r\n- `df -h`查询磁盘空间（自动换算空间）\r\n\r\n##### 查询指定目录的磁盘使用空间 `du`\r\n- `du -sh .`查询当前目录的所占磁盘空间\r\n- `du -sh 指定目录`查询指定目录所占磁盘空间\r\n- `du -h 指定目录`查询指定目录下所有目录所占磁盘空间\r\n- `du -ah 指定目录`查询指定目录下的所有目录及文件所占磁盘空间\r\n\r\n\r\n### 磁盘分区工具 `fdisk`\r\n\r\n`fdisk -l`查询磁盘物理信息\r\n\r\n磁盘分区\r\n`fdisk 指定磁盘`使用 fdisk 命令打开磁盘。如`fdisk /dev/sdb`。进入磁盘分区页面。\r\n- 输入 m 可以获取帮助信息。\r\n- 输入 p 可以获取当前磁盘分区信息。\r\n- 输入 n 创建新的分区。\r\n- 分配完分区可以通过 p 来查看结果。\r\n- w 或 q 保存/退出\r\n刚刚分配完的分区只是保存在内存中，并没有实际应用到磁盘，如果此时点击 q，分区工具会直接退出，刚刚的更改并不会生效。如果想要叫分区生效，输入 w，保存退出，就会直接将修改生效到磁盘，此步骤要万分小心，因为一担保存后就立即生效，如果原本分区中有数据就会丢失。\r\n\r\n## 格式化磁盘\r\n\r\n磁盘分完区还要先磁盘格式化才可以使用，如果要使用 lvm 逻辑卷就不要格式化（lvm 部分再说明）。\r\n\r\n#### Linux 下的主流格式\r\n\r\n##### ext2、ext3、ext4\r\n\r\next 家族在 Linux 使用的时间最长，现在很多发行版本默认也会使用这个格式。\r\n随着数量来的增大，现在 ext4 就有一些明显的限制，最大文件大小是 16 TB（tebibytes），\r\n对于普通磁盘来说已经非常大了，但是一个大数据的处理或者使用了磁盘阵列后，\r\n这个就会不够用了。并且因为数据验证算法的原因，当磁盘容量大的时候，\r\n格式化磁盘的时间会非常的长。\r\n\r\n##### xfs\r\n\r\nXFS 是一个全64-bit的文件系统，它可以支持上百万T字节的存储空间。对特大文件及小尺寸文件的支持都表现出众，支持特大数量的目录。最大可支持的文件大 小为263 = 9 x 1018 = 9 exabytes，最大文件系统尺寸为18 exabytes。\r\n总体来说，XFS的各方面现在都已经超过了 ext4，所以现在很多新版本的 Linux 发行版本中，\r\n都已经替换成了 xfs。\r\n\r\n##### mkfs 格式化磁盘\r\n\r\n`mkfs.ext4 指定磁盘`格式化成 ext 4`mkfs.ext4 /dev/sdb1`\r\n`mkfs.xfs 指定磁盘`格式化成 xfs`mkfs.xfs /dev/sdb2`\r\n\r\n## 挂载磁盘 `mount`\r\n\r\n磁盘格式化完成后要将磁盘挂载才可以使用，在Windows下，其实也有这个步骤，\r\n不过一般都是和格式化磁盘同时进行了，Windows下叫驱动器号，就是平常所说的C盘、D盘，\r\nLinux下叫做挂在点，在前面已经介绍过，Linux是由 / 开始的目录结果，\r\n所以刚刚格式化好的磁盘理论上可以挂载到任意一个目录下，但是一般需要挂载点有意义一些，\r\n并且保证原本的目录是空的，否则会将原目录的数据覆盖，不能再使用。\r\n\r\n`mount 指定的磁盘分区 指定目录` 将指定的磁盘分区挂载到指定目录',1,6,0,0,0,100,'Linux磁盘分区','','2018-02-21 10:46:54','2018-02-21 10:46:54'),(8,'linux目录结构','## linux目录结构\r\n\r\n![Linux目录结构](http://pcen3n3o2.bkt.clouddn.com/linux%E7%B3%BB%E7%BB%9F%E7%9B%AE%E5%BD%95.png)\r\n\r\n#### /root\r\n\r\n该目录为系统管理员，也称作超级权限者的用户主目录。\r\n\r\n#### /bin\r\n\r\nbin是Binary的缩写, 这个目录存放着最经常使用的命令。\r\n\r\n#### /boot\r\n\r\n这里存放的是启动Linux时使用的一些核心文件，包括一些连接文件以及镜像文件。\r\n\r\n#### /dev\r\n\r\ndev是Device(设备)的缩写, 该目录下存放的是Linux的外部设备，在Linux中访问设备的方式和访问文件的方式是相同的。\r\n\r\n#### /etc\r\n\r\n这个目录用来存放所有的系统管理所需要的配置文件和子目录，来源于 法语的 et cetera ，源自 Minix 系统，\r\n翻译成中文就是等等的意思，用来放一些零碎的内容，慢慢就发展成为主要存放配置文件的目录。\r\n\r\n#### /home\r\n\r\n用户的主目录，在Linux中，每个用户都有一个自己的目录，一般该目录名是以用户的账号命名的。\r\n\r\n#### /lib\r\n\r\nlib是库（Library）的英文缩写，这个目录里存放着系统最基本的动态连接共享库，其作用类似于Windows里的DLL文件。几乎所有的应用程序都需要用到这些共享库。\r\n\r\n\r\n#### /media\r\n\r\nlinux系统会自动识别一些设备，例如U盘、光驱等等，当识别后，linux会把识别的设备挂载到这个目录下。\r\n\r\n#### /mnt\r\n\r\n这个目录是 mount 的缩写，系统提供该目录是为了让用户临时挂载别的文件系统的，我们可以将光驱挂载在/mnt/上，然后进入该目录就可以查看光驱里的内容了。\r\n\r\n#### /opt\r\n\r\n这个目录是 optional 的缩写，用于安装一些可选的软件，就是和系统本身没有关系的，很多第三方厂商的软件默认都放在这个目录，这是给主机额外安装软件所摆放的目录。比如你安装一个 Sublime 默认就会放在这个目录下。默认是空的。\r\n\r\n#### /proc\r\n\r\n这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。\r\n\r\n这个目录的内容不在硬盘上而是在内存里，我们也可以直接修改里面的某些文件。\r\n\r\n\r\n#### /sbin\r\n\r\ns就是Super User的意思，这里存放的是系统管理员使用的系统管理程序。\r\n\r\n\r\n#### /sys\r\n\r\n这是linux2.6内核的一个很大的变化。该目录下安装了2.6内核中新出现的一个文件系统 sysfs 。\r\nsysfs文件系统集成了下面3种文件系统的信息：针对进程信息的proc文件系统、针对设备的devfs文件系统以及针对伪终端的devpts文件系统。\r\n该文件系统是内核设备树的一个直观反映。\r\n当一个内核对象被创建的时候，对应的文件和目录也在内核对象子系统中被创建。\r\n\r\n#### /tmp\r\n\r\n这个目录是用来存放一些临时文件的。\r\n\r\n#### /usr\r\n\r\n这是一个非常重要的目录，用户的很多应用程序和文件都放在这个目录下，类似与windows下的program files目录。\r\n\r\n#### /var\r\n\r\n这个目录中存放着在不断扩充着的东西，我们习惯将那些经常被修改的目录放在这个目录下。包括各种日志文件。\r\n\r\n## 常用命令\r\n\r\n#### 查看当前所在路径`pwd`\r\n\r\n绝对路径与相对路径\r\n绝对路径\r\nLinux 的绝对路径是从 / 开始的路径，如 /etc/passwd\r\n相对路径\r\n相对于当前工作目录的路径。\r\n\r\n#### 查看目录或文件`ls`\r\n`ls -a`查看全部目录或文件包括隐藏文件\r\n`ls -l`列表方式查看目录或文件，别名`ll`\r\n`ll -a`列表方式查看全部目录或文件包括隐藏文件\r\n\r\n`. `代表当前目录。\r\n`.. `代表上级目录。\r\n`~` 代表当前用户所在的家目录。\r\n`~bro` 代表bro帐号所在的家目录（这个帐号是可以更换，根据用户不同代表目录不同）。\r\n\r\n#### 改变当前所在目录`cd`（change directory）\r\n`cd  ..`回到上级目录\r\n`cd ~`回到当前用户的家目录\r\n`cd ~root`回到root用户的家目录\r\n`cd -`直接回到上一次切换之前的目录',1,6,0,0,0,100,'linux目录结构','','2018-01-23 12:25:51','2018-01-23 12:25:51'),(9,'计算机组成','现代计算机是由`运算器、存储器、控制器、适配器、输入/输出设备、总线`组成的。这些部件或设备都是由元器件构成的有形物体，因而称为硬件或硬设备。\r\n\r\n现代数字计算机使用二进制数（电位的高低或脉冲的有无）来传送信息。\r\n\r\n>`计算机系统的性能主要取决于CPU和I/O速度`\r\n\r\n## CPU（中央处理器）\r\n\r\n当用计算机解决某个问题时，我们首先必须为它们编写程序。程序是一个指令序列，这个序列明确告诉计算机应该执行什么操作，在什么地方找到用来操作的数据。一旦程序进入内存，CPU就可以与内存交互，来完成取指令和执行指令的任务，从而解决我们问题。\r\n\r\n>CPU主要由运算器、控制器和部分高速缓存存储器（cache）组成\r\n\r\n\r\nCPU基本功能\r\n- 指令控制（控制程序的执行顺序）\r\n- 操作控制（把操作信号送往相应的部件）\r\n- 时间控制（对各操作进行严格的时间控制，有条不紊的执行指令）\r\n- 数据加工（对数据进行算术运算或逻辑运算，是CPU的根本任务）\r\n\r\n通常一个算术操作产生一个算术结果，一个逻辑操作产生一个判决。\r\n\r\n>最底层的是半导体物理学\r\n晶体管开关是建立在半导体物理学上的模型\r\n逻辑门是建立在开关上的模型\r\nCPU是建立在逻辑门上的模型\r\n`整个CPU就是一个开关网络！`\r\n\r\n上层模型只需要关心跟它紧挨着的下层模型，而不需要关心其他层模型。就如设计CPU只需要关心逻辑门，而不必关心晶体管开关怎么实现。\r\n\r\n这个层级很想人类的组织，中央管省，省管市，市管区，区管基层单位。人类组织是人类的“想象的共同体”，CPU的层级结构也是工程师想象的共同体。\r\n\r\n开关的功能是如此的简单，它只能根据两种命令完成两种动作，它是纯机械化的事，没有任何智能。但亿万个这样的开关组成在一起，就是CPU。就能运行软件，就能实现人工智能。\r\n\r\n## 存储器\r\n\r\n存储器是计算机系统中的记忆设备，用来存放程序和数据。\r\n\r\n计算机系统对存储器的要求是容量大、速度快、成本低。存储器的技术指标有容量指标（存储容量）和速度指标（存取时间、存储周期、存储器带宽）。\r\n\r\n##### 多级存储器体系结构\r\n\r\n>高速缓冲存储器（cache）、主存储器、外存储器。\r\n\r\n>`cache和主存合称为内存（内部存储器）。`\r\n\r\n>`CPU只能访问内存，不能访问外存。`\r\n\r\n#### cache\r\n\r\ncache是一个高速小容量半导体存储器，是主存的缓冲存储器，能够快速存取指令和数据，`解决CPU与主存之间速度不匹配的问题`。cache存储的内容是主存储器内容的一个子集。\r\n\r\n随着半导体器件集成度的提高，cache已放入到CPU中，其工作速度接近于CPU的速度。\r\n\r\ncache现已发展为多级cache体系。\r\n\r\n#### 主存\r\n\r\n主存储器是计算机的主要存储器，用来存放计算机运行期间的大量程序和数据。\r\n\r\n#### 外存\r\n\r\n外存（外部存储器）拥有强大的存储容量，通常用来存放系统程序和大型数据文件及数据库。主要分为磁盘存储器、磁带存储器、光盘存储器。\r\n\r\n>内存存储介质是半导体材料，断电后信息就会丢失，主要存储计算机运行时调用的程序和数据。\r\n\r\n>外存存储介质是磁性材料，断电后信息不会丢失，通常用来存放系统程序和大型数据文件及数据库。\r\n\r\n>`内存相当于是中介，计算机运行时内存从外存中获取CPU所需要的程序和数据，并把CPU返回来的数据存入外存。`\r\n\r\n#### 可移动存储器\r\n\r\n这部分属于外围设备。但功能是用来存储，所以归到这。\r\n\r\n分为U盘、光盘、移动硬盘等。\r\n\r\n磁盘存储器的主要技术指标包括存储密度、存储容量、存取时间及数据传输率。\r\n\r\n\r\n## 适配器（I/O接口）\r\n\r\n计算机的用途很大程度上取决于它所能连接的外围设备的范围。\r\n\r\n适配器是将CPU、主存和外围设备之间通过系统总线进行连接的标准化逻辑部件。适配器有两个接口：和系统总线的接口、和外设的接口。\r\n\r\n通过适配器可以实现高速CPU与低速外围设备之间工作速度上的匹配，并完成计算机与外设之间的所有数据的传送和控制。\r\n\r\n>`适配器（I/O接口）的作用是缓冲器（速度匹配）与转换器（数据传送和控制）`\r\n\r\n\r\n\r\n## 总线系统\r\n\r\n总线是构成计算机系统的互联机构，是多个系统功能部件之间进行数据传送的公共通道，并在争用资源的基础上进行工作。\r\n\r\n总线有物理特性、功能特性、电气特性、机械特性，因此必须标准化。当代流行的标总线追求与结构、CPU、技术无关的开发标准。\r\n\r\n>衡量总线性能的重要指标是总线带宽，它定义为总线本身所能达到的最高传输速率。\r\n\r\n各种外围设备必须通过I/O接口与总线相连。\r\n\r\n## I/O系统\r\n\r\ni/o系统即输入输出系统，操作系统中负责管理输入输出设备的部分称为i/o系统，完成设备管理功能,包括外设编址，数据通路的建立，向主机提供外设的状态信息等。\r\n\r\n>i/o系统的组成：外围设备，设备控制器及i/o操作有关的软硬件。\r\n\r\n#### 外围设备\r\n\r\n外围设备：事实上，除了CPU和主存外，计算机系统的其他每一部分都可以作为一个外围设备来看待。\r\n\r\n外围设备的功能是在计算机和其他机器之间以及与用户之间提供关系。没有外围设备的计算机就像缺乏五官四肢的人一样，即不能从外界接收信息，又不能对处理的结果做出表达和反应。\r\n\r\n\r\n输入设备：会看、会听\r\n输出设备：会写、会讲\r\n\r\n\r\n外围设备可分为输入输出设备（I/O）、外存设备、数据通信设备、过程控制设备几大类。\r\n\r\n如下图：中央部分是CPU和主存，通过总线和第二层的适配器（I/O接口）部件相连，第三层是各种外围设备控制器，最外层是外围设备。\r\n\r\n每一种外围设备都是在它自己的设备控制器下工作，为设备控制器通过I/O接口和主机连接，并受主机控制。\r\n\r\n\r\n#### 输入设备\r\n\r\n常用的计算机输入设备有图形输入设备（键盘、鼠标）、图像输入设备、语音输入设备。\r\n\r\n#### 输出设备\r\n\r\n常用的输出设备有显示设备和打印设备等。\r\n\r\n##### 显示设备\r\n\r\n以可见光的形式传递和处理信息的设备叫显示设备。\r\n\r\n显示系统由插在主机槽中的显示适配器卡（显卡）和显示器两部分组成。\r\n\r\n##### 打印设备\r\n\r\n打印设备有激光打印机、彩色喷墨打印机等，它们都属于硬拷贝输出设备。',1,1,0,0,0,100,'计算机组成','','2018-07-26 12:35:14','2018-07-26 12:35:14'),(10,'MarkDown基本语法','markdown是一种纯文本格式的标记语言。通过简单的标记语法，它可以使普通文本内容具有一定的格式。\r\n\r\n相比WYSIWYG编辑器\r\n\r\n#### 优点：\r\n\r\n1、因为是纯文本，所以只要支持markdown的地方都能获得一样的编辑效果，可以让作者摆脱排版的困扰，专心写作。\r\n\r\n2、操作简单。比如:WYSIWYG编辑时标记个标题，先选中内容，再点击导航栏的标题按钮，选择几级标题。要三个步骤。而markdown只需要在标题内容前加#即可\r\n\r\n#### 缺点：\r\n\r\n1、需要记一些语法（当然，是很简单。五分钟学会）。\r\n\r\n2、有些平台不支持markdown编辑模式。\r\n\r\n\r\n\r\n# 一、标题\r\n\r\n\r\n在想要设置为标题的文字前面加#和空格\r\n\r\n\r\n一个#是一级标题，二个#是二级标题，以此类推。支持六级标题。\r\n\r\n\r\n示例：\r\n\r\n```\r\n# 这是一级标题\r\n## 这是二级标题\r\n### 这是三级标题\r\n#### 这是四级标题\r\n##### 这是五级标题\r\n###### 这是六级标题\r\n```\r\n\r\n效果如下：\r\n\r\n# 这是一级标题\r\n## 这是二级标题\r\n### 这是三级标题\r\n#### 这是四级标题\r\n##### 这是五级标题\r\n###### 这是六级标题\r\n\r\n>注：这里一级、二级、四级显示样式不太一样，是因为个人设置的，markdown本身的样式主要就是大小不同\r\n\r\n# 二、字体\r\n\r\n - ##### 加粗\r\n\r\n要加粗的文字左右分别用两个*号包起来\r\n\r\n- ##### 斜体\r\n\r\n要倾斜的文字左右分别用一个*号包起来\r\n\r\n- ##### 斜体加粗\r\n\r\n要倾斜和加粗的文字左右分别用三个*号包起来\r\n\r\n- ##### 删除线\r\n\r\n要加删除线的文字左右分别用两个~~号包起来\r\n\r\n示例：\r\n```\r\n**这是加粗的文字**\r\n*这是倾斜的文字*`\r\n***这是斜体加粗的文字***\r\n~~这是加删除线的文字~~\r\n```\r\n\r\n效果如下：\r\n\r\n**这是加粗的文字**\r\n*这是倾斜的文字*\r\n***这是斜体加粗的文字***\r\n~~这是加删除线的文字~~\r\n\r\n---\r\n\r\n# 三、引用\r\n\r\n在引用的文字前加>即可。引用也可以嵌套，如加两个>>三个>>> \r\n n个...\r\n貌似可以一直加下去，但没神马卵用\r\n\r\n示例：\r\n```\r\n>这是引用的内容\r\n>>这是引用的内容\r\n>>>>>>>>>>这是引用的内容\r\n```\r\n\r\n效果如下：\r\n\r\n>这是引用的内容\r\n>>这是引用的内容\r\n>>>>>>>>>>这是引用的内容\r\n\r\n# 四、分割线\r\n\r\n三个或者三个以上的 - 或者 * 都可以。\r\n\r\n示例：\r\n```\r\n---\r\n***\r\n```\r\n效果如下：\r\n可以看到，显示效果是一样的。\r\n\r\n\r\n---\r\n***\r\n\r\n\r\n# 五、图片\r\n语法：\r\n```\r\n![图片alt](图片地址 \'\'图片title\'\')\r\n\r\n图片alt就是显示在图片下面的文字，相当于对图片内容的解释。\r\n图片title是图片的标题，当鼠标移到图片上时显示的内容。title可加可不加\r\n```\r\n示例：\r\n```\r\n![blockchain](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/\r\nu=702257389,1274025419&fm=27&gp=0.jpg \"区块链\")\r\n```\r\n效果如下：\r\n![blockchain](http://pcen3n3o2.bkt.clouddn.com/%E5%8C%BA%E5%9D%97%E9%93%BE.jpg)\r\n\r\n\r\n# 六、超链接\r\n\r\n语法：\r\n```\r\n[超链接名](超链接地址 \"超链接title\")\r\ntitle可加可不加\r\n```\r\n示例：\r\n```\r\n[简书](http://jianshu.com)\r\n[百度](http://baidu.com)\r\n```\r\n\r\n效果如下：\r\n\r\n[简书](http://jianshu.com)\r\n[百度](http://baidu.com)\r\n\r\n\r\n# 七、列表\r\n\r\n#### 无序列表\r\n\r\n语法：\r\n无序列表用 - + * 任何一种都可以\r\n\r\n示例：\r\n\r\n```\r\n- 列表内容\r\n+ 列表内容\r\n* 列表内容\r\n\r\n注意：- + * 跟内容之间都要有一个空格\r\n\r\n```\r\n\r\n效果如下：\r\n- 列表内容\r\n+ 列表内容\r\n* 列表内容\r\n\r\n#### 有序列表\r\n\r\n语法：\r\n数字加点\r\n\r\n示例：\r\n\r\n```\r\n1. 列表内容\r\n2. 列表内容\r\n3. 列表内容\r\n\r\n注意：序号跟内容之间要有空格\r\n```\r\n\r\n效果如下：\r\n\r\n1. 列表内容\r\n2. 列表内容\r\n3. 列表内容\r\n\r\n#### 列表嵌套\r\n\r\n**上一级和下一级之间敲三个空格即可**\r\n\r\n- 一级无序列表内容\r\n   - 二级无序列表内容\r\n   - 二级无序列表内容\r\n   - 二级无序列表内容\r\n\r\n- 一级无序列表内容\r\n   1. 二级有序列表内容\r\n   2. 二级有序列表内容\r\n   3. 二级有序列表内容\r\n\r\n1. 一级有序列表内容\r\n   - 二级无序列表内容\r\n   - 二级无序列表内容\r\n   - 二级无序列表内容\r\n\r\n2. 一级有序列表内容\r\n   1. 二级有序列表内容\r\n   2. 二级有序列表内容\r\n   3. 二级有序列表内容\r\n\r\n\r\n# 八、表格\r\n\r\n语法：\r\n\r\n```\r\n表头|表头|表头\r\n---|:--:|---:\r\n内容|内容|内容\r\n内容|内容|内容\r\n\r\n第二行分割表头和内容。\r\n- 有一个就行，为了对齐，多加了几个\r\n文字默认居左\r\n\r\n-两边加：表示文字居中\r\n-右边加：表示文字居右\r\n\r\n注：原生的语法两边都要用 | 包起来。此处省略\r\n```\r\n\r\n效果如下：\r\n\r\n姓名|技能|排行\r\n---|:---:|---:\r\n刘备|哭|大哥\r\n关羽|打|二哥\r\n张飞|骂|三弟\r\n\r\n\r\n# 九、代码\r\n\r\n#### 单行代码\r\n\r\n语法：两个反引号中间写内容\r\n\r\n示例：\r\n\r\n```\r\n`create database hero;`\r\n```\r\n\r\n效果：\r\n\r\n`create database hero;`\r\n\r\n#### 多行代码\r\n\r\n语法：三个反引号开始，回车，中间写代码内容，回车，三个反引号结束\r\n\r\n示例：\r\n\r\n```\r\n(```)\r\nfunction fun(){\r\n  echo \"这是一句非常牛逼的代码\";\r\n}\r\nfun();\r\n(```)\r\n```\r\n>注：前后三个反引号用小括号包起来了，避免被转译。实际中是没有小括号的\r\n\r\n效果如下：\r\n\r\n```\r\nfunction fun(){\r\n  echo \"这是一句非常牛逼的代码\";\r\n}\r\nfun();\r\n```\r\n\r\n# 十、流程图\r\n\r\n```\r\n（```）\r\nflow\r\nst=>start: 开始\r\nop=>operation: My Operation\r\ncond=>condition: Yes or No?\r\ne=>end\r\nst->op->cond\r\ncond(yes)->e\r\ncond(no)->op\r\n（```）\r\n```\r\n>注：前后三个反引号用小括号包起来了，避免被转译。实际中是没有小括号的\r\n\r\n效果如下：\r\n\r\n流程图支持不好，所以截了个图\r\n![流程图.png](http://upload-images.jianshu.io/upload_images/6860761-9d9524ba31047696.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)',1,1,0,0,0,100,'MarkDown基本语法','','2018-07-26 13:17:46','2018-07-26 13:32:59'),(11,'windows及linux重装系统方法','重装系统最主要的就是需要有另外一个系统能够引导启动计算机。目前主流的安装系统方法是通过把u盘制作成系统启动盘来安装\r\n\r\n理想状态是将u盘分区，将windows和linux系统做到一个u盘里。但windows系统不支持u盘分区（只认一个分区。移动硬盘可以分区，可以把u盘伪装成移动硬盘然后分区，但我不会）。\r\n\r\nu盘分区还有一个好处就是启动+文件存储。把启动程序单独放到一个分区，文件存储放在一个分区，操作文件不会影响启动程序。\r\n\r\nu盘初始化\r\n管理员身份进入命令行->diskpart->select disk 1->clean将u盘变为原始盘\r\n分区\r\n控制面板->管理工具->计算机管理->磁盘管理->可移动磁盘->右击，新建简单卷。\r\n\r\n>目前采取的是用两个u盘，分别做windows系统启动盘和linux系统启动盘。windows系统启动盘容量大，除了系统启动文件外还装了一些常用的软件源，装完系统可以直接把常用软件装上。\r\n\r\n\r\n## 制作启动盘\r\n\r\n### windows系统启动盘\r\n\r\n环境：windows系统下制作windows启动盘（linux下制作windows启动盘没试过）\r\n\r\n1、安装u盘制作工具（如：U启动、大白菜、老毛桃之类的制作软件）我用的u启动\r\n2、打开u盘制作软件，根据提示步骤进行即可（都选默认即可）\r\n3、将要安装的windows系统镜像文件（去官网下载）放入启动盘的ISO文件夹\r\n4、下载驱动精灵装入u盘，等重装系统时用来安装驱动\r\n\r\n>启动盘做完可以预装一些常用的软件源，等装完系统后可以直接安装进电脑\r\n\r\n### linux系统启动盘\r\n\r\n制作ubuntu系统启动盘\r\n\r\n环境：ubuntu系统下制作ubuntu启动盘（其他没试过）\r\n\r\n如果ubuntu系统是运行在虚拟机的话，把焦点放在ubuntu系统上，插入u盘，让系统识别u盘（如果ubuntu系统是物理机，u盘直接就会识别）\r\n1、把要安装的系统镜像文件存入u盘\r\n2、命令行`usb-creator-gtk`若没有此命令执行`sudo apt install usb-creator-gtk`命令安装此包\r\n3、在弹出的对话框里选择“其他”选择要安装的系统的iso镜像文件\r\n4、点击制作启动盘\r\n\r\n>注意：ubuntu系统启动盘会占满整个u盘（无论u盘容量多大），所以，尽量用个小的u盘来制作ubuntu系统启动盘，避免浪费\r\n\r\n## 安装\r\n\r\n### windows系统\r\n进入bios\r\n1、关闭U启动PE装机工具（默认打开的，一般用WinNTStup工具安装）\r\n2、格式化c盘（要安装系统的盘，默认c盘）\r\n3、装载镜像文件（进入u盘，右键点击装载），自动到cd/sources下，为install..wim文件\r\n4、打开WinNTStup。选择包含windows安装文件的文件夹 选择install.wim文件，在cd/sources下。引导驱动器选c盘、安装磁盘的位置选c盘。然后开始安装即可\r\n5、u盘里找到驱动精灵，下载。安装驱动\r\n6、安装常用软件\r\n\r\n### linux系统\r\n进入bios后，直接就会进入安装ubuntu系统的界面，按步骤安装即可。\r\n安装软件(参考[linux软件包](https://mp.weixin.qq.com/s/ykB3p-Re19EI7-_hR_633w))',1,6,0,0,0,100,'windows及linux重装系统方法','','2018-07-26 13:34:56','2018-07-26 13:34:56'),(12,'初识MySQL','MySQL是一种`关系型数据库`。（建立在关系模型上的数据库就是关系型数据库。）本身是一个软件。\r\n\r\n数据库（database 简称DB）软件以文件的形式来管理数据。而数据库服务器（安装了MySQL等数据库软件的机器）提供储存和处理数据的服务。\r\n\r\n数据库**按数据组织方式**可分为层次式数据库、网络式数据库、关系式数据库。**按数据库模型**可分为`关系型数据库(SQL)`、`非关系型数据库(NOSQL)`。\r\n\r\n>目前最流行的数据库模型主要是两种，即关系型数据库和非关系型数据库。\r\n\r\n\r\n关系分为`一对一`、`一对多`、`多对多`。区分关系把握住实体！\r\n\r\n\r\n实体：客观存在的事物，能够看得见，摸得着或者感受到。所对应的是数据库记录。\r\n\r\n实体集：抽象出来的，具体的事物的一个抽象的统称。所对应的是数据库的表概念\r\n\r\n属性：实体具有的特性，对于的数据库的概念是表字段(列)。\r\n\r\n## MYSQL 数据库\r\n\r\n### SQL（structured query language）\r\n\r\n结构化查询语言。同时这个sql也是数据库文件的脚本后缀名。\r\n\r\nSQL是数据客户端与数据库服务端进行沟通的语言，SQL语言是一种SQL通信的规范。是由美国的国家标准协会制定的标准（1986）。几乎所有的关系型数据库都是支持SQL的。\r\n\r\n### SQL分类：\r\n\r\nDCL：数据库控制语言： 主要是进行权限以及数据库用户的管理。\r\n\r\nDDL：数据库定义语言： 创建表，创建库。\r\n\r\nDML数据操作语言（对数据进行增删改查）\r\n\r\nDQL： 数据库查询语言：数据的查询。\r\n\r\n\r\n### 范式(Normal Format)\r\n\r\n#### 定义\r\n\r\n符合某一种级别的关系模式的集合。构造数据库必须遵循一定的规则。在关系数据库中，这种规则就是范式。\r\n\r\n#### 范式层级（1NF-6NF）\r\n\r\n主要用到前三层\r\n\r\n第一范式（1NF）：字段要保证原子性，也就是字段不可拆分\r\n\r\n第二范式（2NF）：一张表中所有的字段完全直接依赖于主键\r\n\r\n第三范式（3NF）：主要解决传递依赖\r\n\r\n\r\n>范式作用：解决存储空间问题（关系存储过程中的数据冗余问题。\r\n>特点：每一层都比上一层更加严格。每一层都是下一层的基础条件\r\n\r\n\r\n\r\n#### 逆范式\r\n\r\n由起：有时数据表中的一些数据需要从另外一个数据表中根据关联查询去获取，理论上也能够取到数据。但是效率就会低很多，所以可以在设计数据表的时候增加一个字段去保存在查询时经常会获取的另一个数据表中的字段。这样在进行数据获取的时候使用一张数据表就能够获取到所有的数据。从而提高了查询效率。\r\n\r\n>作用：解决效率问题。\r\n\r\n### MySQL数据库的组织架构\r\n\r\n#### 数据库\r\n\r\nMySQL可以有多个数据库\r\n\r\n一个数据库可以有多个数据表\r\n\r\n#### 数据表\r\n\r\n一个数据表可以有多个记录\r\n\r\n一个记录可以有多个字段\r\n\r\n#### 数据\r\n\r\n就是具体的值\r\n\r\n图示MySQL数据库的组织架构\r\n\r\n![MySQL数据库的组织架构](http://pcen3n3o2.bkt.clouddn.com/%E6%95%B0%E6%8D%AE%E5%BA%93%E7%BB%93%E6%9E%84.png)\r\n\r\n数据表结构\r\n\r\n![数据表结构](http://pcen3n3o2.bkt.clouddn.com/%E8%A1%A8%E7%BB%93%E6%9E%84.png)',1,7,0,0,0,100,'初识MySQL','','2018-02-10 14:43:55','2018-02-10 14:43:55'),(13,'MySQL中的表结构','MySQL中的表结构分为`表字段`、`字段数据类型`、`字段属性`三部分。创建表就是对这三部分的设置\r\n\r\n![表结构.png](http://pcen3n3o2.bkt.clouddn.com/%E8%A1%A8%E7%BB%93%E6%9E%84.png)\r\n\r\n\r\n## 一、表字段\r\n\r\n- 本表的记录内容\r\n- 确定表与表之间的关系\r\n- 设计遵循范式规则\r\n\r\n详见[初识MySQL](http://118.24.52.193/posts/12)\r\n\r\n## 二、字段属性\r\n\r\nMySQL规定： 一条记录最大只能有65535个字节。\r\n\r\n### 1、null属性\r\n\r\n- MySQL字段的默认属性为空\r\n- MySQL使用一个字节去保存空字段\r\n- 空字段会使数据表的查询变慢。所以开发中所有数据都不能为空。\r\n\r\n#### 指定某一个字段不能为空的方法：\r\n\r\n在数据字段定义的时候：\r\n\r\n```\r\nalter table table_name add 字段名 字段类型  not null;\r\n```\r\n在数据字段修改的时候：\r\n```\r\nalter table table_name modify 字段名 字段类型  not null;\r\n```\r\n\r\n### 2、key属性\r\n\r\n**键即索引**\r\n\r\n#### 主键(primary key)\r\n\r\n**定义**\r\n\r\n- 表里唯一能够确定一行数据的字段\r\n- 不能重复\r\n- 不能为空\r\n- **组合主键：**包含多个字段的主键\r\n\r\n**添加主键**\r\n\r\n在创建表的时候在字段的属性中申明字段为主键\r\n\r\n```\r\n//单一主键\r\ncreate table table_name (\r\n字段名 字段类型 primary key\r\n);\r\n\r\n//组合主键：最后一起添加\r\ncreate table table_name(\r\n字段1 字段类型,\r\n字段2 字段类型,\r\n字段n 字段类型\r\nprimary key(字段1，字段2));\r\n```\r\n\r\n追加字段的方式在字段的属性中申明字段为主键\r\n\r\n```\r\nalter table table_name add 字段 字段类型 primary key;\r\n```\r\n\r\n修改字段属性的方式申明字段为主键\r\n\r\n```\r\nalter table table_name modify 字段 字段类型 primary key;\r\n```\r\n\r\n注意：如果数据表中有数据的话无法添加主键！！！\r\n\r\n**删除主键**\r\n\r\n```\r\nalter table table_name drop primary key;\r\n```\r\n\r\n#### 唯一键(unique key)\r\n\r\n**定义**\r\n\r\n- 唯一键的本质与主键类似\r\n- 唯一键允许为空，并且允许多个字段为空，为空的字段不参与唯一键的比较。\r\n\r\n**添加唯一键**\r\n\r\n```\r\n方式跟添加主键一样\r\n```\r\n\r\n**删除唯一键**\r\n\r\n使用建表语句来查看唯一键名字\r\n\r\n```\r\nshow create table table_name;\r\n```\r\n\r\n使用删除索引的语法删除\r\n```\r\nalter table table_name drop index index_name;\r\n```\r\n\r\n#### 外键\r\n\r\n一张表里面有一个字段刚好又是另外一张表的主键。我们就称呼这个字段为这张表的外键。\r\n\r\n**添加外键**\r\n\r\n创建表的时候添加\r\n在要变成外键的字段后添加声明\r\n```\r\ncreate table table_name(\r\n外键字段 类型 属性，\r\nalter table table_name add foreign key(字段) references table_name(主键字段)； foreign key (外键字段) references 外表(主键)\r\n);\r\n注：外键字段和声明紧挨着。跟其他字段位置无关\r\n```\r\n```\r\nconstraint 名字 可以自己起外键名字 foreign key外键 references 映射\r\n```\r\n\r\n修改字段的方式添加外键\r\n```\r\nalter table table_name add constraint 名字 foreign key(外键字段) references 外表(主键字段);\r\n```\r\n![外键](http://pcen3n3o2.bkt.clouddn.com/%E5%A4%96%E9%94%AE.png)\r\n在建立外键的时候，外键的字段必须是一个索引（键）。所以在创建外键的时候，数据库会自动为这个字段先添加一个键。然后再去添加外键。所以最后我们能够看到的就是mul。也就是多个建。\r\n\r\n**修改&删除外键**\r\n\r\n外键不能修改只能删除再建新的\r\n\r\n#### 自动增长(auto_increment)\r\n\r\n**规则**\r\n\r\n- 当对应的字段不给值或者复制为null的时候，自动从上一条数据的这个字段中取值，然后+1作为这个数据的字段记录的值。\r\n- 自动增长必须是数字整数类型\r\n- 自增长的字段必须是索引(也就是在key栏位有东西的字段)\r\n - 一个数据表只能有一个自增的字段\r\n\r\n**添加自动增长**\r\n\r\n```\r\n跟添加主键一样\r\n```\r\n**删除自增**\r\n\r\n修改字段的方式删除\r\n```\r\nalter table table_name modify 字段 类型 属性（不要加自增即可）;\r\n```\r\n\r\n\r\n**与自增相关的变量increment**\r\n\r\n![自增.png](http://pcen3n3o2.bkt.clouddn.com/%E8%87%AA%E5%A2%9E.png)\r\n\r\n**修改步进值**\r\n\r\n```\r\nset auto_increment_increment =值; \r\n```\r\n**修改自增值**\r\n\r\n```\r\nalter table table_name auto_increment=数值;\r\n```\r\n\r\n如果修改的自增值大于当前的自增值，那么下一次插入的数据是按照这个自增值进行插入的。\r\n\r\n如果修改的自增值小于当前的自增值，那么洗一次插入的数据按照正常的自增值插入。\r\n\r\n### 3、default属性\r\n\r\n- 数据默认值(初始值)\r\n- 有默认值的字段插入数值时的方式：\r\n\r\n指定好字段 `insert into table_name (字段) values(\"值\"); `\r\n默认值占位 `insert into table_name values(\"值\",default); `\r\n\r\n### 4、索引\r\n\r\n**定义**\r\n\r\n- 根据某种算法（btree，hash）将表中的数据进行快速的匹配。\r\n- 几乎所有的索引都是建立在表字段上的，与表的建表语句一起保存。\r\n- 默认的索引的名称是字段的名称。\r\n\r\n**MySQL中的索引**\r\n\r\n- 主键索引\r\n- 唯一索引\r\n- 普通索引\r\n- 全文索引(分词难) ---sphinx分词\r\n\r\n**索引的作用**\r\n\r\n- 提高数据的查询效率。\r\n- 能够对数据进行约束（唯一键）\r\n\r\n**增加索引的不利影响**\r\n\r\n- 索引文件大，甚至可能比数据本身的文件还要大。(用空间换取效率)。\r\n- 数据的约束条件，数据在插入的时候就比较慢。\r\n\r\n### 5、comment属性\r\n\r\n对字段的描述，没有任何实际的数据库意义。一般给程序员或DBA看的\r\n\r\n## 三、数据类型\r\n\r\n![数据类型.png](http://pcen3n3o2.bkt.clouddn.com/%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B.png)\r\n\r\n### 1.数值型\r\n\r\n#### 整数型\r\n\r\n- tinyint(微整型)：1个字节存储数据，最大值255\r\n- smallint(小整型)：2个字节存储数据 ，最大值65535\r\n- mediumint(中整型)：3个字节存储数据\r\n- int(标准整型)：4个字节存储数据\r\n- bigint(大整型)：8个字节存储数据\r\n\r\n|整数类型|字节|有符号数范围|无符号数范围|\r\n| :---: | :---: | --- | :---: |\r\n|tinyint|1|-127~128|0~255|\r\n|smallint|2|-32768~32767|0~65535|\r\n|mediumint|3|-8388608~8388607|0~1677215|\r\n|int|4|-2147483648~2147483647|0~4294967295|\r\n|bigint|8|-9223372036854775808~9223372036854775807|0~18446744073709551615|\r\n\r\n数据库默认的存储整型的方式是**有符号数**\r\n\r\n给表添加一个使用无符号数存储整型的字段\r\n```\r\nalter table table_name add 字段名 整型 unsigned; \r\n```\r\n\r\n添加0填充 zerofill\r\n```\r\nalter table  table_name add 字段名 整型 zerofill;\r\n```\r\n\r\n\r\n#### 小数型\r\n\r\n带有小数点的数据类型或者超出整形范围数都是小数型。\r\n\r\n小数型又分为浮点型和定点型。\r\n\r\n**浮点型**\r\n\r\n浮点型又分为单精度（float）和双精度（double）\r\n\r\n**float(单精度)**：使用4个字节存储数据，精度的范围大概在6位左右。小数点会浮动，精度有限，而且可能会丢失精度。\r\n\r\n创建float类型字段\r\n\r\n1. 直接使用float创建：数据按照自己的精度进行存储\r\n2. 使用float（M,D）方式创建(非典型用法)：小数位是D位，整数位是M-D位。小数位与整数位的总和是M\r\n\r\n**double(双精度)**：使用8个字节存储数据，精度的范围大概在16位左右。\r\n\r\n**定点型(decimal)**\r\n- 小数点固定，精度比较高，不会丢失精度。\r\n- 存储有效范围与double一致。精度由M和D共同决定\r\n- 默认是一个整数。整数位是10位，小数位是0位\r\n- 保存小数的最大有效范围是30位。\r\n\r\n**基本用法是decimal(M,D)**，使用M+2个字节存储数据\r\n\r\n\r\n### 2.字符串型\r\n\r\n#### char\r\n\r\n- 固定长度字符串，创建数据库表的时候规定好数据的长度。char(L):L 表示长度，单位是字符。char的最大长度是255\r\n- char的最大存储长度255*3 = 765个字节(utf8编码的文字的时候，一个中文时3个字节)\r\n\r\n#### varchar\r\n\r\n- 变长长度，在数据表定义的时候，指定的长度就是数据的最大长度，数据开辟的空间是按照最大的长度开辟的。实际占用的长度是按照实际字符串长度占用的空间来计算的，多余的部分回收。\r\n- varchar(L)： L表示长度。表示的是定义的时候的长度，不是实际占用的长度。如果一个字符串达不到实际开辟的长度,就会按照实际的长度进行调整。\r\n- varchar默认的最大长度是65535个字符。\r\n- 注意： varchar的类型除了要保存数据的实际内容之外，还需要使用1-2个字符的空间去保存数据的长度。\r\n\r\n如果在实际开发中一个字符串超过了255个字符，那么既不会用char类型也不会使用varchar类型，而是使用text类型。\r\n\r\n#### 文本类型(text/blob)\r\n\r\n若字符串的长度超过了255个字符就使用文本类型的数据格式存储。\r\n\r\n文本类型的数据格式按照存储的数据的格式分为两类：\r\n\r\n1. **text存储字符串格式的数据**\r\n\r\n2. blob存储二进制格式的数据（通常不用）\r\n\r\n文本类型不占用数据记录的空间，而是占用ibdata1文件空间。\r\n\r\n#### enum(枚举)\r\n\r\n- 类似于HTML里面的radio(单选框)\r\n- 将有可能使用到的数据都定义好，在使用的时候只能从定义好的数据里面选取，如果是使用没有定义的数据会产生错误。\r\n- **enum类型的数据在MySQL中实际使用int类型存储**，可节约空间\r\n- 预先定义好的数据类型能够保证数据格式统一规范。\r\n\r\n\r\n#### set(集合)\r\n\r\n- 类似于HTML中的多选框(CheckBox)\r\n- set使用二进制数字进行存储，每一个值都是一个二进制位。\r\n\r\n\r\n### 3.日期时间型\r\n\r\n\r\n|类型|取值范围| 存储空间 |零值|\r\n| :---: | :---: | --- | :---: |\r\n|date|1000-01-01~9999-12-31|3字节|0000-00-00|\r\n|time|-838.59.59~838.59.59|3字节|00:00:00|\r\n| <span style=\"color:red;\">**datetime**</span> |1001-01-01 00:00:00~9999-12-31 23:59:59|8字节|0000-00-00 00:00:00|\r\n| <span style=\"color:red;\">**timestamp**</span> |1970-01-01 00:00:00~2038-01-19 03:14:07|4字节|0000-00-00 00:00:00|\r\n|year| <span style=\"color:red;\">4位:1901-2155</span>，2位:70-69|1字节  |000|\r\n\r\n\r\n####  datetime\r\n\r\n- 格式： YYYY-MM-dd HH：ii：ss\r\n- 表示的范围 1000-01-01 00:00:00   到  9999-12-31 23:59:59\r\n- 可省略分隔符，但不能省略前导0。比如01不能为1\r\n- now(): mysql内部的时间函数，能够获取当前时间。\r\n\r\n```\r\ninsert into table_name values(now());\r\n```\r\n\r\n#### date\r\n\r\n日期格式 ，相当于datetime的日期部分\r\n\r\n#### timestamp(时间戳)\r\n\r\n- 格式上与datetime格式完全一致\r\n- 数据的存储形式上使用4个字节的int来存储。\r\n\r\n#### time\r\n\r\n表示的是一天中的时间，也可以表示时间段。\r\n\r\n#### year\r\n\r\n两种格式\r\n\r\n- year(4):  XXXX 范围：1901-2155年  默认的是这个格式\r\n- year(2),  XX 范围：1970-2069年。如果（00-69）表示 2000-2069，如果（70-99）表示 1970-1999\r\n\r\n**注意：**在实际开发过程中，如果是一个不需要进行处理的时间格式，那么就使用datetime格式进行存储\r\n\r\n如果需要进行时间计算一般用int存储为一个事件的格式。再用PHP获取到时间之后用PHP时间函数进行数据处理time()、date()\r\n\r\n\r\n>总结：创建数据表的流程\r\n\r\n>1、判断表与表的关系，建几张表\r\n\r\n>考虑因素：表关系（一对一、一对多、多对多）、范式\r\n\r\n>2、一张表内\r\n\r\n>考虑因素：\r\n\r\n>字段设计：几个字段\r\n\r\n>数据类型：各字段属于什么数据类型\r\n>>选择数据类型黄金定律\r\n1. 先选择大类型，再选择小类型。\r\n2. 具体的小类型原则： 越小越好，越简单越好，不使用null最好。\r\n\r\n>字段属性：每个字段都不能为空、主键是哪个、有没有唯一键、自动增长',1,7,0,0,0,100,'MySQL中的表结构','','2018-02-12 06:38:25','2018-07-27 06:40:27'),(14,'MySQL高级查询','# MySQL查询完整语法\r\n\r\n```\r\nselect [select选项] */字段列表[字段别名] from 数据源 \r\n[where 条件子句][group by 子句][having 子句][order by 子句][limit 子句];\r\n```\r\n\r\n## select选项\r\n\r\nall： 全部的数据，默认选项\r\n\r\ndistinct：去除重复\r\n\r\n## 字段别名\r\n\r\n多表查询的时候，如果表里面具有相同名字的字段，但是表示的是不同的意思，就需要给字段起一个别名。\r\n\r\n```\r\n字段名 as 别名\r\n```\r\n\r\n## 数据源\r\n\r\n- 数据的来源\r\n- 关系型数据库的数据来源就是数据表\r\n\r\n数据源细分：\r\n\r\n- 单表数据源\r\n- 多表数据源\r\n```\r\nselect * from table_name1[as 别名],table_name2[as 别名] where 条件;\r\n当判断条件中两个表的字段相同时需要用到别名来区分\r\n例：判断条件是两个表的id相等\r\nselect * from stu as s,ter as t where s.id=t.id;\r\n```\r\n- 查询结果\r\n```\r\nselect 字段 from (select */字段列表 from table_name) as 别名;\r\n括号里的查询结果要起一个别名\r\n```\r\n\r\n## where 子句\r\n\r\nwhere子句是一个判断条件，返回布尔值\r\n\r\n判断条件\r\n\r\n常规：> < = <= >= != && ||\r\n\r\n**like**\r\n```\r\nselect * from table_name where name like \'%xiao%\';\r\nselect * from table_name where name like \'xiao%\';\r\nselect * from table_name where name like \'%xiao\';\r\n\r\n```\r\n- 模糊匹配，用%表示。\r\n- %是一个占位符，表示可以是任何字符。\r\n- %两边都有：表示两边都模糊匹配。\r\n- %左有右无：表示往右模糊匹配。\r\n- &右有左无：表示往左模糊匹配。\r\n\r\n**between and**\r\n\r\n在什么和什么之间\r\n```\r\nselect * from table_name where id between 5 and 15;\r\n```\r\n**in / not in**\r\n\r\n满足in里面的条件/满足in外面的条件\r\n\r\n```\r\nselect * from table_name id in(1,2,3,4,5,6,7);\r\n```\r\n\r\n## group by 子句\r\n**规则：**\r\n- 按照某个字段进行分组统计（非分组查询）\r\n- 每一个分组只会获取第一条符合分组的数据。\r\n- 一般与聚合函数一起使用\r\n\r\n**SQL进行数据统计的函数（聚合函数）**\r\n\r\n- count() : 计算符合查询的条数\r\n  参数一般用*，也可以使用字段。若字段，那字段为null的数据不计算条数。\r\n- max() : 计算字段的最大值\r\n- min() : 计算字段的最小值\r\n- avg() : 计算字段的平均值\r\n- sum() : 计算字段的和\r\n\r\n\r\n**分组排序**\r\n\r\n- 对分组的结果进行排序，而不是对分组的内部进行排序。\r\n- ASC：升序（默认方式）\r\n- DESC：降序\r\n```\r\nselect sex,count(*) as total from table_name group by sex desc;\r\n查询两个字段 性别和总量（别名total）两个字段逗号隔开，降序排列\r\n```\r\n\r\n**多字段分组**\r\n\r\n先对一个字段进行分组，在分组的内部再对第二个字段进行分组\r\n```\r\nselect class,sex,count(sex) as total from table_name group by class,sex;\r\n```\r\n获取分组后的所有指定数据\r\n```\r\ngroup concat(字段) //获取分组中所有数据的某一个字段\r\n```\r\n```\r\nselect sex,count(*) as total,group concat(name) as cname \r\nfrom student group by sex desc;\r\n查询按性别分类的性别总数和各性别组里的人名\r\n```\r\n\r\n**回溯统计(with rollup)**\r\n\r\n- 任何一个分组之后会有一个小的分组，在这个分组上再次进行统计\r\n- with rollup 与order by 是互斥的。\r\n- 单字段分组排序，最后统计的是这个分组的总和。\r\n- 多字段分组之后，统计的是各个小分组的内部的总和还有所有分组的总和。\r\n\r\n```\r\nselect class,sex,count(sex) as total from table_name group by class,sex with rollup;\r\n```\r\n## having 子句\r\n\r\nhaving子句与where子句功能一样，也是进行数据筛选的\r\n\r\n查询所有班级id大于2的学生，并且按照班级进行分组：\r\n```\r\nselect classid,count(classid) from student where classid>2 group by classid;\r\nselect classid,count(classid) from student  group by class having classid>2;\r\n```\r\n注意顺序，having子句写在group by 后。where子句写在group by前。\r\n\r\n**where与having的区别：**\r\n\r\n- where子句是磁盘级的，只有符合where子句条件判断的数据才能够进入内存。**能够使用where尽量使用where，提高内存的使用率。**\r\n\r\n- where子句无法使用count等聚合函数，无法使用别名。函数、别名是进入内存之后的操作\r\n\r\n- group by 是将进入内存的数据进行分组，如果需要对分组之后的数据再次进行过滤，就需要使用到having。\r\n\r\n- having 能够实现所有where子句的操作，但是where不一定能够实现having的操作。\r\n\r\n- 分组查询只能在having子句里面使用，因为where是磁盘级的查询，这个时候还没有分组统计的结果，不能使用聚合函数。\r\n\r\n\r\n## order by 子句\r\n\r\n排序\r\nasc\r\ndesc\r\n```\r\norder by 字段 asc/desc;\r\n```\r\n多字段排序\r\n- 多字段排序的时候首先要根据某一个字段进行排序。然后在排好的顺序内部再根据第二个字段进行排序。\r\n- 第二个字段不会影响第一个字段的排序。\r\n```\r\nselect * from table_name order by 字段1 asc,字段2 desc;\r\n```\r\n## limit 子句\r\n\r\nlimit子句是一个限制结果的子句，限制删除数量，限制修改数量。 限制查询的数量。在一定程度上可以实现数据获取的安全性。\r\n\r\n```\r\nlimit 数量;\r\n```\r\n```\r\nlimit 开始位置,数量；\r\n```\r\n```\r\nselect * from table_name limit 0,5;\r\n注意：数据库的计数是从0开始的，但是数据库的id起始位置是从1开始的。\r\n```\r\n```\r\nselect * from table_name limit num*(page-1),num；\r\n查询第n页的数据\r\n```\r\n# 联合查询\r\n\r\n联合查询语句\r\n\r\n```\r\nselect语句1 union [union选项] select语句2；\r\n注意：两个数据表的查询可以在不同的数据表中，\r\n但是查询的结果里面的字段 顺序必须是一致的\r\n```\r\n\r\nunion选项\r\n\r\n- all：所有\r\n- distinct：去重复（默认选项）\r\n\r\n```\r\n\r\nselect name from table_name1 union all select name from table_name2;\r\n```\r\n\r\n查询两个表，一个id降序一个id升序\r\n```\r\nselect * from (select * from table_name1 order by id desc) as 别名1 union select * from (select * from table_name2 order by id asc) as 别名2;\r\n```\r\n\r\n# 连接查询\r\n\r\n连接表查询\r\n\r\n数据库每一个数据表都是保存一方面的数据。所以有的时候如果想要获取完整的数据就需要使用几张表之间的关联关系和关联条件进行表关联查询。\r\n\r\n```\r\nselect * from 左表 join 右表；\r\n```\r\n## 交叉查询\r\n\r\n```\r\nselect * from 左表 cross join 右表；\r\nselect * from 表1，表2；//等价与不写条件的双表查询\r\n```\r\n\r\n笛卡尔积\r\n两张表交叉连接的总数量 = 左表的数量 * 右表的数量 \r\n\r\n## 内连接查询\r\n\r\n- 从左表中每次取出一条数据，与右表中的每一条数据进行匹配。\r\n- 符合on条件数据作为结果\r\n- on表示连接的条件，左表的字段与右表的字段必须表示的是相同的业务意义。\r\n\r\n```\r\nselect * from 左表 inner join 右表 on 左表.字段 = 右表.字段；\r\n```\r\n\r\n- 当两个表里面的字段名称是唯一的话，可以省略表名称\r\n- 如果两个表里面有相同的连接字段，比如说都有id。那么这两个表名称能不能省略。\r\n\r\n## 外连接查询\r\n\r\n- 以某一个表为准，取出表中的每一条数据，然后与另一张表中的每一条数据进行匹配。\r\n- 如果能够匹配的上，那么就像内连接一样正确的保存。\r\n- 如果不能够匹配符，那么第一张表的数据正确保存，第二张表的字段全部置null。\r\n\r\n**外链接有两种： 以某个表为准，那么这个表就是主表，主表的字段都是有值的。**\r\n\r\n- 左外连接： 左表 left join 右表  按照左表为准\r\n- 右外链接： 左表 right join 右表 按照右表为准。\r\n\r\n```\r\nselect * from 左表  left | right  join  右表 on 左表.字段 = 右表.字段；\r\n```\r\n\r\n查询的数据量等于匹配的数据量加上剩下的主表的数据量\r\n\r\n## 自然连接查询\r\n\r\n- natural join ：自动连接，自动匹配连接条件。\r\n- 系统自动使用名称相同的字段作为连接条件。（同名的字段作为连接条件，多个同名的字段都会作为条件。）\r\n\r\n\r\n自然内连接：\r\n```\r\nselect s.*,c.name,c.id from student as s inner join class as c;\r\n```\r\n自然外链接：\r\n```\r\nselect s.*,c.name,c.id from student as s left join class as c;\r\n```\r\n---\r\n\r\n>#### 总结\r\n>**MySQL查询完整语法**\r\n>`select [select选项] */字段列表[字段别名] from 数据源 \r\n>[where 条件子句][group by 子句][having 子句][order by 子句][limit 子句];`\r\n>**联合查询**\r\n>`select语句1 union [union选项] select语句2；`\r\n>**连接查询**\r\n>`select * from 左表 join 右表；`\r\n>交叉查询、内连接查询、外连接查询、自然查询',1,7,0,0,0,100,'MySQL高级查询','','2018-02-17 09:43:47','2018-02-17 09:43:47'),(15,'MySQL存储引擎之InnoDB和MyISAM','MySQL 提供了多个存储引擎，包括处理事务安全表的引擎和处理非事务安全表的引擎。在 MySQL 中，不需要在整个服务器中使用同一种存储引擎，针对具体的要求，可以对每一个表使用不同的存储引擎。\r\n\r\n>查询数据库默认支持的所有存储引擎 `SHOW ENGINES;`\r\n查询默认的存储引擎`SHOW VARIABLES LIKE \'%storage_engine%\';`\r\n\r\n\r\n\r\n最常用的就是 InnoDB和MyISAM ，他们的特性正好也几乎都是互斥的，可以根据业务的需要来决定使用那种存储引擎。\r\n\r\n## InnoDB和MyISAM主要特点对比\r\n\r\n#### 存储结构\r\n\r\nMyISAM：每个MyISAM在磁盘上存储成三个文件。第一个文件的名字以表的名字开始，扩展名指出文件类型。.frm文件存储表定义。数据文件的扩展名为.MYD (MYData)。索引文件的扩展名是.MYI (MYIndex)。\r\n\r\nInnoDB：所有的表都保存在同一个数据文件中（也可能是多个文件，或者是独立的表空间文件），InnoDB表的大小只受限于操作系统文件的大小，一般为2GB。\r\n\r\n#### 存储空间\r\n\r\nMyISAM：可被压缩，存储空间较小。支持三种不同的存储格式：静态表(默认，但是注意数据末尾不能有空格，会被去掉)、动态表、压缩表。\r\n\r\nInnoDB：需要更多的内存和存储，它会在主内存中建立其专用的缓冲池用于高速缓冲数据和索引。\r\n\r\n#### 可移植性、备份及恢复\r\n\r\nMyISAM：数据是以文件的形式存储，所以在跨平台的数据转移中会很方便。在备份和恢复时可单独针对某个表进行操作。\r\nInnoDB：免费的方案可以是拷贝数据文件、备份 binlog，或者用 mysqldump，在数据量达到几十G的时候就相对痛苦了。\r\n\r\n#### `事务支持`\r\n\r\nMyISAM：强调的是性能，每次查询具有原子性,其执行数度比InnoDB类型更快，但是不提供事务支持。\r\n\r\nInnoDB：提供事务支持事务，外部键等高级数据库功能。 具有事务(commit)、回滚(rollback)和崩溃修复能力(crash recovery capabilities)的事务安全(transaction-safe (ACID compliant))型表。\r\n\r\n#### AUTO_INCREMENT\r\n\r\nMyISAM：可以和其他字段一起建立联合索引。引擎的自动增长列必须是索引，如果是组合索引，自动增长可以不是第一列，他可以根据前面几列进行排序后递增。\r\n\r\nInnoDB：InnoDB中必须包含只有该字段的索引。引擎的自动增长列必须是索引，如果是组合索引也必须是组合索引的第一列。\r\n\r\n#### `表锁机制`\r\n\r\nMyISAM：只支持表级锁，用户在操作myisam表时，select，update，delete，insert语句都会给表自动加锁，如果加锁以后的表满足insert并发的情况下，可以在表的尾部插入新的数据。\r\n\r\nInnoDB：`支持事务和行级锁，是InnoDB的最大特色。`行锁大幅度提高了多用户并发操作的新能。但是InnoDB的行锁，只是在WHERE的主键是有效的，非主键的WHERE都会锁全表的。\r\n\r\n#### 全文索引\r\n\r\nMyISAM：支持 FULLTEXT类型的全文索引\r\n\r\nInnoDB：支持FULLTEXT类型的全文索引，但是innodb可以使用sphinx插件支持全文索引，并且效果更好。\r\n\r\n#### 表主键\r\n\r\nMyISAM：允许没有任何索引和主键的表存在，索引都是保存行的地址。\r\n\r\nInnoDB：如果没有设定主键或者非空唯一索引，就会自动生成一个6字节的主键(用户不可见)，数据是主索引的一部分，附加索引保存的是主索引的值。\r\n\r\n#### 表的具体行数\r\n\r\nMyISAM：保存有表的总行数，如果select count() from table;会直接取出出该值。\r\n\r\nInnoDB：没有保存表的总行数，如果使用select count() from table；就会遍历整个表，消耗相当大，但是在加了wehre条件后，myisam和innodb处理的方式都一样。\r\n\r\n#### CURD操作\r\n\r\nMyISAM：如果执行大量的SELECT，MyISAM是更好的选择。\r\n\r\nInnoDB：如果你的数据执行大量的INSERT或UPDATE，出于性能方面的考虑，应该使用InnoDB表。DELETE 从性能上InnoDB更优，但DELETE FROM table时，InnoDB不会重新建立表，而是一行一行的删除，在innodb上如果要清空保存有大量数据的表，最好使用truncate table这个命令。\r\n\r\n#### 外键\r\n\r\nMyISAM：不支持\r\n\r\nInnoDB：支持\r\n\r\n>InnoDB自身很多良好的特点，比如事务支持、行级锁定、存储 过程、视图等等，在并发很多的情况下，InnoDB的表现要比MyISAM强很多。\r\n\r\n任何一种表都不是万能的，只用恰当的针对业务类型来选择合适的表类型，才能最大的发挥MySQL的性能优势。如果不是很复杂的Web应用，非关键应用，或者做了主从之后的从库，考虑MyISAM，具体采用那种存储引擎，还是要根据实际的情况去决定。',1,7,0,0,0,100,'MySQL存储引擎之InnoDB和MyISAM','','2018-02-27 09:49:16','2018-02-27 09:49:16');
/*!40000 ALTER TABLE `ghx_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_skills`
--

DROP TABLE IF EXISTS `ghx_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `post_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_skills`
--

LOCK TABLES `ghx_skills` WRITE;
/*!40000 ALTER TABLE `ghx_skills` DISABLE KEYS */;
INSERT INTO `ghx_skills` VALUES (1,'计算机基础','计算机基础相关文章',10,2,'2018-07-24 12:01:03','2018-07-26 13:17:46'),(2,'计算机网络','计算机网络相关文章',30,0,'2018-07-24 12:01:36','2018-07-24 12:01:36'),(3,'PHP','PHP相关文章',50,3,'2018-07-24 12:01:59','2018-07-25 09:51:41'),(4,'GO','GO相关文章',70,0,'2018-07-24 12:02:21','2018-07-24 12:02:21'),(5,'区块链','区块链相关文章',90,0,'2018-07-24 12:02:37','2018-07-24 12:02:37'),(6,'Linux','Linux相关文章',100,6,'2018-07-24 12:17:31','2018-07-26 13:34:56'),(7,'数据库','数据库相关文章',130,4,'2018-07-25 09:54:19','2018-07-27 09:49:16');
/*!40000 ALTER TABLE `ghx_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_tutorials`
--

DROP TABLE IF EXISTS `ghx_tutorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_tutorials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教程标题',
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教程描述',
  `title_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '封面图片 url',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'seo 友好路径',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `sort` int(10) unsigned NOT NULL DEFAULT '100',
  `follows` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注人数',
  `visits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `article_counts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '包含文章数量',
  `auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '权限： 0-私有的， 1-公开，但是会被权限控制控制',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态: 0-禁用， 1-启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_tutorials`
--

LOCK TABLES `ghx_tutorials` WRITE;
/*!40000 ALTER TABLE `ghx_tutorials` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghx_tutorials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_users`
--

DROP TABLE IF EXISTS `ghx_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://image.broqiang.com/avatar_default_php.png',
  `realname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `introduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tel` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wechat` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `qq` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `github` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'github 主页',
  `github_account` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'github 账号',
  `homepage` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '个人主页链接',
  `weibo` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '个人主页链接',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是管理员: 0 - 否,1 - 是',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态: 0 - 正常,1 - 禁用',
  `member_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级: 0 - 普通用户,1 - 高级用户',
  `notification_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '未读消息数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_users`
--

LOCK TABLES `ghx_users` WRITE;
/*!40000 ALTER TABLE `ghx_users` DISABLE KEYS */;
INSERT INTO `ghx_users` VALUES (1,'gaohongxiang','ghongxiang@outlook.com','$2y$10$.SsreIpgatr1fXiVeduD0eKZgG.OO0gmb0GeyhRWpzSCqh7.LIAjq','0Cv6E7mHWKguUYmzTZXAz0uJD0IxBFezx0CWDP9UWyl76uZycQkdsG6KiHtA','2018-01-10 11:50:04','2018-01-10 11:50:04','http://image.broqiang.com//broqiang/logo320.png','','','','','','','','','',1,0,0,0);
/*!40000 ALTER TABLE `ghx_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghx_visits`
--

DROP TABLE IF EXISTS `ghx_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghx_visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL COMMENT '文章 id',
  `ip` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访客 IP 地址',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id，如果不存在就是 0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghx_visits`
--

LOCK TABLES `ghx_visits` WRITE;
/*!40000 ALTER TABLE `ghx_visits` DISABLE KEYS */;
INSERT INTO `ghx_visits` VALUES (1,1,'61.148.243.141',1,'2018-07-24 12:05:55','2018-07-24 12:05:55'),(2,1,'140.207.128.179',0,'2018-07-24 12:06:55','2018-07-24 12:06:55'),(3,1,'61.148.243.141',1,'2018-07-24 12:12:00','2018-07-24 12:12:00'),(4,2,'61.148.243.141',1,'2018-07-24 12:18:27','2018-07-24 12:18:27'),(5,2,'223.167.152.22',0,'2018-07-24 12:19:27','2018-07-24 12:19:27'),(6,1,'61.148.243.141',1,'2018-07-24 12:26:46','2018-07-24 12:26:46'),(7,3,'61.148.243.141',1,'2018-07-24 12:29:12','2018-07-24 12:29:12'),(8,3,'61.148.243.141',1,'2018-07-24 12:29:43','2018-07-24 12:29:43'),(9,3,'140.207.128.179',0,'2018-07-24 12:30:12','2018-07-24 12:30:12'),(10,2,'61.148.243.141',1,'2018-07-24 12:41:37','2018-07-24 12:41:37'),(11,2,'125.120.152.160',1,'2018-07-25 04:05:09','2018-07-25 04:05:09'),(12,2,'125.120.152.160',1,'2018-07-25 04:31:05','2018-07-25 04:31:05'),(13,4,'125.120.152.160',1,'2018-07-25 04:31:27','2018-07-25 04:31:27'),(14,4,'101.226.79.246',0,'2018-07-25 04:32:27','2018-07-25 04:32:27'),(15,4,'125.120.152.160',1,'2018-07-25 04:51:04','2018-07-25 04:51:04'),(16,4,'101.226.79.240',0,'2018-07-25 04:51:07','2018-07-25 04:51:07'),(17,4,'125.120.152.160',1,'2018-07-25 05:50:34','2018-07-25 05:50:34'),(18,4,'125.120.152.160',1,'2018-07-25 05:50:56','2018-07-25 05:50:56'),(19,4,'125.120.152.160',1,'2018-07-25 05:51:32','2018-07-25 05:51:32'),(20,4,'61.148.245.105',1,'2018-07-25 09:37:44','2018-07-25 09:37:44'),(21,4,'223.167.152.22',0,'2018-07-25 09:38:44','2018-07-25 09:38:44'),(22,5,'125.120.152.160',1,'2018-07-25 09:51:47','2018-07-25 09:51:47'),(23,5,'125.120.152.160',1,'2018-07-25 09:52:25','2018-07-25 09:52:25'),(24,5,'61.151.218.118',0,'2018-07-25 09:52:47','2018-07-25 09:52:47'),(25,5,'112.10.126.16',1,'2018-07-25 15:21:15','2018-07-25 15:21:15'),(26,9,'112.10.126.16',1,'2018-07-26 12:35:49','2018-07-26 12:35:49'),(27,9,'117.185.117.54',0,'2018-07-26 12:36:48','2018-07-26 12:36:48'),(28,9,'112.10.126.16',1,'2018-07-26 13:17:53','2018-07-26 13:17:53'),(29,10,'112.10.126.16',1,'2018-07-26 13:18:37','2018-07-26 13:18:37'),(30,10,'117.185.117.54',0,'2018-07-26 13:19:36','2018-07-26 13:19:36'),(31,10,'112.10.126.16',1,'2018-07-26 13:33:04','2018-07-26 13:33:04'),(32,12,'112.10.126.16',1,'2018-07-26 14:44:00','2018-07-26 14:44:00'),(33,12,'117.144.246.149',0,'2018-07-26 14:44:59','2018-07-26 14:44:59'),(34,12,'112.10.126.49',1,'2018-07-27 06:32:28','2018-07-27 06:32:28'),(35,12,'112.10.126.49',1,'2018-07-27 06:32:42','2018-07-27 06:32:42'),(36,12,'117.185.117.52',0,'2018-07-27 06:33:31','2018-07-27 06:33:31'),(37,13,'112.10.126.49',1,'2018-07-27 06:39:51','2018-07-27 06:39:51'),(38,13,'112.10.126.49',1,'2018-07-27 06:40:30','2018-07-27 06:40:30'),(39,12,'112.10.126.49',1,'2018-07-27 06:40:36','2018-07-27 06:40:36'),(40,13,'117.185.117.52',0,'2018-07-27 06:40:51','2018-07-27 06:40:51'),(41,13,'112.10.126.49',1,'2018-07-27 06:47:37','2018-07-27 06:47:37'),(42,13,'112.10.126.49',1,'2018-07-27 09:37:36','2018-07-27 09:37:36'),(43,13,'112.10.126.49',1,'2018-07-27 09:39:31','2018-07-27 09:39:31');
/*!40000 ALTER TABLE `ghx_visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-27 19:00:58
