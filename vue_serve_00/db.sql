#db.sql 数据库脚本文件
USE xz;
CREATE TABLE t_login(
 id INT PRIMARY KEY AUTO_INCREMENT,
 uname VARCHAR(25),
 upass VARCHAR(32)
);
INSERT INTO t_login VALUES(null,'tom',md5('123'));
INSERT INTO t_login VALUES(null,'jerry',md5('123'));

#完成购物车功能
CREATE TABLE xz_cart(
 id INT PRIMARY KEY AUTO_INCREMENT,
 img VARCHAR(255),
 uid INT,
 price DECIMAL(10,2),
 count INT
);
INSERT INTO xz_cart VALUES(null,'p1.jpg',7,100,1);
INSERT INTO xz_cart VALUES(null,'p2.jpg',7,101,2);
INSERT INTO xz_cart VALUES(null,'p3.jpg',7,10,1);
INSERT INTO xz_cart VALUES(null,'p4.jpg',7,99,1);
INSERT INTO xz_cart VALUES(null,'p5.jpg',7,91,1);

CREATE TABLE my_vue(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(25),
    upass VARCHAR(32)
);
INSERT INTO my_vue VALUES(null,'tom',md5('123456'));
INSERT INTO my_vue VALUES(null,'19976695113',md5('123456'));
INSERT INTO my_vue VALUES(null,'jerry',md5('123456'));
INSERT INTO my_vue VALUES(null,'king',md5('123456'));

CREATE TABLE vue_pic(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(255),
    title VARCHAR(255)
);
INSERT INTO vue_pic VALUES(null,'free2.jpg',"心形折纸大全视频");
INSERT INTO vue_pic VALUES(null,'free3.jpg',"氢气球浪漫惊喜（免费版）");
INSERT INTO vue_pic VALUES(null,'free4.jpg',"快速折999个心形的折纸方法");
INSERT INTO vue_pic VALUES(null,'free5.jpg',"简单示爱密码：表白、暗恋专用");


CREATE TABLE free_original(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(255),
    title VARCHAR(255),
    reading INT,
    comment INT
);
INSERT INTO free_original VALUES(null,'freepic1.jpg',"极致童话般浪漫的 Hello Kitty 表白场景布置",620156,10);
INSERT INTO free_original VALUES(null,'freepic2.jpg',"突破限制完成国庆期间异地恋生日惊喜",315356,6);
INSERT INTO free_original VALUES(null,'freepic3.jpg',"超市储物柜的浪漫计划",345674,11);
INSERT INTO free_original VALUES(null,'freepic4.jpg',"手工打造最强夜光玫瑰花",134562,7);
INSERT INTO free_original VALUES(null,'freepic5.jpg',"自暴我给女友的情人节视频情书",209431,8);
INSERT INTO free_original VALUES(null,'freepic6.jpg',"用狗狗追女孩的浪漫方法",421673,10);
INSERT INTO free_original VALUES(null,'freepic7.jpg',"老外在家布置情人节浪漫场景",12673,6);
INSERT INTO free_original VALUES(null,'freepic8.jpg',"韩国人让女友激动得跳起的咖啡厅求婚",216732,7);
INSERT INTO free_original VALUES(null,'freepic9.jpg',"手工打造新时代最有创意的情书",378953,12);
INSERT INTO free_original VALUES(null,'freepic10.jpg',"韩国人驾车绕社区一圈的感人求婚",125576,4);
INSERT INTO free_original VALUES(null,'freepic11.jpg',"儿子帮父亲策划30周年情人节活动",22532,2);
INSERT INTO free_original VALUES(null,'freepic12.jpg',"《魔女幼熙》给男朋友制造生日惊喜片段",413467,9);









