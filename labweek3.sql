create database supplier;
use supplier;

create table suppliers(sid int,
sname varchar(30),
address varchar(30),
primary key(sid));

create table parts(pid int,
pname varchar(20),
colour varchar(10),
primary key(pid));

create table catalog(sid int,
pid int,
cost real,
primary key(pid,sid),
foreign key(sid) references suppliers(sid) on delete cascade on update cascade,
foreign key(pid) references parts(pid) on delete cascade on update cascade);

insert into suppliers values(),(),(),(),();
insert into parts values(),(),(),(),();
insert into catalog values(),(),(),(),();

select pnames from parts;