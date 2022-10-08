use ineuron_fsda;

select * from bank_details2;

select sum(balance) as gross_total from bank_details2;

select avg(balance) as mean_balance from bank_details2;

select * from bank_details2 where balance in (select min(balance) from bank_details2);

select * from bank_details2 where balance in (select max(balance) from bank_details2);

select * from bank_details2 order by balance desc limit 1;

select * from bank_details2 where loan = 'yes';

select avg(balance) from bank_details2 where Job = 'admin.';

select * from bank_details2 where (job = 'unknown' or job = 'retired' and age < 45);

select * from bank_details2 where education = 'primary' and job = 'unknown';

select * from bank_details2 where balance < 0;

select housing, balance from bank_details2 where housing = 'no';




call avg_bal_jobrole('technician');

