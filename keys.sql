create database key_prim;
use key_prim;

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int,
primary key(course_id));

insert into ineuron values( 56, 'FSDA', 'Active', 100);
insert into ineuron values( 57, 'FSDS', 'not-Active', 100);


select * from ineuron;

create table students_ineuron(
student_id int,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references ineuron(course_id));

insert into students_ineuron values(101, 'FSDA', 'test@gmail.com', 'active', 56);
insert into students_ineuron values(101, 'FSDA', 'test@gmail.com', 'active', 56);
insert into students_ineuron values(101, 'FSDA', 'test@gmail.com', 'active', 56);

select * from students_ineuron; 

create table payment(
course_name varchar(40),
course_id int,
course_live_status varchar(60),
course_launch_date varchar(60),
FOREIGN KEY (course_id) references ineuron(course_id));

insert into payment values ('FSDA', 56, 'not-active', '7th aug');
insert into payment values ('FSDA', 56, 'not-active', '7th aug');
insert into payment values ('FSDA', 56, 'not-active', '7th aug');
insert into payment values ('FSDA', 56, 'not-active', '7th aug');

select * from payment;

create table class(
course_id int,
class_name varchar(30),
class_topic varchar(60),
class_duration int,
PRIMARY KEY(course_id),
FOREIGN KEY (course_id) references ineuron(course_id));

alter table ineuron drop primary key;

alter table class drop primary key;

alter table ineuron add constraint test_prim primary key(course_status, course_name);


















