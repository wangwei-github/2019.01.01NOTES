
		create table student (id int,name varchar(10),subject varchar(10),score int);
			alter table student engine=innodb charset=utf8;
			alter database db1 character set utf8;
		insert into student values(null,'王维','语文',90),(null,'王维','数学',85),(null,'王维','英语',70),
	(null,'王欢','语文',88),(null,'王欢','数学',83),(null,'王欢','英语',64),(null,'王权','语文',67),
	(null,'王权','数学',88),(null,'王权','英语',66),(null,'国强','语文',44),(null,'国强','数学',82),(null,'国强','英语',81);

	/*select rank() over( name by subject order by score desc) 排名, * from score;where subject='语文' group by name ;
	select a.*,b.*from student a,student b where a.score>=b.score;*/


 select d.name 学生,(select score from student where subject='语文' and name=d.name)语文 ,
 (select c from (select a.name ,count(distinct b.score) c from (select *from student where subject='语文')a , (select *from student where subject='语文') 
 b where a.score<=b.score group by a.name) cc where name=d.name)语文排名,

 (select score from student where subject='数学' and name=d.name)数学,
 (select c from (select a.name ,count(distinct b.score) c from (select *from student where subject='数学')a , (select *from student where subject='数学') 
 b where a.score<=b.score group by a.name) cc where name=d.name)数学排名,

 (select score from student where subject='英语' and name=d.name)英语 ,
 (select c from (select a.name ,count(distinct b.score) c from (select *from student where subject='英语')a , (select *from student where subject='英语') 
 b where a.score<=b.score group by a.name) cc where name=d.name)英语排名 ,

(select sum(score) from student where  name=d.name)总分 ,
 (select c from (select a.name ,count(distinct b.s) c from (select name,sum(score)s from student group by name)a , 
 	(select name,sum(score)s from student group by name) 
 b where a.s<=b.s group by a.name) cc where name=d.name)总分排名 from student d group by d.name order by sum(score) desc;

 select a.name,count(distinct b.score)排名 from(select *from student where subject="语文")a,(select *from student where subject="语文")
 b where a.score<=b.score group by a.name;
 


select a.name,count(distinct b.s) from (select name,sum(score)s from student group by name)a,
(select name,sum(score)s from student group by name)b where a.s<=b.s group by a.name;




id  time amount r_id
SELECT * FROM trade;
CREATE TABLE trade (id int primary key auto_increment ,dates date,amount double(8,2),app varchar(5) ,r_id int) DEFAULT charset=utf8;

INSERT INTO trade VALUES(null,'2018.2.5',1000,'微信',1),(null,'2018.2.8',10000,'支付宝',2),(null,'2018.2.8',-1000,'现金',3),(null,'2018.2.8',5000,'微信',4)
,(null,'2018.2.20',-10000,'微信',5),(null,'2018.2.20',500,'现金',6),(null,'2018.2.22',6000,'支付宝',7);



SELECT * FROM relation;
relation_id  name type  gender
CREATE TABLE relation(relation_id int primary key auto_increment,name varchar(10) not null unique,type varchar(10),gender varchar(5)) DEFAULT charset=utf8;

INSERT INTO relation VALUES(null,'马云','朋友','男'),(null,'王维','同事','男'),(null,'小明','亲戚','男'),(null,'小红','朋友','女'),
(null,'小丽','亲戚','女'),(null,'胡歌','朋友','男'),(null,'强','同事','男');

SELECT date_format(now(),'%Y年%m月%d日 %H-%i分=%s秒');
SELECT str_to_date('5月6号2018年','%m月%d号%Y年');

1.SELECT sum(amount) AS 总收益 FROM trade WHERE dates>=str_to_date('2018年2月5号','%Y年%m月%d号');
2.SELECT name,type,amount FROM trade t JOIN relation r ON t.r_id=r.relation_id WHERE amount<-100 AND gender='女' AND type='亲戚' AND dates>
str_to_date('2018年2月5号','%Y年%m月%d号');
3.SELECT app,sum(amount) FROM trade WHERE amount>0 group by app;


select deptno,ename,sal from emp e where sal>(select avg(sal) from emp where deptno=e.deptno )order by e.deptno ;

Grant all privileges on *.* to root@'%' identified by 'wangwei' with grant option;