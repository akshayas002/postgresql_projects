-- Students Table
CREATE TABLE students (
    sid SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    dept VARCHAR(100),
    details JSONB
);

-- Courses Table
CREATE TABLE courses (
    cid SERIAL PRIMARY KEY,
    cname VARCHAR(100),
    credits INT,
    prerequisites INT[],
    metadata JSONB
);

-- Enrollments Table
CREATE TABLE enroll (
    enroll_id SERIAL PRIMARY KEY,
    sid INT REFERENCES students(sid),
    cid INT REFERENCES courses(cid),
    grade INT
);
