# 📘 Student-Course DBMS with PostgreSQL

This is a simple PostgreSQL-based **Database Management System** project that manages **students and their enrolled courses**. It includes SQL schema creation, **CRUD operations**, **JOIN queries**, **Views**, and **Aggregation queries**, along with Python integration using `psycopg2`.

---

## 🗃️ Features

- 🧑 Manage Students
- 📚 Manage Courses
- 🧾 Enroll students in courses (many-to-many)
- ✅ Full CRUD (Create, Read, Update, Delete)
- 🔗 JOINs between students and courses
- 📊 Aggregation queries (e.g., average age, course count)
- 👓 Views for simplified access

---

## 🏗️ Database Schema

```sql
-- students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

-- enrollments table (many-to-many relationship)
CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    PRIMARY KEY (student_id, course_id)
);

## Project Structure
graphql
Copy code
studcourse_dbms/
├── main.py          # Python script to test CRUD
├── db.py            # PostgreSQL connection config
├── crud.py          # Python functions for CRUD
├── schema.sql       # SQL schema (students, courses, enrollments)
└── README.md        # Project documentation

