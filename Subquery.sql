-- ПОДЗАПРОСЫ

-- 1. в условии
-- 2. в качестве источника данных

select * from departments;
select * from employees;
SELECT * FROM hr.jobs;

select employees.first_name, employees.last_name, employees.manager_id, employees_copy.employee_id
from employees
inner join employees employees_copy
on employees.manager_id = employees_copy.employee_id
and employees.job_id = "IT_PROG";

SELECT 
	first_name,
    last_name
FROM employees
WHERE manager_id IN (
	select employee_id
	from employees
	where job_id = 'IT_PROG'
);

select 
	t1.first_name,
    t1.last_name
from employees t1
inner join (
	select employee_id
	from employees
	where job_id = 'IT_PROG'
    ) t2
on t1.manager_id = t2.employee_id;

use tmp;

select * from tasks;
select * from employee;

select *
from employee 
where id not in (
	select employee_id
    from tasks
    where done_flg = 0
);

select title, employee_id
from tasks
where employee_id not in (
	select id
    from employee
)
and done_flg = 0;

SELECT * FROM uni.Teachers;
SELECT * FROM uni.Teachers2Competencies;

-- вывести преподавателя, у которого нет ни одной компетенции

select name 
from teachers
where id not in (
	select teacher_id
    from Teachers2Competencies
);

select * from Students;
select * from Students2Courses;
select * from Courses;

-- вывести компетенцию, по которой нет ни одного преподавателя

select title from Competencies
where id not in (
    select distinct Competencies_id 
    from Teachers2Competencies
);

-- найти всех студентов, которые не ходят ни на один курс

select * from Students
where id not in (
	select distinct student_id
    from Students2Courses
);

-- найти все курсы, на которые не записан староста

select title from courses
where headman_id not in (
	select student_id
    from Students2Courses
    where course_id is null
);

create view tmp as 
	select students2courses.student_id, courses.title as tmp_title
	from students2courses
	inner join courses
	on students2courses.course_id = courses.id;
    
select * from courses 
	where headman_id not in (select student_id from tmp where tmp_title = title);

drop view tmp;

