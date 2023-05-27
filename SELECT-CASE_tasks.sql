select * from locations;

-- вывести среднюю зарплату сотрудников

select 
	round(avg(salary),2)
from employees;

-- найти среднюю зп в каждом департаменте

select 
	round(avg(salary),2)
from employees
where department_id is not null
group by department_id;

-- найти сотрудников, у которых наибольшая зп

select 
	*
from employees
where salary = (select max(salary) from employees);

select * from countries;

-- сформировать запрос, который выдает кол-во департаментов в штатах
-- country_id US

select 
	count(*)
from locations
where country_id = "US";

-- сформировать запрос, который выводит поле с кол-вом локаций в штатах
-- и кол-во локаций вообще

select
    case 
		when country_id = "US" then 1 
    end as "count", 
    country_id
from locations
where count is not null;

