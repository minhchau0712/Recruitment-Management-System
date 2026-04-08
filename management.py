from database import get_connection

def add_candidate(name, dob, email, phone):
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        query = "INSERT INTO Candidates (CandidateName, DateOfBirth, Email, PhoneNumber) VALUES (%s, %s, %s, %s)"
        cursor.execute(query, (name, dob, email, phone))
        conn.commit()
        print(f"✅ Đã thêm ứng viên: {name}")
        conn.close()

def update_interview(interview_id, result):
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        query = "UPDATE Interviews SET Result = %s WHERE InterviewID = %s"
        cursor.execute(query, (result, interview_id))
        conn.commit()
        print(f"✅ Đã cập nhật kết quả cho ID {interview_id}")
        conn.close()