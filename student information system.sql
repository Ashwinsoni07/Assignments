use StudentInformationSystem;

insert into students (first_name, last_name, date_of_birth, email,phone_number)
values 
('Robert','Downey','2001-07-05','rdj@gmail.com','9865472554'),
('Chris','Evans','2001-01-26','evans@gmail.com','8457582144'),
('Chris','Hemsworth','2002-03-11','chrishem@gmail.com','9436578415'),
('Johnny','Depp','2002-07-25','jo@gmail.com','7003226589'),
('Tom','Holland','2000-11-05','tom@gmail.com','9888000654'),
('Andrew','Garfield','2001-08-05','andr@gmail.com','9754100113'),
('Emma','Watson','2001-07-05','emm@gmail.com','7000648525'),
('Emma','Stone','2003-04-7','stone@gmail.com','9452100068'),
('Ryan','Reynolds','2001-11-07','ryan@gmail.com','9542215425'),
('Bill','Smith','2001-11-21','bill@gmail.com','9000716584');

describe enrollments;

insert into teacher(first_name,last_name,email)
values
('Tony','Stark','tony@gmail.com'),
('Steve','Rogers','ste@gmail.com'),
('Thor','Odinson','thor@gmail.com'),
('Jack','Sparrow','jack@gmail.com'),
('Peter','Parker','pete@gmail.com'),
('Pete','Parker','par@gmail.com'),
('Hermione','Weasley','her@gmail.com'),
('Gwen','Stacy','gwen@gmail.com'),
('Wade','Wilson','wade@gmail.com'),
('Steve','Smith','smi@gmail.com');

insert into payments(amount,students_student_id,payment_date)
values 
(10000,2,'2024-03-02'),
(12000,1,'2024-03-10'),
(1700,3,'2024-03-24'),
(6000,4,'2024-02-26'),
(10000,6,'2024-03-05'),
(12500,7,'2024-02-28'),
(7000,5,'2024-03-17'),
(9500,7,'2024-03-24'),
(10000,9,'2024-02-26'),
(10000,2,'2024-03-02');

insert into courses(course_name,credit,teacher_teacher_id)
values 
('Java Programming',100,'2'),
('Pyhton Programming',100,'3'),
('Javascript',80,'2'),
('Graphic Designing',80,'1'),
('Advanced Web Development',100,'5'),
('Database Management',60,'6'),
('Competitive Programming',120,'8'),
('Aptitude',100,'9'),
('Communication',50,'4'),
('c++ Programming',80,'7');


insert into enrollments(courses_course_id,student_id,enrollment_date)
values
(2,3,'2024-03-02'),
(1,5,'2024-03-10'),
(3,10,'2024-03-24'),
(7,7,'2024-03-02'),
(2,2,'2024-03-24'),
(8,6,'2024-02-28'),
(10,4,'2024-02-28'),
(4,8,'2024-03-02'),
(5,9,'2024-03-24'),
(6,1,'2024-03-10');
/*
1. Write an SQL query to insert a new student into the "Students" table with the following details:
	a. First Name: John
	b. Last Name: Doe
	c. Date of Birth: 1995-08-15
	d. Email: john.doe@example.com
	e. Phone Number: 1234567890
*/
insert into students (first_name, last_name, date_of_birth, email,phone_number)
values
('JOHN','Doe','1995-08-15','john.doe@example.com','1234567890');

/*
2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
*/
insert into enrollments(courses_course_id,student_id,enrollment_date)
values
(1,11,'2024-03-02');

-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
update teacher set email = 'parker@gmail.com' where teacher_id = 6;

-- 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Selectan enrollment record based on the student and course.
delete from enrollments where student_id = 11;

-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
update courses set teacher_teacher_id = 5 where course_id = 2;

--  6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
delete from students where student_id = 11;
delete from enrollments where student_id = 11;

-- 7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
update payments set amount = 12500 where payment_id = 2;

-- Task 2

-- 1. Write an SQL query to calculate total payment made by specific student. You will need to join the payments table and student table via student_id.
select s.first_name,s.last_name, sum(p.amount) as 'Total_payment' 
from students s 
join payments p on s.student_id = p.students_student_id 
where s.student_id = 2;
/*+------------+-----------+---------------+
| first_name | last_name | Total_payment |
+------------+-----------+---------------+
| Chris      | Evans     |         20000 |
+------------+-----------+---------------+*/

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. 
-- Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select c.course_name, count(e.student_id) as 'Students_Enrolled'
from courses c 
join enrollments e on c.course_id = e.courses_course_id 
group by c.course_name;
/*+--------------------------+-------------------+
| course_name              | Students_Enrolled |
+--------------------------+-------------------+
| Advanced Web Development |                 1 |
| Aptitude                 |                 1 |
| c++ Programming          |                 1 |
| Competitive Programming  |                 1 |
| Database Management      |                 1 |
| Graphic Designing        |                 1 |
| Java Programming         |                 1 |
| Javascript               |                 1 |
| Pyhton Programming       |                 2 |
+--------------------------+-------------------+*/

-- 3. Write an SQL query to find the names of students who have not enrolled in any course.
-- Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
select s.first_name,s.last_name 
from students s 
join enrollments e on s.student_id = e.student_id 
where s.student_id not in (select student_id from enrollments);
/*NULL*/

-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in.
-- Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
select s.first_name,s.last_name,c.course_name 
from students s 
join enrollments e on s.student_id = e.student_id 
join courses c on e.courses_course_id = c.course_id;

/*+------------+-----------+--------------------------+
| first_name | last_name | course_name              |
+------------+-----------+--------------------------+
| Tom        | Holland   | Java Programming         |
| Chris      | Hemsworth | Pyhton Programming       |
| Chris      | Evans     | Pyhton Programming       |
| Bill       | Smith     | Javascript               |
| Emma       | Stone     | Graphic Designing        |
| Ryan       | Reynolds  | Advanced Web Development |
| Robert     | Downey    | Database Management      |
| Emma       | Watson    | Competitive Programming  |
| Andrew     | Garfield  | Aptitude                 |
| Johnny     | Depp      | c++ Programming          |
+------------+-----------+--------------------------+*/

-- 5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
select t.first_name,t.last_name,c.course_name 
from courses c 
join teacher t on c.teacher_teacher_id = t.teacher_id ;
/*+------------+-----------+--------------------------+
| first_name | last_name | course_name              |
+------------+-----------+--------------------------+
| Steve      | Rogers    | Java Programming         |
| Peter      | Parker    | Pyhton Programming       |
| Steve      | Rogers    | Javascript               |
| Tony       | Stark     | Graphic Designing        |
| Peter      | Parker    | Advanced Web Development |
| Pete       | Parker    | Database Management      |
| Gwen       | Stacy     | Competitive Programming  |
| Wade       | Wilson    | Aptitude                 |
| Jack       | Sparrow   | Communication            |
| Hermione   | Weasley   | c++ Programming          |
+------------+-----------+--------------------------+*/

-- 6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
select s.first_name,s.last_name,e.enrollment_date 
from students s 
join enrollments e on s.student_id = e.student_id 
where e.courses_course_id = 4;
/*+------------+-----------+-----------------+
| first_name | last_name | enrollment_date |
+------------+-----------+-----------------+
| Emma       | Stone     | 2024-03-02      |
+------------+-----------+-----------------+*/

-- 7. Find the names of students who have not made any payments.
-- Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
select distinct s.* 
from students s 
left join payments p on s.student_id = p.students_student_id 
where s.student_id not in (select students_student_id from payments);
/*+------------+------------+-----------+---------------+----------------------+--------------+
| student_id | first_name | last_name | date_of_birth | email                | phone_number |
+------------+------------+-----------+---------------+----------------------+--------------+
|          8 | Emma       | Stone     | 2003-04-07    | stone@gmail.com      | 9452100068   |
|         10 | Bill       | Smith     | 2001-11-21    | bill@gmail.com       | 9000716584   |
|         12 | JOHN       | Doe       | 1995-08-15    | john.doe@example.com | 1234567890   |
+------------+------------+-----------+---------------+----------------------+--------------+*/

-- 8. Write a query to identify courses that have no enrollments. 
-- You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
select c.* 
from courses c 
left join enrollments e on c.course_id = e.courses_course_id 
where c.course_id not in (select courses_course_id from enrollments);
/*+-----------+---------------+--------+--------------------+
| course_id | course_name   | credit | teacher_teacher_id |
+-----------+---------------+--------+--------------------+
|         9 | Communication | 50     |                  4 |
+-----------+---------------+--------+--------------------+*/

-- 9. Identify students who are enrolled in more than one course.
-- Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
select s.*
from students s 
join enrollments e on s.student_id = e.student_id 
group by e.student_id
having count(e.student_id) > 1;

/*NULL*/
update courses set teacher_teacher_id = 3 where course_id = 2;

-- 10. Find teachers who are not assigned to any courses.
-- Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.
select t.*
from courses c 
right join teacher t on c.teacher_teacher_id = t.teacher_id 
where t.teacher_id not in (select teacher_teacher_id from courses);
/*NULL*/

-- TASK-4

-- 1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
select avg(e.student_id) as 'average_students' 
from students s 
join enrollments e on s.student_id = e.student_id 
group by e.courses_course_id;
/*NULL*/

-- 2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
select s.* ,p.amount 
from students s 
left join payments p on s.student_id = p.students_student_id 
order by p.amount desc 
limit 1;
/*+------------+------------+-----------+---------------+---------------+--------------+--------+
| student_id | first_name | last_name | date_of_birth | email         | phone_number | amount |
+------------+------------+-----------+---------------+---------------+--------------+--------+
|          1 | Robert     | Downey    | 2001-07-05    | rdj@gmail.com | 9865472554   |  12500 |
+------------+------------+-----------+---------------+---------------+--------------+--------+*/

-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find thecourse(s) with the maximum enrollment count.
select c.*,count(e.courses_course_id) as 'num_of_enrollments' 
from courses c 
left join enrollments e on c.course_id = e.courses_course_id 
group by c.course_name 
order by num_of_enrollments desc ;
/*+-----------+--------------------------+--------+--------------------+--------------------+
| course_id | course_name              | credit | teacher_teacher_id | num_of_enrollments |
+-----------+--------------------------+--------+--------------------+--------------------+
|         2 | Pyhton Programming       | 100    |                  3 |                  2 |
|         1 | Java Programming         | 100    |                  2 |                  1 |
|         3 | Javascript               | 80     |                  2 |                  1 |
|         4 | Graphic Designing        | 80     |                  1 |                  1 |
|         5 | Advanced Web Development | 100    |                  5 |                  1 |
|         6 | Database Management      | 60     |                  6 |                  1 |
|         7 | Competitive Programming  | 120    |                  8 |                  1 |
|         8 | Aptitude                 | 100    |                  9 |                  1 |
|        10 | c++ Programming          | 80     |                  7 |                  1 |
|         9 | Communication            | 50     |                  4 |                  0 |
+-----------+--------------------------+--------+--------------------+--------------------+*/

-- 4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
select t.*,c.course_name,sum(p.amount) as'payments' 
from payments p 
join students s on p.students_student_id = s.student_id 
join enrollments e on s.student_id = e.student_id 
join courses c on e.courses_course_id = c.course_id 
join teacher t on c.teacher_teacher_id = t.teacher_id 
group by t.teacher_id;
/*+------------+------------+-----------+------------------+--------------------------+----------+
| teacher_id | first_name | last_name | email            | course_name              | payments |
+------------+------------+-----------+------------------+--------------------------+----------+
|          2 | Steve      | Rogers    | ste@gmail.com    | Java Programming         |     7000 |
|          3 | Thor       | Odinson   | thor@gmail.com   | Pyhton Programming       |    21700 |
|          5 | Peter      | Parker    | pete@gmail.com   | Advanced Web Development |    10000 |
|          6 | Pete       | Parker    | parker@gmail.com | Database Management      |    12500 |
|          7 | Hermione   | Weasley   | her@gmail.com    | c++ Programming          |     6000 |
|          8 | Gwen       | Stacy     | gwen@gmail.com   | Competitive Programming  |    22000 |
|          9 | Wade       | Wilson    | wade@gmail.com   | Aptitude                 |    10000 |
+------------+------------+-----------+------------------+--------------------------+----------+*/

-- 5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.
select s.*
from students s 
join enrollments e on s.student_id = e.student_id
join courses c on e.courses_course_id = c.course_id
where c.course_name = all (select course_name from courses);
/*NULL*/

-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
select t.first_name,t.last_name
from courses c 
right join teacher t on c.teacher_teacher_id = t.teacher_id 
where t.teacher_id not in (select teacher_teacher_id from courses);

-- Steve Smith 


-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
/*age column does not exist iin the current database*/

-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
select c.* 
from courses c 
left join enrollments e on c.course_id = e.courses_course_id 
where c.course_id not in (select courses_course_id from enrollments);
/*+-----------+---------------+--------+--------------------+
| course_id | course_name   | credit | teacher_teacher_id |
+-----------+---------------+--------+--------------------+
|         9 | Communication | 50     |                  4 |
+-----------+---------------+--------+--------------------+*/

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
select c.course_name, sum(p.amount) 
from payments p 
join students s on p.students_student_id = s.student_id 
join enrollments e on s.student_id = e.student_id 
join courses c on e.courses_course_id = c.course_id 
group by c.course_id ;
/*+--------------------------+---------------+
| course_name              | sum(p.amount) |
+--------------------------+---------------+
| Java Programming         |          7000 |
| Pyhton Programming       |         21700 |
| Advanced Web Development |         10000 |
| Database Management      |         12500 |
| Competitive Programming  |         22000 |
| Aptitude                 |         10000 |
| c++ Programming          |          6000 |
+--------------------------+---------------+*/

-- 10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
select s.* 
from students s 
left join payments p on s.student_id = p.students_student_id 
group by p.students_student_id 
having count(p.students_student_id) > 1 ;
/*+------------+------------+-----------+---------------+-----------------+--------------+
| student_id | first_name | last_name | date_of_birth | email           | phone_number |
+------------+------------+-----------+---------------+-----------------+--------------+
|          2 | Chris      | Evans     | 2001-01-26    | evans@gmail.com | 8457582144   |
|          7 | Emma       | Watson    | 2001-07-05    | emm@gmail.com   | 7000648525   |
+------------+------------+-----------+---------------+-----------------+--------------+*/

-- 11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
select s.*, sum(p.amount) as 'total_payment'
from payments p 
join students s on p.students_student_id = s.student_id  
group by p.students_student_id ;
/*+------------+------------+-----------+---------------+--------------------+--------------+---------------+
| student_id | first_name | last_name | date_of_birth | email              | phone_number | total_payment |
+------------+------------+-----------+---------------+--------------------+--------------+---------------+
|          1 | Robert     | Downey    | 2001-07-05    | rdj@gmail.com      | 9865472554   |         12500 |
|          2 | Chris      | Evans     | 2001-01-26    | evans@gmail.com    | 8457582144   |         20000 |
|          3 | Chris      | Hemsworth | 2002-03-11    | chrishem@gmail.com | 9436578415   |          1700 |
|          4 | Johnny     | Depp      | 2002-07-25    | jo@gmail.com       | 7003226589   |          6000 |
|          5 | Tom        | Holland   | 2000-11-05    | tom@gmail.com      | 9888000654   |          7000 |
|          6 | Andrew     | Garfield  | 2001-08-05    | andr@gmail.com     | 9754100113   |         10000 |
|          7 | Emma       | Watson    | 2001-07-05    | emm@gmail.com      | 7000648525   |         22000 |
|          9 | Ryan       | Reynolds  | 2001-11-07    | ryan@gmail.com     | 9542215425   |         10000 |
+------------+------------+-----------+---------------+--------------------+--------------+---------------+*/

-- 12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
select c.course_name,count(e.courses_course_id) as 'num_of_enrollments' 
from courses c 
left join enrollments e on c.course_id = e.courses_course_id 
group by c.course_name 
order by num_of_enrollments desc ;
/*+--------------------------+--------------------+
| course_name              | num_of_enrollments |
+--------------------------+--------------------+
| Pyhton Programming       |                  2 |
| Java Programming         |                  1 |
| Aptitude                 |                  1 |
| Competitive Programming  |                  1 |
| Database Management      |                  1 |
| Advanced Web Development |                  1 |
| Graphic Designing        |                  1 |
| Javascript               |                  1 |
| c++ Programming          |                  1 |
| Communication            |                  0 |
+--------------------------+--------------------+*/

-- 13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
select avg(p.amount) as 'average_amount'
from payments p 
join students s on p.students_student_id = s.student_id;
/*+----------------+
| average_amount |
+----------------+
|      8920.0000 |
+----------------+*/