Create table NhaCungCap (
	maNhaCungCap varchar(50) PRIMARY KEY,
	tenNhaCungCap nvarchar(100) not null,
	diaChi nvarchar(100),
	soDienThoai	varchar(10) not null,
	maSoThue varchar(50) not null,
	email varchar(50) not null,
	website varchar(50),
	note nvarchar(100)
)

Create table KhachHang (
	maKhachHang varchar(20) PRIMARY KEY,
	hoVaTen nvarchar(50) not null,
	soDienThoai varchar(10) not null,
	note nvarchar(100),
)

Create table TaiKhoan(
	tenDangNhap varchar(50) PRIMARY KEY,
	matKhau	varchar(50) not null,
	hoVaTen nvarchar(50) not null,
	soDienThoai varchar(10),
	queQuan nvarchar(100),
	diaChi nvarchar(100),
	vaiTro nvarchar(50) not null,
	trangThai nvarchar(50)
)

Create table LoHang (
	maLoHang varchar(50) PRIMARY KEY,
	maNhaCungCap varchar(50) not null,
	ngayNhap date not null,
	FOREIGN KEY (maNhaCungCap) REFERENCES NhaCungCap (maNhaCungCap)
)

Create table HangHoa (
	maHangHoa varchar(50) not null,
	maLoHang varchar(50) not null,
	tenHangHoa nvarchar(100) not null,
	donVi nvarchar(50) not null,
	soLuong int not null,
	giaMua int not null,
	giaBan int not null,
	ngaySanXuat date not null,
	hanSuDung date not null,
	note nvarchar(100),
	PRIMARY KEY (maHangHoa, maLoHang),
	FOREIGN KEY (maLoHang) REFERENCES LoHang (maLoHang)
)

Create table PhieuXuatHuy (
	maPhieuXuatHuy varchar(50) PRIMARY KEY,
	tenPhieuXuatHuy nvarchar(100) not null,
	ngayHuy date not null,
	note nvarchar(100),
)

Create table SubPhieuXuatHuy (
	maPhieuXuatHuy varchar(50) not null,
	maHangHoa varchar(50) not null,
	maLoHang varchar(50) not null,
	soLuong int not null,
	PRIMARY KEY(maHangHoa, maLoHang),
	FOREIGN KEY (maHangHoa, maLoHang) REFERENCES HangHoa (maHangHoa, maLoHang),
	FOREIGN KEY (maPhieuXuatHuy) REFERENCES PhieuXuatHuy (maPhieuXuatHuy),
)

Create table HoaDon (
	maHoaDon varchar(50) PRIMARY KEY,
	maKhachHang varchar(20) not null,
	thoiGianXuatHoaDon datetime not null,
	tongTien int not null,
	diaChiCuaHang nvarchar(100),
	FOREIGN KEY (maKhachHang) REFERENCES KhachHang (maKhachHang)
)

Create table SubHoaDon (
	maHoaDon varchar(50) not null,
	maHangHoa varchar(50) not null,
	maLoHang varchar(50) not null,
	soLuong int not null,
	PRIMARY KEY(maHangHoa, maLoHang),
	FOREIGN KEY (maHangHoa, maLoHang) REFERENCES HangHoa (maHangHoa, maLoHang),
	FOREIGN KEY (maHoaDon) REFERENCES HoaDon (maHoaDon),
)

Create table LichLam (
	tenDangNhap varchar(50) PRIMARY KEY,
	batDauCa datetime not null,
	ketThucCa datetime not null,
	FOREIGN KEY (tenDangNhap) REFERENCES TaiKhoan (tenDangNhap)
)

Create table ChamCong (
	tenDangNhap varchar(50) PRIMARY KEY,
	checkIn datetime not null,
	checkOut datetime not null,
	FOREIGN KEY (tenDangNhap) REFERENCES TaiKhoan (tenDangNhap)
)

Create table ThuongPhat (
	tenDangNhap varchar(50) PRIMARY KEY,
	thoiGian datetime not null,
	tienThuongPhat int not null,
	lyDo nvarchar(100) not null,
	trangThai nvarchar(50) not null,
	FOREIGN KEY (tenDangNhap) REFERENCES TaiKhoan (tenDangNhap)
)