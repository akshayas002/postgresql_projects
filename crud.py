from db import get_connection

def create_student(name, age):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO students (name, age) VALUES (%s, %s)", (name, age))
    conn.commit()
    cur.close()
    conn.close()

def read_students():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM students")
    students = cur.fetchall()
    cur.close()
    conn.close()
    return students

def update_student(student_id, name, age):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("UPDATE students SET name = %s, age = %s WHERE id = %s", (name, age, student_id))
    conn.commit()
    cur.close()
    conn.close()

def delete_student(student_id):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM students WHERE id = %s", (student_id,))
    conn.commit()
    cur.close()
    conn.close()
