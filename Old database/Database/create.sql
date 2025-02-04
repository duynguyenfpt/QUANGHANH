USE [master]
GO
/****** Object:  Database [QUANGHANHABC]    Script Date: 6/16/2020 8:08:49 AM ******/
CREATE DATABASE [QUANGHANHABC]
GO
USE [QUANGHANHABC]
GO
/****** Object:  Table [dbo].[Acceptance]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acceptance](
	[acceptance_id] [int] IDENTITY(1,1) NOT NULL,
	[equipmentStatus] [int] NOT NULL,
	[acceptance_date] [date] NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[attach_to] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[acceptance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[attach_to] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Position] [nvarchar](100) NULL,
	[Role] [int] NULL,
	[NVID] [nvarchar](50) NOT NULL,
	[CDVT] [bit] NOT NULL,
	[TCLD] [bit] NOT NULL,
	[BGD] [bit] NOT NULL,
	[DK] [bit] NOT NULL,
	[KCS] [bit] NOT NULL,
	[PXKT] [bit] NOT NULL,
	[PXDL] [bit] NOT NULL,
	[PXVT] [bit] NOT NULL,
	[PXCBT] [bit] NOT NULL,
	[PXPV] [bit] NOT NULL,
	[PXDS] [bit] NOT NULL,
	[PXCDM] [bit] NOT NULL,
	[PXTGQLM] [bit] NOT NULL,
	[PXXD] [bit] NOT NULL,
	[AT] [bit] NOT NULL,
	[KCM] [bit] NOT NULL,
	[ADMIN] [bit] NOT NULL,
	[PXCKSC] [bit] NULL,
	[token] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Right]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Right](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [nvarchar](50) NULL,
	[GroupID] [int] NULL,
	[Right] [nvarchar](70) NULL,
	[isBasic] [bit] NULL,
 CONSTRAINT [PK_Account_Right] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Right_Detail]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Right_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RightID] [int] NOT NULL,
 CONSTRAINT [PK_Account_Right_Detail] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[activityid] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[equipmentid] [nvarchar](150) NOT NULL,
	[activityname] [nvarchar](150) NOT NULL,
	[hours_per_day] [float] NOT NULL,
	[quantity] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[activityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentid] ASC,
	[date] ASC,
	[activityname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BacLuong]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacLuong](
	[MaBacLuong] [int] IDENTITY(1,1) NOT NULL,
	[MucBacLuong] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBacLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BacLuong_ThangLuong_MucLuong]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacLuong_ThangLuong_MucLuong](
	[MaBacLuong_ThangLuong_MucLuong] [int] IDENTITY(1,1) NOT NULL,
	[MaBacLuong] [int] NULL,
	[MaThangLuong] [int] NULL,
	[MucLuong] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBacLuong_ThangLuong_MucLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangCap_GiayChungNhan]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangCap_GiayChungNhan](
	[MaTruong] [int] NULL,
	[MaBangCap_GiayChungNhan] [int] IDENTITY(1,1) NOT NULL,
	[MaTrinhDo] [int] NULL,
	[KieuBangCap] [nvarchar](100) NULL,
	[ThoiHan] [nvarchar](50) NULL,
	[TenBangCap] [nvarchar](100) NULL,
	[Loai] [nvarchar](100) NULL,
	[MaChuyenNganh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBangCap_GiayChungNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCaoFile]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ngay] [date] NULL,
	[ca] [int] NULL,
	[phanxuong_id] [nvarchar](150) NULL,
	[lock] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Camera_Acceptance]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camera_Acceptance](
	[room_id] [nvarchar](150) NOT NULL,
	[acceptance_camera_quantity] [int] NOT NULL,
	[documentary_id] [int] NOT NULL,
	[acceptance_date] [date] NULL,
	[isAcceptance] [bit] NOT NULL,
 CONSTRAINT [PK__Camera_A__30E849AA1ED998B2] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CameraIncident]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CameraIncident](
	[incident_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [nvarchar](150) NOT NULL,
	[incident_camera_quantity] [int] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NULL,
	[reason] [nvarchar](150) NULL,
	[disk_saveable] [bit] NOT NULL,
	[disk_status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[incident_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[equipmentId] [nvarchar](150) NOT NULL,
	[namsanxuat] [int] NULL,
	[sokhung] [nvarchar](150) NOT NULL,
	[somay] [nvarchar](150) NOT NULL,
	[GPS] [bit] NULL,
	[nhienlieu] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[equipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarGPS]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarGPS](
	[equipmentId] [nvarchar](150) NOT NULL,
	[date] [date] NOT NULL,
	[session] [int] NOT NULL,
	[available] [bit] NOT NULL,
	[reason] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipmentId] ASC,
	[date] ASC,
	[session] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_attribute_value]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_attribute_value](
	[Value] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[Equipment_category_id] [nvarchar](150) NOT NULL,
	[Equipment_category_attribute_id] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[equipmentId] ASC,
	[Equipment_category_id] ASC,
	[Equipment_category_attribute_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamDut_NhanVien]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamDut_NhanVien](
	[MaQuyetDinh] [int] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[LoaiChamDut] [nvarchar](100) NULL,
	[NgayChamDut] [date] NULL,
 CONSTRAINT [PK__ChamDut___8D1F62BBD51B05BB] PRIMARY KEY CLUSTERED 
(
	[MaQuyetDinh] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_BangCap_GiayChungNhan]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_BangCap_GiayChungNhan](
	[SoHieu] [nvarchar](100) NOT NULL,
	[MaBangCap_GiayChungNhan] [int] NOT NULL,
	[NgayCap] [date] NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayTra] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTiet_NhiemVu_NhanVien]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTiet_NhiemVu_NhanVien](
	[NgayNhanNhiemVu] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaNhiemVu] [int] NOT NULL,
	[MaChiTiet_NhiemVu_NhanVien] [int] IDENTITY(1,1) NOT NULL,
	[IsInProcess] [bit] NOT NULL,
	[LanCuoiCapNhat] [datetime] NULL,
	[IsUpdated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet_NhiemVu_NhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChungChi]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungChi](
	[MaChungChi] [int] IDENTITY(1,1) NOT NULL,
	[TenChungChi] [nvarchar](100) NULL,
	[ThoiHan] [int] NULL,
	[KieuChungChi] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChungChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChungChi_NhanVien]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungChi_NhanVien](
	[SoHieu] [nvarchar](100) NOT NULL,
	[NgayCap] [date] NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[MaChungChi] [int] NOT NULL,
	[NgayTra] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenNganh](
	[MaChuyenNganh] [nvarchar](100) NOT NULL,
	[TenChuyenNganh] [nvarchar](100) NULL,
	[CapBac] [nvarchar](100) NULL,
	[ChiTiet] [nvarchar](100) NULL,
	[MaNganh] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChuyenNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongTacAnToan]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTacAnToan](
	[MaCongTacAnToan] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NULL,
	[MaPhongBan] [nvarchar](150) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[LoaiGhiChu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCongTacAnToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[MaCongViec] [int] IDENTITY(1,1) NOT NULL,
	[TenCongViec] [nvarchar](500) NULL,
	[PhuCap] [float] NULL,
	[MaThangLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongViec_NhomCongViec]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec_NhomCongViec](
	[MaCongViec_NhomCongViec] [int] IDENTITY(1,1) NOT NULL,
	[MaCongViec] [int] NULL,
	[MaNhomCongViec] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCongViec_NhomCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [nvarchar](150) NOT NULL,
	[department_name] [nvarchar](150) NOT NULL,
	[department_type] [nvarchar](150) NOT NULL,
	[isInside] [bit] NOT NULL,
	[index] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiemDanh_NangSuatLaoDong]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemDanh_NangSuatLaoDong](
	[MaNV] [nvarchar](50) NOT NULL,
	[HeaderID] [int] NOT NULL,
	[ThoiGianThucTeDiemDanh] [datetime] NULL,
	[DiemLuong] [float] NULL,
	[DiLam] [bit] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[LyDoVangMat] [nvarchar](1000) NULL,
	[ThoiGianXuongLo] [datetime] NULL,
	[ThoiGianLenLo] [datetime] NULL,
	[isChangedManually] [bit] NOT NULL,
	[ActualHeaderFetched] [int] NOT NULL,
	[isFilledFromAPI] [bit] NOT NULL,
 CONSTRAINT [PK__DiemDanh__0AE631966435AEFE] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[HeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienCongViec]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienCongViec](
	[MaDienCongViec] [int] IDENTITY(1,1) NOT NULL,
	[TenDienCongViec] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDienCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DieuDong_NhanVien]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DieuDong_NhanVien](
	[MaQuyetDinh] [int] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[LyDoDieuDong] [nvarchar](1000) NULL,
	[MaDonViMoi] [nvarchar](150) NULL,
	[MaChucVuMoi] [int] NULL,
	[MaDonViCu] [nvarchar](150) NULL,
	[MaChucVuCu] [int] NULL,
	[MaBacLuong_ThangLuong_MucLuongCu] [int] NULL,
	[MaBacLuong_ThangLuong_MucLuongMoi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyetDinh] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary](
	[documentary_id] [int] IDENTITY(1,1) NOT NULL,
	[documentary_code] [nvarchar](150) NULL,
	[documentary_type] [int] NOT NULL,
	[department_id_to] [nvarchar](150) NULL,
	[date_created] [date] NOT NULL,
	[person_created] [nvarchar](150) NOT NULL,
	[reason] [nvarchar](150) NOT NULL,
	[out/in_come] [nvarchar](150) NULL,
	[documentary_status] [int] NOT NULL,
 CONSTRAINT [PK__Document__98F1320301ABE4FB] PRIMARY KEY CLUSTERED 
(
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_big_maintain_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_big_maintain_details](
	[documentary_big_maintain_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_big_maintain_status] [int] NOT NULL,
	[remodel_type] [nvarchar](150) NOT NULL,
	[end_date] [date] NOT NULL,
	[next_remodel_type] [nvarchar](150) NOT NULL,
	[next_end_time] [float] NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[attach_to] [nvarchar](150) NULL,
	[quantity] [int] NOT NULL,
	[equipment_big_maintain_reason] [nvarchar](150) NULL,
	[department_id_from] [nvarchar](150) NULL,
 CONSTRAINT [PK__Document__91679028640B9ABD] PRIMARY KEY CLUSTERED 
(
	[documentary_big_maintain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[attach_to] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_camera_repair_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_camera_repair_details](
	[documentary_id] [int] NOT NULL,
	[room_id] [nvarchar](150) NOT NULL,
	[broken_camera_quantity] [int] NOT NULL,
	[repair_requirement] [nvarchar](150) NOT NULL,
	[note] [nvarchar](150) NULL,
	[Documentary_camera_repair_status] [int] NOT NULL,
	[department_id] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[documentary_id] ASC,
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_Improve_Detail]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_Improve_Detail](
	[documentary_improve_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_Improve_status] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[documentary_id] [int] NOT NULL,
	[department_id_from] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[documentary_improve_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_liquidation_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_liquidation_details](
	[documentary_liquidation_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_liquidation_status] [int] NOT NULL,
	[buyer] [nvarchar](150) NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[equipment_liquidation_reason] [nvarchar](150) NULL,
	[department_id_from] [nvarchar](150) NULL,
 CONSTRAINT [PK__Document__91679028451AF592] PRIMARY KEY CLUSTERED 
(
	[documentary_liquidation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_maintain_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_maintain_details](
	[documentary_maintain_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_maintain_status] [int] NOT NULL,
	[maintain_type] [nvarchar](150) NOT NULL,
	[finish_date_plan] [date] NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[attach_to] [nvarchar](150) NULL,
	[quantity] [int] NOT NULL,
	[equipment_maintain_reason] [nvarchar](150) NULL,
	[department_id_from] [nvarchar](150) NULL,
 CONSTRAINT [PK__Document__91679028188D90C1] PRIMARY KEY CLUSTERED 
(
	[documentary_maintain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[attach_to] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_moveline_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_moveline_details](
	[documentary_moveline_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_moveline_status] [int] NOT NULL,
	[department_detail] [nvarchar](150) NOT NULL,
	[date_to] [date] NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[equipment_moveline_reason] [nvarchar](150) NULL,
	[department_id_from] [nvarchar](150) NULL,
 CONSTRAINT [PK__Document__9167902838E8012A] PRIMARY KEY CLUSTERED 
(
	[documentary_moveline_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_repair_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_repair_details](
	[documentary_repair_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_repair_status] [int] NOT NULL,
	[repair_type] [nvarchar](150) NOT NULL,
	[repair_reason] [nvarchar](150) NOT NULL,
	[finish_date_plan] [date] NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[attach_to] [nvarchar](150) NULL,
	[quantity] [int] NOT NULL,
	[department_id_from] [nvarchar](150) NULL,
	[isVisible] [bit] NOT NULL,
 CONSTRAINT [PK__Document__91679028E1AEF922] PRIMARY KEY CLUSTERED 
(
	[documentary_repair_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[attach_to] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documentary_revoke_details]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documentary_revoke_details](
	[documentary_revoke_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_revoke_status] [int] NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[equipment_revoke_reason] [nvarchar](150) NULL,
	[department_id_from] [nvarchar](150) NULL,
 CONSTRAINT [PK__Document__9167902836A80706] PRIMARY KEY CLUSTERED 
(
	[documentary_revoke_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[documentary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentaryType]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentaryType](
	[documentary_type] [int] IDENTITY(1,1) NOT NULL,
	[documentary_name] [nvarchar](150) NOT NULL,
	[du_phong] [bit] NOT NULL,
	[di_kem] [bit] NOT NULL,
	[can] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[documentary_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipmentId] [nvarchar](150) NOT NULL,
	[equipment_name] [nvarchar](250) NOT NULL,
	[supplier] [nvarchar](150) NULL,
	[date_import] [date] NULL,
	[depreciation_estimate] [float] NULL,
	[depreciation_present] [float] NULL,
	[durationOfInspection] [date] NULL,
	[durationOfInsurance] [date] NULL,
	[inspect_date] [date] NULL,
	[insurance_date] [date] NULL,
	[usedDay] [date] NULL,
	[durationOfMaintainance] [date] NULL,
	[total_operating_hours] [int] NULL,
	[current_Status] [int] NULL,
	[fabrication_number] [nvarchar](150) NULL,
	[mark_code] [nvarchar](150) NULL,
	[quality_type] [nvarchar](150) NULL,
	[input_channel] [nvarchar](150) NULL,
	[Equipment_category_id] [nvarchar](150) NULL,
	[department_id] [nvarchar](150) NULL,
	[isAttach] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[equipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_attribute]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_attribute](
	[Equipment_attribute_id] [nvarchar](150) NOT NULL,
	[Equipment_attribute_name] [nvarchar](150) NOT NULL,
	[value] [nvarchar](150) NOT NULL,
	[unit] [nvarchar](150) NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_attribute_id] ASC,
	[equipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_category]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_category](
	[Equipment_category_id] [nvarchar](150) NOT NULL,
	[Equipment_category_name] [nvarchar](150) NOT NULL,
	[divce_type] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_category_attribute]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_category_attribute](
	[Equipment_category_attribute_id] [nvarchar](150) NOT NULL,
	[Equipment_category_attribute_name] [nvarchar](150) NOT NULL,
	[unit] [nvarchar](150) NOT NULL,
	[Equipment_category_id] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_category_attribute_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_Inspection]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_Inspection](
	[inspect_id] [int] IDENTITY(1,1) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[inspect_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inspect_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_Insurance]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_Insurance](
	[insurance_id] [int] IDENTITY(1,1) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[insurance_start_date] [datetime] NOT NULL,
	[insurance_end_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[insurance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_SCTX]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_SCTX](
	[maintain_id] [int] IDENTITY(1,1) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[date] [datetime] NOT NULL,
	[department_id] [nvarchar](150) NOT NULL,
	[maintain_content] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maintain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_SCTX_Detail]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_SCTX_Detail](
	[maintain_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[maintain_id] [int] NOT NULL,
	[supplyid] [nvarchar](150) NOT NULL,
	[used] [int] NOT NULL,
	[thuhoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maintain_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[maintain_id] ASC,
	[supplyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FakeAPI]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FakeAPI](
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayDiemDanh] [date] NOT NULL,
	[CaDiemDanh] [int] NOT NULL,
	[GioDiemDanh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[NgayDiemDanh] ASC,
	[CaDiemDanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileBaoCao]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileBaoCao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baoCaoID] [int] NULL,
	[fileName] [nvarchar](50) NULL,
	[fileNameDisplay] [nvarchar](50) NULL,
	[nguoinhap_id] [int] NULL,
	[uploadTime] [datetime] NULL,
	[chuthich] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[fileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fuel_activities_consumption]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuel_activities_consumption](
	[fuelid] [int] IDENTITY(1,1) NOT NULL,
	[consumption_value] [int] NOT NULL,
	[date] [date] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[department_id] [nvarchar](150) NULL,
	[fuel_type] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fuelid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_FAC] UNIQUE NONCLUSTERED 
(
	[date] ASC,
	[equipmentId] ASC,
	[fuel_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiayTo]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiayTo](
	[MaNV] [nvarchar](50) NOT NULL,
	[TenGiayTo] [nvarchar](100) NOT NULL,
	[KieuGiayTo] [nvarchar](100) NULL,
	[MaGiayTo] [int] IDENTITY(1,1) NOT NULL,
	[NgayTra] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiayTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Header_DiemDanh_NangSuat_LaoDong]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong](
	[HeaderID] [int] IDENTITY(1,1) NOT NULL,
	[NgayDiemDanh] [datetime] NOT NULL,
	[Ca] [int] NOT NULL,
	[isCreatedManually] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[Message] [nvarchar](100) NULL,
	[FetchDataTime] [datetime] NOT NULL,
	[VERSION] [nchar](30) NULL,
 CONSTRAINT [PK_Header_DiemDanh_NangSuat_LaoDong1] PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail](
	[HeaderID] [int] NOT NULL,
	[TotalEffort] [float] NOT NULL,
	[ThanThucHien] [float] NOT NULL,
	[MetLoThucHien] [float] NOT NULL,
	[XenThucHien] [float] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[isFilledFromAPI] [bit] NOT NULL,
	[MaPhongBan] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC,
	[MaPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[header_KeHoach_TieuChi_TheoNam]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[header_KeHoach_TieuChi_TheoNam](
	[HeaderID] [int] IDENTITY(1,1) NOT NULL,
	[MaPhongBan] [nvarchar](150) NULL,
	[Nam] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[header_KeHoach_TieuChi_TheoNgay]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[header_KeHoach_TieuChi_TheoNgay](
	[HeaderID] [int] IDENTITY(1,1) NOT NULL,
	[MaPhongBan] [nvarchar](150) NULL,
	[Ca] [int] NULL,
	[NgayNhapKH] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uniqueheaderkhtc] UNIQUE NONCLUSTERED 
(
	[MaPhongBan] ASC,
	[Ca] ASC,
	[NgayNhapKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[header_KeHoachTungThang]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[header_KeHoachTungThang](
	[HeaderID] [int] IDENTITY(1,1) NOT NULL,
	[MaPhongBan] [nvarchar](150) NULL,
	[ThangID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[header_ThucHienTheoNgay]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[header_ThucHienTheoNgay](
	[MaPhongBan] [nvarchar](150) NOT NULL,
	[HeaderID] [int] IDENTITY(1,1) NOT NULL,
	[NgayID] [int] NOT NULL,
	[Ca] [int] NOT NULL,
 CONSTRAINT [PK_header_ThucHienTheoNgay] PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoSo]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoSo](
	[TrangThaiHoSo] [nvarchar](100) NULL,
	[NgayNhanHoSo] [date] NULL,
	[NguoiGiaoHoSo] [nvarchar](100) NULL,
	[CamKetTuyenDung] [nvarchar](100) NULL,
	[QuyetDinhTiepNhanDVC] [nvarchar](100) NULL,
	[QDChamDutHopDongDVC] [nvarchar](100) NULL,
	[NLDHocTheoChiTieuCTDT] [nvarchar](100) NULL,
	[NguoiBanGiaoBangNhapKho] [nvarchar](100) NULL,
	[NguoiGiuHoSo] [nvarchar](100) NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayQuyetDinhTuyenDung] [date] NULL,
	[NgayDiLam] [date] NULL,
	[DonViKyQuyetDinhTiepNhan] [nvarchar](100) NULL,
	[NgayQuyetDinhChamDut] [date] NULL,
	[NgayChamDut] [date] NULL,
	[DonViKyQuyetDinhChamDut] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Important_Documentary]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Important_Documentary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[documentary_id] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Important_Documentary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident](
	[incident_id] [int] IDENTITY(1,1) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NULL,
	[detail_location] [nvarchar](150) NULL,
	[reason] [nvarchar](150) NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[department_id] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[incident_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeHoach_TieuChi_TheoNam]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeHoach_TieuChi_TheoNam](
	[HeaderID] [int] NOT NULL,
	[MaTieuChi] [int] NOT NULL,
	[SanLuongKeHoach] [float] NULL,
	[ThoiGianNhapCuoiCung] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC,
	[MaTieuChi] ASC,
	[ThoiGianNhapCuoiCung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeHoach_TieuChi_TheoNgay]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeHoach_TieuChi_TheoNgay](
	[HeaderID] [int] NOT NULL,
	[MaTieuChi] [int] NOT NULL,
	[KeHoach] [float] NULL,
	[ThoiGianNhapCuoiCung] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC,
	[MaTieuChi] ASC,
	[ThoiGianNhapCuoiCung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeHoach_TieuChi_TheoThang]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeHoach_TieuChi_TheoThang](
	[HeaderID] [int] NOT NULL,
	[MaTieuChi] [int] NOT NULL,
	[SanLuong] [float] NULL,
	[ThoiGianNhapCuoiCung] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK__KeHoach___9821EC604DC982AE] PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC,
	[MaTieuChi] ASC,
	[ThoiGianNhapCuoiCung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeHoachTungThang]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeHoachTungThang](
	[ThangID] [int] IDENTITY(1,1) NOT NULL,
	[ThangKeHoach] [int] NULL,
	[NamKeHoach] [int] NULL,
	[SoNgayLamViec] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ThangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ThangKeHoach] ASC,
	[NamKeHoach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuBoSungSYLL]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuBoSungSYLL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[NamBoSung] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintain_Car]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintain_Car](
	[maintainid] [int] IDENTITY(1,1) NOT NULL,
	[equipmentid] [nvarchar](150) NOT NULL,
	[date] [datetime] NOT NULL,
	[departmentid] [nvarchar](150) NOT NULL,
	[maintain_content] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maintainid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintain_Car_Detail]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintain_Car_Detail](
	[maintaindetailid] [int] IDENTITY(1,1) NOT NULL,
	[maintainid] [int] NOT NULL,
	[supplyid] [nvarchar](150) NOT NULL,
	[used] [int] NOT NULL,
	[thuhoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maintaindetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[maintainid] ASC,
	[supplyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealRegistration]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealRegistration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [nvarchar](150) NULL,
	[date_regs] [date] NOT NULL,
	[num_regs] [int] NULL,
	[num_regs_plan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ID] [nvarchar](50) NOT NULL,
	[Module] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Module_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nganh]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nganh](
	[MaNganh] [nvarchar](100) NOT NULL,
	[TenNganh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiUyQuyenLayHoSo_BaoHiem]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiUyQuyenLayHoSo_BaoHiem](
	[MaUyQuyen] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[QuanHe] [nvarchar](100) NULL,
	[SoCMND] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](100) NULL,
	[DiaChiThuongTru] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUyQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[Tenkhac] [nvarchar](100) NULL,
	[GioiTinh] [bit] NOT NULL,
	[CapUyHienTai] [nvarchar](100) NULL,
	[CapUyKiem] [nvarchar](100) NULL,
	[PhuCapChucVu] [float] NULL,
	[NgaySinh] [date] NULL,
	[NoiSinh] [nvarchar](100) NULL,
	[DanToc] [nvarchar](100) NULL,
	[QueQuan] [nvarchar](100) NULL,
	[TonGiao] [nvarchar](100) NULL,
	[NoiOHienTai] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[TPGiaDinhXuatThan] [nvarchar](100) NULL,
	[NgayThamGiaCachMang] [date] NULL,
	[NgayVaoDangCSVN] [date] NULL,
	[NgayChinhThuc] [date] NULL,
	[NgayVaoToChucCTXH] [date] NULL,
	[ToChuc] [nvarchar](100) NULL,
	[NgayNhapNgu] [date] NULL,
	[NgayXuatNgu] [date] NULL,
	[QuanHamChucVuCaoNhat] [nvarchar](100) NULL,
	[HocHamHocViCaoNhat] [nvarchar](100) NULL,
	[LyLuanChinhTri] [nvarchar](100) NULL,
	[NgoaiNgu] [nvarchar](100) NULL,
	[CongTacChinhDangLam] [nvarchar](100) NULL,
	[NgachCongChuc] [nvarchar](100) NULL,
	[MaNgach] [float] NULL,
	[DanhHieuDuocPhong] [nvarchar](100) NULL,
	[SoTruongCongTac] [nvarchar](100) NULL,
	[CongViecDaLamLauNhat] [nvarchar](100) NULL,
	[KhenThuong] [nvarchar](100) NULL,
	[KyLuat] [nvarchar](100) NULL,
	[TinhTrangSucKhoe] [nvarchar](100) NULL,
	[ChiTietSucKhoe] [nvarchar](100) NULL,
	[ChieuCao] [float] NULL,
	[CanNang] [float] NULL,
	[NhomMau] [nvarchar](100) NULL,
	[HangThuongBinh] [nvarchar](100) NULL,
	[GiaDinhChinhSach] [nvarchar](100) NULL,
	[SoCMND] [nvarchar](20) NULL,
	[NgayCapCMND] [date] NULL,
	[NoiCapCMND] [nvarchar](100) NULL,
	[NgayDiLam] [date] NULL,
	[MaUyQuyen] [int] NULL,
	[SoBHXH] [nvarchar](100) NULL,
	[NgayTraBHXH] [date] NULL,
	[MaCongViec] [int] NULL,
	[MucLuong] [float] NULL,
	[MaTrinhDo] [int] NULL,
	[MaTruong] [int] NULL,
	[BacLuong] [nvarchar](100) NULL,
	[NgheTruoc] [nvarchar](100) NULL,
	[NgayTuyenDungTruoc] [date] NULL,
	[CoQuanTruoc] [nvarchar](100) NULL,
	[HeSo] [float] NULL,
	[TuThang] [int] NULL,
	[MaTrangThai] [int] NOT NULL,
	[MaChuyenNganh] [nvarchar](100) NULL,
	[MaPhongBan] [nvarchar](150) NULL,
	[MaBacLuong_ThangLuong_MucLuong] [int] NULL,
 CONSTRAINT [PK__NhanVien__2725D70AC587C2A2] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhiemVu]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhiemVu](
	[Loai] [nvarchar](100) NOT NULL,
	[TenNhiemVu] [nvarchar](100) NOT NULL,
	[MaChungChi] [int] NULL,
	[MaNhiemVu] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhiemVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomCongViec]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomCongViec](
	[MaNhomCongViec] [int] IDENTITY(1,1) NOT NULL,
	[LoaiNhomCongViec] [nvarchar](100) NULL,
	[TenNhomCongViec] [nvarchar](100) NULL,
	[MaDienCongViec] [int] NULL,
 CONSTRAINT [PK__NhomCong__B0E23700E7B50F3F] PRIMARY KEY CLUSTERED 
(
	[MaNhomCongViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomTieuChi]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomTieuChi](
	[MaNhomTieuChi] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomTieuChi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhomTieuChi] PRIMARY KEY CLUSTERED 
(
	[MaNhomTieuChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id_noti] [int] IDENTITY(1,1) NOT NULL,
	[id_problem] [int] NOT NULL,
	[department_id] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[isread] [bit] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[id_noti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan_TieuChi]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan_TieuChi](
	[MaTieuChi] [int] NOT NULL,
	[MaPhongBan] [nvarchar](150) NOT NULL,
	[Thang] [int] NOT NULL,
	[Nam] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTieuChi] ASC,
	[MaPhongBan] ASC,
	[Thang] ASC,
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan_TieuChi_TheoNam]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan_TieuChi_TheoNam](
	[MaPhongBan] [nvarchar](150) NOT NULL,
	[MaTieuChi] [int] NOT NULL,
	[Nam] [int] NOT NULL,
 CONSTRAINT [PK_PhongBan_TieuChi_TheoNam] PRIMARY KEY CLUSTERED 
(
	[MaPhongBan] ASC,
	[MaTieuChi] ASC,
	[Nam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanHeGiaDinh]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHeGiaDinh](
	[MaQuanHeGiaDinh] [int] IDENTITY(1,1) NOT NULL,
	[LoaiGiaDinh] [nvarchar](100) NULL,
	[MoiQuanHe] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[LyLich] [nvarchar](100) NULL,
	[MaNV] [nvarchar](50) NULL,
	[HoTen] [nvarchar](100) NULL,
	[NoiThuongTru] [nvarchar](100) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuanHeGiaDinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuaTrinhCongTac]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuaTrinhCongTac](
	[MaCongTac] [int] IDENTITY(1,1) NOT NULL,
	[ChucDanh] [nvarchar](100) NULL,
	[ChucVu] [nvarchar](100) NULL,
	[DonViCongTac] [nvarchar](100) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[MaNV] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCongTac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyetDinh]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyetDinh](
	[MaQuyetDinh] [int] IDENTITY(1,1) NOT NULL,
	[SoQuyetDinh] [nvarchar](50) NULL,
	[NgayQuyetDinh] [date] NULL,
 CONSTRAINT [PK__QuyetDin__3F6D3FCB2549C64E] PRIMARY KEY CLUSTERED 
(
	[MaQuyetDinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[department_id] [nvarchar](150) NOT NULL,
	[room_id] [nvarchar](150) NOT NULL,
	[room_name] [nvarchar](150) NOT NULL,
	[camera_quantity] [int] NOT NULL,
	[camera_available] [int] NOT NULL,
	[series] [nvarchar](50) NULL,
	[capacity] [nvarchar](50) NOT NULL,
	[disk_status] [nvarchar](50) NOT NULL,
	[signal_loss_reason] [nvarchar](150) NULL,
	[note] [nvarchar](150) NULL,
	[disk_saveable] [bit] NOT NULL,
	[login_information] [nvarchar](100) NOT NULL,
	[image_link] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Status]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Status](
	[room_id] [nvarchar](150) NOT NULL,
	[date] [date] NOT NULL,
	[session] [int] NOT NULL,
	[fully_function] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC,
	[date] ASC,
	[session] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[statusid] [int] NOT NULL,
	[statusname] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[supply_id] [nvarchar](150) NOT NULL,
	[supply_name] [nvarchar](250) NOT NULL,
	[unit] [nvarchar](150) NOT NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[supply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_DiKem]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_DiKem](
	[equipmentId] [nvarchar](150) NOT NULL,
	[equipmentId_dikem] [nvarchar](150) NOT NULL,
	[quantity] [int] NOT NULL,
	[note] [nvarchar](150) NULL,
	[quantity_duphong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[equipmentId] ASC,
	[equipmentId_dikem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Documentary_Big_Maintain_Equipment]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Documentary_Big_Maintain_Equipment](
	[supplyDocumentaryEquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[documentary_big_maintain_id] [int] NOT NULL,
	[supply_id] [nvarchar](150) NULL,
	[quantity_plan] [int] NOT NULL,
	[quantity_in] [int] NOT NULL,
	[quantity_used] [int] NOT NULL,
	[quantity_out] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyDocumentaryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Documentary_Camera]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Documentary_Camera](
	[supplyDocumentaryCameraId] [int] IDENTITY(1,1) NOT NULL,
	[documentary_id] [int] NOT NULL,
	[room_id] [nvarchar](150) NOT NULL,
	[supply_id] [nvarchar](150) NOT NULL,
	[quantity_plan] [int] NOT NULL,
	[quantity_in] [int] NOT NULL,
	[quantity_used] [int] NOT NULL,
	[quantity_out] [int] NOT NULL,
	[supplyStatus] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyDocumentaryCameraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[documentary_id] ASC,
	[room_id] ASC,
	[supply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Documentary_Equipment]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Documentary_Equipment](
	[supplyDocumentaryEquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[documentary_id] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[supply_id] [nvarchar](150) NULL,
	[quantity_plan] [int] NOT NULL,
	[quantity_in] [int] NOT NULL,
	[quantity_used] [int] NOT NULL,
	[quantity_out] [int] NOT NULL,
	[supplyStatus] [nvarchar](150) NULL,
	[equipmentId_dikem] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyDocumentaryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Documentary_Improve_Equipment]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Documentary_Improve_Equipment](
	[supplyDocumentaryEquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[documentary_improve_id] [int] NOT NULL,
	[supply_id] [nvarchar](150) NULL,
	[equipmentId] [nvarchar](150) NULL,
	[quantity_before] [int] NOT NULL,
	[quantity_after] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyDocumentaryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Documentary_Maintain_Equipment]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Documentary_Maintain_Equipment](
	[supplyDocumentaryEquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[documentary_maintain_id] [int] NOT NULL,
	[supply_id] [nvarchar](150) NULL,
	[quantity_plan] [int] NOT NULL,
	[quantity_in] [int] NOT NULL,
	[quantity_used] [int] NOT NULL,
	[quantity_out] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyDocumentaryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Documentary_Repair_Equipment]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Documentary_Repair_Equipment](
	[supplyDocumentaryEquipmentId] [int] IDENTITY(1,1) NOT NULL,
	[documentary_repair_id] [int] NOT NULL,
	[supply_id] [nvarchar](150) NULL,
	[quantity_plan] [int] NOT NULL,
	[quantity_in] [int] NOT NULL,
	[quantity_used] [int] NOT NULL,
	[quantity_out] [int] NOT NULL,
	[equipmentId] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyDocumentaryEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_Equipment_DiKem]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_Equipment_DiKem](
	[supply_id] [nvarchar](150) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supply_id] ASC,
	[equipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_SCTX]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_SCTX](
	[supply_sctx_id] [int] IDENTITY(1,1) NOT NULL,
	[supply_id] [nvarchar](150) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[quantity] [int] NOT NULL,
	[equipmentId_dikem] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[supply_sctx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[equipmentId] ASC,
	[equipmentId_dikem] ASC,
	[supply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply_tieuhao]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply_tieuhao](
	[supplyid] [nvarchar](150) NOT NULL,
	[departmentid] [nvarchar](150) NOT NULL,
	[date] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	[used] [int] NOT NULL,
	[thuhoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplyid] ASC,
	[departmentid] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyPlan]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyPlan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supplyid] [nvarchar](150) NOT NULL,
	[departmentid] [nvarchar](150) NOT NULL,
	[equipmentid] [nvarchar](150) NULL,
	[date] [date] NOT NULL,
	[dinh_muc] [float] NULL,
	[quantity_plan] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [int] NULL,
	[quantity_provide] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiNan]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiNan](
	[MaTaiNan] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[LyDo] [nvarchar](max) NULL,
	[Ngay] [date] NULL,
	[Ca] [int] NULL,
	[Loai] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTaiNan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThangLuong]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThangLuong](
	[MaThangLuong] [int] IDENTITY(1,1) NOT NULL,
	[MucThangLuong] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThangLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThucHien_TieuChi_TheoNgay]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThucHien_TieuChi_TheoNgay](
	[HeaderID] [int] NOT NULL,
	[MaTieuChi] [int] NOT NULL,
	[SanLuong] [float] NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HeaderID] ASC,
	[MaTieuChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThucHienTheoNgay]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThucHienTheoNgay](
	[NgayID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [date] NOT NULL,
	[NgaySanXuat] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NgayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TieuChi]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieuChi](
	[MaTieuChi] [int] IDENTITY(1,1) NOT NULL,
	[TenTieuChi] [nvarchar](100) NULL,
	[DonViDo] [nvarchar](100) NULL,
	[MaNhomTieuChi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTieuChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrinhDo]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhDo](
	[MaTrinhDo] [int] NOT NULL,
	[TenTrinhDo] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTrinhDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truong]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truong](
	[MaTruong] [int] NOT NULL,
	[TenTruong] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTruong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuyenDung_NhanVien]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuyenDung_NhanVien](
	[MaQuyetDinh] [int] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayTuyenDung] [date] NULL,
 CONSTRAINT [PK__TuyenDun__8D1F62BBF450B11C] PRIMARY KEY CLUSTERED 
(
	[MaQuyetDinh] ASC,
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Action_Log]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Action_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Method] [nvarchar](100) NULL,
	[Url_From] [nvarchar](100) NOT NULL,
	[Url_To] [nvarchar](100) NULL,
	[Action_Time] [datetime] NOT NULL,
	[Browser] [nvarchar](100) NULL,
	[Location_IP] [nvarchar](100) NULL,
 CONSTRAINT [PK__User_Act__3214EC27038683F8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vattu_Dikem]    Script Date: 6/28/2020 10:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vattu_Dikem](
	[supply_id] [nvarchar](150) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supply_id] ASC,
	[equipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_isInside]  DEFAULT ((0)) FOR [isInside]
GO
ALTER TABLE [dbo].[DiemDanh_NangSuatLaoDong] ADD  CONSTRAINT [DF_DiemDanh_NangSuatLaoDong_isChangedManually]  DEFAULT ((0)) FOR [isChangedManually]
GO
ALTER TABLE [dbo].[DiemDanh_NangSuatLaoDong] ADD  CONSTRAINT [DF_DiemDanh_NangSuatLaoDong_isFilledFromAPI]  DEFAULT ((0)) FOR [isFilledFromAPI]
GO
ALTER TABLE [dbo].[Documentary_repair_details] ADD  DEFAULT ((1)) FOR [isVisible]
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail] ADD  CONSTRAINT [DF_Table_1_Tổng Điểm]  DEFAULT ((0)) FOR [TotalEffort]
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail] ADD  CONSTRAINT [DF_Table_1_Sản Lượng Than Thực Hiện]  DEFAULT ((0)) FOR [ThanThucHien]
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail] ADD  CONSTRAINT [DF_Table_1_Sản Lượng Mét Lò Thực Hiện]  DEFAULT ((0)) FOR [MetLoThucHien]
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail] ADD  CONSTRAINT [DF_Table_1_Sản Lượng Xén Thực Hiện]  DEFAULT ((0)) FOR [XenThucHien]
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail] ADD  CONSTRAINT [DF_Header_DiemDanh_NangSuat_LaoDong_isFilledFromAPI]  DEFAULT ((0)) FOR [isFilledFromAPI]
GO
ALTER TABLE [dbo].[header_ThucHienTheoNgay] ADD  CONSTRAINT [DF_header_ThucHienTheoNgay_Ca]  DEFAULT ((0)) FOR [Ca]
GO
ALTER TABLE [dbo].[SupplyPlan] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Acceptance]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Acceptance]  WITH NOCHECK ADD  CONSTRAINT [FK__Acceptanc__docum__2A164134] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Acceptance] CHECK CONSTRAINT [FK__Acceptanc__docum__2A164134]
GO
ALTER TABLE [dbo].[Acceptance]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Account]  WITH NOCHECK ADD  CONSTRAINT [FK_Account_NhanVien] FOREIGN KEY([NVID])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_NhanVien]
GO
ALTER TABLE [dbo].[Account]  WITH NOCHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Account_Right]  WITH NOCHECK ADD  CONSTRAINT [FK_Account_Right_Module] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Module] ([ID])
GO
ALTER TABLE [dbo].[Account_Right] CHECK CONSTRAINT [FK_Account_Right_Module]
GO
ALTER TABLE [dbo].[Account_Right_Detail]  WITH NOCHECK ADD  CONSTRAINT [FK_Account_Right_Detail_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Account_Right_Detail] CHECK CONSTRAINT [FK_Account_Right_Detail_Account]
GO
ALTER TABLE [dbo].[Account_Right_Detail]  WITH NOCHECK ADD  CONSTRAINT [FK_Account_Right_Detail_Account_Right] FOREIGN KEY([RightID])
REFERENCES [dbo].[Account_Right] ([ID])
GO
ALTER TABLE [dbo].[Account_Right_Detail] CHECK CONSTRAINT [FK_Account_Right_Detail_Account_Right]
GO
ALTER TABLE [dbo].[Activity]  WITH NOCHECK ADD FOREIGN KEY([equipmentid])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[BacLuong_ThangLuong_MucLuong]  WITH NOCHECK ADD FOREIGN KEY([MaBacLuong])
REFERENCES [dbo].[BacLuong] ([MaBacLuong])
GO
ALTER TABLE [dbo].[BacLuong_ThangLuong_MucLuong]  WITH NOCHECK ADD FOREIGN KEY([MaThangLuong])
REFERENCES [dbo].[ThangLuong] ([MaThangLuong])
GO
ALTER TABLE [dbo].[BangCap_GiayChungNhan]  WITH NOCHECK ADD FOREIGN KEY([MaChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([MaChuyenNganh])
GO
ALTER TABLE [dbo].[BangCap_GiayChungNhan]  WITH NOCHECK ADD  CONSTRAINT [FK_BangCap_TrinhDo] FOREIGN KEY([MaTrinhDo])
REFERENCES [dbo].[TrinhDo] ([MaTrinhDo])
GO
ALTER TABLE [dbo].[BangCap_GiayChungNhan] CHECK CONSTRAINT [FK_BangCap_TrinhDo]
GO
ALTER TABLE [dbo].[BangCap_GiayChungNhan]  WITH NOCHECK ADD  CONSTRAINT [FK_BangCap_Truong] FOREIGN KEY([MaTruong])
REFERENCES [dbo].[Truong] ([MaTruong])
GO
ALTER TABLE [dbo].[BangCap_GiayChungNhan] CHECK CONSTRAINT [FK_BangCap_Truong]
GO
ALTER TABLE [dbo].[BaoCaoFile]  WITH NOCHECK ADD FOREIGN KEY([phanxuong_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Camera_Acceptance]  WITH NOCHECK ADD  CONSTRAINT [FK__Camera_Ac__docum__73501C2F] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
GO
ALTER TABLE [dbo].[Camera_Acceptance] CHECK CONSTRAINT [FK__Camera_Ac__docum__73501C2F]
GO
ALTER TABLE [dbo].[Camera_Acceptance]  WITH NOCHECK ADD  CONSTRAINT [FK__Camera_Ac__room___74444068] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Camera_Acceptance] CHECK CONSTRAINT [FK__Camera_Ac__room___74444068]
GO
ALTER TABLE [dbo].[CameraIncident]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Car]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[CarGPS]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Category_attribute_value]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Category_attribute_value]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_id])
REFERENCES [dbo].[Equipment_category] ([Equipment_category_id])
GO
ALTER TABLE [dbo].[Category_attribute_value]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_attribute_id])
REFERENCES [dbo].[Equipment_category_attribute] ([Equipment_category_attribute_id])
GO
ALTER TABLE [dbo].[ChamDut_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__ChamDut_N__MaQuy__0B91BA14] FOREIGN KEY([MaQuyetDinh])
REFERENCES [dbo].[QuyetDinh] ([MaQuyetDinh])
GO
ALTER TABLE [dbo].[ChamDut_NhanVien] CHECK CONSTRAINT [FK__ChamDut_N__MaQuy__0B91BA14]
GO
ALTER TABLE [dbo].[ChamDut_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK_ChamDut_NhanVien_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChamDut_NhanVien] CHECK CONSTRAINT [FK_ChamDut_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[ChiTiet_BangCap_GiayChungNhan]  WITH NOCHECK ADD FOREIGN KEY([MaBangCap_GiayChungNhan])
REFERENCES [dbo].[BangCap_GiayChungNhan] ([MaBangCap_GiayChungNhan])
GO
ALTER TABLE [dbo].[ChiTiet_BangCap_GiayChungNhan]  WITH NOCHECK ADD  CONSTRAINT [FK_ChiTiet_BangCap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChiTiet_BangCap_GiayChungNhan] CHECK CONSTRAINT [FK_ChiTiet_BangCap_NhanVien]
GO
ALTER TABLE [dbo].[ChiTiet_NhiemVu_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__ChiTiet_Nh__MaNV__1CBC4616] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChiTiet_NhiemVu_NhanVien] CHECK CONSTRAINT [FK__ChiTiet_Nh__MaNV__1CBC4616]
GO
ALTER TABLE [dbo].[ChiTiet_NhiemVu_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK_ChiTiet_NhiemVu_NhanVien_NhiemVu] FOREIGN KEY([MaNhiemVu])
REFERENCES [dbo].[NhiemVu] ([MaNhiemVu])
GO
ALTER TABLE [dbo].[ChiTiet_NhiemVu_NhanVien] CHECK CONSTRAINT [FK_ChiTiet_NhiemVu_NhanVien_NhiemVu]
GO
ALTER TABLE [dbo].[ChungChi_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaChungChi])
REFERENCES [dbo].[ChungChi] ([MaChungChi])
GO
ALTER TABLE [dbo].[ChungChi_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__ChungChi_N__MaNV__1F98B2C1] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChungChi_NhanVien] CHECK CONSTRAINT [FK__ChungChi_N__MaNV__1F98B2C1]
GO
ALTER TABLE [dbo].[ChuyenNganh]  WITH NOCHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[Nganh] ([MaNganh])
GO
ALTER TABLE [dbo].[CongTacAnToan]  WITH NOCHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[CongViec]  WITH NOCHECK ADD  CONSTRAINT [FK_CongViec_ThangLuong] FOREIGN KEY([MaThangLuong])
REFERENCES [dbo].[ThangLuong] ([MaThangLuong])
GO
ALTER TABLE [dbo].[CongViec] CHECK CONSTRAINT [FK_CongViec_ThangLuong]
GO
ALTER TABLE [dbo].[CongViec_NhomCongViec]  WITH NOCHECK ADD FOREIGN KEY([MaCongViec])
REFERENCES [dbo].[CongViec] ([MaCongViec])
GO
ALTER TABLE [dbo].[CongViec_NhomCongViec]  WITH NOCHECK ADD FOREIGN KEY([MaNhomCongViec])
REFERENCES [dbo].[NhomCongViec] ([MaNhomCongViec])
GO
ALTER TABLE [dbo].[DiemDanh_NangSuatLaoDong]  WITH NOCHECK ADD  CONSTRAINT [FK_DiemDanh_NangSuatLaoDong_Header_DiemDanh_NangSuat_LaoDong] FOREIGN KEY([HeaderID])
REFERENCES [dbo].[Header_DiemDanh_NangSuat_LaoDong] ([HeaderID])
GO
ALTER TABLE [dbo].[DiemDanh_NangSuatLaoDong] CHECK CONSTRAINT [FK_DiemDanh_NangSuatLaoDong_Header_DiemDanh_NangSuat_LaoDong]
GO
ALTER TABLE [dbo].[DiemDanh_NangSuatLaoDong]  WITH NOCHECK ADD  CONSTRAINT [FK_DiemDanh_NangSuatLaoDong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DiemDanh_NangSuatLaoDong] CHECK CONSTRAINT [FK_DiemDanh_NangSuatLaoDong_NhanVien]
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaBacLuong_ThangLuong_MucLuongMoi])
REFERENCES [dbo].[BacLuong_ThangLuong_MucLuong] ([MaBacLuong_ThangLuong_MucLuong])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaBacLuong_ThangLuong_MucLuongCu])
REFERENCES [dbo].[BacLuong_ThangLuong_MucLuong] ([MaBacLuong_ThangLuong_MucLuong])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaChucVuMoi])
REFERENCES [dbo].[CongViec] ([MaCongViec])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaChucVuCu])
REFERENCES [dbo].[CongViec] ([MaCongViec])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaDonViMoi])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaDonViCu])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaQuyetDinh])
REFERENCES [dbo].[QuyetDinh] ([MaQuyetDinh])
GO
ALTER TABLE [dbo].[DieuDong_NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[Documentary]  WITH NOCHECK ADD FOREIGN KEY([department_id_to])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary]  WITH NOCHECK ADD FOREIGN KEY([documentary_type])
REFERENCES [dbo].[DocumentaryType] ([documentary_type])
GO
ALTER TABLE [dbo].[Documentary_big_maintain_details]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_big_maintain_details]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_big_maintain_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__40F9A68C] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentary_big_maintain_details] CHECK CONSTRAINT [FK__Documenta__docum__40F9A68C]
GO
ALTER TABLE [dbo].[Documentary_big_maintain_details]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_camera_repair_details]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_camera_repair_details]  WITH NOCHECK ADD FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
GO
ALTER TABLE [dbo].[Documentary_camera_repair_details]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Documentary_Improve_Detail]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_Improve_Detail]  WITH NOCHECK ADD FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
GO
ALTER TABLE [dbo].[Documentary_Improve_Detail]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_liquidation_details]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_liquidation_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__42E1EEFE] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentary_liquidation_details] CHECK CONSTRAINT [FK__Documenta__docum__42E1EEFE]
GO
ALTER TABLE [dbo].[Documentary_liquidation_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__43D61338] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_liquidation_details] CHECK CONSTRAINT [FK__Documenta__equip__43D61338]
GO
ALTER TABLE [dbo].[Documentary_maintain_details]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_maintain_details]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_maintain_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__44CA3770] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentary_maintain_details] CHECK CONSTRAINT [FK__Documenta__docum__44CA3770]
GO
ALTER TABLE [dbo].[Documentary_maintain_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__45BE5BA9] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_maintain_details] CHECK CONSTRAINT [FK__Documenta__equip__45BE5BA9]
GO
ALTER TABLE [dbo].[Documentary_moveline_details]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_moveline_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__46B27FE2] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentary_moveline_details] CHECK CONSTRAINT [FK__Documenta__docum__46B27FE2]
GO
ALTER TABLE [dbo].[Documentary_moveline_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__47A6A41B] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_moveline_details] CHECK CONSTRAINT [FK__Documenta__equip__47A6A41B]
GO
ALTER TABLE [dbo].[Documentary_repair_details]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_repair_details]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_repair_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__489AC854] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentary_repair_details] CHECK CONSTRAINT [FK__Documenta__docum__489AC854]
GO
ALTER TABLE [dbo].[Documentary_repair_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__498EEC82] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_repair_details] CHECK CONSTRAINT [FK__Documenta__equip__498EEC82]
GO
ALTER TABLE [dbo].[Documentary_revoke_details]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Documentary_revoke_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__4A8310C6] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documentary_revoke_details] CHECK CONSTRAINT [FK__Documenta__docum__4A8310C6]
GO
ALTER TABLE [dbo].[Documentary_revoke_details]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__4B7734FA] FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Documentary_revoke_details] CHECK CONSTRAINT [FK__Documenta__equip__4B7734FA]
GO
ALTER TABLE [dbo].[Equipment]  WITH NOCHECK ADD FOREIGN KEY([current_Status])
REFERENCES [dbo].[Status] ([statusid])
GO
ALTER TABLE [dbo].[Equipment]  WITH NOCHECK ADD  CONSTRAINT [FK__Equipment__depar__625A9A57] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK__Equipment__depar__625A9A57]
GO
ALTER TABLE [dbo].[Equipment]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_id])
REFERENCES [dbo].[Equipment_category] ([Equipment_category_id])
GO
ALTER TABLE [dbo].[Equipment_attribute]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Equipment_category_attribute]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_id])
REFERENCES [dbo].[Equipment_category] ([Equipment_category_id])
GO
ALTER TABLE [dbo].[Equipment_Inspection]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Equipment_Insurance]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Equipment_SCTX]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Equipment_SCTX]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Equipment_SCTX_Detail]  WITH NOCHECK ADD FOREIGN KEY([maintain_id])
REFERENCES [dbo].[Equipment_SCTX] ([maintain_id])
GO
ALTER TABLE [dbo].[Equipment_SCTX_Detail]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[FakeAPI]  WITH NOCHECK ADD  CONSTRAINT [FK__FakeAPI__MaNV__40F9A68C] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[FakeAPI] CHECK CONSTRAINT [FK__FakeAPI__MaNV__40F9A68C]
GO
ALTER TABLE [dbo].[FileBaoCao]  WITH NOCHECK ADD FOREIGN KEY([baoCaoID])
REFERENCES [dbo].[BaoCaoFile] ([ID])
GO
ALTER TABLE [dbo].[FileBaoCao]  WITH NOCHECK ADD  CONSTRAINT [FK__FileBaoCa__nguoi__29AC2CE0] FOREIGN KEY([nguoinhap_id])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[FileBaoCao] CHECK CONSTRAINT [FK__FileBaoCa__nguoi__29AC2CE0]
GO
ALTER TABLE [dbo].[Fuel_activities_consumption]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Fuel_activities_consumption]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Fuel_activities_consumption]  WITH NOCHECK ADD FOREIGN KEY([fuel_type])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[GiayTo]  WITH NOCHECK ADD  CONSTRAINT [FK__GiayTo__MaNV__45BE5BA9] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[GiayTo] CHECK CONSTRAINT [FK__GiayTo__MaNV__45BE5BA9]
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail]  WITH NOCHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail]  WITH NOCHECK ADD  CONSTRAINT [FK_Header_DiemDanh_NangSuat_LaoDong_Detail_Header_DiemDanh_NangSuat_LaoDong] FOREIGN KEY([HeaderID])
REFERENCES [dbo].[Header_DiemDanh_NangSuat_LaoDong] ([HeaderID])
GO
ALTER TABLE [dbo].[Header_DiemDanh_NangSuat_LaoDong_Detail] CHECK CONSTRAINT [FK_Header_DiemDanh_NangSuat_LaoDong_Detail_Header_DiemDanh_NangSuat_LaoDong]
GO
ALTER TABLE [dbo].[header_KeHoach_TieuChi_TheoNam]  WITH NOCHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[header_KeHoach_TieuChi_TheoNgay]  WITH NOCHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[header_KeHoachTungThang]  WITH NOCHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[header_KeHoachTungThang]  WITH NOCHECK ADD FOREIGN KEY([ThangID])
REFERENCES [dbo].[KeHoachTungThang] ([ThangID])
GO
ALTER TABLE [dbo].[header_ThucHienTheoNgay]  WITH NOCHECK ADD FOREIGN KEY([NgayID])
REFERENCES [dbo].[ThucHienTheoNgay] ([NgayID])
GO
ALTER TABLE [dbo].[header_ThucHienTheoNgay]  WITH NOCHECK ADD  CONSTRAINT [FK_header_ThucHienTheoNgay_Department] FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[header_ThucHienTheoNgay] CHECK CONSTRAINT [FK_header_ThucHienTheoNgay_Department]
GO
ALTER TABLE [dbo].[HoSo]  WITH NOCHECK ADD  CONSTRAINT [FK__HoSo__MaNV__46B27FE2] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoSo] CHECK CONSTRAINT [FK__HoSo__MaNV__46B27FE2]
GO
ALTER TABLE [dbo].[Important_Documentary]  WITH NOCHECK ADD  CONSTRAINT [FK__Important__docum__38EE7070] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
GO
ALTER TABLE [dbo].[Important_Documentary] CHECK CONSTRAINT [FK__Important__docum__38EE7070]
GO
ALTER TABLE [dbo].[Important_Documentary]  WITH NOCHECK ADD  CONSTRAINT [FK_Important_Documentary_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Important_Documentary] CHECK CONSTRAINT [FK_Important_Documentary_Account]
GO
ALTER TABLE [dbo].[Incident]  WITH NOCHECK ADD  CONSTRAINT [FK__Incident__depart__6FB49575] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK__Incident__depart__6FB49575]
GO
ALTER TABLE [dbo].[Incident]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoNam]  WITH NOCHECK ADD FOREIGN KEY([HeaderID])
REFERENCES [dbo].[header_KeHoach_TieuChi_TheoNam] ([HeaderID])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoNam]  WITH NOCHECK ADD FOREIGN KEY([MaTieuChi])
REFERENCES [dbo].[TieuChi] ([MaTieuChi])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoNgay]  WITH NOCHECK ADD FOREIGN KEY([HeaderID])
REFERENCES [dbo].[header_KeHoach_TieuChi_TheoNgay] ([HeaderID])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoNgay]  WITH NOCHECK ADD FOREIGN KEY([MaTieuChi])
REFERENCES [dbo].[TieuChi] ([MaTieuChi])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoThang]  WITH NOCHECK ADD  CONSTRAINT [FK_KeHoach_TieuChi_TheoThang_header_KeHoachTungThang] FOREIGN KEY([HeaderID])
REFERENCES [dbo].[header_KeHoachTungThang] ([HeaderID])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoThang] CHECK CONSTRAINT [FK_KeHoach_TieuChi_TheoThang_header_KeHoachTungThang]
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoThang]  WITH NOCHECK ADD  CONSTRAINT [FK_KeHoach_TieuChi_TheoThang_TieuChi] FOREIGN KEY([MaTieuChi])
REFERENCES [dbo].[TieuChi] ([MaTieuChi])
GO
ALTER TABLE [dbo].[KeHoach_TieuChi_TheoThang] CHECK CONSTRAINT [FK_KeHoach_TieuChi_TheoThang_TieuChi]
GO
ALTER TABLE [dbo].[LichSuBoSungSYLL]  WITH NOCHECK ADD  CONSTRAINT [FK__LichSuBoSu__MaNV__4D5F7D71] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[LichSuBoSungSYLL] CHECK CONSTRAINT [FK__LichSuBoSu__MaNV__4D5F7D71]
GO
ALTER TABLE [dbo].[Maintain_Car]  WITH NOCHECK ADD  CONSTRAINT [FK__Maintain___depar__76619304] FOREIGN KEY([departmentid])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Maintain_Car] CHECK CONSTRAINT [FK__Maintain___depar__76619304]
GO
ALTER TABLE [dbo].[Maintain_Car]  WITH NOCHECK ADD FOREIGN KEY([equipmentid])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Maintain_Car_Detail]  WITH NOCHECK ADD FOREIGN KEY([maintainid])
REFERENCES [dbo].[Maintain_Car] ([maintainid])
GO
ALTER TABLE [dbo].[Maintain_Car_Detail]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[MealRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK__MealRegis__depar__7A3223E8] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[MealRegistration] CHECK CONSTRAINT [FK__MealRegis__depar__7A3223E8]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD FOREIGN KEY([MaBacLuong_ThangLuong_MucLuong])
REFERENCES [dbo].[BacLuong_ThangLuong_MucLuong] ([MaBacLuong_ThangLuong_MucLuong])
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__NhanVien__MaChuy__531856C7] FOREIGN KEY([MaChuyenNganh])
REFERENCES [dbo].[ChuyenNganh] ([MaChuyenNganh])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaChuy__531856C7]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__NhanVien__MaPhon__793DFFAF] FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaPhon__793DFFAF]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__NhanVien__MaTran__540C7B00] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaTran__540C7B00]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__NhanVien__MaTrin__55009F39] FOREIGN KEY([MaTrinhDo])
REFERENCES [dbo].[TrinhDo] ([MaTrinhDo])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaTrin__55009F39]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__NhanVien__MaTruo__55F4C372] FOREIGN KEY([MaTruong])
REFERENCES [dbo].[Truong] ([MaTruong])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaTruo__55F4C372]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__NhanVien__MaUyQu__56E8E7AB] FOREIGN KEY([MaUyQuyen])
REFERENCES [dbo].[NguoiUyQuyenLayHoSo_BaoHiem] ([MaUyQuyen])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaUyQu__56E8E7AB]
GO
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK_NhanVien_CongViec] FOREIGN KEY([MaCongViec])
REFERENCES [dbo].[CongViec] ([MaCongViec])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_CongViec]
GO
ALTER TABLE [dbo].[NhiemVu]  WITH NOCHECK ADD  CONSTRAINT [FK_NhiemVu_ChungChi] FOREIGN KEY([MaChungChi])
REFERENCES [dbo].[ChungChi] ([MaChungChi])
GO
ALTER TABLE [dbo].[NhiemVu] CHECK CONSTRAINT [FK_NhiemVu_ChungChi]
GO
ALTER TABLE [dbo].[NhomCongViec]  WITH NOCHECK ADD FOREIGN KEY([MaDienCongViec])
REFERENCES [dbo].[DienCongViec] ([MaDienCongViec])
GO
ALTER TABLE [dbo].[PhongBan_TieuChi]  WITH NOCHECK ADD FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[PhongBan_TieuChi]  WITH NOCHECK ADD FOREIGN KEY([MaTieuChi])
REFERENCES [dbo].[TieuChi] ([MaTieuChi])
GO
ALTER TABLE [dbo].[PhongBan_TieuChi_TheoNam]  WITH NOCHECK ADD  CONSTRAINT [FK_PhongBan_TieuChi_TheoNam_Department] FOREIGN KEY([MaPhongBan])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[PhongBan_TieuChi_TheoNam] CHECK CONSTRAINT [FK_PhongBan_TieuChi_TheoNam_Department]
GO
ALTER TABLE [dbo].[PhongBan_TieuChi_TheoNam]  WITH NOCHECK ADD  CONSTRAINT [FK_PhongBan_TieuChi_TheoNam_TieuChi] FOREIGN KEY([MaTieuChi])
REFERENCES [dbo].[TieuChi] ([MaTieuChi])
GO
ALTER TABLE [dbo].[PhongBan_TieuChi_TheoNam] CHECK CONSTRAINT [FK_PhongBan_TieuChi_TheoNam_TieuChi]
GO
ALTER TABLE [dbo].[QuanHeGiaDinh]  WITH NOCHECK ADD  CONSTRAINT [FK__QuanHeGiaD__MaNV__5AB9788F] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[QuanHeGiaDinh] CHECK CONSTRAINT [FK__QuanHeGiaD__MaNV__5AB9788F]
GO
ALTER TABLE [dbo].[QuaTrinhCongTac]  WITH NOCHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[Room]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Room_Status]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Supply_DiKem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_DiKem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Big_Maintain_Equipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_big_maintain_id])
REFERENCES [dbo].[Documentary_big_maintain_details] ([documentary_big_maintain_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Big_Maintain_Equipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Big_Maintain_Equipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Camera]  WITH NOCHECK ADD FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Camera]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Camera]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Equipment]  WITH NOCHECK ADD  CONSTRAINT [FK__Supply_Do__docum__671F4F74] FOREIGN KEY([documentary_id])
REFERENCES [dbo].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supply_Documentary_Equipment] CHECK CONSTRAINT [FK__Supply_Do__docum__671F4F74]
GO
ALTER TABLE [dbo].[Supply_Documentary_Equipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Equipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId_dikem])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Equipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Improve_Equipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_improve_id])
REFERENCES [dbo].[Documentary_Improve_Detail] ([documentary_improve_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Improve_Equipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Improve_Equipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Maintain_Equipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_maintain_id])
REFERENCES [dbo].[Documentary_maintain_details] ([documentary_maintain_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Maintain_Equipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Maintain_Equipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Repair_Equipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_repair_id])
REFERENCES [dbo].[Documentary_repair_details] ([documentary_repair_id])
GO
ALTER TABLE [dbo].[Supply_Documentary_Repair_Equipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Documentary_Repair_Equipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_Equipment_DiKem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Equipment_DiKem]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_SCTX]  WITH NOCHECK ADD FOREIGN KEY([equipmentId_dikem])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_SCTX]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_SCTX]  WITH NOCHECK ADD FOREIGN KEY([equipmentId_dikem])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_SCTX]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Supply_tieuhao]  WITH NOCHECK ADD  CONSTRAINT [FK__Supply_ti__depar__078C1F06] FOREIGN KEY([departmentid])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Supply_tieuhao] CHECK CONSTRAINT [FK__Supply_ti__depar__078C1F06]
GO
ALTER TABLE [dbo].[Supply_tieuhao]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[SupplyPlan]  WITH NOCHECK ADD  CONSTRAINT [FK__SupplyPla__depar__09746778] FOREIGN KEY([departmentid])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[SupplyPlan] CHECK CONSTRAINT [FK__SupplyPla__depar__09746778]
GO
ALTER TABLE [dbo].[SupplyPlan]  WITH NOCHECK ADD  CONSTRAINT [FK__SupplyPla__depar__0A688BB1] FOREIGN KEY([departmentid])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[SupplyPlan] CHECK CONSTRAINT [FK__SupplyPla__depar__0A688BB1]
GO
ALTER TABLE [dbo].[SupplyPlan]  WITH NOCHECK ADD FOREIGN KEY([equipmentid])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[SupplyPlan]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[SupplyPlan]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [dbo].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[TaiNan]  WITH NOCHECK ADD  CONSTRAINT [FK__TaiNan__MaNV__662B2B3B] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiNan] CHECK CONSTRAINT [FK__TaiNan__MaNV__662B2B3B]
GO
ALTER TABLE [dbo].[ThucHien_TieuChi_TheoNgay]  WITH NOCHECK ADD FOREIGN KEY([MaTieuChi])
REFERENCES [dbo].[TieuChi] ([MaTieuChi])
GO
ALTER TABLE [dbo].[ThucHien_TieuChi_TheoNgay]  WITH NOCHECK ADD  CONSTRAINT [FK_ThucHien_TieuChi_TheoNgay_header_ThucHienTheoNgay] FOREIGN KEY([HeaderID])
REFERENCES [dbo].[header_ThucHienTheoNgay] ([HeaderID])
GO
ALTER TABLE [dbo].[ThucHien_TieuChi_TheoNgay] CHECK CONSTRAINT [FK_ThucHien_TieuChi_TheoNgay_header_ThucHienTheoNgay]
GO
ALTER TABLE [dbo].[TieuChi]  WITH NOCHECK ADD  CONSTRAINT [FK_TieuChi_NhomTieuChi] FOREIGN KEY([MaNhomTieuChi])
REFERENCES [dbo].[NhomTieuChi] ([MaNhomTieuChi])
GO
ALTER TABLE [dbo].[TieuChi] CHECK CONSTRAINT [FK_TieuChi_NhomTieuChi]
GO
ALTER TABLE [dbo].[TuyenDung_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK__TuyenDung__MaQuy__4D5F7D71] FOREIGN KEY([MaQuyetDinh])
REFERENCES [dbo].[QuyetDinh] ([MaQuyetDinh])
GO
ALTER TABLE [dbo].[TuyenDung_NhanVien] CHECK CONSTRAINT [FK__TuyenDung__MaQuy__4D5F7D71]
GO
ALTER TABLE [dbo].[TuyenDung_NhanVien]  WITH NOCHECK ADD  CONSTRAINT [FK_TuyenDung_NhanVien_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TuyenDung_NhanVien] CHECK CONSTRAINT [FK_TuyenDung_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[Vattu_Dikem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Vattu_Dikem]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [dbo].[Supply] ([supply_id])
GO
