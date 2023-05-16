-- create database library;

use library;

-- select * from books;

-- create table books(
-- 	id integer primary key auto_increment,
--     title varchar(128) not null,
--     author varchar(128)
-- );

-- insert into books(title, author) values("Тараканище", "Чуковский Корней");
-- insert into books(title, author) values("Муха-цокотуха", "Чуковский Корней");
-- insert into books(title, author) values("Ружья, микробы и сталь", "Джарельд Даймонд");
-- insert into books(title, author) values("Тараканище", "Чуковский Корней");
-- insert into books(title, author) values("Муха-цокотуха", "Чуковский Корней");
-- insert into books(title, author) values("Ружья, микробы и сталь", "Джарельд Даймонд");
-- insert into books(title, author) values("Тараканище", "Чуковский Корней");
-- insert into books(title, author) values("Муха-цокотуха", "Чуковский Корней");
-- insert into books(title, author) values("Ружья, микробы и сталь", "Джарельд Даймонд");
-- insert into books(title, author) values("Тараканище", "Чуковский Корней");
-- insert into books(title, author) values("Муха-цокотуха", "Чуковский Корней");
-- insert into books(title, author) values("Ружья, микробы и сталь", "Джарельд Даймонд");

-- ALTER TABLE books
-- ADD inv_number integer default 0;

-- SELECT * from books;

-- ALTER TABLE books
-- MODIFY inv_number integer default 1;

-- INSERT into books(title, author) values("Три мушкетёра", "Александр Дюма");

-- UPDATE books
-- SET inv_number = null;

-- ALTER TABLE books
-- MODIFY inv_number varchar(128) default "000/000";

-- INSERT into books(title, author) values("Три мушкетёра, 20 лет спустя", "Александр Дюма");

-- UPDATE books
-- SET inv_number = 1;

-- Select * from books; 

-- INSERT into books(title, author) values("Сказка о золотом петушке", "Александр Пушкин");

-- SHOW COLUMNS from books;

-- UPDATE books
-- set inv_number = "111/111"
-- where title = "Тараканище";

-- select * from books;

-- ALTER TABLE books
-- CHANGE inv_number inventory_number varchar(255);

-- ALTER TABLE books
-- DROP COLUMN inventory_number;

-- select * from books;

-- DELETE from books WHERE id = 13;

-- insert into books(title, author) values("Азбука", "Маршак")

-- update books
-- set id = 13
-- where id = 17;

-- insert into books(title, author) values("Красная Шапочка", "Шарль Пьерро");
-- select * from books;

-- ALTER TABLE books
-- ADD is_deleted integer default 0;

-- UPDATE books
-- SET is_deleted = 1
-- WHERE author = "Чуковский Корней";

-- select * from books;

-- Создать новую таблицу readers с полями:
-- id (primary key + автоинкремент)
-- name (varchar(255)) обязательное поле
-- address(varchar(255))
-- и вставить в неё 3 читателей: Петя, живёт на улице Мира, д. 17
-- Маша, живёт на проспекте Луначарского, д. 7
-- Витя, живёт на улице Распутина, д. 13

-- CREATE TABLE readers(
-- 	id integer primary key auto_increment,
--     name varchar(255) not null,
--     address varchar(255)
-- );
-- insert into readers(name, address) values("Петя", "ул. Мира, д. 17");
-- insert into readers(name, address) values("Маша", "пр. Луначарского, д. 7");
-- insert into readers(name, address) values("Витя", "ул. Распутина, д. 13");

-- Добавить новую колонку date_of_birth
-- тип DATE, может быть пустым
-- поставить дни рождения ребят в следующем порядке:
-- Петя 2010-01-01
-- Маша 2011-02-02
-- Витя 2010-10-10

-- ALTER TABLE readers
-- ADD date_of_birth date;

-- update readers
-- set date_of_birth = "2010-01-01"
-- where name = "Петя";

-- update readers
-- set date_of_birth = "2011-02-02"
-- where name = "Маша";

-- update readers
-- set date_of_birth = "2010-10-10"
-- where name = "Витя";

-- ALTER TABLE readers
-- ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- ALTER TABLE readers
-- ADD updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- update readers
-- set name = "Петя"
-- where name = "Пётр";

-- select * from readers;

-- переименовать колонку date_of_birth в birth_date и поставить значение по умолчанию 
-- равное текущей дате 
-- чтобы проверить, создайте новую строку с name = "Коля" и address = "ул. Лунтика, д. 99"

-- ALTER TABLE readers
-- CHANGE date_of_birth birth_date date;

-- ALTER TABLE readers
-- MODIFY birth_date date default(current_date);

-- insert into readers(name, address) values("Иммануил", "ул. Прунтика, д. 69");

-- select * from readers;

-- в таблице books создать колонки created_at и updated_at (логика колонок идентична логике в readers)
-- в таблице books переименовать колонку title в name
-- в таблице readers реализовать механизм soft delete
-- работаем в таблице hr: посчитать среднюю зарплату для каждого департамента
-- работаем в таблице hr: посчитать разницу между максимальной и минимальной зарплатой для каждого департамента 

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
