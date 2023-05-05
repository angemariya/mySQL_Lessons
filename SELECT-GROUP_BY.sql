use hr;

select 
	sum(salary * 0.1) 
from employees;

select 
	sum(salary * 0.1)
from employees
group by department_id;

select 
	sum(salary * 0.1)
from employees
where salary >10000;

select sum (
		case 
			when salary >= 10000 then salary * 0.1 else 0
		end
) from employees;

select sum (
		case 
			when salary > 10000 then 10000 else salary
		end
) from employees;


use hr;

select * from employees;

select 
	sum(salary),
    max(salary),
    min(salary),
    avg(salary)
from employees;

