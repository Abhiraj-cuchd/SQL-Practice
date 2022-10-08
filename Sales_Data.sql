create database sales;
use sales;

SET SESSION sql_mode = '';

SET SQL_SAFE_UPDATES = 0;


CREATE TABLE sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1;

select str_to_date(order_date, '%m/%d/%y')  from sales1;

alter table sales1 add column order_date_new date after order_date;

update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%Y');

alter table sales1 add column ship_date_new date after ship_date;

update sales1 
set ship_date_new = str_to_date(ship_date, '%m/%d/%Y');

select * from sales1 where ship_date_new = '2011-01-09';
select * from sales1 where ship_date_new > '2011-01-09';
select * from sales1 where ship_date_new < '2011-01-09';

select * from sales1 where ship_date_new between '2011-01-04' and '2011-05-09';

select now();
select curdate();
select curtime();

select * from sales1  where ship_date_new < date_sub(now(), interval 1 week);
select date_sub(now(), interval 4 day);
select year(now());
select dayname(now());

alter table sales1
add column flag date after order_id;

update sales1 
set flag = now();

alter table sales1 
modify column `year` datetime;


alter table sales1
modify column year_new int;

alter table sales1
modify column month_new int;

alter table sales1
modify column day_new int;


update sales1 set year_new = year(order_date_new);

update sales1 set month_new = month(order_date_new);

update sales1 set day_new = day(order_date_new);

select * from sales1;

select year_new , max(quantity) from sales1 group by year_new ;

select ((discount * sales) + shipping_cost) as ctc from sales1; 

select order_id, discount,  if(discount > 0, 'yes', 'no') as discount_flag from sales1;

alter table sales1 
add column discount_flagg varchar(30) after discount;


update sales1
set discount_flagg = if(discount > 0, 'yes', 'no');

select discount_flagg, count(discount_flagg) from sales1 group by discount_flagg;




