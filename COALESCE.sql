-- use hr;
-- select * from hr.employees;
--  
-- use tmp;
-- select * from employee;
--  
--  select 
-- 	t1.name, t2.lastname, t1.salary,
--     t2.name as manager_name, t2.salary
--  from employee t1
--  inner join employee t2
--  on t1.manager_id = t2.id
--  where t1.salary > t2.salary;

SELECT
	t1.name, 
    t1.lastname,
    t3.title as 'workers_task'
    -- COALESCE(t3.city, 'UNKNOWN')
from employee t1
left join employee t2
on t1.manager_id = t2.id
left join tasks t3
on t2.id = t3.employee_id;

use library;
 
 select * from employees;
 
alter table employees 
add last_name varchar(255) after middle_name;

alter table employees 
add middle_name varchar(255) after name;

ALTER TABLE employees
DROP COLUMN last_name;
 
UPDATE employees
set last_name = "Иванов"
where id = 1;

select concat(name, " ", last_name, " ", coalesce(middle_name, "")) from employees;


