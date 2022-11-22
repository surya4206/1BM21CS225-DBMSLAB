create database bank;
use bank;

create table branch(b_name varchar(30),
b_city varchar(20),
assets real,
primary key(b_name));

create table BankAccount(accno int,
b_name varchar(30),
balance real,
primary key (accno),
foreign key(b_name) references branch(b_name) on delete cascade);

create table BankCustomer(c_name varchar(20),
c_street varchar(20),
c_city varchar (20),
primary key(c_name));

create table depositor(c_name varchar(20),
accno int,
primary key(c_name,accno),
foreign key(c_name) references BankCustomer(c_name) on delete cascade,
foreign key(accno) references BankAccount(accno) on delete cascade);

create table loan(l_num int,
b_name varchar(30),
amt real,
primary key(l_num),
foreign key(b_name) references branch(b_name) on delete cascade);

insert into branch values('SBI_Chamrajpet','Bangalore',50000),('SBI_ResidencyRoad','Bangalore',10000),('SBI_ShivajiRoad','Bombay',20000),('SBI_ParliamentRoad','Delhi',10000),('SBI_JantarMantar','Delhi',20000);

insert into BankAccount values(1,'SBI_Chamrajpet',2000),(2,'SBI_ResidencyRoad',5000),(3,'SBI_ShivajiRoad',6000),(4,'SBI_ParliamentRoad',9000),(5,'SBI_JantarMantar',8000);

insert into BankCustomer values('Avinash','Bull_Temple_Road','Bangalore'),('Dinesh','Bannergatta_Road','Bangalore'),('Mohan','NationalCollege_Road','Bangalore'),('Nikil','Akbar_Road','Delhi'),('Ravi','Prithviraj_Road','Delhi');

insert into depositor values('Avinash',1),('Dinesh',2),('Mohan',3),('Nikil',4),('Ravi',5);

insert into loan values(1,'SBI_Chamrajpet',1000),(2,'SBI_ResidencyRoad',2000),(3,'SBI_ShivajiRoad',3000),(4,'SBI_ParliamentRoad',4000),(5,'SBI_JantarMantar',5000);