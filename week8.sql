create database airline;
use airline;

create table flights(flno int,
from_ varchar(20),
to_ varchar(20),
distance int,
departs time,
arrives time,
price int,
primary key(flno));

create table aircraft(aid int,
aname varchar(20),
cruisingRange int,
primary key(aid));

create table employee(
eid int,
ename varchar(20),
salary int,
primary key(eid));

create table certified(
eid int,
aid int,
foreign key(eid) references employee(eid) on update cascade on delete cascade,
foreign key(aid) references aircraft(aid) on update cascade on delete cascade);

insert into flights values(1,'Bengaluru','NewDelhi',500,'06:00','09:00',5000),(2,'Bengaluru','Chennai',300,'07:00','08:30',3000),(3,'Trivandrum','NewDelhi',800,'08:00','11:30',6000),(4,'Bengaluru','Frankfurt',10000,'06:00','23:30',50000),(5,'Kolkata','NewDelhi',2400,'11:00','03:30',9000),(6,'Bengaluru','Frankfurt',8000,'09:00','23:00',40000);
select * from flights;

insert into aircraft values(1,'Airbus',2000),(2,'Boeing',700),(3,'JetAirways',550),(4,'Indigo',5000),(5,'Boeing',4500),(6,'Airbus',2200);
select * from aircraft;

insert into employee values(101,'Avinash',50000),(102,'Lokesh',60000),(103,'Rakesh',70000),(104,'Santhosh',82000),(105,'Tilak',5000);
select * from employee;

insert into certified values(101,2),(101,4),(101,5),(101,6),(102,1),(102,3),(102,5),(103,2),(103,3),(103,5),(103,6),(104,6),(104,1),(104,3),(105,3);
select * from certified;

select (a.aname) from employee e inner join certified c
on e.eid=c.eid and e.salary>80000 inner join aircraft a on
a.aid=c.aid;

select c.eid, max(a.cruisingRange) as Max_Range
from aircraft a, certified c
where c.aid=a.aid group by c.eid having count(*)>=3;

select ename
from employee
where salary<some(select price from flights where from_='Bengaluru' and to_='Frankfurt');

select c.aid,a.aname, avg(e.salary)
from certified c, aircraft a,employee e
where a.cruisingRange>1000 and e.eid=c.eid and a.aid=c.aid group by c.aid;

select distinct e.ename
from certified c,employee e
where c.eid=e.eid and c.aid in (select aid from aircraft where aname='Boeing');

select aid
from aircraft
where cruisingRange>=(select distance from flights where from_='Bengaluru' and to_='NewDelhi');