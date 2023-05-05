-- use library;

-- create table workers (
-- 	id int primary key auto_increment,
--     last_name varchar(255),
--     gender varchar(1), check(gender in ("M", "F")),
--     birthdate date
-- );

-- insert into workers (last_name, gender, birthdate) values ("Иванова", "F", "1990-03-20");
-- insert into workers (last_name, gender, birthdate) values ("Петров", "M", "1991-07-15");

-- select * from workers;

-- Alter table workers
-- Modify gender char(1); -- изменить тип данных в колонке

-- show columns from workers; -- показать тип данных которые используются в колонках

-- insert into workers(last_name, gender, birthdate) values("Сидорова", "F", "1990-03-20");
-- insert into workers(last_name, gender, birthdate) values("Кузнецова", "F", "1990-03-20");
-- insert into workers(last_name, gender, birthdate) values("Кузнецов", "M", "1991-07-15");

-- select * from workers;

-- показать 2 колонки. первая колонка - gender, вторая колонка - "Количество", где количество - 
-- это число сотрудников с этим полом

-- SELECT gender, count(id) as "Количество"
-- from workers
-- group by gender;

-- Alter table workers
-- add first_name varchar(255); -- добавить колонку 

-- UPDATE workers
-- set first_name = "Семён" where last_name = "Кузнецов"; -- изменить/добавить новое имя в строку

-- UPDATE workers
-- set birthdate = "1990-04-05" where last_name = "Кузнецова";

-- select * from workers where date_format(birthdate, "%m %d") = date_format(Current_date(), "%m %d");
-- показать у кого из workers сегодня день рождения

-- ALTER TABLE workers
-- modify column first_name VARCHAR(255)
-- after last_name;