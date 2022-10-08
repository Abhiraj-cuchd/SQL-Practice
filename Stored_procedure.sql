use ineuron_fsda;

DELIMITER &&
create procedure select_all()
BEGIN
	select * from bank_details2;
END &&

DELIMITER &&
create procedure max_balance()
BEGIN
	select * from bank_details2 where balance in (select max(balance) from bank_details2);
END &&

DELIMITER &&
create procedure avg_bal_jobrole1(IN jobrole varchar(30))
BEGIN
	select avg(balance) from bank_details2 where job = jobrole;
END &&

DELIMITER &&
create procedure sel_edu_job(IN v1 varchar(30), IN v2 varchar(30))
BEGIN
	select * from bank_details2 where education = v1 and job = v2;
END &&

call select_all();

call avg_bal_jobrole1('technician');

call sel_edu_job_count('primary', 'retired');








