-- в таблице books создать колонки created_at и updated_at (логика колонок идентична логике в readers)
-- в таблице books переименовать колонку title в name
-- в таблице readers реализовать механизм soft delete
-- работаем в таблице hr: посчитать среднюю зарплату для каждого департамента
-- работаем в таблице hr: посчитать разницу между максимальной и минимальной зарплатой для каждого департамента

-- use library;

-- select * from books

-- alter table books
-- add created_at date;

-- alter table books 
-- add updated_at date;

-- alter table books
-- change title name varchar(255);

-- select * from readers;

-- alter table readers 
-- add deleted int default 0;

-- SET SQL_SAFE_UPDATES = 0;

-- UPDATE readers
-- set deleted = 1 where name = "Петя";

-- select * from employees;

-- работаем в таблице hr: посчитать среднюю зарплату для каждого департамента
-- SELECT AVG(Price) AS Average_Price FROM Products

-- select department_id,
-- 	avg(salary)
-- FROM employees
-- GROUP BY department_id;
-- -- ORDER BY department_id

-- select department_id,
-- 	max(salary) - min(salary)
-- FROM employees
-- GROUP BY department_id;

-- delete from employee where lastname like "%ова";

