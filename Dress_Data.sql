create database dress_data;
use dress_data;

create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30));	

LOAD DATA local INFILE 'C:/Users/abhir/Downloads/AttributeDataSet.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;


select * from dress;

create table if not exists test (
test_id int auto_increment,
test_name varchar(30),
test_mainId varchar(30),
test_address varchar(30),
primary key(test_id));

select * from test;

insert into test (test_name, test_mainId, test_address) values ('SQL test','abhiraj@gmail.com','Bangalore'),
('Anshu', 'anshu@gmail.com','Ranchi'),
('Abhinav','abhinav@gmail.com', 'Assam'),
('Ramesh','ram@gmail.com', 'Bihar');


create table if not exists test3 (
test_id int,
test_name varchar(30),
test_mainId varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000));


insert into test3  values (1,'SQL test','abhiraj@gmail.com','Bangalore', 40000),
(2,'Anshu', 'anshu@gmail.com','Ranchi', 20000),
(3,'Abhinav','abhinav@gmail.com', 'Assam', 11000),
(4,'Ramesh','ram@gmail.com', 'Bihar', 27000);
 select * from test3;

create table if not exists test4 (
test_id int,
test_name varchar(30),
test_mainId varchar(30),
test_address varchar(30) check (test_address = 'Mohali'),
test_salary int check(test_salary > 10000));

insert into test4  values (1,'SQL test','abhiraj@gmail.com','Mohali', 40000),
(2,'Anshu', 'anshu@gmail.com','Mohali', 20000),
(3,'Abhinav','abhinav@gmail.com', 'Mohali', 11000),
(4,'Ramesh','ram@gmail.com', 'Mohali', 27000);

select * from test4;

create table if not exists test5 (
test_id int  NOT NULL auto_increment,
test_name varchar(30),
test_mainId varchar(30),
test_address varchar(30) check (test_address = 'Mohali'),
test_salary int check(test_salary > 10000));

insert into test5 ( test_name, test_mainId, test_address, test_salary)  values ('SQL test','abhiraj@gmail.com','Mohali', 40000),
('Anshu', 'anshu@gmail.com','Mohali', 20000),
('Abhinav','abhinav@gmail.com', 'Mohali', 11000),
('Ramesh','ram@gmail.com', 'Mohali', 27000);

create table if not exists test6 (
test_id int  NOT NULL default 0 auto_increment,
test_name varchar(30),
test_mainId varchar(30),
test_address varchar(30) check (test_address = 'Mohali'),
test_salary int check(test_salary > 10000));

insert into test6 ( test_name, test_mainId, test_address, test_salary)  values ('SQL test','abhiraj@gmail.com','Mohali', 40000),
('Anshu', 'anshu@gmail.com','Mohali', 20000),
('Abhinav','abhinav@gmail.com', 'Mohali', 11000),
('Ramesh','ram@gmail.com', 'Mohali', 27000);

select * from test6;
select * from dress;

create table if not exists test7 (
test_id int  NOT NULL default 0,
test_name varchar(30),
test_mailId varchar(30) unique,
test_address varchar(30) check (test_address = 'Mohali'),
test_salary int check(test_salary > 10000));

insert into test7 ( test_name, test_mailId, test_address, test_salary)  values ('SQL test','abhiraj@gmail.com','Mohali', 40000),
('Anshu', 'anshu@gmail.com','Mohali', 20000),
('Abhinav','alfvnbfs@gmail.com', 'Mohali', 11000),
('Ramesh','ram@gmail.com', 'Mohali', 27000);

select * from test7;

create table if not exists test8 (
test_id int  NOT NULL  auto_increment,
test_name varchar(30) NOT NULL default 'unknown',
test_mailId varchar(30) unique NOT NULL,
test_address varchar(30) check (test_address = 'Mohali') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key(test_id));

insert into test8 ( test_name, test_mailId, test_address, test_salary)  values ('SQL test','abhiraj@gmail.com','Mohali', 40000),
('Anshu', 'anshu@gmail.com','Mohali', 20000),
('Abhinav','alfvnbfs@gmail.com', 'Mohali', 11000),
('Ramesh','ram@gmail.com', 'Mohali', 27000);

select * from test8;

