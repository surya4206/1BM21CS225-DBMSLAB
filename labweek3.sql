create database employees;
use employees;

create table project(pno int,
ploc varchar(20),
pname varchar(20),
primary key(pno));

create table dept(dept_no int,
dname varchar(15),
dloc varchar(20),
primary key(dept_no));

create table employee(empno int,
ename varchar(10),
mgr_no int,
hiredate date,
sal real,
dept_no int,
primary key(empno),
foreign key(dept_no) references dept(dept_no) on delete cascade on update cascade);

create table assigned_to(empno int,
pno int,
job_role varchar(15),
primary key(empno,pno),
foreign key(pno) references project(pno) on delete cascade on update cascade,
foreign key(empno) references employee(empno) on delete cascade on update cascade);

create table incentives(empno int,
incentive_date date,
incentive_amt real,
primary key(empno,incentive_date),
foreign key(empno) references employee(empno) on delete cascade on update cascade);

insert into project values(01,'Bengaluru','Blockchain'),(02,'Bengaluru','AIML'),(03,'Mysuru','AppDev'),(04,'Mysuru','Cloud'),(05,'Hyderabad','WebDev'),(06,'Hyderabad','Cybersecurity');
select * from project;

insert into assigned_to values(01,01,'Accountant'),(02,02,'MLDev'),(03,03,'JavaDev'),(04,04,'PythonDev'),(05,05,'PythonDev'),(07,06,'CyberExpert');
select * from assigned_to;

insert into employee values(01,'Arun',20,'1999-01-01',10000,10),(02,'Dinesh',21,'2000-02-01',20000,11),(03,'Karthikeya',22,'2001-03-01',30000,12),(04,'Arjun',23,'2002-04-01',40000,13),(05,'Karthikeya',24,'2003-05-01',50000,14),(06,'Dinesh',25,'2004-06-01',60000,15),(07,'Arun',26,'2005-07-01',70000,10);
select * from employee;

insert into dept values(10,'Blockchain','Bengaluru'),(11,'AIML','Bengaluru'),(12,'AppDev','Mysuru'),(13,'Cloud','Mysuru'),(14,'WebDev','Hyderabad'),(15,'Cybersecurity','Hyderabad');
select * from dept;

insert into incentives values(01,'1999-01-01',2000),(02,'2000-02-01',3000),(03,'2001-03-01',4000),(04,'2002-04-01',5000),(05,'2003-05-01',6000),(04,'2004-06-01',7000);
select * from incentives;
