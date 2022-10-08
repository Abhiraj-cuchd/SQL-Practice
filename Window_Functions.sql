create database win_fun;
use win_fun;

create table ineuron_students(
student_id int,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
student_marks int,
student_mail_id varchar(50));

insert into ineuron_students values (101, 'fsda', 'Sourav', 'CS', 80, 'sourav@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');

select * from ineuron_students;

#Aggregated windowing functions
select student_batch, sum(student_marks) as marks_batchwise from ineuron_students group by student_batch;

select student_batch, min(student_marks) as marks_batchwise from ineuron_students group by student_batch;

select student_batch, max(student_marks) as marks_batchwise from ineuron_students group by student_batch;

select student_batch, avg(student_marks) as marks_batchwise from ineuron_students group by student_batch;

select student_batch, count(*) as batch_strength from ineuron_students group by student_batch;

#Query to select the toppers of Every Batch
select student_name, student_batch, max(student_marks) as heighest_marks from ineuron_students group by student_batch;

#Query to select the batch topper of a particular batch
select student_name from ineuron_students where student_marks in
(select max(student_marks) from ineuron_students where student_batch = 'fsda');

#Query to select thr 2nd highest topper of a particular batch
select * from ineuron_students where student_batch = 'fsda' order by student_marks desc limit 1,1;

#Query to select the 3rd highest topper of a particular batch without using any hardcoded value
select * from ineuron_students where student_marks = (
select min(student_marks) from (select student_marks from ineuron_students
where student_batch = 'fsda'
order by student_marks desc limit 3) as top);  #Bugged code

#Query for the above questions but with Windowing analytical Functions approach
select student_id, student_batch, student_stream, student_marks, row_number() over 
(partition by student_batch
order by student_marks desc) 
as `row_number` from ineuron_students;

#Query to find the topper from every batch using window functions
select * from ( select student_id, student_batch, student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks ) as `row_num`
from ineuron_students) as test where row_num = 1;

#Correct approach -- using rank function
select student_id, student_batch, student_stream, student_marks,
rank() over (order by student_marks desc ) as `row_rank`
from ineuron_students;

#Combining row_number and rank function using windowing function
select * from (select student_id, student_batch, student_stream, 
student_marks,row_number() over (order by student_marks desc ) 
as `row_number`,rank() over 
(partition by student_batch order by student_marks desc) 
as `row_rank`from ineuron_students) as test where row_rank = 1;

select * from ineuron_students;

#Query to select the 3rd highest topper of a particular batch  using first_value, last_value and nth_value functions
select *,
first_value(student_name) over w as batch_topper,
last_value(student_name) over w as poor_performer,
nth_value(student_name, 2) over w as batch_runner_up ,
nth_value(student_name, 3) over w as 3rd_topper
from ineuron_students where student_batch = 'fsda'  window w as 
(partition by student_batch order by student_marks desc 
rows between unbounded preceding and  unbounded following);
			




