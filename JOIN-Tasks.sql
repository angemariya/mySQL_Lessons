-- select * from employees;
-- select * from departments;
-- select * from countries;
-- select * from locations;

-- select
-- 	t1.first_name,
--     t1.last_name,
--     t2.department_name
-- from employees t1
-- left join departments t2
-- on t1.department_id = t2.department_id;

-- select
-- 	t1.department_name,
--     t2.city
-- from departments t1
-- left join locations t2
-- on t1.location_id = t2.location_id;

-- select
-- 	t1.department_name,
--     t2.city
-- from departments t1
-- inner join locations t2
-- on t1.location_id = t2.location_id
-- and t2.city = "London";

-- use tmp;
/*
-- employee

id - идентификатор сотрудника
name - имя сотрудника
lastname - фамилия сотрудника
salary - зарплата сотрудника
manager_id - идентификатор менеджера сотрудника

-- tasks

id - идентификатор задачи
title - наименование задачи
employee_id - идентификатор сотрудника, который назначен исполнителем
done_flg - флаг выполнения задачи (1 - задача выполнена, 0 - задача не выполнена)
*/

select * from employee; 
select * from tasks; 

-- Сформируйте выборку, которая содержит имена и фамилии сотрудников, у которых нет задач.

-- select
-- 	t1.name,
--     t1.lastname
-- from employee t1
-- left join tasks t2
-- on t1.id = t2.employee_id
-- where t2.employee_id is null;

-- select
-- 	t1.title 
-- from tasks t1
-- left join employee t2
-- on t1.employee_id = t2.id
-- where t2.id is null;

-- select 
-- 	employees.first_name, employees.last_name, 
--     departments.department_name, employees.department_id
-- from employees
-- left join departments
-- on departments.department_id = employees.department_id

-- union

-- select 
-- 	employees.first_name, employees.last_name, 
--     departments.department_name, employees.department_id
-- from employees
-- right join departments
-- on departments.department_id = employees.department_id;

