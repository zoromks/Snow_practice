CREATE TABLE students_marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    student_name VARCHAR(100),
    class VARCHAR(20),
    subject VARCHAR(50),
    marks_obtained INT,
    total_marks INT,
    exam_type VARCHAR(30),
    exam_date DATE
);



INSERT INTO students_marks
(mark_id, student_id, student_name, class, subject,
 marks_obtained, total_marks, exam_type, exam_date)
VALUES
(1,  101, 'Rahul',  '10th', 'Maths',      85, 100, 'Final', '2026-03-10'),
(2,  101, 'Rahul',  '10th', 'Science',   78, 100, 'Final', '2026-03-11'),
(3,  101, 'Rahul',  '10th', 'English',   92, 100, 'Final', '2026-03-12'),
(4,  102, 'Priya',  '10th', 'Maths',      95, 100, 'Final', '2026-03-10'),
(5,  102, 'Priya',  '10th', 'Science',   88, 100, 'Final', '2026-03-11'),
(6,  102, 'Priya',  '10th', 'English',   91, 100, 'Final', '2026-03-12'),
(7,  103, 'Kiran',  '10th', 'Maths',      67, 100, 'Final', '2026-03-10'),
(8,  103, 'Kiran',  '10th', 'Science',   72, 100, 'Final', '2026-03-11'),
(9,  103, 'Kiran',  '10th', 'English',   65, 100, 'Final', '2026-03-12'),
(10, 104, 'Sneha',  '10th', 'Maths',      45, 100, 'Final', '2026-03-10'),
(11, 104, 'Sneha',  '10th', 'Science',   52, 100, 'Final', '2026-03-11'),
(12, 104, 'Sneha',  '10th', 'English',   48, 100, 'Final', '2026-03-12'),
(13, 105, 'Arjun',  '10th', 'Maths',      89, 100, 'Final', '2026-03-10'),
(14, 105, 'Arjun',  '10th', 'Science',   94, 100, 'Final', '2026-03-11'),
(15, 105, 'Arjun',  '10th', 'English',   83, 100, 'Final', '2026-03-12'),
(16, 101, 'Rahul',  '10th', 'Maths',      72, 100, 'Midterm', '2025-11-15'),
(17, 102, 'Priya',  '10th', 'Maths',      90, 100, 'Midterm', '2025-11-15'),
(18, 103, 'Kiran',  '10th', 'Maths',      60, 100, 'Midterm', '2025-11-15'),
(19, 104, 'Sneha',  '10th', 'Maths',      55, 100, 'Midterm', '2025-11-15'),
(20, 105, 'Arjun',  '10th', 'Maths',      80, 100, 'Midterm', '2025-11-15');






select *,row_number()over(order by marks_obtained desc) rno from students_marks qualify rno<=10;


