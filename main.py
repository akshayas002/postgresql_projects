from crud import create_student, read_students, update_student, delete_student

# Create
create_student("Akshaya", 21)

# Read
students = read_students()
print("Students:", students)

# Update
update_student(1, "Akshaya S", 22)

# Delete
delete_student(1)
