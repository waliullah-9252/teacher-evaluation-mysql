-- create a database with teacher evaluation
create database Teacher_Evaluation;

-- database activation
use Teacher_Evaluation;

-- 1. Create students table with proper constraints
CREATE TABLE students (
    student_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE,
    class_id INT,
    primary key(student_id, class_id),
    CONSTRAINT fk_class FOREIGN KEY (class_id) 
    REFERENCES classes(class_id)
);

-- create teachers table 
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    subject VARCHAR(50),
    department_id INT,
    PRIMARY KEY(teacher_id, department_id),
    CONSTRAINT fk_department FOREIGN KEY (department_id) 
    REFERENCES departments(department_id)
);

-- create evaluation table 
CREATE TABLE evaluation (
    evaluation_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    teacher_id INT,
    date DATE,
    grade VARCHAR(2),
    comments TEXT,
    CONSTRAINT fk_student FOREIGN KEY (student_id) 
    REFERENCES students(student_id),
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) 
    REFERENCES teachers(teacher_id)
);

-- create classess table
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL
);

-- create departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Insert into students table
INSERT INTO students (name, age, gender, email, date_of_birth, class_id) VALUES
('Jane Smith2', 17, 'Female', 'janee.smith@example.com', '2007-02-02', 2),
('Jane Smith3', 17, 'Female', 'janes.smith@example.com', '2007-02-02', 2),
('Jane Smith', 17, 'Female', 'jane.smith@example.com', '2007-02-02', 2),
('John Doe', 18, 'Male', 'john.doe@example.com', '2006-03-15', 3),
('Alice Johnson', 16, 'Female', 'alice.johnson@example.com', '2008-07-25', 4),
('Michael Brown', 17, 'Male', 'michael.brown@example.com', '2007-11-12', 5),
('Emily Davis', 18, 'Female', 'emily.davis@example.com', '2006-05-30', 6),
('David Wilson', 17, 'Male', 'david.wilson@example.com', '2007-08-21', 7),
('Sophia Martinez', 16, 'Female', 'sophia.martinez@example.com', '2008-12-14', 8),
('James Lee', 18, 'Male', 'james.lee@example.com', '2006-10-05', 9),
('Olivia Taylor', 17, 'Female', 'olivia.taylor@example.com', '2007-04-18', 10),
('Liam Anderson', 16, 'Male', 'liam.anderson@example.com', '2008-09-09', 1);


-- Insert into teachers table
INSERT INTO teachers (name, email, subject, department_id) VALUES
('Mr. Anderson3', 'anderson3@example.com', 'Mathematics', 1),
('Mr. Anderson2', 'anderson2@example.com', 'Mathematics', 1),
('Mr. Anderson', 'anderson@example.com', 'Mathematics', 1),
('Ms. Johnson', 'johnson@example.com', 'Physics', 2),
('Dr. Smith', 'smith@example.com', 'Chemistry', 3),
('Prof. Brown', 'brown@example.com', 'Biology', 4),
('Mrs. Taylor', 'taylor@example.com', 'History', 5),
('Mr. Harris', 'harris@example.com', 'Geography', 6),
('Miss Lee', 'lee@example.com', 'English', 7),
('Dr. Walker', 'walker@example.com', 'Economics', 8),
('Mr. Hall', 'hall@example.com', 'Political Science', 9),
('Mrs. Allen', 'allen@example.com', 'Philosophy', 10);


-- Insert into evaluation table
INSERT INTO evaluation (student_id, teacher_id, date, grade, comments) 
VALUES 
    (21, 2, '2024-05-01', 'A', 'Excellent performance'), 
    (22, 2, '2024-05-02', 'B', 'Good effort'), 
    (23, 3, '2024-05-03', 'C', 'Satisfactory'), 
    (24, 4, '2024-05-04', 'A', 'Outstanding'), 
    (25, 5, '2024-05-05', 'B', 'Very good'), 
    (26, 6, '2024-05-06', 'A', 'Remarkable'), 
    (27, 7, '2024-05-07', 'B', 'Well done'), 
    (28, 8, '2024-05-08', 'C', 'Could improve'), 
    (29, 9, '2024-05-09', 'A', 'Excellent understanding'), 
    (30, 10, '2024-05-10', 'B', 'Good progress');

-- classess table insert 
INSERT INTO classes (class_name) VALUES
('Mathematics'),
('Science'),
('History'),
('English'),
('Art'),
('Physical Education'),
('Computer Science'),
('Biology'),
('Chemistry'),
('Physics');

-- department table insert
INSERT INTO departments (department_name) VALUES
('Human Resources'),
('Finance'),
('Marketing'),
('Sales'),
('Research and Development'),
('IT'),
('Customer Service'),
('Operations'),
('Legal'),
('Administration');

-- query start here 
-- where condition use
-- 1. Retrieve all students
SELECT * 
FROM students;

-- 2. Retrieve all teachers
SELECT * 
FROM teachers;

-- 3. Select students older than 17
SELECT * 
FROM students 
WHERE age > 17;

-- 4. Retrieve all teachers from a specific department
SELECT * 
FROM teachers 
WHERE department_id = 1;

-- 5. Retrieve evaluations for a particular student
SELECT * 
FROM evaluation 
WHERE student_id = 21;

-- 6. Select students in class with ID 2
SELECT * 
FROM students 
WHERE class_id = 2;

-- 7. Retrieve all male students
SELECT * 
FROM students 
WHERE gender = 'Male';

-- 8. Retrieve all female students
SELECT * 
FROM students 
WHERE gender = 'Female';

-- 9. Retrieve all evaluations where grade is 'A'
SELECT * 
FROM evaluation 
WHERE grade = 'A';

-- aggrigate function use
-- 10. Count the number of students
SELECT COUNT(*) AS total_students 
FROM students;

-- 11. Find the average age of students
SELECT AVG(age) as avg_age 
FROM students;

-- 12. Find the minimum age of students
SELECT MIN(age) AS min_age 
FROM students;

-- 13. Find the maximum age of students
SELECT MAX(age) AS max_age 
FROM students;

-- 14. sum all student ages
SELECT SUM(age) AS total_age 
FROM students;

-- Group By and Having
-- 15. Retrieve teachers who have evaluated more than 1 students
SELECT t.name, COUNT(*) AS num_evaluations
FROM evaluation as e JOIN teachers as t 
ON e.teacher_id = t.teacher_id
GROUP BY t.name
HAVING COUNT(*) > 1;

-- 16. Count the number of evaluations per grade
SELECT grade, COUNT(*) AS num_evaluations
FROM evaluation
GROUP BY grade;

-- 17. Count the number of students in each class
SELECT class_id, COUNT(*) as num_students 
FROM students 
GROUP BY class_id;

-- 18. Average age of students in each class
SELECT class_id, AVG(age) AS avg_age 
FROM students 
GROUP BY class_id;

-- 19. Count teachers in each department
SELECT department_id, COUNT(*) AS num_teachers 
FROM teachers 
GROUP BY department_id;

-- 20. Find classes with more than 2 students
SELECT class_id, COUNT(*) AS num_students 
FROM students 
GROUP BY class_id 
HAVING COUNT(*) > 2;

-- 21. Find departments with more than 1 teacher
SELECT department_id, COUNT(*) AS num_teachers 
FROM teachers 
GROUP BY department_id 
HAVING COUNT(*) > 1;

-- Order By
-- 22. Retrieve students ordered by age in descending order
SELECT * 
FROM students 
ORDER BY age DESC;

-- 23. Order teachers by name
SELECT * 
FROM teachers 
ORDER BY name;

-- 24. Order evaluations by date
SELECT * 
FROM evaluation 
ORDER BY date;

-- 25. Order classes by class name
SELECT * 
FROM classes 
ORDER BY class_name;

-- join quries
-- 26. Find student name, teacher name, and show grade a student with evaluation tables
SELECT s.name as student_name, t.name as teacher_name, e.grade
FROM evaluation as e
INNER JOIN students as s ON e.student_id = s.student_id
INNER JOIN teachers as t ON e.teacher_id = t.teacher_id;

-- 27. Join students with their classes
SELECT s.name, c.class_name
FROM students as s JOIN classes as c
ON s.class_id = c.class_id;

-- 28. Find students with the highest grade in each class
SELECT s.name, e.grade, c.class_name
FROM students as s
JOIN evaluation as e ON s.student_id = e.student_id
JOIN classes as c ON s.class_id = c.class_id
WHERE e.grade = 'A';

-- view
-- 29. Create a view for student evaluations
CREATE VIEW student_evaluations AS
SELECT s.name AS student_name, t.name AS teacher_name, e.grade, e.comments, e.date
FROM evaluation e
JOIN students s ON e.student_id = s.student_id
JOIN teachers t ON e.teacher_id = t.teacher_id;


-- Subqueries
-- 30. Find students not evaluated
SELECT * 
FROM students 
WHERE student_id NOT IN (SELECT student_id 
						FROM evaluation);
                        
-- 31. Find teachers who haven't evaluated any student
SELECT * 
FROM teachers 
WHERE teacher_id NOT IN (SELECT teacher_id 
							FROM evaluation);

-- 32. Find the highest grade given by a specific teacher
SELECT MAX(grade) 
FROM evaluation 
WHERE teacher_id = 2;

-- 33. Find students evaluated by a specific teacher
SELECT * 
FROM students 
WHERE student_id IN (SELECT student_id 
					FROM evaluation 
					WHERE teacher_id = 2);

-- 34. Find evaluations with grades higher than the average grade
SELECT * 
FROM evaluation 
WHERE grade > (SELECT AVG(grade) 
				FROM evaluation);

-- trigger 
-- 35. Create a trigger to update student age automatically when evaluation is added
DELIMITER //
CREATE TRIGGER update_student_age
AFTER INSERT ON evaluation
FOR EACH ROW
BEGIN
    UPDATE students
    SET age = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())
    WHERE student_id = NEW.student_id;
END;
//
DELIMITER ;


-- index 
-- 36. Create an index on students' name
CREATE INDEX idx_student_name 
ON students(name);

-- 37. Create an index on teachers' name
CREATE INDEX idx_teacher_name 
ON teachers(name);

-- 38. Create an index on evaluations' date
CREATE INDEX idx_evaluation_date 
ON evaluation(date);

