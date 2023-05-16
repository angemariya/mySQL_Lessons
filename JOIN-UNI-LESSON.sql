select * from Students2Courses;

-- вывести имена студентов и курсы, которые они проходят

-- select Students.name, Courses.title
-- from Students
-- left join Students2Courses
-- on Students.id = Students2Courses.student_id
-- left join Courses
-- on Courses.id = Students2Courses.course_id;

-- вывести преподавателей, у которых нет компетенций

-- select teachers.name, Competencies.title
-- from teachers
-- left join Teachers2Competencies
-- on teachers.id = Teachers2Competencies.teacher_id
-- left join Competencies
-- on Competencies.id = Teachers2Competencies.competencies_id
-- where Competencies.title is null;