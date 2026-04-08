import mysql.connector

def get_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='mydb', 
            user='admin_user',
            password='Admin@123'
        )
        return connection
    except mysql.connector.Error as err:
        print(f"Lỗi: {err}")
        return None