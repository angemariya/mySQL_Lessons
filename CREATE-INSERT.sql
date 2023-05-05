-- create table employees(
-- id int primary key auto_increment,
-- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
-- is_deleted int default 0 check(is_deleted in (0, 1)),
-- name varchar(255) not null,
-- address varchar(255),
-- birth_date date
-- );

-- insert into employees (name, address, birthdate) values ("Иванов Иван", "ул.Мира, д. 17", "1989-09-22");

-- select * from readers;

-- select id, 
-- name, 
-- birth_date, 
-- address
-- (case when true then "reader" end) as "status" from readers
-- union
-- select id, 
-- name, 
-- birthdate,
-- address
-- (case when true then "employees" end) as "status" from employees;

-- update employees
-- set birthdate = "Петя"
-- where id = 1;

-- alter table employees
-- add salary int check (salary > 0);

-- select * from employees;

-- SET SQL_SAFE_UPDATES=0;

-- UPDATE employees
-- set salary = 10000 where name = "Петя";

select id, name, null as salary from readers -- когда нет колонки salary
union all
select id, name, salary from employees;

insert into citizens(name) values("Иван");
insert into citizens(name) values("Мария");
insert into citizens(name) values("Игнат");

insert into real_estate(address) values("ул. Мира, д. 17");
insert into real_estate(address) values("ул. Алабяна, д. 3");
insert into real_estate(address) values("Беверли-Хиллз 90\2010"); 

-- Дз
-- у одного жителя может быть много домов. Реализовать механизм связи между домом и жителем.
-- проверка: написать запрос, который вернёт все дома гражданина с id = 1

-- у одно жителя может быть много домов и у одного дома может быть несколько владельцев
-- реализовать механизм связи многие ко многим в рамках этой задачи
