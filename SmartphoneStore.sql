USE SmartphoneStore
GO

Create DATABASE SmartphoneStore
GO

--Tạo bảng ChucVu
CREATE TABLE ChucVu(
   	ChucVuID 		INT IDENTITY(1, 1) NOT NULL,
   	TenChucVu 		NVARCHAR(20),
   	CONSTRAINT PK_ChucVu Primary key(ChucVuID)
);
GO

--Tạo bảng KhuVuc
CREATE TABLE KhuVuc(
 	KhuVucID    INT IDENTITY(1, 1) NOT NULL,
 	TenKV       NVARCHAR(30)
    CONSTRAINT PK_KhuVuc PRIMARY KEY (KhuVucID)
);
GO

--Tạo bảng KhachHang
CREATE TABLE KhachHang(
    KhachHangID     INT IDENTITY(1, 1) NOT NULL,
    TenKH           NVARCHAR(50),
    GioiTinh        NVARCHAR(3),
 	SDT             VARCHAR(10),
 	DiaChi          NVARCHAR(50),
 	KhuVucID        INT FOREIGN KEY REFERENCES KhuVuc(KhuVucID)
 	CONSTRAINT PK_KhachHang PRIMARY KEY (KhachHangID)
);
GO

--Tạo bảng NhanVien
CREATE TABLE NhanVien (
    NhanVienID  INT IDENTITY(1, 1) NOT NULL,
    TenNV       NVARCHAR (50),
    GioiTinh   	NVARCHAR (3),
    NgaySinh  	DATE,
    DiaChi     	NVARCHAR (50),
    Luong      	MONEY,
    ChucVuID   	INT  FOREIGN KEY REFERENCES ChucVu(ChucVuID) 
    CONSTRAINT PK_NhanVien PRIMARY KEY (NhanVienID)
);
GO



--Tạo bảng DonMua
CREATE TABLE DonMua(
 	DonMuaID            INT IDENTITY(1, 1) NOT NULL,
    KhachHangID         INT FOREIGN KEY REFERENCES KhachHang(KhachHangID),
    NhanVienID          INT FOREIGN KEY REFERENCES NhanVien(NhanVienID),
	DonGia		        MONEY,
    NgayMua     	    DATE,
    CONSTRAINT PK_DonMua PRIMARY KEY (DonMuaID)
);
GO

-- DBCC CHECKIDENT('DonMua', RESEED, 0)
-- GO

--Tạo bảng SanPham
CREATE TABLE SanPham (
    SanPhamID     INT IDENTITY(1, 1) NOT NULL,
    TenSP         NVARCHAR (30),
    ThuongHieu    NVARCHAR (20),
    XuatXu        NVARCHAR (20),
    Gia           MONEY,
    SoLuong       INT,
    CONSTRAINT PK_SanPham PRIMARY KEY (SanPhamID)
);
GO


--Tạo bảng ChiTietDonMua
CREATE TABLE ChiTietDonMua (
    DonMuaID    INT NOT NULL FOREIGN KEY REFERENCES DonMua(DonMuaID),
    SanPhamID   INT NOT NULL FOREIGN KEY REFERENCES SanPham(SanPhamID),
    SoLuong     INT,
    ThanhTien   MONEY,
    CONSTRAINT PK_ChiTietDonMua PRIMARY KEY(DonMuaID, SanPhamID)
);
GO
CREATE TABLE TaiKhoan (
    UserID    INT NOT NULL FOREIGN KEY REFERENCES NhanVien(NhanVienID),
    Pass      NVARCHAR (30),
    ChucVuID          INT FOREIGN KEY REFERENCES ChucVu(ChucVuID),
    CONSTRAINT PK_TaiKhoan PRIMARY KEY(UserID)
);
GO
INSERT INTO ChiTietDonMua( DonMuaID,SanPhamID, Soluong, ThanhTien) VALUES ( 3, 1,1, 2300);
INSERT INTO ChiTietDonMua( DonMuaID,SanPhamID, Soluong, ThanhTien) VALUES ( 3, 2,1, 2300);

INSERT INTO ChiTietDonMua( DonMuaID,SanPhamID, Soluong, ThanhTien) VALUES ( 4, 1,1, 2300);

INSERT INTO ChiTietDonMua( DonMuaID,SanPhamID, Soluong, ThanhTien) VALUES ( 4, 2,1, 2300);

INSERT INTO DonMua(KhachHangID, NhanVienID, DonGia,NgayMua)  VALUES (2,1,2300,'2022-1-12');
INSERT INTO DonMua(KhachHangID, NhanVienID, DonGia,NgayMua)  VALUES (2,1,2300,'2022-2-12');
INSERT INTO DonMua(KhachHangID, NhanVienID, DonGia,NgayMua)  VALUES (2,1,2300,'2022-2-12');

INSERT INTO SanPham(TenSP, ThuongHieu,XuatXu,Gia,SoLuong)  VALUES ('Laptop','Apple','My',2300,99);
INSERT INTO SanPham(TenSP, ThuongHieu,XuatXu,Gia,SoLuong)  VALUES ('Chuot','Apple','My',3300,99);
INSERT INTO SanPham(TenSP, ThuongHieu,XuatXu,Gia,SoLuong)  VALUES ('TaiNghe','Apple','My',3300,99);

INSERT INTO KhachHang(TenKH, GioiTinh, SDT,DiaChi,KhuVucID)  VALUES ('Nguyen Thi A','Nu','904988','Ha Noi',1);

INSERT INTO NhanVien(TenNV, GioiTinh, NgaySinh,DiaChi,Luong,ChucVuID)  VALUES ('Nguyen THi B','Nu','2002-1-12','Sai Gon',123123,1);
INSERT INTO NhanVien(TenNV, GioiTinh, NgaySinh,DiaChi,Luong,ChucVuID)  VALUES ('Nguyen THi A','Nu','2002-1-12','Sai Gon',123123,2);


INSERT INTO ChucVu(TenChucVu) VALUES('Nhan vien');

USE MyStoreDB
GO

DBCC CHECKIDENT('KhuVuc', RESEED, 0)
DBCC CHECKIDENT('DonMua', RESEED, 0)
GO
