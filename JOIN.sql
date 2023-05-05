-- select id, name created_at from readers
-- union all
-- select id, name, salary from employees;

-- select * from books;

-- update books
-- set employee_id = 1
-- where id = 1;

-- select 
-- 	books.id, books.name, books.author, 
--     employees.name as "Имя сотрудника", employees.salary as "Зарплата сотрудника"
-- from books
-- left join employees
-- on books.employee_id = employees.id;

-- alter table books
-- add reader_id int;

-- update books
-- set reader_id = 4
-- where id = 4;


-- select 
-- 	books.id, books.name, books.author, 
--     employees.name as "Имя сотрудника", employees.salary as "Зарплата сотрудника",
--     readers.name as "Читатель", readers.address as "Адрес читателя"
-- from books
-- left join employees
-- on books.employee_id = employees.id
-- inner join readers
-- on books.readers_id = readers.id;


-- select 
-- 	employees.first_name, employees.last_name, departments.department_name
-- from employees
-- inner join departments
-- on employees.department_id = departments.department_id
-- where departments.department_name = "IT";

-- вывести имя и фамилию всех сотрудников и имя и фамилию их менеджера
-- select 
-- 	employees.first_name, employees.last_name, 
--     managers.first_name as "Managers name", managers.last_name as "Managers lastname"
-- from employees
-- inner join employees managers -- склеиваем таблицу саму с собой - переименовываем
-- on employees.manager_id = managers.employee_id;

-- вывести имя и фамилию тех сотрудников, которые зарабатывают больше, чем их менеджер
-- select 
-- 	employees.first_name, employees.last_name, 
--     employees.salary "Зарплата сотрудника", managers.salary as "Зарплата менеджера"
-- from employees
-- inner join employees managers -- склеиваем таблицу саму с собой - переименовываем
-- on employees.manager_id = managers.employee_id
-- where employees.salary > managers.salary

-- для всех сотрудников вывести имя, фамилию и город проживания
-- select 
-- 	employees.first_name, employees.last_name, locations.city
-- from employees
-- inner join departments
-- on employees.department_id = departments.department_id
-- inner join locations 
-- on departments.location_id = locations.location_id;

-- вывести названия департаментов, где никто не работает
-- select 
-- 	departments.department_name, employees.employee_id
-- from departments
-- left join employees
-- on employees.department_id = departments.department_id
-- where employees.employee_id is null;

select * from employees;
select * from departments;

-- вывести названия департаментов, где менеджеры получают > 10000
select 
	departments.department_name, managers.salary as "Зарплата менеджеров > 10000" 
from departments
left join employees
on employees.department_id = departments.department_id
left join employees managers
on employees.manager_id = managers.employee_id
where managers.salary > 10000;
