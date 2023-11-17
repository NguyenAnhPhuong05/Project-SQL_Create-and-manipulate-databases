/* Project SQL _ Triển khai và thao tác CSDL*/
/* Họ và tên: Nguyễn Anh Phương */
-------------------------------------------------------------

-------------------------------------------------------------
                 /* Khởi tạo Database */
-------------------------------------------------------------

CREATE DATABASE Asm2
USE Asm2;
--DROP DATABASE Asm2
-------------------------------------------------------------
                /* Tạo bảng trong CSDL */
-------------------------------------------------------------

-- Tạo bảng Admin (Quản trị viên)
CREATE TABLE tbl_Admin(
  ID NVARCHAR(10) PRIMARY KEY,
  AdminName NVARCHAR(45) NOT NULL,
  AdminEmail NVARCHAR(45) NOT NULL,
  AdminPassword VARCHAR(45) NOT NULL,
  AdminPhone VARCHAR(32) NULL,
  Activities NVARCHAR(45) NOT NULL);

-- Tạo bảng Editor (Biên tập viên)
CREATE TABLE tbl_Editor(
  ID NVARCHAR(10) PRIMARY KEY,
  EditorName NVARCHAR(45) NOT NULL,
  EditorEmail NVARCHAR(45) NOT NULL,
  EditorPassword NVARCHAR(45) NOT NULL,
  EditorPhone VARCHAR(32) NULL,
  Active INT NOT NULL);

-- Tạo bảng Reporter (Nhà báo)
CREATE TABLE tbl_Reporter(
  ID NVARCHAR(10) PRIMARY KEY,
  ReporterName NVARCHAR(45) NOT NULL,
  ReporterEmail NVARCHAR(45) NOT NULL,
  ReporterPassword NVARCHAR(45) NOT NULL,
  ReporterPhone VARCHAR(32) NULL,
  Active INT NOT NULL);

-- Tạo bảng User (Người đọc)
CREATE TABLE tbl_User(
  ID NVARCHAR(10) PRIMARY KEY,
  UserName NVARCHAR(45) NOT NULL,
  UserEmail NVARCHAR(45) NOT NULL,
  UserPassword NVARCHAR(45) NOT NULL,
  UserPhone VARCHAR(32) NULL,
  Active INT NOT NULL);

-- Tạo bảng Categorie(Chủ đề)
CREATE TABLE tbl_Categorie(
  ID NVARCHAR(10) PRIMARY KEY,
  Categorie NVARCHAR(45) NOT NULL,
  SubCategorie NVARCHAR(45) NOT NULL,
  Display NVARCHAR(45) NOT NULL);

-- Tạo bảng News(Tin tức)
CREATE TABLE tbl_News(
  ID NVARCHAR(10) PRIMARY KEY,
  CategorieID NVARCHAR(10) NOT NULL,
  ReporterID NVARCHAR(10) NOT NULL,
  Title NVARCHAR(255) NOT NULL,
  Descrpt NVARCHAR(255) NOT NULL,
  ImageURL NVARCHAR(255) NULL,
  Content TEXT NOT NULL,
  CreateDate DATE NOT NULL,
  NewsStatus NVARCHAR(45) NOT NULL);

-- Tạo bảng Approve (Phê duyệt)
CREATE TABLE tbl_Approve(
  ID NVARCHAR(10) PRIMARY KEY,
  NewsID NVARCHAR(10) NOT NULL,
  EditorID NVARCHAR(10) NOT NULL,
  ApproveDate DATE NULL)

-- Tạo bảng Comment(Bình luận)
CREATE TABLE tbl_Comment(
  ID NVARCHAR(10) PRIMARY KEY,
  NewsID NVARCHAR(10) NOT NULL,
  UserID NVARCHAR(10) NOT NULL,
  CommentDate DATE NOT NULL,
  Content NVARCHAR(255) NOT NULL)

----------------------------------------------------------------------------
  /* Chèn dữ liệu vào các bảng đã tạo, mỗi bảng có tối thiểu 10 bản ghi */
----------------------------------------------------------------------------

-- Nhập dữ liệu cho bảng Admin --
INSERT INTO tbl_Admin(ID, AdminName, AdminEmail, AdminPassword, AdminPhone, Activities)
VALUES 
       ('AD001', N'Nguyễn Thu Trang', 'thutrang23@gmail.com','nguyenthutrang012','01234567', N'duyệt Comment, trực page'),
	   ('AD003', N'Hoàng Văn Thanh', 'hoangvanthanh@gmail.com', 'vanthanh123','0345681', N'trực page, quản lí user'),
	   ('AD004', N'Đào Tuấn Anh', 'tuananh2503@gmail.com', 'tuananhdao253', NULL, N'quản lí user'),
	   ('AD005', N'Nguyễn Mạnh Cường', 'nguyenmanhcuong@gmail.com', 'manhcuong16', '09262624', N'quản lí chủ đề'),
	   ('AD006', N'Trần Khoa Bình', 'binhtran0205@gmail.com', 'binhtran93', '0456789', N'quản lí Comment'),
	   ('AD008', N'Nguyễn Hồng Nhung', 'nhungnguyen2211@gmail.com', 'hongnhung91', '0985627', N'trực page'),
	   ('AD009', N'Nguyễn Quỳnh Anh', 'nguyenquynhanh@gmail.com', 'quynhanh09', '0782389', N'quản lí Reporter'),
	   ('AD010', N'Lê Thị Nga', 'ngalethi12@gmail.com', 'lenga12', '0129468', N'quản lí Editor');

SELECT * FROM tbl_Admin;

-- Nhập dữ liệu cho bảng Approve--
INSERT INTO tbl_Approve (ID, NewsID, EditorID, ApproveDate)
VALUES
       ('AP001', 'N006','ED003','2022-06-12'),
	   ('AP002', 'N004','ED001','2022-06-09'),
	   ('AP003', 'N003','ED002','2022-07-10'),
	   ('AP004', 'N005','ED008',NULL),
	   ('AP005', 'N007','ED001','2022-08-15'),
	   ('AP006', 'N001','ED004','2022-07-05'),
	   ('AP007', 'N002','ED003','2022-08-20'),
	   ('AP008', 'N010','ED006','2022-07-31'),
	   ('AP009', 'N008','ED007','2022-05-15'),
	   ('AP010', 'N009','ED009','2022-05-08'),
	   ('AP011', 'N012','ED006','2022-06-08'),
	   ('AP012', 'N011','ED010',NULL);

SELECT * FROM tbl_Approve

-- Nhập dữ liệu cho bảng Categorie--
INSERT INTO tbl_Categorie(ID, Categorie, SubCategorie, Display)
VALUES 
       ('CA001A', N'Xã hội', N'Chính trị', N'Xanh lá'),
	   ('CA001B', N'Xã hội', N'Giao thông', N'Xanh lá'),
	   ('CA001C', N'Xã hội', N'Nóng trên mạng', N'Xanh lá'),
	   ('CA002A', N'Thế giới', N'Quân sự', N'Đỏ'),
	   ('CA002B', N'Thế giới', N'Thế giới đó đây', N'Đỏ'),
	   ('CA002C', N'Thế giới', N'Kiều bào', N'Đỏ'),
	   ('CA002D', N'Thế giới', N'Hồ sơ-Phân tích', N'Đỏ'),
	   ('CA003A', N'Kinh doanh', N'Chứng khoán', N'Xanh lam'),
	   ('CA003B', N'Kinh doanh', N'Tài chính', N'Xanh lam'),
	   ('CA003C', N'Kinh doanh', N'Doanh nghiệp', N'Xanh lam'),
	   ('CA003D', N'Kinh doanh', N'Khởi nghiệp', N'Xanh lam'),
	   ('CA003E', N'Kinh doanh', N'Tiêu dùng', N'Xanh lam'),
	   ('CA004A', N'Bất động sản', N'Dự án', N'Nâu'),
	   ('CA004B', N'Bất động sản', N'Thị trường', N'Nâu'),
	   ('CA004C', N'Bất động sản', N'Nhà đất', N'Nâu'),
	   ('CA004D', N'Bất động sản', N'Nhịp sống đô thị', N'Nâu'),
	   ('CA005A', N'Thể thao', N'Thể thao trong nước', N'Cam'),
	   ('CA005B', N'Thể thao', N'Bóng đá châu âu', N'Cam'),
	   ('CA005C', N'Thể thao', N'Tennis', N'Cam'),
	   ('CA005D', N'Thể thao', N'Golf', N'Cam'),
	   ('CA005E', N'Thể thao', N'Võ thuật', N'Cam'),
	   ('CA006A', N'Việc làm', N'Chính sách', N'Tím'),
	   ('CA006B', N'Việc làm', N'Việc làm', N'Tím'),
	   ('CA006C', N'Việc làm', N'Xuất khẩu lao động', N'Tím'),
	   ('CA007A', N'Nhân ái', N'Danh sách ủng hộ', N'Vàng'),
	   ('CA007B', N'Nhân ái', N'Hoàn cảnh', N'Vàng'),
	   ('CA008A', N'Sức khỏe', N'Ung thư', N'Hồng'),
	   ('CA008B', N'Sức khỏe', N'Sống khỏe', N'Hồng'),
	   ('CA008C', N'Sức khỏe', N'Dịch vụ y tế', N'Hồng'),
	   ('CA008D', N'Sức khỏe', N'Khỏe đẹp', N'Hồng'),
	   ('CA009A', N'Văn hóa', N'Đời sống văn hóa', N'Đỏ cam'),
	   ('CA009B', N'Văn hóa', N'Điện ảnh', N'Đỏ cam'),
	   ('CA009C', N'Văn hóa', N'Âm nhạc', N'Đỏ cam'), 
	   ('CA009D', N'Văn hóa', N'Văn học', N'Đỏ cam'),
	   ('CA010A', N'Giải trí', N'Hậu trường', N'Xanh, đỏ'),
	   ('CA010B', N'Giải trí', N'Thời trang', N'Xanh, đỏ'),
	   ('CA010C', N'Giải trí', N'TVShow', N'Xanh, đỏ');

SELECT * FROM tbl_Categorie

-- Nhập dữ liệu bảng Comment--
INSERT INTO tbl_Comment(ID, NewsID, UserID, CommentDate, Content)
VALUES 
       ('C001', 'N003', 'US002', '2022-08-01', N'Phát triển du lịch thi đường bộ vẫn thu hút hơn chứ đi máy bay vèo cái đến trung tâm rồi về thì mất hết hấp dẫn'),
	   ('C002', 'N008', 'US008', '2022-06-30', N'Rất đáng quan tâm cố lên các em'),
	   ('C003', 'N010', 'US001', '2022-08-15', N'Bài viết rất chính xác, ở cấp cao Tôi không rõ nhưng cấp cơ sở thì rất chính xác. Bên cạnh còn các yếu tố tiêu cực khác ...'),
	   ('C004', 'N010', 'US005', '2022-08-30', N'Ý kiến rất xác đáng.'),
	   ('C005', 'N012', 'US001', '2022-07-15', N'Giải thì nhỏ mà cup to thế'),
	   ('C006', 'N008', 'US003', '2022-05-28', N'Hồi còn nhỏ chữa vết thương gì mẹ mình cũng dùng lá sống đời đắp cho mình mỗi khi đá bóng , ngã té'),
	   ('C007', 'N009', 'US004', '2022-06-01', N'Cái này mới gọi là đỉnh cao của sáng tạo thời trang.'),
	   ('C008', 'N001', 'US006', '2022-07-20', N'Mình dậy sơm vì thích có nhiều thời gian làm việc!'),
	   ('C009', 'N002', 'US009', '2022-08-31', N'Uống trà vừa thưởng thức hương vị trà nhâm nhi tách trà cảm nhận cuộc sống tích cực lên, giúp giảm căng thẳng xã stress,...nhiêu đó thôi là đã an vui rồi.'),
	   ('C010', 'N007', 'US005', '2022-09-01', N'Nhà nước cần tăng thuế bất động sản để thêm nguồn thu, giảm đầu cơ');

SELECT * FROM tbl_Comment

-- Nhập dữ liệu bảng Editor--
INSERT INTO tbl_Editor(ID, EditorName, EditorEmail, EditorPassword, EditorPhone, Active)
VALUES
      ('ED001', N'Nguyễn Phương My', 'phuongmy0211@gmail.com','mynguyen211', NULL,0),
	  ('ED002', N'Nguyễn Anh Phương', 'phuongnguyen51291@gmail.com', 'anhphuong0512', '0383501658',1),
	  ('ED003', N'Phạm Thanh Duy', 'thanhduypham@gmail.com', 'duyphamthanh', '0893467231',1),
	  ('ED004', N'Trần Đức Khang', 'khangductran@gmail.com', 'khangtran0203', '03527819', 1),
	  ('ED005', N'Nguyễn Minh Hằng', 'hangminhnguyen1510@gmail.com','hangnguyen91',NULL,1),
	  ('ED006', N'Trần Thanh Tùng', 'tranthanhtung0511@gmail.com','tungtran87','03437829',1),
	  ('ED007', N'Trần Thị Quỳnh Nga', 'ngaquynh1510@gmail.com', 'tranquynhnga','03576589',0),
	  ('ED008', N'Đào Minh Chiến', 'chiendao0489@gmail.com', 'daominhchien89',NULL, 1),
	  ('ED009', N'Trần Trung Dũng', 'trungdungtran54@gmail.com','dungtran78',NULL,1),
	  ('ED010', N'Phạm Ngọc Bích', 'ngocbichpham@gmail.com','bichpham91', '08351487',0);

SELECT * FROM tbl_Editor

--Nhập dữ liệu bảng Reporter--
INSERT INTO tbl_Reporter(ID, ReporterName, ReporterEmail, ReporterPassword, ReporterPhone, Active)
VALUES
      ('R001', N'Nguyễn Phương Anh', 'phuonganh@gmail.com','anhphuongnguyen211', '024354678 ',0),
	  ('R002', N'Nguyễn Anh Sơn', 'sonnguyen51291@gmail.com', 'anhsonnguyen0512', NULL,1),
	  ('R003', N'Phạm Minh Duy', 'minhduypham@gmail.com', 'duyphamminh1302', '08941902',1),
	  ('R004', N'Trần Đức Kha', 'khaductran@gmail.com', 'khatran0203', '03627829', 0),
	  ('R005', N'Nguyễn Minh Tuyết', 'tuyetminhnguyen1410@gmail.com','tuyetnguyen91','08987136 ',1),
	  ('R006', N'Trần Hoàng Tùng', 'tranhoangtung0511@gmail.com','tungtran99',NULL,1),
	  ('R007', N'Trần Thị Quỳnh Mai', 'maiquynh1511@gmail.com', 'tranquynhmai','03577777',1),
	  ('R008', N'Đào Minh Hạnh', 'hanhdao0688@gmail.com', 'daominhhanh88','01614237 ', 1),
	  ('R009', N'Trần Trung Thành', 'trungthanhtran89@gmail.com','thanhtran89', NULL,0),
	  ('R010', N'Phạm Lan Hương', 'lanhuongpham@gmail.com','huongpham91', '08385679',1);

SELECT * FROM tbl_Reporter

-- Nhập dữ liệu bảng User--
INSERT INTO tbl_User(ID, UserName, UserEmail, UserPassword, UserPhone, Active)
VALUES
      ('US001', N'Nguyễn Mạnh Hùng', 'manhhungnguyen@gmail.com','hungnguyen451', '07967345 ',1),
	  ('US002', N'Nguyễn Thu Minh', 'thuminhnguyen1102@gmail.com', 'minhnguyen05', NULL,0),
	  ('US003', N'Phạm Ngọc Duy', 'ngocduypham@gmail.com', 'duypham098', '0893461234',1),
	  ('US004', N'Trần Minh Đức', 'minhductran01@gmail.com', 'ducminhtran0203', '035278197', 1),
	  ('US005', N'Nguyễn Trần Trung Quân', 'quannguyen1710@gmail.com','nguyentrungquan91','046421678 ',1),
	  ('US006', N'Trần Tùng', 'trantung0521@gmail.com','tungtran189',NULL,1),
	  ('US007', N'Trần Thị Quỳnh Mai', 'maiquynhtran1410@gmail.com', 'tranquynhmai87','03571899',1),
	  ('US008', N'Đào Hải Yến', 'yenhaidao1089@gmail.com', 'daohaiyen89','03639198 ', 0),
	  ('US009', N'Đào Mạnh Dũng', 'manhdungdao@gmail.com','dungdao98', NULL,1),
	  ('US010', N'Lê Đức Hải', 'duchaile@gmail.com','haile91', '08281986',1);

SELECT * FROM tbl_User

--Nhập dữ liệu bảng News--
INSERT INTO tbl_News(ID, CategorieID, ReporterID, Title, Descrpt, ImageURL, Content, CreateDate, NewsStatus)
VALUES 
      ('N001', 'CA003A', 'R003', N'Chứng khoán giảm còn bao nhiêu?', N'Thị trường chứng khoán tiếp tục giảm sâu','http://dantri.com.vn/kinh-doanh/','abcdef','2022-07-01','approved'),
	  ('N002', 'CA008B', 'R004', N'Uống trà có lợi cho sức khỏe như thế nào?', N'Trà có chứa chất chống ô xi hóa','http://dantri.com.vn/suc-khoe/.','gvdvcubdludbiflvndl','2022-08-15','approving'),
	  ('N003', 'CA002B', 'R002', N'Phát triển du lịch ở vùng núi phía bắc', N'Vùng núi định hướng phát triển du lịch sinh thái','http://dantri.com.vn/van-hoa/.','jjdsfvhdbfvid','2022-07-01','approved'),
	  ('N004', 'CA001B', 'R001', N'Nhức nhối vấn đề đỗ xe trong khu đô thị', N'Trong các khu đô thị không đủ xe đỗ cho cư dân','http://dantri.com.vn/doi-song/.','bjhd jdh djhb ','2022-06-01','approving'),
	  ('N005', 'CA003C', 'R009', N'Sunshine Group được vinh danh trong lĩnh vực bất động sản cao cấp', N'Tập đoàn Sunshine đi đầu trong phân khúc bất động sản cao cấp','http://dantri.com.vn/kinh-doanh/doanh-nghiep/','bidubiudbvudbiud','2022-07-15','approved'),
	  ('N006', 'CA005A', 'R010', N'Cơ hội nào cho bóng đá nữ Việt Nam trên trường quốc tế', N'Bóng đá nữ Việt Nam tham gia World Cup','http://dantri.com.vn/the-thao/the-thao-trong-nuoc/','vsdcshdbcudhcipad','2022-06-01','approved'),
	  ('N007', 'CA004B', 'R008', N'Áp dụng thay đổi khung giá đất 9/2022', N'Khung giá đất mới chính thức được áp dụng','http://dantri.com.vn/bat-dong-san/thi-truong/','bjdncdjsfvbfdbvsd','2022-08-05','approved'),
	  ('N008', 'CA009D', 'R007', N'Sinh vien Đại học Khoa học Tự nhiên giành giải vàng châu Á', N'Sinh viên Việt Nam giành giải vàng châu Á','http://dantri.com.vn/van-hoa/van-hoc/','údbcubvhbsubvfsuf','2022-04-20','approving'),
	  ('N009', 'CA010B', 'R004', N'Ranh giới giữa sáng tạo và phản cảm trong thời trang', N'Sáng tạo sai cách dẫn tới phản cảm trong thời trang','http://dantri.com.vn/giai_tri/thoi-trang/','bvuibvuihfiushe','2022-04-15','approving'),
	  ('N010', 'CA009A', 'R005', N'Nỗ lực đưa chèo trở thành đại diện văn hóa phi vật thể của nhân loại', N'Chèo là một điểm sáng trong văn hóa phi vật thể của Việt Nam','http://dantri.com.vn/van-hoa/doi-song-van-hoc/','vzbdsubvsubhf','2022-07-20','approved'),
	  ('N011', 'CA005D', 'R006', N'Giải Golf Việt Nam mở rộng 2022: Nhiều điểm nhấn đặc biệt', N'Có nhiều tay Golf nổi tiếng thế giới đã tham gia','http://dantri.com.vn/the-thao/golf/','vbufbchsdbzyhbc','2022-06-28','approved'),
	  ('N012', 'CA005E', 'R007', N'Võ sĩ Carnelo bảo vệ thành công 5 đai vô địch', N'Một giải đấu thành công của võ sĩ Carnelo','http://dantri.com.vn/the-thao/vo-thuat','jbcabvuzebhfcbszhb','2022-07-25','approving');
	  
SELECT * FROM tbl_News

-------------------------------------------------------------------------------------
             /* Bổ sung các ràng buộc tạo liên kết giữa các bảng */
-------------------------------------------------------------------------------------

-- 1. Tạo ràng buộc khóa ngoại cho bảng tbl_Approve liên kết với bảng tbl_News và bảng tbl_Editor --
ALTER TABLE dbo.tbl_Approve
ADD CONSTRAINT FK_NewsID FOREIGN KEY(NewsID) REFERENCES tbl_News(ID);

ALTER TABLE dbo.tbl_Approve
ADD CONSTRAINT FK_EditorID FOREIGN KEY(EditorID) REFERENCES tbl_Editor(ID);

-- 2. Tạo ràng buộc khóa ngoại cho bảng tbl_Comment liên kết với bảng tbl_News và bảng tbl_User--
ALTER TABLE dbo.tbl_Comment
ADD CONSTRAINT FK_NewID FOREIGN KEY(NewsID) REFERENCES tbl_News(ID);

ALTER TABLE dbo.tbl_Comment
ADD CONSTRAINT FK_UserID FOREIGN KEY(UserID) REFERENCES tbl_User(ID);

-- 3. Tạo ràng buộc khóa ngoại cho bảng tbl_News liên kết với bảng tbl_Categorie và bảng tbl_Reporter --
ALTER TABLE dbo.tbl_News
ADD CONSTRAINT FK_CategorieID FOREIGN KEY(CategorieID) REFERENCES tbl_Categorie(ID);

ALTER TABLE dbo.tbl_News
ADD CONSTRAINT FK_ReporterID FOREIGN KEY(ReporterID) REFERENCES tbl_Reporter(ID);

-- 4. Tạo ràng buộc CHECK CreateDate trong bảng tbl_News sau ngày 01-01-2022 --
ALTER TABLE dbo.tbl_News
ADD CONSTRAINT CK_CreateDate CHECK (CreateDate >= '2022-01-01');

-- 5. Tạo ràng buộc mặc định NULL cho ApproveDate trong bảng tbl_Approve --
ALTER TABLE dbo.tbl_Approve
ADD CONSTRAINT DF_Date DEFAULT NULL FOR ApproveDate;

-- 6. Tạo ràng buộc mặc định NULL cho AdminPhone, EditorPhone, ReporterPhone, UserPhone 
--    trong các bảng tbl_Admin, tbl_Editor, tbl_Reporter, tbl_User --

/* Bảng tbl_Admin */
ALTER TABLE dbo.tbl_Admin
ADD CONSTRAINT DF_AdPhone DEFAULT NULL FOR AdminPhone;  

/* Bảng tbl_Editor */
ALTER TABLE dbo.tbl_Editor
ADD CONSTRAINT DF_EdPhone DEFAULT NULL FOR EditorPhone; 

/* Bảng tbl_Reporter */
ALTER TABLE dbo.tbl_Reporter
ADD CONSTRAINT DF_RepPhone DEFAULT NULL FOR ReporterPhone; 

/* Bảng tbl_User */
ALTER TABLE dbo.tbl_User
ADD CONSTRAINT DF_UsPhone DEFAULT NULL FOR UserPhone;

----------------------------------------------------------------------------------------
                  /* Tương tác với CSDL (INSERT, UPDATE, DELETE) */
----------------------------------------------------------------------------------------
-- 1. Chèn thêm dữ liệu vào các bảng bằng INSERT --
ALTER TABLE dbo.tbl_Approve DROP CONSTRAINT FK_NewsID -- Do giữa 2 bảng tbl_Approve và tbl_News có ràng buộc khóa ngoại
INSERT INTO dbo.tbl_Approve(ID, NewsID, EditorID)  -- Chèn thêm dữ liệu vào bảng tbl_Approve
VALUES('AP015', 'N016', 'ED003'),
      ('AP013', 'N014', 'ED005'),
	  ('AP014', 'N015', 'ED002');

INSERT INTO dbo.tbl_Admin(ID, AdminName, AdminEmail, AdminPassword, Activities)  -- Chèn thêm dữ liệu cho bảng tbl_Admin
VALUES ('AD011', N'Nguyễn Thu Thảo', 'thaonguyen1234@gmail.com', 'nguyenthuthao', N'quản lí Comment, quản lí User'),
       ('AD002', N'Lê Thành Trung', 'trungthanhle@gmail.com', 'trungle222', N'duyệt bài, quản lí chủ đề'),
	   ('AD007', N'Lê Thu Loan', 'loanle91@gmai.com', 'thuloanle0101', N'duyệt đăng bài');

INSERT INTO dbo.tbl_Editor(ID,EditorName, EditorEmail, EditorPassword, Active)  -- Chèn thêm dữ liệu cho bảng tbl_Editor
VALUES ('ED014', N'Đặng Hải Đăng', 'haidang89@gmail.com', '123danghaidang',0)

INSERT INTO dbo.tbl_Reporter(ID,ReporterName, ReporterEmail, ReporterPassword, Active)  -- Chèn thêm dữ liệu cho bảng tbl_Reporter
VALUES ('RE013', N'Nguyễn Tiến Lâm', 'lamnguyen1234@gmail.com', 'nguyentienlam234',1)

INSERT INTO dbo.tbl_User(ID,UserName, UserEmail, UserPassword, Active)  -- Chèn thêm dữ liệu cho bảng tbl_Reporter
VALUES ('US012', N'Trần Quang Thái', 'tranquangthai@gmail.com', 'thaitran0123',1)

-- 2. Xóa tên chuyên mục Kiều bào trong bảng tbl_Categorie --
DELETE FROM tbl_Categorie
WHERE SubCategorie = N'Kiều bào';

SELECT * FROM tbl_Categorie -- Sau khi xóa, chủ đề Thế giới chỉ còn 3 chuyên mục --

-- 3. Update thêm nhiệm vụ quản lí Reporter của Admin tên Đào Tuấn Anh --
UPDATE dbo.tbl_Admin
SET Activities = N'quản lí Reporter, quản lí User'
WHERE AdminName = N'Đào Tuấn Anh';

SELECT * FROM tbl_Admin  -- nhiệm vụ của Admin Đào Tuấn Anh đã được update

------------------------------------------------------------------------------------------------------------
                                          /* Tạo Trigger */
------------------------------------------------------------------------------------------------------------
-- 1. Tạo Trigger TRG_UpdateNewsStatus cập nhật trạng thái tin tức sau khi được phê duyệt --
CREATE TRIGGER TRG_UpdateNewsStatus
ON dbo.tbl_Approve
FOR INSERT, UPDATE
AS 
  -- Đặt tham số mã ID của thông tin và ApproveDate là ngày thông tin được phê duyệt
   DECLARE @NewsID NVARCHAR(10), @ApproveDate DATE 
  -- Lấy thông tin tin tức mới được phê duyệt ở bảng tbl_Approve
   SELECT @NewsID = NewsID, @ApproveDate = ApproveDate FROM inserted
  -- Cập nhật trạng thái tin tức trong bảng tbl_News
   UPDATE dbo.tbl_News
   SET NewsStatus = 'approved' WHERE CreateDate <= @ApproveDate
GO

-- Thực hiện Trigger --
UPDATE dbo.tbl_Approve
SET ApproveDate = '2022-07-20' WHERE NewsID = 'N005'
SELECT * FROM dbo.tbl_News WHERE ID = 'N005'

-- 2. Tạo Trigger TRG_DeleteComment để xóa tất cả bình luận của một tin tức đã được xóa khỏi trang chủ --
CREATE TRIGGER TRG_DeleteComment
ON dbo.tbl_News
FOR DELETE
AS
  -- Đặt tham số mã ID của thông tin sẽ bị gỡ khỏi trang chủ
  DECLARE @NewsID NVARCHAR(10)
  -- Lấy thông tin bị xóa có mã @NewsID trong bảng tbl_News
  SET @NewsID = (SELECT ID FROM deleted)
  -- Xóa những Comment của tin tức có mã @NewsID đã bị xóa
  DELETE FROM dbo.tbl_Comment WHERE NewsID = @NewsID
GO

-- Thực thi Trigger
ALTER TABLE dbo.tbl_Comment DROP CONSTRAINT FK_NewID  -- Do giữa 2 bảng tbl_Comment và tbl_News có ràng buộc khóa ngoại
DELETE FROM tbl_News WHERE ID = 'N003'
SELECT * FROM dbo.tbl_Comment

------------------------------------------------------------------------------------------------------------
                                     /* Tạo Stored Procedure*/
------------------------------------------------------------------------------------------------------------
-- 1. Tạo SP_NewsDescrpt có đầu vào là ID để chỉ ra phần chủ đề và mô tả của tin tức --
CREATE PROCEDURE SP_NewsDescrpt 
  @ID NVARCHAR(10),
  @NewsDescrpt NVARCHAR(255) OUT -- tham số kiểu output
AS 
BEGIN 
   SET @NewsDescrpt = (SELECT Descrpt FROM dbo.tbl_News
                       WHERE ID = @ID)
END
GO
-- thực thi SP --
DECLARE @ID NVARCHAR(10), @NewsDescrpt NVARCHAR(255)
EXECUTE SP_NewsDescrpt 'N001', @NewsDescrpt OUT
PRINT N'Mô tả của bản tin: '+ @NewsDescrpt

-- 2. Tạo SP_Comment có đầu vào là ID của bản tin để tìm ra những bình luận về bản tin đó --
--    (bao gồm tài khoản bình luận,nội dung,ngày bình luận) --
CREATE PROCEDURE SP_Comment
  @ID NVARCHAR(10)
AS
BEGIN 
  SELECT u.ID, u.UserName, u.UserEmail, c.Content, c.CommentDate FROM dbo.tbl_Comment c
  INNER JOIN dbo.tbl_User u
  ON u.ID = c.UserID
  WHERE NewsID = @ID
  ORDER BY CommentDate
END
GO
-- Thực thi Store Procedure
EXECUTE SP_Comment @ID = 'N001'

-----------------------------------------------------------------------------------------------------------
                                        /* Tạo hàm */
-----------------------------------------------------------------------------------------------------------
-- 1. Tạo hàm FNC_SLComment để xem tin tức nào có nhiều lượng bình luận nhất, kết quả trả về là mã của tin tức đó --
CREATE FUNCTION FNC_SLComment()
RETURNS TABLE
AS 
  RETURN (SELECT NewsID, SL AS Max_Comment FROM (SELECT NewsID, COUNT(ID) AS SL FROM dbo.tbl_Comment 
                                                 GROUP BY NewsID) a
          WHERE SL = (SELECT MAX(SL) FROM (SELECT NewsID, COUNT(ID) AS SL FROM dbo.tbl_Comment 
                                           GROUP BY NewsID) a))
GO
-- Thực thi hàm --
SELECT * FROM dbo.FNC_SLComment();

-- 2. Tạo hàm FNC_Categorie để xem chuyên mục cụ thể của bài báo, với tham số truyền vào là mã ID của bài báo đó --
CREATE FUNCTION FNC_Categorie(
  @ID NVARCHAR(10))
RETURNS NVARCHAR(45)   
AS BEGIN
   RETURN 
      (SELECT c.Subcategorie FROM dbo.tbl_Categorie c
       INNER JOIN dbo.tbl_News n
       ON c.ID = n.CategorieID
       WHERE n.ID = @ID)
END
GO
-- Thực thi hàm --
SELECT dbo.FNC_Categorie('N009') AS N'Chủ đề';

-- 3. Tạo hàm FNC_Approve để xem trạng thái tin tức đã được duyệt hay chưa(gồm ID, Title, Status) --
CREATE FUNCTION FNC_Approve(
  @ID NVARCHAR(10))
RETURNS TABLE
AS 
  RETURN 
     (SELECT Title, NewsStatus FROM dbo.tbl_News
	  WHERE ID = @ID)
GO
-- Thực thi hàm --
SELECT * FROM dbo.FNC_Approve('N010') 

------------------------------------------------------------------------------------------------
                                   /* Tạo chỉ mục Index */
------------------------------------------------------------------------------------------------
-- 1. Tạo Index Idx_News_Create cho 2 cột Title và CreateDate cho bảng tbl_News để truy vấn thông tin của tin tức 
--    trong 1 khoảng thời gian hoặc 1 ngày cụ thể --
CREATE UNIQUE INDEX Idx_News_Create
ON dbo.tbl_News(Title, CreateDate);

-- Truy vấn thông tin của những tin tức được tạo ra trong tháng 6/2022
SELECT * FROM dbo.tbl_News WHERE CreateDate BETWEEN '2022-06-01' AND '2022-06-30';

-- 2. Tạo Index Admin_Contact để liên lạc với Admin --
CREATE INDEX Idx_Admin_Contact
ON dbo.tbl_Admin(Activities);

-- Tìm thông tin liên lạc những Admin có nhiệm vụ quản lí User --
SELECT AdminName,AdminEmail,AdminPhone FROM dbo.tbl_Admin
WHERE Activities LIKE N'%quản lí User%'

-- 3. Tạo Index Editor_Contact để liên lạc với Editor --
CREATE INDEX Idx_Editor_Contact
ON dbo.tbl_Editor(EditorName);

-- Tìm số điện thoại liên lạc của Editor có tên là Phạm Thanh Duy --
SELECT EditorPhone FROM dbo.tbl_Editor
WHERE EditorName = N'Phạm Thanh Duy';

-------------------------------------------------------------------------------------------------------------
                                          /* Tạo Transaction */
-------------------------------------------------------------------------------------------------------------
-- 1. Tạo Transaction để thêm tin tức mới vào bảng tbl_News, sau đó thêm thông tin của tin tức đó vào bảng tbl_Approve --
DECLARE @TransName1 VARCHAR(30)
SELECT @TransName1 = 'NewsInsert'
 -- Chèn tin tức mới vào bảng tbl_News --
BEGIN TRANSACTION @TransName1
  INSERT INTO dbo.tbl_News(ID, CategorieID, ReporterID, Title, Descrpt, ImageURL, Content, CreateDate, NewsStatus)
  VALUES('N018', 'CA004B', 'R003', N'Giá chung cư tiếp tục tăng trong quý III', N'Giá bán chung cư ở Hà Nội đã tăng cả tỉ đồng một căn hộ', 
         'https://dantri.com.vn/bat-dong-san/gia-ban-chung-cu-ha-noi-da-tang-ca-ty-dong-mot-can-ho-20221011223519075.htm', N'hdcsdzzudbgcuz',
		 '2022-08-02','approving')
  COMMIT TRANSACTION @TransName1

  DECLARE @TransName2 VARCHAR(30)
  SELECT @TransName2 = 'ApproveInsert'
  -- Chèn thông tin duyệt bài của tin tức mới --
  BEGIN TRANSACTION @TransName2
    INSERT INTO dbo.tbl_Approve(ID, NewsID, EditorID,ApproveDate)
	VALUES('AP016', 'N018','ED003',NULL)
	COMMIT TRANSACTION @TransName2

-- 2. Tạo Transaction để xóa 1 User, sau đó xóa hết các bình luận của User đó --

-- Xóa ràng buộc khóa ngoại giữa 2 bảng tbl_Comment và tbl_User
ALTER TABLE dbo.tbl_Comment
DROP CONSTRAINT FK_UserID

-- Xóa thông tin User của bảng tbl_User --
DECLARE @TransName3 VARCHAR(30)
SELECT @TransName3 = 'UserDelete'
  
  BEGIN TRANSACTION @TransName3
  -- Kiểm tra xem User có tồn tại trong bảng tbl_User hay không, nếu có thực hiện xóa theo ID, nếu không quay trở lại--
    IF NOT EXISTS (SELECT ID FROM dbo.tbl_User WHERE ID = 'US001')
      ROLLBACK TRANSACTION @TransName3
    ELSE
      DELETE FROM dbo.tbl_User WHERE ID = 'US001'
  
      -- Kiểm tra xem User đó đã từng tạo bình luận hay chưa. Nếu chưa thì hiển thị 'User chưa thực hiện bình luận',
      -- nếu có thì xóa bình luận --
      DECLARE @TransName4 VARCHAR(30)
      SELECT @TransName4 = 'CommentDelete'
    
	    BEGIN TRANSACTION @TransName4
	      IF NOT EXISTS (SELECT ID FROM dbo.tbl_Comment WHERE UserID = 'US001')
	        PRINT N'User chưa thực hiện bình luận'
	      ELSE 
	        DELETE FROM dbo.tbl_Comment WHERE UserID = 'US001'
	    COMMIT TRANSACTION @TransName4
  COMMIT TRANSACTION @TransName3
----------------------------------------------------------------------------------------
      /* Thực hiện các truy vấn lấy dữ liệu từ nhiều bảng trên CSDL đã tạo */
----------------------------------------------------------------------------------------

-- 1. Truy vấn những bài báo (gồm ID, Categorie, Title, CreateDate) được phê duyệt trong tháng 7 --
SELECT news.ID, cat.Categorie, news.Title, news.CreateDate FROM dbo.tbl_News news
INNER JOIN dbo.tbl_Categorie cat
ON news.CategorieID = cat.ID
WHERE (news.CreateDate BETWEEN '2022-07-01' AND '2022-07-31') AND news.NewsStatus = 'approved';

-- 2. Truy vấn số lượng chủ đề con có trong từng chủ đề lớn --
SELECT Categorie, COUNT(SubCategorie) AS SL FROM dbo.tbl_Categorie
GROUP BY Categorie;

-- 3. Truy vấn số lượng Admin có nhiệm vụ trực page --
SELECT SUM(SLAdmin) AS Tong_SLAdmin FROM (SELECT Activities, COUNT(ID) AS SLAdmin FROM dbo.tbl_Admin
                                          GROUP BY Activities
                                          HAVING Activities LIKE N'%trực page%') tbl_trucpage;

-- 4. Sắp xếp ngày các bài báo được phê duyệt trong tháng 6 và tháng 7 theo thứ tự tăng dần --
SELECT n.ID, c.SubCategorie, n.Title, n.Descrpt, n.ImageURL, n.Content, n.CreateDate, n.NewsStatus FROM dbo.tbl_News n
INNER JOIN dbo.tbl_Categorie c
ON n.CategorieID = c.ID
WHERE NewsStatus = 'approved' AND (CreateDate BETWEEN '2022-06-01' AND '2022-07-31')
ORDER BY CreateDate ASC;

-- 5. Tìm những Editor có thể liên lạc bằng số điện thoại và đang hoạt động --
SELECT ID, EditorName, EditorPhone, Active FROM dbo.tbl_Editor
WHERE EditorPhone IS NOT NULL AND Active = 1;

-- 6. Tìm những chủ đề có nhiều hơn 2 bài báo đã được duyệt đăng --
SELECT c.Categorie, COUNT(n.ID) AS SL FROM dbo.tbl_News n
INNER JOIN (SELECT ID, Categorie FROM dbo.tbl_Categorie) c
ON c.ID = n.CategorieID
GROUP BY Categorie
HAVING COUNT(n.ID) >= 2;

-- 7. Tìm những tin tức được viết bởi cùng một tác giả có ID là R004--
SELECT n1.ID, n1.ReporterID, r.ReporterName, n1.Title, n1.CreateDate FROM dbo.tbl_News n1
INNER JOIN dbo.tbl_Reporter r
ON n1.ReporterID = r.ID
WHERE r.ID = 'R004';

-- 8. Truy vấn những Comment (gồm UserID, CommentDate, Content) của tin tức có tiêu đề 'Áp dụng thay đổi khung giá đất 9/2022' --
SELECT c.UserID, c.CommentDate, c.Content FROM dbo.tbl_Comment c
INNER JOIN dbo.tbl_News n
ON n.ID = c.NewsID
WHERE n.Title = N'Áp dụng thay đổi khung giá đất 9/2022';

-- 9. Truy vấn số lượng bài báo đã viết trong tháng 7 của từng nhà báo --
SELECT a.ReporterID, r.ReporterName, a.SL FROM (SELECT ReporterID, COUNT(ID) AS SL FROM dbo.tbl_News
                                                WHERE CreateDate BETWEEN '2022-01-01' AND '2022-09-30'
                                                GROUP BY ReporterID) a
INNER JOIN dbo.tbl_Reporter r
ON a.ReporterID = r.ID

-- 10. Truy vấn User để lại bình luận nhiều nhất --
WITH Comment(MaxComment) AS (SELECT MAX(a.SL) FROM (SELECT UserID, COUNT(UserID) AS SL 
								                    FROM dbo.tbl_Comment
                                                    GROUP BY UserID) AS a)
SELECT a.UserID, a.SL FROM (SELECT UserID, COUNT(UserID) AS SL 
                            FROM dbo.tbl_Comment
                            GROUP BY UserID) AS a, Comment
                            WHERE a.SL = Comment.MaxComment

-- 11. Truy vấn so sánh độ active của các Editor  --
SELECT a.ID,a.EditorName, b.EditorName, a.Active FROM dbo.tbl_Editor a, dbo.tbl_Editor b
WHERE a.Active > b.Active

-- 12. Truy vấn các nhà báo trong danh sách đã có tin tức được đăng hay chưa, đó là tin tức gì --
SELECT n.ReporterID, r.ReporterName, n.ID, n.Title, n.CreateDate FROM dbo.tbl_Reporter r
FULL OUTER JOIN dbo.tbl_News n
ON n.ReporterID = r.ID



  

