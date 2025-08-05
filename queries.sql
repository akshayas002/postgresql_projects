-- INNER JOIN: Get student names, course titles, and grades
SELECT s.name, c.title, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- LEFT JOIN: List all students, even if not enrolled
SELECT s.name, c.title
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

-- Aggregation: Average GPA per course
SELECT c.title, AVG(
    CASE 
        WHEN e.grade = 'A' THEN 4
        WHEN e.grade = 'B' THEN 3
        WHEN e.grade = 'C' THEN 2
        WHEN e.grade = 'D' THEN 1
        ELSE 0
    END
) AS avg_gpa
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.title;

-- Create a view to simplify student-course-grade data

CREATE VIEW student_course_grades AS
SELECT 
    s.name AS student_name, 
    c.title AS course_title, 
    e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

