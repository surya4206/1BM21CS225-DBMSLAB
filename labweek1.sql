create database insurance;
use insurance;

create table person(driver_id char(3),
name varchar(10),
address varchar(20),
primary key(driver_id));

create table car(reg_num char(8),
model varchar(10),
year year,
primary key(reg_num));

create table owns(driver_id char(3),
reg_num char(8),
primary key(driver_id,reg_num),
foreign key (driver_id) references person(driver_id) on delete cascade,
foreign key (reg_num) references car(reg_num) on delete cascade);

create table accident(report_num int,
accident_date char(9),
location varchar(15),
primary key(report_num,accident_date,location));

create table participated(driver_id char(3),
reg_num char(8),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));

insert into person values('A01','Richard','Srinivas nagar'),('A02','Pradeep','Rajajinagar'),('A03','Smith','Ashok nagar'),('A04','Venu','N R Colony'),('A05','Jhon','Hanumanth nagar');

insert into car values('KA052250','Indica','1990'),('KA031181','Lancer','1957'),('KA095477','Toyota','1998'),('KA053408','Honda','2008'),('KA041702','Audi','2005');

insert into owns values('A01','KA052250'),('A02','KA031181'),('A03','KA095477'),('A04','KA053408'),('A05','KA041702');

insert into accident values(11,'01-JAN-03','Mysore Road'),(12,'02-FEB-04','South Circle'),(13,'21-JAN-03','Bull temple'),(14,'17-FEB-08','Mysore Road'),(15,'04-MAR-05','Kanakpura Road');

insert into participated values('A01','KA052250',11,10000),('A02','KA031181',12,50000),('A03','KA095477',13,25000),('A04','KA053408',14,3000),('A05','KA041702',15,5000);

update participated set damage_amount=25000
where reg_num='KA031181' and report_num=12;

select count(distinct driver_id) CNT
from participated a,accident b
where a.report_num=b.report_num and b.accident_date like '%08';

insert into accident values(16,'08-MAR-08','Domlur');
select * from accident;

select accident_date,location from accident;
select driver_id from participated
where damage_amount>=25000;

select * from participated order by damage_amount desc;
select avg(damage_amount) from participated;
SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID AND
DAMAGE_AMOUNT > (SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);
select max(damage_amount) from participated;
