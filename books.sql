/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL57
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : books

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 07/05/2020 17:58:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add books', 7, 'add_books');
INSERT INTO `auth_permission` VALUES (26, 'Can change books', 7, 'change_books');
INSERT INTO `auth_permission` VALUES (27, 'Can delete books', 7, 'delete_books');
INSERT INTO `auth_permission` VALUES (28, 'Can view books', 7, 'view_books');
INSERT INTO `auth_permission` VALUES (29, 'Can add 用户', 8, 'add_user');
INSERT INTO `auth_permission` VALUES (30, 'Can change 用户', 8, 'change_user');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 用户', 8, 'delete_user');
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户', 8, 'view_user');
INSERT INTO `auth_permission` VALUES (33, 'Can add captcha store', 9, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (34, 'Can change captcha store', 9, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (35, 'Can delete captcha store', 9, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (36, 'Can view captcha store', 9, 'view_captchastore');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (9, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'login', 'books');
INSERT INTO `django_content_type` VALUES (8, 'login', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-04-20 12:47:05.509962');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-04-20 12:47:05.646455');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-04-20 12:47:06.012346');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-04-20 12:47:06.110883');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-20 12:47:06.123536');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-04-20 12:47:06.210105');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-04-20 12:47:06.265174');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-04-20 12:47:06.332343');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-04-20 12:47:06.345746');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-04-20 12:47:06.404388');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-04-20 12:47:06.410142');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-04-20 12:47:06.427511');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-04-20 12:47:06.522746');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-04-20 12:47:06.586115');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-04-20 12:47:06.647851');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-04-20 12:47:06.662778');
INSERT INTO `django_migrations` VALUES (17, 'captcha', '0001_initial', '2020-04-20 12:47:06.696126');
INSERT INTO `django_migrations` VALUES (18, 'login', '0001_initial', '2020-04-20 12:47:06.759118');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2020-04-20 12:47:06.777712');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('77irlvnke7ob5m8j36asdyshovxiejh6', 'ZjcyMjRiZjExYzU0MTE5ZWQ0ODEwOTViZTIzMTk4NzNkMTE3MTM4Nzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJzb25nemkifQ==', '2020-05-04 12:49:12.362493');
INSERT INTO `django_session` VALUES ('kzkncb4ml8fd3ria99qeq5u6sqxlzx8n', 'ZjcyMjRiZjExYzU0MTE5ZWQ0ODEwOTViZTIzMTk4NzNkMTE3MTM4Nzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJzb25nemkifQ==', '2020-05-21 17:33:27.483175');
COMMIT;

-- ----------------------------
-- Table structure for login_books
-- ----------------------------
DROP TABLE IF EXISTS `login_books`;
CREATE TABLE `login_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `publish` varchar(32) NOT NULL,
  `time` varchar(64) NOT NULL,
  `price` varchar(32) NOT NULL,
  `img` varchar(256) NOT NULL,
  `context` varchar(256) NOT NULL,
  `number` varchar(64) NOT NULL,
  `access` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_books
-- ----------------------------
BEGIN;
INSERT INTO `login_books` VALUES (41, '活着', '小说', '余华', '作家出版社', '2012-8-1', '20.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s29053580.jpg', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵... ', '461629', '9.4');
INSERT INTO `login_books` VALUES (42, '解忧杂货店', '小说', '[日] 东野圭吾 , 李盈春', '南海出版公司', '2014-5', '39.50元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s27264181.jpg', '现代人内心流失的东西，这家杂货店能帮你找回——僻静的街道旁有一家杂货店，只要写下烦恼投进卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答。因男友身患绝... ', '625215', '8.5');
INSERT INTO `login_books` VALUES (43, '追风筝的人', '小说', '[美] 卡勒德·胡赛尼 , 李继宏', '上海人民出版社', '2006-5', '29.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s1727290.jpg', '12岁的阿富汗富家少爷阿米尔与仆人哈桑情同手足。然而，在一场风筝比赛后，发生了一件悲惨不堪的事，阿米尔为自己的懦弱感到自责和痛苦，逼走了哈桑，不久，自己也跟... ', '628607', '8.9');
INSERT INTO `login_books` VALUES (44, '白夜行', '小说', '[日] 东野圭吾 , 刘姿君', '南海出版公司', '2013-1-1', '39.50元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s24514468.jpg', '东野圭吾万千书迷心中的无冕之王周刊文春推理小说年度BEST10第1名本格推理小说年度BEST10第2名《白夜行》是东野圭吾迄今口碑最好的长篇杰作，具备... ', '245105', '9.1');
INSERT INTO `login_books` VALUES (45, '红楼梦', '小说', '[清] 曹雪芹 著、高鹗 续', '人民文学出版社', '1996-12', '59.70元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s1070959.jpg', '《红楼梦》是一部百科全书式的长篇小说。以宝黛爱情悲剧为主线，以四大家族的荣辱兴衰为背景，描绘出18世纪中国封建社会的方方面面，以及封建专制下新兴资本主义民主... ', '277314', '9.6');
INSERT INTO `login_books` VALUES (46, '百年孤独', '小说', '[哥伦比亚] 加西亚·马尔克斯 , 范晔', '南海出版公司', '2011-6', '39.50元', 'https://images.weserv.nl/?url=img9.doubanio.com/view/subject/s/public/s6384944.jpg', '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。... ', '280650', '9.2');
INSERT INTO `login_books` VALUES (47, '房思琪的初恋乐园', '小说', '林奕含', '北京联合出版公司', '2018-1', '45.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s29651121.jpg', '令人心碎却无能为力的真实故事。向死而生的文学绝唱  打动万千读者的年度华语小说。李银河 戴锦华 骆以军 张悦然 冯唐 詹宏志 蒋方舟 史航 等多位学者作... ', '166989', '9.2');
INSERT INTO `login_books` VALUES (48, '霍乱时期的爱情', '小说', '[哥伦比亚] 加西亚·马尔克斯 , 杨玲', '南海出版公司', '2012-9-1', '39.50元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s11284102.jpg', '★马尔克斯唯一正式授权，首次完整翻译★《霍乱时期的爱情》是我最好的作品，是我发自内心的创作。——加西亚•马尔克斯★这部光芒闪耀、令人心碎的作品是人类有史... ', '174385', '9.0');
INSERT INTO `login_books` VALUES (49, '小王子', '小说', '[法] 圣埃克苏佩里 , 马振聘', '人民文学出版社', '2003-8', '22.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s1103152.jpg', '小王子是一个超凡脱俗的仙童，他住在一颗只比他大一丁点儿的小行星上。陪伴他的是一朵他非常喜爱的小玫瑰花。但玫瑰花的虚荣心伤害了小王子对她的感情。小王子告别小行... ', '554334', '9.0');
INSERT INTO `login_books` VALUES (50, '围城', '小说', '钱锺书', '人民文学出版社', '1991-2', '19.00', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s1070222.jpg', '《围城》是钱钟书所著的长篇小说。第一版于1947年由上海晨光出版公司出版。1949年之后，由于政治等方面的原因，本书长期无法在中国大陆和台湾重印，仅在香港出... ', '361336', '8.9');
INSERT INTO `login_books` VALUES (51, '平凡的世界（全三部）', '小说', '路遥', '人民文学出版社', '2005-1', '64.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s1144911.jpg', '《平凡的世界》是一部现实主义小说，也是一部小说形式的家族史。作者浓缩了中国西北农村的历史变迁过程，在小说中全景式地表现了中国当代城乡的社会生活。在近十年的广... ', '241660', '9.0');
INSERT INTO `login_books` VALUES (52, '嫌疑人X的献身', '小说', '[日] 东野圭吾 , 刘子倩', '南海出版公司', '2008-9', '28.00', 'https://images.weserv.nl/?url=img9.doubanio.com/view/subject/s/public/s3254244.jpg', '百年一遇的数学天才石神，每天唯一的乐趣，便是去固定的便当店买午餐，只为看一眼在便当店做事的邻居靖子。靖子与女儿相依为命，失手杀了前来纠缠的前夫。石神提出由... ', '396858', '8.9');
INSERT INTO `login_books` VALUES (53, '三体', '小说', '刘慈欣', '重庆出版社', '2008-1', '23.00', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s2768378.jpg', '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的... ', '366325', '8.8');
INSERT INTO `login_books` VALUES (54, '1984', '小说', '[英] 乔治·奥威尔 , 刘绍铭', '北京十月文艺出版社', '2010-4-1', '28.00', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s4371408.jpg', '★村上春树以《1Q84》向本书致敬★著名学者刘绍铭经典译本内地首次出版★62种文字风靡110个国家，全球销量超过5000万册★《时代周刊》“最好的10... ', '137725', '9.3');
INSERT INTO `login_books` VALUES (55, '飘', '小说', '[美国] 玛格丽特·米切尔 , 李美华', '译林出版社', '2000-9', '40.00元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s1078958.jpg', '小说中的故事发生在1861年美国南北战争前夕。生活在南方的少女郝思嘉从小深受南方文化传统的熏陶，可在她的血液里却流淌着野性的叛逆因素。随着战火的蔓廷和生活环... ', '151449', '9.3');
INSERT INTO `login_books` VALUES (56, '月亮与六便士', '小说', '[英] 威廉·萨默塞特·毛姆 , 徐淳刚', '浙江文艺出版社', '2017-1-1', '39.80元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s29634528.jpg', '“满地都是六便士，他却抬头看见了月亮。”银行家查尔斯，人到中年，事业有成，为了追求内心隐秘的绘画梦想，突然抛妻别子，弃家出走。他深知：人的每一种身份都是一... ', '140858', '8.8');
INSERT INTO `login_books` VALUES (57, '82年生的金智英', '小说', '[韩]赵南柱 , 尹嘉玄', '贵州人民出版社', '2019-9', '45.00元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s33463759.jpg', '一个女孩要经历多少看不见的坎坷，才能跌跌撞撞地长大成人。亚洲10年来罕见的现象级畅销书，凭口口相传在韩国销量突破100万册。韩国书店联合会评选2017年... ', '43999', '7.9');
INSERT INTO `login_books` VALUES (58, '鼠疫', '小说', '(法)阿尔贝·加缪 , 刘方', '上海译文出版社', '2013-8', '34.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s27003191.jpg', '阿尔贝•加缪（1913—1960）是法国声名卓著的小说家、散文家和剧作家，“存在主义”文学的大师。1957年因“热情而冷静地阐明了当代向人类良知提出的种种问... ', '18388', '9.1');
INSERT INTO `login_books` VALUES (59, '骆驼祥子', '小说', '老舍', '人民文学出版社', '2000-3-1', '12.00', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s1146040.jpg', '《骆驼祥子》是老舍用同情的笔触描绘的一幕悲剧：二十年代的北京，一个勤劳、壮实的底层社会小人物怀着发家、奋斗的美好梦想，却最终为黑暗的暴风雨所吞噬。它揭示了当... ', '145274', '8.4');
INSERT INTO `login_books` VALUES (60, '呼吸', '小说', '[美] 特德·姜 , 耿辉、Ent、李克勤、姚向辉', '译林出版社', '2019-12', '42', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s33519539.jpg', '★ 《降临》原著小说作者，美国华裔科幻奇才特德·姜新结集。★ 9个短篇，9集《黑镜》，融科幻的诗意与哲学的浪漫于一体：我所有的欲望和沉思，都是这个宇宙缓缓... ', '11240', '8.6');
INSERT INTO `login_books` VALUES (61, '书写的疗愈力量', '书写', '詹姆斯·彭尼贝克 , 何丽', '机械工业出版社', '2018-7', '69.00', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s29816461.jpg', '表露自己是人的基本需要。隐藏秘密、沉默不语会加剧你的内心焦虑和生理压力，而写下经历或感受则会提升你的总体健康水平和幸福感。表达性书写是一种简单易行、科学有... ', '45', '6.7');
INSERT INTO `login_books` VALUES (62, '天才基本法', '数学', '长洱', '江苏凤凰文艺出版社', '2019-7', '78.00元', 'https://images.weserv.nl/?url=img9.doubanio.com/view/subject/s/public/s33322954.jpg', '二十二岁的林朝夕在父亲确诊阿尔茨海默病这天，得知自己暗恋多年的校园男神裴之即将出国深造的消息——对方考取的学校，恰是父亲当年为她放弃的那所。同样自幼与奥数... ', '4674', '8.7');
INSERT INTO `login_books` VALUES (63, '数学之美', '数学', '吴军', '人民邮电出版社', '2012-5-1', '45.00元', 'https://images.weserv.nl/?url=img9.doubanio.com/view/subject/s/public/s9114855.jpg', '几年前，“数学之美”系列文章原刊载于谷歌黑板报，获得上百万次点击，得到读者高度评价。读者说，读了“数学之美”，才发现大学时学的数学知识，比如马尔可夫链、矩阵... ', '10497', '8.7');
INSERT INTO `login_books` VALUES (64, '从一到无穷大', '数学', '[美] G. 伽莫夫 , 暴永宁 译、吴伯泽 校', '科学出版社', '2002-11', '29.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s2516920.jpg', '《从一到无穷大：科学中的事实和臆测》是当今世界最有影响的科普经典名著之一，1970年代末由科学出版社引进出版后，曾在国内引起很大反响，直接影响了众多的科普工... ', '9158', '9.1');
INSERT INTO `login_books` VALUES (65, '什么是数学', '数学', '[美] R·柯朗 H·罗宾 著、I·斯图尔特 修订 , 左平、张饴慈', '复旦大学出版社', '2005-5', '37.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s1802550.jpg', '《什么是数学》既是为初学者也是为专家，既是为学生也是为教师，既是为哲学家也是为工程师而写的。它是一本世界著名的数学科普读物。书中搜集了许多经典的数学珍品，给... ', '3611', '9.1');
INSERT INTO `login_books` VALUES (66, '天才基本法·完结篇', '数学', '长洱', '江苏凤凰文艺出版社', '2019-9', '78.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s33472051.jpg', '人人都以为，林朝夕是数学天才，殊不知，仰仗命运的超凡眷顾，才令她有机会回过头去，用多年的奥赛经验悄然“作弊”。在时间与空间的往返旅途中，手握E=MC²密钥... ', '1329', '9.0');
INSERT INTO `login_books` VALUES (67, '哥德尔、艾舍尔、巴赫', '数学', '[美] 侯世达 , 严勇、刘皓明、莫大伟', '商务印书馆', '1997-5', '88.00元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s1789059.jpg', '集异璧－GEB，是数学家哥德尔、版画家艾舍尔、音乐家巴赫三个名字的前缀。《哥德尔、艾舍尔、巴赫书：集异璧之大成》是在英语世界中有极高评价的科普著作，曾获得普... ', '6234', '9.4');
INSERT INTO `login_books` VALUES (68, '怎样解题', '数学', '[美] G. 波利亚 , 涂泓、冯承天', '上海科技教育出版社', '2007-5', '16.00元', 'https://images.weserv.nl/?url=img9.doubanio.com/view/subject/s/public/s3308655.jpg', '怎样解题：数学思维的新方法，ISBN：9787542843876，作者：（美）波利亚 著；徐泓、冯承天 译 ', '1804', '8.8');
INSERT INTO `login_books` VALUES (69, '数学简史', '数学', '[美]莫里斯·克莱因 , 李宏魁', '中信出版集团', '2019-3-31', '78.00', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s32260819.jpg', '20世纪最后一位数学史大师，克莱因被最多读者阅读的一本书。……音乐能激起或平静人的心灵，绘画能愉悦人的视觉，诗歌能激发人的感情，哲学能使思想得到满足... ', '147', '9.2');
INSERT INTO `login_books` VALUES (70, '线性代数及其应用', '数学', '（美）莱（Lay D.C.）、none、none , 刘深泉 等', '机械工业出版社', '2005-8-1', '59.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s27291003.jpg', '本书主要内容包括线性方程组、矩阵代数、行列式、向量空间、特征值与特征向量、正交性和最小二乘法、对称矩阵和二次型等。此外，本书包含大量的练习题、习题、例题等，... ', '911', '9.2');
INSERT INTO `login_books` VALUES (71, '高观点下的初等数学', '数学', 'Felix Klein , 舒湘芹、陈义章', '复旦大学出版社', '2008-9', '68.00元', 'https://images.weserv.nl/?url=img1.doubanio.com/view/subject/s/public/s3455737.jpg', '《高观点下的初等数学》(全3册)是克莱因根据自己在哥廷根大学多年为德国中学数学教师及在校学生开设的讲座所撰写的基础数学普及读物。该书反映了他对数学的许多观点... ', '582', '9.2');
INSERT INTO `login_books` VALUES (72, '数学', '数学', '[英国] 蒂莫西•高尔斯 , 刘熙', '译林出版社', '2014-3', '25.00', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s27220613.jpg', '★传达主流数学的魅力，揭开数与空间的神秘面纱★从哲学高度展示数学思维方式，启示你如何抽象思考★剑桥大学数学教授，“数学界诺贝尔奖”——菲尔茨奖得主蒂莫西... ', '1051', '8.9');
INSERT INTO `login_books` VALUES (73, '普林斯顿微积分读本（修订版）', '数学', '[美] Adrian Banner , 杨爽、赵晓婷、高璞', '人民邮电出版社', '2016-10', '99.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s29114473.jpg', '本书阐述了求解微积分的技巧, 详细讲解了微积分基础、极限、连续、微分、导数的应用、积分、无穷级数、泰勒级数与幂级数等内容，旨在教会读者如何思考问题从而找到解... ', '402', '9.6');
INSERT INTO `login_books` VALUES (74, '万物皆数', '数学', '[法] 米卡埃尔·洛奈（Mickaël Launay） , 孙佳雯', '低音·北京联合出版公司', '2018-12', '68.00元', 'https://images.weserv.nl/?url=img3.doubanio.com/view/subject/s/public/s29917943.jpg', '★★★已被译为英语、西班牙语、波兰语等6种语言法国亚马逊科学史分类第1名获法国数学期刊Tangente图书奖……………………◎ 编辑推荐★ 数学... ', '865', '8.3');
COMMIT;

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_user
-- ----------------------------
BEGIN;
INSERT INTO `login_user` VALUES (1, 'songzi', 's111', '2521815745@qq.com', 'female', '2020-04-20 12:49:05.016221');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
