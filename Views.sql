use ineuron_fsda;

create view bank_view as select age, job, marital, balance, education from bank_details2;

DELIMITER && 
create procedure job_role_avg_bal(IN v1 varchar(30))
BEGIN
	select avg(balance) from bank_view where job = v1;
END &&

call job_role_avg_bal('admin.');

