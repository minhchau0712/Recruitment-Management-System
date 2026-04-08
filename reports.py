from database import get_connection

def interview_pass_rate():
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        # Truy vấn tính tỉ lệ Pass
        query = """
        SELECT 
            (SELECT COUNT(*) FROM Interviews WHERE Result = 'Pass') * 100.0 / COUNT(*) 
        FROM Interviews;
        """
        cursor.execute(query)
        rate = cursor.fetchone()[0]
        print(f"📊 Tỉ lệ ứng viên vượt qua phỏng vấn: {rate:.2f}%")
        conn.close()