use sales;

select * from sales1;

SET SESSION sql_mode = '';

SET SQL_SAFE_UPDATES = 0;

DELIMITER $$
create function add_to_col(a INT)
returns INT 
DETERMINISTIC
BEGIN 
	DECLARE b int ;
    set b = a + 10;
    return b;
END $$
DELIMITER $$;
    
select add_to_col(15);

select quantity, add_to_col(quantity) as increased_quantity from sales1;

DELIMITER $$
create function final_profits(profit INT, discount INT)
returns INT
DETERMINISTIC
BEGIN
	DECLARE final_profit int;
	set final_profit = profit - discount;
	return final_profit;
END $$
DELIMITER $$

select profit, discount, final_profits(profit, discount) as Final_Profit from sales1;

DELIMITER $$
create function int_to_str( a INT)
returns varchar(30)
DETERMINISTIC
BEGIN
	DECLARE b varchar(30);
    set b = a;
    return b;
END $$
DELIMITER $$

select quantity, int_to_str(quantity) as quantity_number from sales1;

select max(sales), min(sales) from sales1;

DELIMITER $$
create function mark_sales(sales INT)
returns varchar(30)
DETERMINISTIC
BEGIN
	DECLARE flag_sales varchar(30);
    if sales < 100 then 
		set flag_sales = 'Super Affordable Product';
	elseif sales > 100 and sales < 300 then
		set flag_sales = 'Affordable Product';
	elseif sales > 300 and sales  < 600 then
		set flag_sales = 'Moderate Price';
    else 
		set flag_sales = 'Expensive Product';
	end if;
	return flag_sales;
END $$
DELIMITER $$

select product_name, mark_sales(sales) as Affordability from sales1;

alter table sales1
add column Affordability varchar(30) after product_name;

select * from sales1;

update sales1
set Affordability = mark_sales(sales);

create table loop_table( val int);

DELIMITER $$
create procedure insert_data()
BEGIN
	set @var = 10;
	generate_data : loop
    insert into loop_table values(@var);
	set @var = @var + 1;
	if @var = 100 then
		leave generate_data;
	end if;
	end loop generate_data;
END $$

call insert_data;

select * from loop_table;





