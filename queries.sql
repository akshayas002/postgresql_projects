-- BASIC QUERIES
-- 1. View all students
SELECT * FROM students;

-- 2. View all courses
SELECT * FROM courses;

-- 3. View all enrollments
SELECT * FROM enroll;

-- 4. Insert a new student
INSERT INTO students (name, age, dept, details)
VALUES ('Ritika Sharma', 21, 'IT', '{"year": "3rd", "hobbies": ["design", "reading"]}');

-- 5. Insert a new course
INSERT INTO courses (cname, credits, prerequisites, metadata)
VALUES ('Operating Systems', 3, ARRAY[101], '{"semester": "5", "type": "core"}');

-- 6. Enroll a student into a course
INSERT INTO enroll (sid, cid, grade)
VALUES (3, 2, 78);

-- 7. Get all courses taken by a specific student
SELECT c.cname
FROM enroll e
JOIN courses c ON e.cid = c.cid
WHERE e.sid = 1;

-- 8. Get all students enrolled in a specific course
SELECT s.name
FROM enroll e
JOIN students s ON e.sid = s.sid
WHERE e.cid = 2;

-- 9. Get a specific student's details
SELECT * FROM students WHERE sid = 1;

-- 10. Update a student's age
UPDATE students
SET age = 22
WHERE sid = 1;

-- 11. Delete an enrollment record
DELETE FROM enroll
WHERE enroll_id = 1;

-- 12. Count total students
SELECT COUNT(*) FROM students;

-- 13. Show distinct departments
SELECT DISTINCT dept FROM students;

-- 14. Find students older than 21
SELECT * FROM students
WHERE age > 21;

-- 15. Simple join: students and their grades
SELECT s.name, c.cname, e.grade
FROM students s
JOIN enroll e ON s.sid = e.sid
JOIN courses c ON e.cid = c.cid;

-- ADVANCED QUERIES
-- 1. Get student names and the courses they are enrolled in
SELECT s.name AS student, c.cname AS course
FROM students s
JOIN enroll e ON s.sid = e.sid
JOIN courses c ON e.cid = c.cid;

-- 2. List all students who scored above 80 in any course
SELECT s.name, c.cname, e.grade
FROM students s
JOIN enroll e ON s.sid = e.sid
JOIN courses c ON c.cid = e.cid
WHERE e.grade > 80;

-- 3. Get the average grade per course
SELECT c.cname, AVG(e.grade) AS average_grade
FROM courses c
JOIN enroll e ON c.cid = e.cid
GROUP BY c.cname;

-- 4. Get count of students in each department
SELECT dept, COUNT(*) AS student_count
FROM students
GROUP BY dept;

-- 5. List students who have 'coding' as a hobby (JSONB query)
SELECT name, details
FROM students
WHERE details->'hobbies' @> '["coding"]';

-- 6. Find courses that require prerequisite 101
SELECT cname, prerequisites
FROM courses
WHERE 101 = ANY(prerequisites);

-- 7. Find students who failed in at least one course (grade < 50)
SELECT DISTINCT s.name, e.grade
FROM students s
JOIN enroll e ON s.sid = e.sid
WHERE e.grade < 50;

-- 8. View with computed pass/fail status (or use CREATE VIEW)
SELECT s.name, c.cname, e.grade,
       CASE
           WHEN e.grade >= 50 THEN 'PASS'
           ELSE 'FAIL'
       END AS result
FROM students s
JOIN enroll e ON s.sid = e.sid
JOIN courses c ON c.cid = e.cid;

-- 9. Find students not enrolled in any course
SELECT s.name
FROM students s
LEFT JOIN enroll e ON s.sid = e.sid
WHERE e.enroll_id IS NULL;

-- 10. List all courses that no student is enrolled in
SELECT c.cname
FROM courses c
LEFT JOIN enroll e ON c.cid = e.cid
WHERE e.enroll_id IS NULL;

-- 11. Show total credits a student is taking
SELECT s.name, SUM(c.credits) AS total_credits
FROM students s
JOIN enroll e ON s.sid = e.sid
JOIN courses c ON e.cid = c.cid
GROUP BY s.name;

-- 12. Find top 3 students by average grade
SELECT s.name, AVG(e.grade) AS avg_grade
FROM students s
JOIN enroll e ON s.sid = e.sid
GROUP BY s.name
ORDER BY avg_grade DESC
LIMIT 3;

-- 13. Get number of courses each student is enrolled in
SELECT s.name, COUNT(e.cid) AS num_courses
FROM students s
LEFT JOIN enroll e ON s.sid = e.sid
GROUP BY s.name;

-- 14. Get student JSON field 'year' from details
SELECT name, details->>'year' AS year_of_study
FROM students;

-- 15. Expand all student hobbies (unnest JSON array)
SELECT name, jsonb_array_elements_text(details->'hobbies') AS hobby
FROM students;

-- 16. Find students with more than one enrollment
SELECT s.name, COUNT(e.enroll_id) AS total_enrollments
FROM students s
JOIN enroll e ON s.sid = e.sid
GROUP BY s.name
HAVING COUNT(e.enroll_id) > 1;

-- 17. Use subquery: Find students with max grade in any course
SELECT name
FROM students
WHERE sid IN (
    SELECT sid
    FROM enroll
    WHERE grade = (SELECT MAX(grade) FROM enroll)
);

-- 18. Array contains all prerequisites (e.g. 102 and 103)
SELECT cname
FROM courses
WHERE prerequisites @> ARRAY[102, 103];
