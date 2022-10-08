use intro_SQl;

create table employees(
	first_name varchar(50),
    last_name varchar(50),
    title varchar(50),
    age int,
    salary int
);

insert into employees values('Abhiraj', 'Ghosh', 'Data Analyst', 21, 50000);
insert into employees values('Anshu', 'Raj', 'Application Security Analyst', 21, 70000);
insert into employees values('Abhinab', 'Handique', 'R & D Head', 22, 100000);
insert into employees values('Akansha', 'Rajkhowa', 'Marketing Head', 21, 80000);
insert into employees values('Yuvraj', 'Verma', 'Server - DevOps', 21, 60000);
insert into employees values('Akash', 'Borthakur', 'Game Developer', 21, 900000);

select count(*) as record_count from employees;

show tables;

select first_name, last_name, title from employees;

select * from employees where first_name like 'a%'
