select * from Students2Courses;
SELECT * FROM uni.Teachers2Competencies;

-- вывести имена студентов и курсы, которые они проходят

select Students.name, Courses.title
from Students
left join Students2Courses
on Students.id = Students2Courses.student_id
left join Courses
on Courses.id = Students2Courses.course_id;

-- вывести преподавателей, у которых нет компетенций

-- select teachers.name, Competencies.title
-- from teachers
-- left join Teachers2Competencies
-- on teachers.id = Teachers2Competencies.teacher_id
-- left join Competencies
-- on Competencies.id = Teachers2Competencies.competencies_id
-- where Competencies.title is null;

-- найти курсы, которые не посещает ни один студент

-- select Courses.title
-- from Courses
-- left join Students2Courses
-- on Courses.id = Students2Courses.course_id
-- left join Students
-- on Students.id = Students2Courses.student_id
-- where Students.name is null;

-- найти компетенции, которых нет ни у одного преподавателя

select Competencies.title
from Competencies
left join Teachers2Competencies
on Competencies.id = Teachers2Competencies.competencies_id
left join Teachers
on teachers.id = Teachers2Competencies.teacher_id
where teachers.name is null;

-- вывести название курса и имя старосты

select Students.name, Courses.headman_id, Courses.title
from Students
inner join Courses
on Courses.headman_id = Students.id;

-- вывести имена студентов и количество курсов, на которых они являются старостами

select 
	Students.name, Count(Courses.id) as "Count"
from Courses
left join Students
on Courses.headman_id = Students.id
GROUP BY students.name;

-- вывести название курса и число студентов на нём

select Courses.title, Count(student_id) as "Students"
from Courses
left join Students2Courses
on Courses.id = Students2Courses.course_id
left join Students
on Students.id = Students2Courses.student_id
GROUP BY Courses.title;

-- вывести имена студентов и число курсов, на которые они ходят

select students.name, Count(Courses.title)as "Count of Courses"
from Courses
inner join Students2Courses
on Courses.id = Students2Courses.course_id
inner join Students
on Students.id = Students2Courses.student_id
GROUP BY students.name;

-- вывести имя студента, имя старосты и имя преподавателя для курсов, которые этот студент проходит

select 
	students.name as "Student name", 
    students_copy.name as "Headman name", 
    teachers.name as "Teacher name"
from students
inner join students2courses
on students.id = students2courses.student_id
inner join courses
on courses.id = students2courses.course_id
inner join teachers
on courses.teacher_id = teachers.id
inner join students students_copy
on students_copy.id = courses.headman_id;



