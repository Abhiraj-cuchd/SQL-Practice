use win_fun;

CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
COMMIT;

select * from product;

#First_value function and Last value function
# Write a query to display the most expensive and least product under each category (corresponding to each record)
select *,
first_value(product_name) 
	over(partition by 
		product_category order by price desc) as most_expensive_brand,
last_value(product_name) 
	over(partition by 
		product_category order by price desc
		rows between unbounded preceding and unbounded following)
    as cheapest_brand 
from product;

#Frames -- It is a subset of a partition

#Alternate way to write the above window function
select *,
first_value(product_name) over w as most_expensive_brand,
last_value(product_name) over w as cheapest_brand 
from product window w as (partition by 
		product_category order by price desc
		rows between unbounded preceding and unbounded following);


#Nth Value function
-- Write a query to display second most expensive product under each category
select *,
first_value(product_name) over w as most_expensive_brand,
last_value(product_name) over w as cheapest_brand,
nth_value(product_name,2) over w as second_most_expensive  
from product window w as (partition by 
		product_category order by price desc
		rows between unbounded preceding and unbounded following);

#N_tile function
-- Write a query to seggregate all the expensive phones , mid range phones and cheaper phones

select product_name,
case when x.buckets = 1  then 'Expensive Phones'
	 when x.buckets = 2  then 'Mid Range Phones'
     when x.buckets = 3  then 'Cheap Phones' END phone_category
from ( select *,
		ntile(3) over (order by price desc) as `buckets`
		from product where product_category = 'Phone') x;

# CUME_DIST function (Cumulative distribution)
/* Value --> 1 <= CUME_DIST > 0 */
/* Formula = Current row number (or Row No with value same as
				current row )/ total no of rows  */

# Query to fetch all products which are constituting the first 30%
  # of the data in products table based on price			
select product_name, (cume_distribution_percentage || '%')
as cume_dist_percentage 
from (
	select *,
	cume_dist() over(order by price desc) as cume_distribution,
	round(cume_dist() over(order by price desc) * 100, 2) 
	as cume_distribution_percentage from product) x
where x.cume_distribution_percentage <= 30;
 








