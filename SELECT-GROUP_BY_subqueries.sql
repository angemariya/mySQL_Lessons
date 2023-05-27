use tmp;

select * from employee;
-- в трех полях вывести 
--  - кол-во сделаных задач
--  - кол-во не сделаных задач
--  - общее кол-во задач
select 
	count(*) as total_cnt,
    count(
		case
			when done_flg = 1 then 1
        end 
	) as done_cnt,
    count(
    case 
		when done_flg = 0 then 1
    end
    ) as not_done_cnt
from tasks;
-- вывести процент сделаных задач и процент не сделаных от общего кол-ва
select 
	count(*) as total_cnt,
    count(
		case
			when done_flg = 1 then 1
        end 
	) / count(*) * 100 as done_cnt_percent,
    count(
    case 
		when done_flg = 0 then 1
    end
    ) / count(*) * 100 as not_done_cnt_percent
from tasks;

create view done_tasks_pct as 
 select 
  count(case when done_flg  = 1 then 1 end) 
   / count(*) * 100 as done_cnt_pct,
  count(case when done_flg  = 0 then 1 end) 
   / count(*) * 100 as not_done_cnt_pct
 from tasks;
 
select 
	count(distinct employee_id),
	count( 
		case
			when done_flg = 0 then 1
		end 
	) as busy_count
from tasks
left join employee
on tasks.employee_id = employee.id;

-- count(*) * или передаем уникальный параметр
-- min() max() минимум и максиму по какой то колонке/параметру
-- avg()
-- sum() работает только с числами

use hr; 

select * from employees;

select max(salary) from employees;

select 
	t1.department_name, t2.max_salary
from departments t1
inner join (select
	department_id, max(salary) as max_salary
from employees
where department_id is not null
group by department_id) t2
on t1.department_id = t2.department_id
order by t2.max_salary desc;

select
	department_id, max(salary) 
from employees
where department_id is not null
group by departmnet_id
order by max(salary) desc;

-- найти сотрудников получающих максимальную зарплату в компании

select first_name, last_name, salary
from employees
where salary = (select max(salary) from employees);

-- найти сотрудников получающих максимальную зп в своем департаменте

select employees.first_name, employees.last_name, employees.salary, employees.department_id
from employees
inner join (
	select department_id, max(salary) as max_salary 
	from employees
	where department_id is not null
	group by department_id) t2
on employees.department_id = t2.department_id
where employees.salary = t2.max_salary;

-- найти всех сотрудников, получающих зарплату меньше средней по департменту

select first_name, last_name, salary
from employees
inner join (
	select department_id, avg(salary) as average_salary
	from employees
	group by department_id
) t2
on employees.department_id = t2.department_id
where employees.salary < t2.average_salary;

-- найти всех сотрудников, получающих зарплату меньше средней по компании

select * from employees
where salary < (select avg(salary) from employees);

-- найти всех сотрудников которые получают не максимум и не минимум в своем департаменте

select employees.first_name, employees.last_name, employees.salary, employees.department_id
from employees
inner join (
	select department_id, max(salary) as max_salary, min(salary) as min_salary
	from employees
	group by department_id) t2
on employees.department_id = t2.department_id
where employees.salary != t2.max_salary 
and employees.salary != t2.min_salary;
 
-- посчитать сколько сотрудников в каждом департаменте

select department_id, count(employee_id)
from employees
group by department_id;
 