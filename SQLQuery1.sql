-- Tạo database DATN_Fusion_Nhom7
CREATE DATABASE DATN_Fusion_Nhom7
GO

-- Use vào database DATN_Fusion_Nhom7 
USE DATN_Fusion_Nhom7
GO

-- Tạo bảng loại hàng
CREATE TABLE LoaiHang(
    MaLH        CHAR(5)        PRIMARY KEY,
    TenLH       NVARCHAR(50)   NULL
)
GO

-- Create the Accounts table
CREATE TABLE TaiKhoan(
    MaTK       BIGINT IDENTITY PRIMARY KEY,
    Username   NVARCHAR(50)   NULL,
    Password   NVARCHAR(50)   NULL,
    VaiTro     BIT            NULL,
)
GO

-- Tạo bảng khách hàng
CREATE TABLE KhachHang(
    MaKH        BIGINT IDENTITY PRIMARY KEY,
    TenKH       NVARCHAR(50)    NULL,
    NgaySinh    DATETIME        NULL,
    Email       NVARCHAR(50)    NULL,
    SDT         NVARCHAR(50)    NULL,
    GioiTinh    BIT             NULL,
	MaTK        BIGINT          NULL,
    Constraint FK_TaiKhoan1 FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK)
)
GO

-- Tạo bảng khách hàng
CREATE TABLE NhanVien(
    MaNV        BIGINT IDENTITY PRIMARY KEY,
    TenNV       NVARCHAR(50)    NULL,
    NgaySinh    DATETIME        NULL,
    Email       NVARCHAR(50)    NULL,
    SDT         NVARCHAR(50)    NULL,
    GioiTinh    BIT             NULL,
	ChucVu      BIT             NULL,
	MaTK        BIGINT          NULL,
    Constraint FK_TaiKhoan2 FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK)
)
GO
-- Tạo bảng nhà cung cấp
CREATE TABLE NhaCungCap(
    MaNCC        CHAR(5)        PRIMARY KEY,
    TenNCC       NVARCHAR(50)   NULL,
	Email        NVARCHAR(50)   NULL,
	SDT          NVARCHAR(50)   NULL,
	DiaChi       NVARCHAR(255)  NULL,
)
GO


-- Tạo bảng Sản phẩm
CREATE TABLE SanPham(
    MaSP        INT             PRIMARY KEY,
    TenSP       NVARCHAR(500)    NULL,
	Orginal      NVARCHAR(50)    NULL,
	Unit   NVARCHAR(50)    NULL,
	Price      FLOAT           NULL,
	Sales     INT             NULL,
	Number     INT             NULL,
	Describe        NVARCHAR(500)    NULL,
	MaLH        CHAR(5)         NULL,
    Constraint FK_LoaiHang FOREIGN KEY (MaLH) REFERENCES LoaiHang(MaLH)
)
GO

-- Tạo bảng Ảnh Sản Phẩm
CREATE TABLE AnhSanPham(
    MaAnh        CHAR(5)        PRIMARY KEY,
    Anh          NVARCHAR(50)   NULL,
	MaSP         INT            NULL,
	Constraint FK_SanPham1  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
GO

-- Tạo bảng Khuyến Mãi
CREATE TABLE KhuyenMai(
    MaKM         CHAR(5)        PRIMARY KEY,
    Giam         NVARCHAR(50)   NULL,
	MaSP         INT            NULL,
	Constraint FK_SanPham2  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
GO


-- Tạo bảng giỏ hàng
CREATE TABLE GioHang(
    MaGH          BIGINT IDENTITY PRIMARY KEY,
    MaKH          BIGINT             NULL,
   Constraint FK_KhachHang1  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
)
GO


-- Tạo Bảng chi tiết giỏ hàng
CREATE TABLE GioHangChiTiet(
    Id          BIGINT IDENTITY PRIMARY KEY,
    MaGH        BIGINT          NULL,
	MaSP        INT             NULL,
	SoLuong     INT             NULL,
    Constraint FK_GioHang1 FOREIGN KEY (MaGH) REFERENCES GioHang(MaGH),
    Constraint FK_SanPham3 FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
GO

-- Tạo bản hóa đơn
CREATE TABLE HoaDon(
    MaHD          BIGINT IDENTITY PRIMARY KEY,
	PTTT          NVARCHAR(50)    NULL,
	TrangThaiTT   NVARCHAR(50)    NULL,
	TrangThaiNH   NVARCHAR(50)    NULL,
	TongTien      FLOAT           NULL,
	MaGH          BIGINT          NULL,
    MaKH          BIGINT          NULL,
	MaNV          BIGINT          NULL,
   Constraint FK_GioHang2  FOREIGN KEY (MaGH) REFERENCES GioHang(MaGH),
   Constraint FK_KhachHang2  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
   Constraint FK_NhanVien1  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO


-- Tạo bản hóa đơn chi tiết
CREATE TABLE HoaDonChiTiet(
    Id          BIGINT IDENTITY PRIMARY KEY,
    MaHD        BIGINT          NULL,
    MaSP        INT             NULL,
    SoLuong     INT             NULL,
    Constraint FK_HoaDon1 FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    Constraint FK_SanPham4 FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
GO

-- Tạo bảng Phiếu nhập kho
CREATE TABLE PhieuNhapKho(
    MaPNK          BIGINT IDENTITY PRIMARY KEY,
	NgayLapPNK     DATE               NULL,
	TongTien       FLOAT              NULL,
	TrangThaiTT    BIT                NULL,
	MaNCC          CHAR(5)            NULL,
    MaNV           BIGINT             NULL,
   Constraint FK_NhanVien2  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
   Constraint FK_NhaCungCap  FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
)
GO


-- Tạo bảng chi tiết phiếu nhập kho
CREATE TABLE ChiTietPhieuNhapKho(
    Id          BIGINT IDENTITY PRIMARY KEY,
    MaPNK       BIGINT          NULL,
	MaSP        INT             NULL,
	SoLuong     INT             NULL,
	DonGia      FLOAT           NULL,
    Constraint FK_PhieuNhapKho1 FOREIGN KEY (MaPNK) REFERENCES PhieuNhapKho(MaPNK),
    Constraint FK_SanPham5 FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
GO
-- Thêm sản phẩm vào bảng LoaiHang
INSERT INTO LoaiHang(MaLH, TenLH) VALUES
('LH01', N'Bông tai bạc nữ'),
('LH02', N'Dây chuyền bạc nữ'),
('LH03', N'Nhẫn bạc nữ'),
('LH04', N'Lắc tay bạc nữ ');


-- Thêm sản phẩm vào bảng SanPham
INSERT INTO SanPham (MaSP, TenSP, Orginal, Unit, Price, Sales, Number, Describe, MaLH)
VALUES 
(1, N'Bông tai bạc nữ bông thời trang cho nữ sang trọng S925 Italy B2414', N'Ý', N'Chiếc', 260000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(2, N'Bông tai bạc nữ 925 cao cấp đính đá màu xanh dương thiết kế thời trang đẹp dành riêng cho nữ – B2411', N'Ý', N'Chiếc', 320000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(3, N'Bông tai bạc nữ 925 khảm đá zirconia trắng tròn trịa lung linh – B2871', N'Ý', N'Chiếc', 225000, 0, 50, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(4, N'Bông tai bạc nữ 925 xi bạch kim đính đá kim cương ngọc lục bảo tổng hợp nhân tạo sang trọng – B2782', N'Ý', N'Chiếc', 400000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(5, N'Bông Tai Bạc Nữ Bạc S925 Đính Đá Cực Xinh Cho Nữ B2399', N'Ý', N'Chiếc', 325000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(6, N'Bông Tai Bạc Nữ Đính Đá Cho Nữ Sang Trọng Cho Nữ B1462', N'Ý', N'Chiếc', 170000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(7, N'Bông Tai Bạc Nữ Hình Giọt Nước Đính Nhiều Đá Trắng-Xanh B2416', N'Ý', N'Chiếc', 270000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(8, N'Bông Tai Bạc Nữ Hình Tròn Đính Đá Cao Cấp B2373', N'Ý', N'Chiếc', 350000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(9, N'Bông Tai Bạc Nữ S925 B1457 Đính Đá Màu Xanh Lục', N'Ý', N'Chiếc', 400000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(10, N'Bông tai bạc nữ s925 đính đá zirconia trắng nhỏ nhắn sang trọng – B2849', N'Ý', N'Chiếc', 120000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(11, N'Bông Tai Bạc Nữ S925 Nữ Đính Cầu Vòng B1454', N'Ý', N'Chiếc', 200000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(12, N'Bông Tai Bạc Ý Đính Đá Màu Nâu Vàng Sang Trọng B-2407-Bảo Ngọc', N'Ý', N'Chiếc', 220000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(13, N'Bông Tai Nữ Bạc S925 Mặt Đá Vuông Qúy Phái Sang Trọng B2390', N'Ý', N'Chiếc', 300000, 0, 200, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(14, N'Bông tai Nữ Bạc S925 tròn xinh đính đá xanh pha lê cao cấp B2707', N'Ý', N'Chiếc', 200000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(15, N'Bông tai nữ giọt nước đá quý Bông tai khí chất thời trang Trang sức thanh lịch', N'Ý', N'Chiếc', 340000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(16, N'Hoa Tai Bạc Nữ S925 Xi Bạch Kim, Đá Kim Cương Xanh Tổng Hợp Nhân Tạo Sang Trọng B2803', N'Ý', N'Chiếc', 340000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(17, N'Hoa Tai Nữ Bạc S925 Xi Bạch Kim, Đá Kim Cương Xanh Tổng Hợp Nhân Tạo Sang Trọng B2807', N'Ý', N'Chiếc', 350000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(18, N'Khuyên Tai Bạc Nữ Hình Bông Hoa Bốn Cánh Đính Đá Xanh Đen Sang Trọng B2393', N'Ý', N'Chiếc', 280000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(19, N'Khuyên Tai Bạc Nữ S925 Đá Xanh B1448', N'Ý', N'Chiếc', 200000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(20, N'Khuyên Tai Bạc Nữ S925 Xi Bạch Kim Cao Cấp Dáng Tròn Đá Xanh B2374', N'Ý', N'Chiếc', 290000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(21, N'Khuyên Tai Nữ Bạc S925 Khảm Đá Zirconia Trắng Lấp Lánh, Khuyên Tai Nữ Bạc Sang Trọng B2862', N'Ý', N'Chiếc', 390000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(22, N'Khuyên tai nữ bạc s925 xi bạch kim đính đá kim cương hồng ngọc tổng hợp nhân tạo sang trọng – B2779', N'Ý', N'Chiếc', 370000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(23, N'Khuyên Tai Nữ Bạc S925 Xi Bạch Kim, Đá Kim Cương Ngọc Lục Bảo Tổng Hợp Nhân Tạo Sang Trọng B2785', N'Ý', N'Chiếc', 300000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(24, N'Khuyên Tai Nữ Bạc S925 Xi Bạch Kim, Đá Kim Cương Vàng Tổng Hợp Nhân Tạo Sang Trọng B2788', N'Ý', N'Chiếc', 300000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH01'),
(25, N'Dây chuyền bạc nữ 925 trái tim hồng mộng mơ đính đá zirconia nhỏ nhắn – DB2868', N'Ý', N'Chiếc', 360000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(26, N'Dây chuyền bạc nữ Cá Voi nhỏ S925 cá tính đính đá xanh pha lê cao cấp DB2708', N'Ý', N'Chiếc', 340000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(27, N'Dây Chuyền Bạc Nữ Cao Cấp Đính Đá Màu Xanh Dương Dành Cho Nữ DB2410', N'Ý', N'Chiếc', 250000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(28, N'Dây Chuyền Bạc Nữ Cao Cấp Thiết Kế Hình Bông Hoa Đính Đá Màu Xanh Dương Dành Riêng Cho Nữ DB2413', N'Ý', N'Chiếc', 320000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(29, N'Dây Chuyền Bạc Nữ Hoàng Tộc Cao Cấp M1450', N'Ý', N'Chiếc', 250000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(30, N'Dây Chuyền Bạc Nữ S925 Cỏ 4 Lá Xoay 360 Độ – DB2858', N'Ý', N'Chiếc', 350000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(31, N'Dây Chuyền Bạc Nữ S925 Đá Zirconia Giọt Nước Pha Lê – DB2859', N'Ý', N'Chiếc', 420000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(32, N'Dây Chuyền Bạc Nữ S925 Đính Đá Zirconia Cánh Hoa Kiêu Hãnh – DB2860', N'Ý', N'Chiếc', 350000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(33, N'Dây Chuyền Bạc Nữ S925 Hình Bông Hoa Sang Trọng DB-2396', N'Ý', N'Chiếc', 290000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(34, N'Dây Chuyền Bạc Nữ S925 Hình Giọt Nước Đính Đá Nhiều Màu Cao Cấp DB2389', N'Ý', N'Chiếc', 300000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(35, N'Dây Chuyền Bạc Nữ S925 Hình Tam Giác Đính Đá Cầu Vồng M1453', N'Ý', N'Chiếc', 320000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(36, N'Dây Chuyền Bạc Nữ S925 Mặt Vuông Đính Đá Nâu Cao Cấp DB2391', N'Ý', N'Chiếc', 280000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(37, N'Dây chuyền Bạc Nữ S925 Xi Bạch Kim Cao Cấp, Đá Kim Cương Ngọc Lục Bảo Tổng Hợp Nhân Tạo DB2784', N'Ý', N'Chiếc', 330000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(38, N'Dây chuyền Bạc nữ S925 xi Bạch Kim cao cấp, Đá Kim Cương Xanh Tổng Hợp Sang Trọng DB2804', N'Ý', N'Chiếc', 330000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(39, N'Dây Chuyền Bạc Nữ Thiết Kế Hình Giọt Nước Đính Đá Trắng-Xanh Sang Trọng DB2417', N'Ý', N'Chiếc', 250000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(40, N'Dây chuyền bạc nữ xi vàng 14K 925 bánh xe michelin đính đá zirconia sắc màu – DB2869', N'Ý', N'Chiếc', 310000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(41, N'Dây chuyền Bạc S925 Xi Bạch Kim Cao Cấp, Đá Kim Cương Hồng Ngọc Tổng Hợp Nhân Tạo DB2792', N'Ý', N'Chiếc', 350000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(42, N'Dây chuyền Bạc S925 Xi Bạch Kim Cao Cấp, Đá Kim Cương Ngọc Lục Bảo Tổng Hợp Nhân Tạo DB2781', N'Ý', N'Chiếc', 350000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH02'),
(43, N'Nhẫn bạc nữ 92 đính đá CZ tím xanh thiết kế thời trang sang trọng – N2876', N'Ý', N'Chiếc', 280000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(44, N'Nhẫn bạc nữ 925 dáng bông hoa nở rộ đính đá CZ thiết kế sang trọng – N2878', N'Ý', N'Chiếc', 280000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(45, N'Nhẫn bạc nữ 925 dáng bông hoa rực rỡ lung linh đính đá CZ thiết kế sang trọng – N2879', N'Ý', N'Chiếc', 270000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(46, N'Nhẫn bạc nữ 925 đính đá CZ hạt độc nhất thiết kế đẹp sang trọng đơn giản – N2874', N'Ý', N'Chiếc', 220000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(47, N'Nhẫn bạc nữ 925 đính đá CZ lục giác thiết kế đơn giản sang trọng – N2873', N'Ý', N'Chiếc', 230000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(48, N'Nhẫn bạc nữ 925 đính đá CZ thiết kế đá to thời trang sang trọng – N2872', N'Ý', N'Chiếc', 310000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(49, N'Nhẫn bạc nữ 925 khảm đá CZ thiết kế hình chữ nhật đơn giản – N2867', N'Ý', N'Chiếc', 250000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(50, N'Nhẫn bạc nữ 925 khảm đá cz trắng đại thiết kế tròn cỡ lớn – N2866', N'Ý', N'Chiếc', 300000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(51, N'Nhẫn bạc nữ 925 khảm đá CZ vàng thiết kế đơn giản, nhỏ nhắn – N2865', N'Ý', N'Chiếc', 210000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(52, N'Nhẫn bạc nữ 925 khảm đá CZ vòng quanh thiết kế sang trọng thời trang đơn giản – N2875', N'Ý', N'Chiếc', 210000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH03'),
(53, N'Lắc tay gắn đá Swarovski Latro', N'Italia', N'Chiếc', 718000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(54, N'Lắc tay bạc Lip And Lock', N'Italia', N'Chiếc', 649000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(55, N'Lắc tay bạc Pretty Sunflower', N'Italia', N'Chiếc', 699000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(56, N'Lắc tay bạc Hexagon Flower', N'Italia', N'Chiếc', 649000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(57, N'Lắc tay bạc ngọc trai Love My Self', N'Italia', N'Chiếc', 1854000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(58, N'Lắc tay bạc Glance Like', N'Italia', N'Chiếc', 779000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(59, N'Lắc tay bạc Thela Love', N'Italia', N'Chiếc', 779000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04'),
(60, N'Lắc tay bạc Jellai Love', N'Italia', N'Chiếc', 649000, 0, 100, N'Fusion cam kết cả về Xuất Xứ cũng như KIỂU DÁNG 100% GIỐNG ẢNH.', 'LH04');

INSERT INTO AnhSanPham(MaAnh, Anh, MaSP) VALUES
('MA01', N'1.jpg', 1),
('MA02', N'2.jpg', 1),
('MA03', N'3.jpg', 1),
('MA04', N'4.jpg',1),
('MA05', N'5.jpg',2),
('MA06', N'6.jpg',2),
('MA07', N'7.jpg',2),
('MA08', N'8.jpg',2),
('MA09', N'9.jpg',3),
('MA10', N'10.jpg',3),
('MA11', N'11.jpg',3),
('MA12', N'12.jpg',3),
('MA13', N'13.jpg',4),
('MA14', N'14.jpg',5),
('MA15', N'15.jpg',5),
('MA16', N'16.jpg',5),
('MA17', N'17.jpg',5),
('MA18', N'18.jpg',6),
('MA19', N'18.jpg',6),
('MA20', N'20.jpg',6),
('MA21', N'21.jpg',6),
('MA22', N'22.jpg',7),
('MA23', N'23.jpg',7),
('MA24', N'24.jpg',7),
('MA25', N'25.jpg',7),
('MA26', N'26.jpg',8),
('MA27', N'27.jpg',8),
('MA28', N'28.jpg',8),
('MA29', N'29.jpg',8),
('MA30', N'30.jpg',9),
('MA31', N'31.jpg',9),
('MA32', N'32.jpg',9),
('MA33', N'33.jpg',10),
('MA34', N'34.jpg',10),
('MA35', N'35.jpg',10),
('MA36', N'36.jpg',10),
('MA37', N'37.jpg',11),
('MA38', N'38.jpg',11),
('MA39', N'39.jpg',11),
('MA40', N'40.jpg',11),
('MA41', N'41.jpg',12),
('MA42', N'42.jpg',12),
('MA43', N'43.jpg',12),
('MA44', N'44.jpg',13),
('MA45', N'45.jpg',13),
('MA46', N'46.jpg',13),
('MA47', N'47.jpg',13),
('MA48', N'48.jpg',14),
('MA49', N'49.jpg',14),
('MA50', N'50.jpg',14),
('MA51', N'51.jpg',15),
('MA52', N'52.jpg',15),
('MA53', N'53.jpg',15),
('MA54', N'54.jpg',15),
('MA55', N'55.jpg',16),
('MA56', N'56.jpg',16),
('MA57', N'57.jpg',16),
('MA58', N'58.jpg',16),
('MA59', N'59.jpg',17),
('MA60', N'60.jpg',17),
('MA61', N'61.jpg',17),
('MA62', N'62.jpg',17),
('MA63', N'63.jpg',18),
('MA64', N'64.jpg',18),
('MA65', N'65.jpg',18),
('MA66', N'66.jpg',18),
('MA67', N'67.jpg',19),
('MA68', N'68.jpg',19),
('MA69', N'69.jpg',19),
('MA70', N'70.jpg',19),
('MA71', N'71.jpg',20),
('MA72', N'72.jpg',20),
('MA73', N'73.jpg',20),
('MA74', N'74.jpg',20),
('MA75', N'75.jpg',21),
('MA76', N'76.jpg',21),
('MA77', N'77.jpg',21),
('MA78', N'78.jpg',21),
('MA79', N'79.jpg',22),
('MA80', N'80.jpg',22),
('MA81', N'81.jpg',22),
('MA82', N'82.jpg',23),
('MA83', N'83.jpg',23),
('MA84', N'84.jpg',23),
('MA85', N'85.jpg',23),
('MA86', N'86.jpg',24),
('MA87', N'87.jpg',24),
('MA88', N'88.jpg',24),
('MA89', N'89.jpg',24),
('MA90', N'90.jpg',25),
('MA91', N'91.jpg',25),
('MA92', N'92.jpg',25),
('MA93', N'93.jpg',25),
('MA94', N'94.jpg',26),
('MA95', N'95.jpg',26),
('MA96', N'96.jpg',26),
('MA97', N'97.jpg',27),
('MA98', N'98.jpg',27),
('MA99', N'99.jpg',27),
('MA100', N'100.jpg',27),
('MA101', N'101.jpg',28),
('MA102', N'102.jpg',28),
('MA103', N'103.jpg',28),
('MA104', N'104.jpg',28),
('MA105', N'105.jpg',29),
('MA106', N'106.jpg',29),
('MA107', N'107.jpg',29),
('MA108', N'108.jpg',29),
('MA109', N'109.jpg',30),
('MA110', N'110.jpg',30),
('MA111', N'111.jpg',30),
('MA112', N'112.jpg',30),
('MA113', N'113.jpg',31),
('MA114', N'114.jpg',31),
('MA115', N'115.jpg',31),
('MA116', N'116.jpg',31),
('MA117', N'117.jpg',32),
('MA118', N'118.jpg',32),
('MA119', N'119.jpg',32),
('MA120', N'120.jpg',32),
('MA121', N'121.jpg',33),
('MA122', N'122.jpg',33),
('MA123', N'123.jpg',33),
('MA124', N'124.jpg',33),
('MA125', N'125.jpg',34),
('MA126', N'126.jpg',34),
('MA127', N'127.jpg',34),
('MA128', N'128.jpg',34),
('MA129', N'129.jpg',35),
('MA130', N'130.jpg',35),
('MA131', N'131.jpg',35),
('MA132', N'132.jpg',35),
('MA133', N'133.jpg',36),
('MA134', N'134.jpg',36),
('MA135', N'135.jpg',36),
('MA136', N'136.jpg',36),
('MA137', N'137.jpg',37),
('MA138', N'138.jpg',37),
('MA139', N'139.jpg',37),
('MA140', N'140.jpg',37),
('MA141', N'141.jpg',38),
('MA142', N'142.jpg',38),
('MA143', N'143.jpg',38),
('MA144', N'144.jpg',38),
('MA145', N'145.jpg',39),
('MA146', N'146.jpg',39),
('MA147', N'147.jpg',39),
('MA148', N'148.jpg',39),
('MA149', N'149.jpg',40),
('MA150', N'150.jpg',40),
('MA151', N'151.jpg',40),
('MA152', N'152.jpg',40),
('MA153', N'153.jpg',41),
('MA154', N'154.jpg',41),
('MA155', N'155.jpg',41),
('MA156', N'156.jpg',41),
('MA157', N'157.jpg',42),
('MA158', N'158.jpg',42),
('MA159', N'159.jpg',42),
('MA160', N'160.jpg',42),
('MA161', N'161.jpg',43),
('MA162', N'162.jpg',43),
('MA163', N'163.jpg',43),
('MA164', N'164.jpg',43),
('MA165', N'165.jpg',44),
('MA166', N'166.jpg',44),
('MA167', N'167.jpg',44),
('MA168', N'168.jpg',44),
('MA169', N'169.jpg',45),
('MA170', N'170.jpg',45),
('MA171', N'171.jpg',45),
('MA172', N'172.jpg',45),
('MA173', N'173.jpg',46),
('MA174', N'174.jpg',46),
('MA175', N'175.jpg',46),
('MA176', N'176.jpg',46),
('MA177', N'177.jpg',47),
('MA178', N'178.jpg',47),
('MA179', N'179.jpg',47),
('MA180', N'180.jpg',47),
('MA181', N'181.jpg',48),
('MA182', N'182.jpg',48),
('MA183', N'183.jpg',48),
('MA184', N'184.jpg',48),
('MA185', N'185.jpg',49),
('MA186', N'186.jpg',49),
('MA187', N'187.jpg',49),
('MA188', N'188.jpg',49),
('MA189', N'189.jpg',50),
('MA190', N'190.jpg',50),
('MA191', N'191.jpg',50),
('MA192', N'192.jpg',50),
('MA193', N'193.jpg',51),
('MA194', N'194.jpg',51),
('MA195', N'195.jpg',51),
('MA196', N'196.jpg',51),
('MA197', N'197.jpg',52),
('MA198', N'198.jpg',52),
('MA199', N'199.jpg',52),
('MA200', N'200.jpg',52),
('MA201', N'201.jpg',53),
('MA202', N'202.jpg',53),
('MA203', N'203.jpg',53),
('MA204', N'204.jpg',54),
('MA205', N'205.jpg',54),
('MA206', N'206.jpg',54),
('MA207', N'207.jpg',55),
('MA208', N'208.jpg',55),
('MA209', N'209.jpg',55),
('MA210', N'210.jpg',56),
('MA211', N'211.jpg',56),
('MA212', N'212.jpg',56),
('MA213', N'213.jpg',57),
('MA214', N'214.jpg',57),
('MA215', N'215.jpg',57),
('MA216', N'216.jpg',58),
('MA217', N'217.jpg',58),
('MA218', N'218.jpg',58),
('MA219', N'219.jpg',59),
('MA220', N'220.jpg',59),
('MA221', N'221.jpg',59),
('MA222', N'222.jpg',60),
('MA223', N'223.jpg',60),
('MA224', N'224.jpg',60);


