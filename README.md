Báo cáo Phân tích Hiệu năng Database Indexing
1. Đặt vấn đề
Bối cảnh: Hệ thống quản lý bệnh viện sở hữu bảng Patients với quy mô dữ liệu lớn (khoảng 500.000 dòng).

Vấn đề: Các câu lệnh truy vấn tìm kiếm theo số điện thoại (Phone) chưa được tối ưu, dẫn đến thời gian phản hồi kéo dài hơn 3 giây mỗi truy vấn.

Hệ quả: Gây ra tình trạng hàng dài bệnh nhân phải chờ đợi tại bộ phận tiếp tân.

2. Mục tiêu thử nghiệm
Tạo lập môi trường dữ liệu giả lập với 500.000 bản ghi để tái hiện vấn đề.

Đo lường và so sánh tốc độ truy vấn (SELECT) trước và sau khi đánh Index.

Đánh giá tác động của Index đến tốc độ ghi dữ liệu (INSERT) khi thực hiện thêm mới 1.000 dòng liên tục.

Phân tích sự "đánh đổi" giữa tốc độ đọc và tốc độ ghi để đưa ra giải pháp tối ưu.

3. Kỹ thuật triển khai
A. Giả lập dữ liệu (Data Seeding)
Sử dụng MySQL Store Procedure để tự động hóa việc chèn dữ liệu mẫu. Mã nguồn thực hiện:

Khởi tạo vòng lặp WHILE chạy 500.000 lần.

Sử dụng hàm CONCAT và RAND để tạo dữ liệu ngẫu nhiên cho các trường Full_Name, Phone, và Age.

B. Công cụ phân tích
EXPLAIN: Sử dụng để phân tích cách Database Engine vận hành câu lệnh SELECT, kiểm tra xem hệ thống thực hiện quét toàn bộ bảng (Full Table Scan) hay sử dụng Index.
