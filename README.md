# 🎓 Student Course Management System — PostgreSQL Project

A PostgreSQL-based database management system to manage students, courses, and enrollments with added functionality for **CRUD operations**, **Joins**, **Views**, **Aggregation**, and **Advanced SQL queries**.

---

## 📌 Project Description

This project implements a relational database for a student-course enrollment system using PostgreSQL. It models three primary entities: `students`, `courses`, and `enrollments`. The database captures student data, course offerings, and enrollment/grade records.

It's designed to practice and demonstrate:

- **Relational schema design**
- **Complex queries with joins and aggregations**
- **Views and triggers**
- **PostgreSQL JSONB & ARRAY usage**
- **Data manipulation through CRUD**
- **Advanced Queries**

---

## 🧱 Database Schema

### `students` table

| Column     | Type     | Description              |
|------------|----------|--------------------------|
| sid        | SERIAL   | Primary key              |
| name       | VARCHAR  | Student's name           |
| age        | INT      | Student's age            |
| dept       | VARCHAR  | Department               |
| details    | JSONB    | Additional info (e.g. hobbies, year) |

---

### `courses` table

| Column         | Type         | Description                        |
|----------------|--------------|------------------------------------|
| cid            | SERIAL       | Primary key                        |
| cname          | VARCHAR      | Course title                       |
| credits        | INT          | Credit value                       |
| prerequisites  | INT[]        | Array of prerequisite course IDs   |
| metadata       | JSONB        | Additional course metadata         |

---

### `enroll` table

| Column     | Type   | Description                                 |
|------------|--------|---------------------------------------------|
| enroll_id  | SERIAL | Primary key                                 |
| sid        | INT    | Foreign key to students                     |
| cid        | INT    | Foreign key to courses                      |
| grade      | INT    | Grade received                              |

---

## ✍️ CRUD Operations

- **Create**: Insert new student, course, or enrollment records
- **Read**: View student/course details, search by criteria
- **Update**: Modify student age, course details, grades, etc.
- **Delete**: Remove enrollments or student/course records

---
## 📚 Learning Outcomes

- PostgreSQL table design with **JSONB** and **arrays**
- CRUD operations through SQL
- Writing and optimizing **JOIN**, **VIEW**, and **AGGREGATE** queries
- Creating and using **triggers**
- Real-world **database modeling**

---

## 🛠️ Technologies Used

- PostgreSQL  
- SQL (Advanced)  
- Git / GitHub

