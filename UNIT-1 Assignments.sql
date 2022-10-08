create database DBMS;

use DBMS;

create table student(
Student_ID int,
Student_Name varchar(30),
Phone_Number int,
Physics_Marks int,
Chemistry_Marks int,
Student_Address varchar(30));

insert into student values(264, 'Abhiraj Ghosh', 875641239, 77, 85, 'Mohali, Punjab'),
(845, 'Abhinab Handique', 98546320, 87, 80, 'NOIDA , U.P'),
(963, 'Ramesh Solanki', 64916548, 63, 81, 'Bangalore, Karntaka'),
(1002, 'Haridyal Mann', 654198651, 40, 60, 'Chennai, Tamil Nadu'),
(130, 'Ravi Sharma', 32167496, 63, 93, 'Mumbai, Maharashtra'),
(987, 'Smriti Kaur', 979615413, 58, 36, 'Guwahati, Assam'),
(1058, 'Harbhajan Singh', 31894521, 78, 55, 'Srinagar, J&K'),
(398, 'Andrew Dsouza', 319854144, 90, 75, 'Delhi, Delhi');
select * from student;
select Student_ID, Student_Name from student;
select * from student where Student_ID = 963;



select sum(Physics_Marks) as Total_Phy_Marks, 
sum(Chemistry_Marks) as Total_Chem_Marks 
from student;


create table Employee(
Employee_ID int,
Employee_Name varchar(30),
Employee_Salary int,
Employee_Phone int,
Employee_Address varchar(30));

insert into Employee values(264, 'Abhiraj Ghosh', 30000 ,875641239, 'Mohali, Punjab'),
(845, 'Abhinab Handique', 45000, 98546320,'NOIDA , U.P'),
(963, 'Ramesh Solanki',80000,  64916548, 'Bangalore, Karntaka'),
(1002, 'Haridyal Mann', 90000 ,654198651, 'Chennai, Tamil Nadu'),
(130, 'Ravi Sharma', 70000, 32167496, 'Mumbai, Maharashtra'),
(987, 'Smriti Kaur', 150000, 979615413, 'Guwahati, Assam'),
(1058, 'Harbhajan Singh', 25000, 31894521,'Srinagar, J&K'),
(398, 'Andrew Dsouza', 60000, 319854144, 'Delhi, Delhi');
select * from Employee;
select Employee_ID, Employee_Name from Employee;
select count(*) as Total_Employees from Employee;
select sum(Employee_Salary) as Total_Salary from Employee;
truncate table Employee;
select * from Employee;
drop table Employee;
select * from Employee;
alter table Employee drop Employee_Address;
select * from Employee;
alter table Employee add Employee_address varchar(30);
select * from Employee;


alter table Employee rename column Employee_Phone to Mobile_Number;
select * from Employee;







