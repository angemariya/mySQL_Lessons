-- use tmp;

-- create table users (
-- id int primary key auto_increment,
-- name varchar(128) not null,
-- age int check (age between 0 and 120),
-- email varchar(128)
-- );

-- select * from users;

-- insert into users (name, age, email) values ("Иванов Иван", 25, "ivan@hello.ru");
-- insert into users (name, age, email) values ("Петров Петр", 30, "pert@hello.ru");
-- insert into users (name, age, email) values ("Максимов Максим", 18, "max@hello.ru");
-- insert into users (name, age, email) values ("Танина Татьяна", 45, "tanya@hello.ru");
-- insert into users (name, age, email) values ("Любина Любовь", 21, "love@hello.ru");

-- create table employees(
--  id integer primary key auto_increment,
--  name varchar(128),
--  age integer check(age between 0 and 120),
--  phone varchar(128)
-- );

-- insert into employees(name, age, phone)values
--  ('Иван', 23, '+3746450730'),
--  ('Ольга', 35, '+37477755309'),
--  ('Игорь', 42, '+37445983335'),
--  ('Ирина', 39, '+37476333009');

create table human as
select
	name, 
	age, email, null, "employee" as type
from users
union
select 
	name, 
    age, null, phone, "user"
from employees;

-- insert into users(name, age, email)values
--  ('Иван', 23, 'ivan@gmail.com'),
--  ('Игнат', 35, 'ignat@gmail.com'),
--  ('Игорь', 42, 'igor@gmail.com'),
--  ('Степан', 42, 'stepan@gmail.com'),
--  ('Алина', 39, 'alina@gmail.com');
--  
--  alter table users
--  add type varchar(128);
--  
--   alter table employees
--  add type varchar(128);
--  
--  insert into users(type) values("user");

select * from human where name like "_г%"; -- выводит имена из human где вторая буква г


 




 