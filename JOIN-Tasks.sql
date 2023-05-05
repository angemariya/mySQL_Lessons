select * from employees;
select * from departments;
select * from countries;
select * from locations;

select
	t1.first_name,
    t1.last_name,
    t2.department_name
from employees t1
left join departments t2
on t1.department_id = t2.department_id;

select
	t1.department_name,
    t2.city
from departments t1
left join locations t2
on t1.location_id = t2.location_id;

select
	t1.department_name,
    t2.city
from departments t1
left join locations t2
on t1.location_id = t2.location_id
where t2.city = "London";
