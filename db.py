import psycopg2

def get_connection():
    return psycopg2.connect(
        dbname="studcourse",
        user="postgres",
        password="yourpassword",
        host="localhost",
        port="5432"
    )
