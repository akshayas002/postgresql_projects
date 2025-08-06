-- Insert students
INSERT INTO students (name, age, dept, details) VALUES
('Alice', 20, 'CS', '{"hobbies": ["reading", "chess"], "year": 2}'),
('Bob', 22, 'ECE', '{"hobbies": ["gaming"], "year": 3}'),
('Charlie', 19, 'ME', '{"hobbies": ["sports", "coding"], "year": 1}');

-- Insert courses
INSERT INTO courses (cname, credits, prerequisites, metadata) VALUES
('Data Structures', 4, ARRAY[101], '{"level": "intermediate"}'),
('Databases', 3, ARRAY[102, 103], '{"level": "advanced"}'),
('Physics', 2, ARRAY[], '{"level": "basic"}');

-- Insert enrollments
INSERT INTO enroll (sid, cid, grade) VALUES
(1, 1, 85),
(1, 2, 78),
(2, 2, 60),
(3, 3, 45);
