import management
import reports

def menu():
    while True:
        print("\n--- HỆ THỐNG QUẢN LÝ TUYỂN DỤNG ---")
        print("1. Thêm ứng viên mới")
        print("2. Cập nhật kết quả phỏng vấn")
        print("3. Xem báo cáo tỉ lệ trúng tuyển")
        print("4. Thoát")
        
        choice = input("Chọn chức năng (1-4): ")
        
        if choice == '1':
            print("\n--- NHẬP THÔNG TIN ỨNG VIÊN ---")
            name = input("Tên ứng viên: ")
            dob = input("Ngày sinh (YYYY-MM-DD): ")
            email = input("Email: ")
            phone = input("Số điện thoại: ")
            # Gọi hàm từ file management.py
            management.add_candidate(name, dob, email, phone) 
            
        elif choice == '2':
            print("\n--- CẬP NHẬT KẾ QUẢ PHỎNG VẤN ---")
            try:
                interview_id = int(input("Nhập ID cuộc phỏng vấn: "))
                result = input("Nhập kết quả (Pass/Fail): ")
                # Gọi hàm từ file management.py
                management.update_interview(interview_id, result)
            except ValueError:
                print("❌ Lỗi: ID phải là một số!")
                
        elif choice == '3':
            print("\n--- BÁO CÁO THỐNG KÊ ---")
            # Gọi hàm từ file reports.py
            reports.interview_pass_rate()
            
        elif choice == '4':
            print("Cảm ơn Châu đã sử dụng hệ thống. Tạm biệt!")
            break
        else:
            print("❌ Lựa chọn không hợp lệ, vui lòng chọn lại.")

if __name__ == "__main__":
    menu()