create database banking;
use banking;

create table Branch
(
Branch_name varchar(20),
Branch_city varchar(20),
assets real,
primary key(Branch_name)
);

insert into branch values('SBI_Chamrajpet','bengalore',50000),
						 ('SBI_ResidencyRoad','bengalore',50000),
                         ('SBI_ShivajiRoad','bombay',20000),
                         ('SBI_ParlimentRoad','Delhi',10000),
                         ('SBI_Jantarmantar','Delhi',20000);
                        
drop table Bank_account;

select *from bank_account;

create table Bank_Account
(
accno int,
Branch_name varchar(30),
Balance real,
primary key(accno,branch_name),
foreign key (Branch_name) references Branch(Branch_name)
);

insert into bank_account values
(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',5000),
(3,'SBI_ShivajiRoad',6000),
(4,'SBI_ParlimentRoad',9000),
(5,'SBI_Jantarmantar',8000),
(6,'SBI_ShivajiRoad',4000),
(8,'SBI_ResidencyRoad',4000),
(9,'SBI_ParlimentRoad',3000),
(10,'SBI_ResidencyRoad',5000),
(11,'SBI_Jantarmantar',2000);
									

create table Bank_customer
(
customer_name varchar(30),
customer_street varchar(30),
customer_city varchar(30),
primary key(customer_name)
);

create table depositer
(
customer_name varchar(30),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references Bank_customer(customer_name),
foreign key(accno) references Bank_Account(accno)
);

create table loan
(
loan_no int,
Branch_name varchar(30),
amount real,
primary key(loan_no,Branch_name),
foreign key(Branch_name) references Branch(branch_name)
);

