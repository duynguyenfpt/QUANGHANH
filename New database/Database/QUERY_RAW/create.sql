USE [master]
GO
/****** Object:  Database [QuangHanhManufacturing]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE DATABASE [QuangHanhManufacturing]
GO
USE [QuangHanhManufacturing]
GO
/****** Object:  Schema [Account]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [Account]
GO
/****** Object:  Schema [Camera]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [Camera]
GO
/****** Object:  Schema [Documentary]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [Documentary]
GO
/****** Object:  Schema [Equipment]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [Equipment]
GO
/****** Object:  Schema [General]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [General]
GO
/****** Object:  Schema [HumanResources]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [HumanResources]
GO
/****** Object:  Schema [Manufacturing]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [Manufacturing]
GO
/****** Object:  Schema [Supply]    Script Date: 12/2/2020 11:23:02 PM ******/
CREATE SCHEMA [Supply]
GO
/****** Object:  Table [Account].[Account]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Account].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Position] [nvarchar](100) NULL,
	[Role] [int] NULL,
	[NVID] [nvarchar](100) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Account].[Account_Right]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Account].[Account_Right](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [nvarchar](50) NULL,
	[GroupID] [int] NULL,
	[Right] [nvarchar](70) NULL,
	[isBasic] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Account].[Account_Right_Detail]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Account].[Account_Right_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[RightID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[RightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Account].[Module]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Account].[Module](
	[ID] [nvarchar](50) NOT NULL,
	[Module] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Account].[Role]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Account].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Camera].[Acceptance]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Camera].[Acceptance](
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
/****** Object:  Table [Camera].[Incident]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Camera].[Incident](
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
/****** Object:  Table [Camera].[Room]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Camera].[Room](
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
/****** Object:  Table [Camera].[Status]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Camera].[Status](
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
/****** Object:  Table [dbo].[Supply_DiKem]    Script Date: 12/2/2020 11:23:02 PM ******/
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
/****** Object:  Table [dbo].[Supply_Equipment_DiKem]    Script Date: 12/2/2020 11:23:02 PM ******/
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
/****** Object:  Table [dbo].[Vattu_Dikem]    Script Date: 12/2/2020 11:23:02 PM ******/
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
/****** Object:  Table [Documentary].[BigMaintainDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[BigMaintainDetails](
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
/****** Object:  Table [Documentary].[CameraRepairDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[CameraRepairDetails](
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
/****** Object:  Table [Documentary].[Documentary]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[Documentary](
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
/****** Object:  Table [Documentary].[DocumentaryType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[DocumentaryType](
	[documentary_type] [int] IDENTITY(1,1) NOT NULL,
	[documentary_name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[documentary_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Documentary].[Important_Documentary]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[Important_Documentary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[documentary_id] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Important_Documentary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Documentary].[ImproveDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[ImproveDetails](
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
/****** Object:  Table [Documentary].[LiquidationDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[LiquidationDetails](
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
/****** Object:  Table [Documentary].[MaintainDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[MaintainDetails](
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
/****** Object:  Table [Documentary].[MovelineDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[MovelineDetails](
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
/****** Object:  Table [Documentary].[RepairDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[RepairDetails](
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
/****** Object:  Table [Documentary].[RevokeDetails]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Documentary].[RevokeDetails](
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
/****** Object:  Table [Equipment].[Acceptance]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Acceptance](
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
/****** Object:  Table [Equipment].[Activity]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Activity](
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
/****** Object:  Table [Equipment].[Attribute]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Attribute](
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
/****** Object:  Table [Equipment].[Car]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Car](
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
/****** Object:  Table [Equipment].[CarGPS]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[CarGPS](
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
/****** Object:  Table [Equipment].[CarMaintenance]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[CarMaintenance](
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
/****** Object:  Table [Equipment].[CarMaintenanceDetail]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[CarMaintenanceDetail](
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
/****** Object:  Table [Equipment].[Category]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Category](
	[Equipment_category_id] [nvarchar](150) NOT NULL,
	[Equipment_category_name] [nvarchar](150) NOT NULL,
	[divce_type] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Equipment_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Equipment].[CategoryAttribute]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[CategoryAttribute](
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
/****** Object:  Table [Equipment].[CategoryAttributeValue]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[CategoryAttributeValue](
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
/****** Object:  Table [Equipment].[Equipment]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Equipment](
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
/****** Object:  Table [Equipment].[FuelActivitiesConsumption]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[FuelActivitiesConsumption](
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
/****** Object:  Table [Equipment].[Incident]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Incident](
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
/****** Object:  Table [Equipment].[Inspection]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Inspection](
	[inspect_id] [int] IDENTITY(1,1) NOT NULL,
	[equipmentId] [nvarchar](150) NOT NULL,
	[inspect_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inspect_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Equipment].[Insurance]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Insurance](
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
/****** Object:  Table [Equipment].[RepairRegularly]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[RepairRegularly](
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
/****** Object:  Table [Equipment].[RepairRegularlyDetail]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[RepairRegularlyDetail](
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
/****** Object:  Table [Equipment].[Status]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Equipment].[Status](
	[statusid] [int] NOT NULL,
	[statusname] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [General].[Department]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [General].[Department](
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
/****** Object:  Table [General].[Notification]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [General].[Notification](
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
/****** Object:  Table [General].[UserActionLog]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [General].[UserActionLog](
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
/****** Object:  Table [HumanResources].[AdditionalHistoryResume]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[AdditionalHistoryResume](
	[additional_history_resume_id] [int] IDENTITY(1,1) NOT NULL,
	[additional_history_resume_year] [nvarchar](100) NULL,
	[note] [nvarchar](max) NULL,
	[records_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[additional_history_resume_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Career]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Career](
	[career_id] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[career_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Decision]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Decision](
	[decision_id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](100) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[decision_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[DurationType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[DurationType](
	[duration_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[duration_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[EducationLevel]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[EducationLevel](
	[education_level_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[education_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Employee]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Employee](
	[employee_id] [nvarchar](100) NOT NULL,
	[BASIC_INFO_full_name] [nvarchar](100) NULL,
	[BASIC_INFO_other_name] [nvarchar](100) NULL,
	[BASIC_INFO_gender] [nvarchar](100) NULL,
	[BASIC_INFO_date_of_birth] [date] NULL,
	[BASIC_INFO_place_of_birth] [nvarchar](100) NULL,
	[BASIC_INFO_nation] [nvarchar](100) NULL,
	[BASIC_INFO_home_town] [nvarchar](100) NULL,
	[BASIC_INFO_religion] [nvarchar](100) NULL,
	[BASIC_INFO_registered_place_of_permanent_residence] [nvarchar](100) NULL,
	[BASIC_INFO_current_residence] [nvarchar](100) NULL,
	[BASIC_INFO_phone_number] [nvarchar](100) NULL,
	[BASIC_INFO_wounded_class] [nvarchar](100) NULL,
	[BASIC_INFO_policy_family_child] [nvarchar](100) NULL,
	[BASIC_INFO_identity_card] [nvarchar](100) NULL,
	[BASIC_INFO_date_of_issuance_of_identity_card] [datetime] NULL,
	[BASIC_INFO_social_insurance_number] [nvarchar](100) NULL,
	[RECRUITMENT_profession] [nvarchar](100) NULL,
	[RECRUITMENT_date] [date] NULL,
	[RECRUITMENT_company] [nvarchar](100) NULL,
	[JOB_instant_position] [nvarchar](100) NULL,
	[JOB_work] [nvarchar](100) NULL,
	[JOB_civil_servants] [nvarchar](100) NULL,
	[JOB_code_ranks] [nvarchar](100) NULL,
	[JOB_pay_rate] [nvarchar](100) NULL,
	[JOB_coefficients_salary] [nvarchar](100) NULL,
	[JOB_date] [date] NULL,
	[JOB_position_allowance] [nvarchar](100) NULL,
	[JOB_other_allowances] [nvarchar](100) NULL,
	[JOB_forte_of_work] [nvarchar](100) NULL,
	[ACADEMIC_academic_level] [nvarchar](100) NULL,
	[ACADEMIC_highest_qualification] [nvarchar](100) NULL,
	[ACADEMIC_political_theory] [nvarchar](100) NULL,
	[ACADEMIC_state_management] [nvarchar](100) NULL,
	[ACADEMIC_languages] [nvarchar](100) NULL,
	[ACADEMIC_information_technology] [nvarchar](100) NULL,
	[PARTY_day_on_VCP] [date] NULL,
	[PARTY_official_date] [date] NULL,
	[PARTY_date_of_joining_political_social_organization] [date] NULL,
	[PARTY_date_of_enlistment] [date] NULL,
	[PARTY_date_of_discharge] [date] NULL,
	[PARTY_highest_rank] [nvarchar](100) NULL,
	[PARTY_highest_achieved_title] [nvarchar](100) NULL,
	[EVALUATION_bonus] [nvarchar](max) NULL,
	[EVALUATION_discipline] [nvarchar](max) NULL,
	[HEALTH_health_condition] [nvarchar](max) NULL,
	[HEALTH_height] [nvarchar](100) NULL,
	[HEALTH_weight] [nvarchar](100) NULL,
	[HEALTH_blood_group] [nvarchar](100) NULL,
	[PERSONAL_HISTORY_detail] [nvarchar](max) NULL,
	[PERSONAL_HISTORY_related_organization] [nvarchar](max) NULL,
	[PERSONAL_HISTORY_relatives] [nvarchar](max) NULL,
	[current_status_id] [int] NULL,
	[current_department_id] [nvarchar](150) NULL,
	[current_salary_id] [int] NULL,
	[current_work_id] [int] NULL,
 CONSTRAINT [PK__Employee__C52E0BA845BE5BA9] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[EmployeeTask]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[EmployeeTask](
	[employee_id] [nvarchar](100) NOT NULL,
	[task_id] [int] NOT NULL,
	[received_date] [date] NULL,
	[is_in_process] [bit] NULL,
	[is_updated] [bit] NULL,
	[last_time_updated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[task_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Family]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Family](
	[full_name] [nvarchar](100) NULL,
	[date_of_birth] [date] NULL,
	[background] [nvarchar](max) NULL,
	[permanent_address] [nvarchar](max) NULL,
	[phone_number] [nvarchar](100) NULL,
	[employee_id] [nvarchar](100) NOT NULL,
	[family_type_id] [int] NOT NULL,
	[family_relationship_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[family_type_id] ASC,
	[family_relationship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[FamilyRelationship]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[FamilyRelationship](
	[family_relationship_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[family_relationship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[FamilyType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[FamilyType](
	[family_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[family_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Papers]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Papers](
	[papers_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[papers_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[papers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[PapersStorageType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[PapersStorageType](
	[papers_storage_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[papers_storage_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[PapersType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[PapersType](
	[papers_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[is_trained_papers] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[papers_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[PayRate]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[PayRate](
	[pay_rate_id] [int] IDENTITY(1,1) NOT NULL,
	[pay_rate] [nvarchar](100) NULL,
	[applied_year] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pay_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[PayTable]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[PayTable](
	[pay_table_id] [int] IDENTITY(1,1) NOT NULL,
	[pay_table] [nvarchar](100) NULL,
	[applied_year] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pay_table_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Qualification]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Qualification](
	[qualification_id] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[qualification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Records]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Records](
	[records_id] [int] IDENTITY(1,1) NOT NULL,
	[records_status_id] [int] NULL,
	[received_date] [date] NULL,
	[delivery_employee_id] [nvarchar](100) NULL,
	[handover_employee_id] [nvarchar](100) NULL,
	[management_employee_id] [nvarchar](100) NULL,
	[employee_id] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[records_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[RecordsGettingAuthorize]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[RecordsGettingAuthorize](
	[records_getting_authorize_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NULL,
	[identity_card_number] [nvarchar](100) NULL,
	[phone_number] [nvarchar](100) NULL,
	[permanent_address] [nvarchar](100) NULL,
	[records_id] [int] NULL,
	[family_relationship_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[records_getting_authorize_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[RecordsPapers]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[RecordsPapers](
	[records_papers_id] [int] IDENTITY(1,1) NOT NULL,
	[school_id] [nvarchar](100) NULL,
	[specializations_id] [int] NULL,
	[career_id] [nvarchar](100) NULL,
	[date_start] [date] NULL,
	[date_end] [date] NULL,
	[trained_forms] [nvarchar](100) NULL,
	[papers_number] [nvarchar](100) NULL,
	[papers_id] [int] NOT NULL,
	[papers_storage_type_id] [int] NULL,
	[qualification_id] [nvarchar](100) NULL,
	[duration] [nvarchar](100) NULL,
	[duration_type_id] [int] NULL,
	[received_date] [date] NULL,
	[given_date] [date] NULL,
	[records_id] [int] NULL,
 CONSTRAINT [PK__RecordsP__03F52FB105B529D2] PRIMARY KEY CLUSTERED 
(
	[records_papers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[RecordsStatus]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[RecordsStatus](
	[records_status_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[records_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Recruitment]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Recruitment](
	[decision_id] [int] NOT NULL,
	[employee_id] [nvarchar](100) NOT NULL,
	[recruitment_date] [date] NULL,
	[work_id] [int] NULL,
	[department_id] [nvarchar](150) NULL,
	[qualification_id] [nvarchar](100) NULL,
	[specializations_id] [int] NULL,
	[salary_id] [int] NULL,
 CONSTRAINT [PK__Recruitm__E334A9D6B541EA9A] PRIMARY KEY CLUSTERED 
(
	[decision_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Salary]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Salary](
	[salary_id] [int] IDENTITY(1,1) NOT NULL,
	[salary_number] [nvarchar](100) NULL,
	[applied_year] [nvarchar](100) NOT NULL,
	[pay_rate_id] [int] NULL,
	[pay_table_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[SalaryProcess]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[SalaryProcess](
	[salary_process_id] [int] IDENTITY(1,1) NOT NULL,
	[code_ranks] [nvarchar](100) NULL,
	[coefficients_salary] [nvarchar](100) NULL,
	[employee_id] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[salary_process_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[School]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[School](
	[school_id] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK__School__27CA6CF47A9881C2] PRIMARY KEY CLUSTERED 
(
	[school_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Specializations]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Specializations](
	[specializations_id] [int] IDENTITY(1,1) NOT NULL,
	[specializations_number] [nvarchar](100) NULL,
	[name] [nvarchar](max) NULL,
	[career_id] [nvarchar](100) NULL,
	[education_level_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[specializations_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[career_id] ASC,
	[specializations_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Status]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Task]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Task](
	[task_id] [int] IDENTITY(1,1) NOT NULL,
	[task_name] [nvarchar](100) NULL,
	[task_type_id] [int] NULL,
	[papers_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[task_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[TaskType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[TaskType](
	[task_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[task_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Termination]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Termination](
	[decision_id] [int] NOT NULL,
	[employee_id] [nvarchar](100) NOT NULL,
	[termination_type_id] [int] NULL,
	[terminate_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[decision_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[TerminationType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[TerminationType](
	[termination_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[termination_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Transfer]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Transfer](
	[decision_id] [int] NOT NULL,
	[employee_id] [nvarchar](100) NOT NULL,
	[transfer_reason] [nvarchar](100) NULL,
	[new_department_id] [nvarchar](150) NULL,
	[new_work_id] [int] NULL,
	[old_department_id] [nvarchar](150) NULL,
	[old_work_id] [int] NULL,
	[new_salary_id] [int] NULL,
	[old_salary_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[decision_id] ASC,
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Work]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Work](
	[work_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[allowance] [nvarchar](100) NULL,
	[pay_table_id] [int] NULL,
 CONSTRAINT [PK__Work__110F4747F3939D1A] PRIMARY KEY CLUSTERED 
(
	[work_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[WorkGroup]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[WorkGroup](
	[work_group_id] [int] IDENTITY(1,1) NOT NULL,
	[acronym] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[work_group_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[work_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[WorkGroupType]    Script Date: 12/2/2020 11:23:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[WorkGroupType](
	[work_group_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[work_group_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[WorkingProcess]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[WorkingProcess](
	[working_process_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[position] [nvarchar](100) NULL,
	[office] [nvarchar](100) NULL,
	[date_start] [date] NULL,
	[date_end] [date] NULL,
	[employee_id] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[working_process_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[WorkWorkGroup]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[WorkWorkGroup](
	[work_id] [int] NOT NULL,
	[work_group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[work_id] ASC,
	[work_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[AbsenceReason]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[AbsenceReason](
	[absence_reason_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[absence_reason_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[absence_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[AbsenceReasonType]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[AbsenceReasonType](
	[absence_reason_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[absence_reason_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[Criteria]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[Criteria](
	[criteria_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[measure_unit_id] [int] NULL,
	[criteria_group_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[criteria_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[CriteriaGroup]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[CriteriaGroup](
	[criteria_group_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[criteria_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[DepartmentAttendanceAndProductivity]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[DepartmentAttendanceAndProductivity](
	[header_attendance_and_productivity_id] [int] NOT NULL,
	[total_effort] [nvarchar](100) NULL,
	[total_mined_coal] [nvarchar](100) NULL,
	[total_mined_meter] [nvarchar](100) NULL,
	[total_cropped_meter] [nvarchar](100) NULL,
	[note] [nvarchar](100) NULL,
	[is_filled_from_api] [bit] NULL,
	[department_id] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[header_attendance_and_productivity_id] ASC,
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[DepartmentCriteriaByMonth]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[DepartmentCriteriaByMonth](
	[criteria_id] [int] NULL,
	[department_id] [nvarchar](150) NULL,
	[month] [nvarchar](100) NULL,
	[year] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[DepartmentCriteriaByYear]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[DepartmentCriteriaByYear](
	[criteria_id] [int] NULL,
	[department_id] [nvarchar](150) NULL,
	[year] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[EmployeeAttendanceAndProductivity]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[EmployeeAttendanceAndProductivity](
	[employee_id] [nvarchar](100) NOT NULL,
	[header_attendance_and_productivity_id] [int] NOT NULL,
	[real_time_attendance] [datetime] NULL,
	[productivity_point] [nvarchar](100) NULL,
	[do_work] [bit] NULL,
	[note] [nvarchar](max) NULL,
	[absence_reason_id] [int] NULL,
	[down_time] [datetime] NULL,
	[up_time] [datetime] NULL,
	[is_changed_manually] [bit] NULL,
	[actual_header_fetched] [int] NULL,
	[is_filled_from_api] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[header_attendance_and_productivity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[FakeAPI]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[FakeAPI](
	[employee_id] [nvarchar](100) NOT NULL,
	[attendance_date] [date] NULL,
	[shifts_id] [int] NOT NULL,
	[attendance_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC,
	[shifts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[File]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[File](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[report_file_id] [int] NULL,
	[file_name] [nvarchar](1000) NULL,
	[file_name_display] [nvarchar](1000) NULL,
	[account_id] [int] NULL,
	[uploaded_time] [datetime] NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[HeaderAttendanceAndProductivity]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[HeaderAttendanceAndProductivity](
	[header_attendance_and_productivity_id] [int] IDENTITY(1,1) NOT NULL,
	[attendance_date] [date] NULL,
	[shifts_id] [int] NULL,
	[is_created_manually] [bit] NULL,
	[status] [nvarchar](100) NULL,
	[message] [nvarchar](max) NULL,
	[fetch_data_time] [datetime] NULL,
	[version] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[header_attendance_and_productivity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[HeaderPlanManufacturingByMonth]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[HeaderPlanManufacturingByMonth](
	[header_plan_manufacturing_by_month_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [nvarchar](150) NULL,
	[plan_manufacturing_month_information_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[header_plan_manufacturing_by_month_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[department_id] ASC,
	[plan_manufacturing_month_information_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[HeaderPlanManufacturingByShifts]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[HeaderPlanManufacturingByShifts](
	[header_phan_manufacturing_by_shifts_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [nvarchar](150) NULL,
	[shifts_id] [int] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[header_phan_manufacturing_by_shifts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[department_id] ASC,
	[shifts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[HeaderPlanManufacturingByYear]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[HeaderPlanManufacturingByYear](
	[header_plan_manufacturing_by_year_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [nvarchar](150) NULL,
	[year] [nvarchar](100) NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[header_plan_manufacturing_by_year_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[HeaderRealityManufacturing]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[HeaderRealityManufacturing](
	[header_reality_manufacturing_id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [nvarchar](150) NULL,
	[reality_manufacturing_day_information_id] [int] NULL,
	[shifts_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[header_reality_manufacturing_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[MealRegistration]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[MealRegistration](
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
/****** Object:  Table [Manufacturing].[MeasureUnit]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[MeasureUnit](
	[measure_unit_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[measure_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[PlanManufacturingByMonth]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[PlanManufacturingByMonth](
	[header_plan_manufacturing_by_month_id] [int] NOT NULL,
	[criteria_id] [int] NOT NULL,
	[plan_quantity] [nvarchar](100) NULL,
	[last_time_update] [datetime] NOT NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[header_plan_manufacturing_by_month_id] ASC,
	[criteria_id] ASC,
	[last_time_update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[PlanManufacturingByShifts]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[PlanManufacturingByShifts](
	[header_phan_manufacturing_by_shifts_id] [int] NOT NULL,
	[criteria_id] [int] NOT NULL,
	[plan_quantity] [nvarchar](100) NULL,
	[last_time_update] [datetime] NOT NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[header_phan_manufacturing_by_shifts_id] ASC,
	[criteria_id] ASC,
	[last_time_update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[PlanManufacturingByYear]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[PlanManufacturingByYear](
	[header_plan_manufacturing_by_year_id] [int] NOT NULL,
	[criteria_id] [int] NOT NULL,
	[plan_quantity] [nvarchar](100) NULL,
	[last_time_update] [datetime] NOT NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[header_plan_manufacturing_by_year_id] ASC,
	[criteria_id] ASC,
	[last_time_update] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[PlanManufacturingMonthInformation]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[PlanManufacturingMonthInformation](
	[plan_manufacturing_month_information_id] [int] IDENTITY(1,1) NOT NULL,
	[month] [nvarchar](100) NULL,
	[year] [nvarchar](100) NULL,
	[number_working_days] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[plan_manufacturing_month_information_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[RealityManufacturing]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[RealityManufacturing](
	[header_reality_manufacturing_id] [int] NULL,
	[criteria_id] [int] NULL,
	[reality_quantity] [nvarchar](100) NULL,
	[note] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[RealityManufacturingDayInformation]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[RealityManufacturingDayInformation](
	[reality_manufacturing_day_information_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[no_date_manufacturing] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[reality_manufacturing_day_information_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[ReportFile]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[ReportFile](
	[report_file_id] [int] IDENTITY(1,1) NOT NULL,
	[report_file_date] [date] NULL,
	[shifts_id] [int] NULL,
	[department_id] [nvarchar](150) NULL,
	[lock] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[report_file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[SafetyWork]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[SafetyWork](
	[safety_work_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [nvarchar](100) NULL,
	[reason] [nvarchar](max) NULL,
	[date] [date] NULL,
	[shifts_id] [int] NULL,
	[safety_work_type_id] [int] NULL,
	[note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[safety_work_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[SafetyWorkType]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[SafetyWorkType](
	[safety_work_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[safety_work_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Manufacturing].[Shifts]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Manufacturing].[Shifts](
	[shifts_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[time_start] [int] NULL,
	[time_end] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[shifts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Supply].[BigMaintainEquipment]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[BigMaintainEquipment](
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
/****** Object:  Table [Supply].[Consumption]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[Consumption](
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
/****** Object:  Table [Supply].[ImproveEquipment]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[ImproveEquipment](
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
/****** Object:  Table [Supply].[MaintainEquipment]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[MaintainEquipment](
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
/****** Object:  Table [Supply].[MonthlyPlan]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[MonthlyPlan](
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
/****** Object:  Table [Supply].[RepairCamera]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[RepairCamera](
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
/****** Object:  Table [Supply].[RepairEquipment]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[RepairEquipment](
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
/****** Object:  Table [Supply].[RepairRegularly]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[RepairRegularly](
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
/****** Object:  Table [Supply].[Supply]    Script Date: 12/2/2020 11:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supply].[Supply](
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
ALTER TABLE [Documentary].[RepairDetails] ADD  DEFAULT ((1)) FOR [isVisible]
GO
ALTER TABLE [Supply].[MonthlyPlan] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [Account].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__NVID__3F9B6DFF] FOREIGN KEY([NVID])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [Account].[Account] CHECK CONSTRAINT [FK__Account__NVID__3F9B6DFF]
GO
ALTER TABLE [Account].[Account]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [Account].[Role] ([ID])
GO
ALTER TABLE [Account].[Account_Right]  WITH CHECK ADD FOREIGN KEY([ModuleID])
REFERENCES [Account].[Module] ([ID])
GO
ALTER TABLE [Account].[Account_Right_Detail]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [Account].[Account] ([ID])
GO
ALTER TABLE [Account].[Account_Right_Detail]  WITH CHECK ADD FOREIGN KEY([RightID])
REFERENCES [Account].[Account_Right] ([ID])
GO
ALTER TABLE [Camera].[Acceptance]  WITH NOCHECK ADD  CONSTRAINT [FK__Camera_Ac__docum__73501C2F] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
GO
ALTER TABLE [Camera].[Acceptance] CHECK CONSTRAINT [FK__Camera_Ac__docum__73501C2F]
GO
ALTER TABLE [Camera].[Acceptance]  WITH NOCHECK ADD  CONSTRAINT [FK__Camera_Ac__room___74444068] FOREIGN KEY([room_id])
REFERENCES [Camera].[Room] ([room_id])
GO
ALTER TABLE [Camera].[Acceptance] CHECK CONSTRAINT [FK__Camera_Ac__room___74444068]
GO
ALTER TABLE [Camera].[Incident]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [Camera].[Room] ([room_id])
GO
ALTER TABLE [Camera].[Room]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Camera].[Status]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [Camera].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Supply_DiKem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_DiKem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Equipment_DiKem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Supply_Equipment_DiKem]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [dbo].[Vattu_Dikem]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [dbo].[Vattu_Dikem]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Documentary].[BigMaintainDetails]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[BigMaintainDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[BigMaintainDetails]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[BigMaintainDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__40F9A68C] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Documentary].[BigMaintainDetails] CHECK CONSTRAINT [FK__Documenta__docum__40F9A68C]
GO
ALTER TABLE [Documentary].[CameraRepairDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[CameraRepairDetails]  WITH NOCHECK ADD FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
GO
ALTER TABLE [Documentary].[CameraRepairDetails]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [Camera].[Room] ([room_id])
GO
ALTER TABLE [Documentary].[Documentary]  WITH NOCHECK ADD FOREIGN KEY([department_id_to])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[Documentary]  WITH NOCHECK ADD FOREIGN KEY([documentary_type])
REFERENCES [Documentary].[DocumentaryType] ([documentary_type])
GO
ALTER TABLE [Documentary].[Important_Documentary]  WITH NOCHECK ADD  CONSTRAINT [FK__Important__docum__38EE7070] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
GO
ALTER TABLE [Documentary].[Important_Documentary] CHECK CONSTRAINT [FK__Important__docum__38EE7070]
GO
ALTER TABLE [Documentary].[Important_Documentary]  WITH NOCHECK ADD  CONSTRAINT [FK_Important_Documentary_Account] FOREIGN KEY([AccountID])
REFERENCES [Account].[Account] ([ID])
GO
ALTER TABLE [Documentary].[Important_Documentary] CHECK CONSTRAINT [FK_Important_Documentary_Account]
GO
ALTER TABLE [Documentary].[ImproveDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[ImproveDetails]  WITH NOCHECK ADD FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
GO
ALTER TABLE [Documentary].[ImproveDetails]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[LiquidationDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__42E1EEFE] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Documentary].[LiquidationDetails] CHECK CONSTRAINT [FK__Documenta__docum__42E1EEFE]
GO
ALTER TABLE [Documentary].[LiquidationDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__43D61338] FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[LiquidationDetails] CHECK CONSTRAINT [FK__Documenta__equip__43D61338]
GO
ALTER TABLE [Documentary].[LiquidationDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[MaintainDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__44CA3770] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Documentary].[MaintainDetails] CHECK CONSTRAINT [FK__Documenta__docum__44CA3770]
GO
ALTER TABLE [Documentary].[MaintainDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__45BE5BA9] FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[MaintainDetails] CHECK CONSTRAINT [FK__Documenta__equip__45BE5BA9]
GO
ALTER TABLE [Documentary].[MaintainDetails]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[MaintainDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[MovelineDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__46B27FE2] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Documentary].[MovelineDetails] CHECK CONSTRAINT [FK__Documenta__docum__46B27FE2]
GO
ALTER TABLE [Documentary].[MovelineDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__47A6A41B] FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[MovelineDetails] CHECK CONSTRAINT [FK__Documenta__equip__47A6A41B]
GO
ALTER TABLE [Documentary].[MovelineDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[RepairDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__489AC854] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Documentary].[RepairDetails] CHECK CONSTRAINT [FK__Documenta__docum__489AC854]
GO
ALTER TABLE [Documentary].[RepairDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__498EEC82] FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[RepairDetails] CHECK CONSTRAINT [FK__Documenta__equip__498EEC82]
GO
ALTER TABLE [Documentary].[RepairDetails]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[RepairDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Documentary].[RevokeDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__docum__4A8310C6] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Documentary].[RevokeDetails] CHECK CONSTRAINT [FK__Documenta__docum__4A8310C6]
GO
ALTER TABLE [Documentary].[RevokeDetails]  WITH NOCHECK ADD  CONSTRAINT [FK__Documenta__equip__4B7734FA] FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Documentary].[RevokeDetails] CHECK CONSTRAINT [FK__Documenta__equip__4B7734FA]
GO
ALTER TABLE [Documentary].[RevokeDetails]  WITH NOCHECK ADD FOREIGN KEY([department_id_from])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Equipment].[Acceptance]  WITH NOCHECK ADD FOREIGN KEY([attach_to])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Acceptance]  WITH NOCHECK ADD  CONSTRAINT [FK__Acceptanc__docum__2A164134] FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Equipment].[Acceptance] CHECK CONSTRAINT [FK__Acceptanc__docum__2A164134]
GO
ALTER TABLE [Equipment].[Acceptance]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Activity]  WITH NOCHECK ADD FOREIGN KEY([equipmentid])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Attribute]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Car]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[CarGPS]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[CarMaintenance]  WITH NOCHECK ADD FOREIGN KEY([equipmentid])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[CarMaintenance]  WITH NOCHECK ADD  CONSTRAINT [FK__Maintain___depar__76619304] FOREIGN KEY([departmentid])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Equipment].[CarMaintenance] CHECK CONSTRAINT [FK__Maintain___depar__76619304]
GO
ALTER TABLE [Equipment].[CarMaintenanceDetail]  WITH NOCHECK ADD FOREIGN KEY([maintainid])
REFERENCES [Equipment].[CarMaintenance] ([maintainid])
GO
ALTER TABLE [Equipment].[CarMaintenanceDetail]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Equipment].[CategoryAttribute]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_id])
REFERENCES [Equipment].[Category] ([Equipment_category_id])
GO
ALTER TABLE [Equipment].[CategoryAttributeValue]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_id])
REFERENCES [Equipment].[Category] ([Equipment_category_id])
GO
ALTER TABLE [Equipment].[CategoryAttributeValue]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_attribute_id])
REFERENCES [Equipment].[CategoryAttribute] ([Equipment_category_attribute_id])
GO
ALTER TABLE [Equipment].[CategoryAttributeValue]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Equipment]  WITH NOCHECK ADD FOREIGN KEY([current_Status])
REFERENCES [Equipment].[Status] ([statusid])
GO
ALTER TABLE [Equipment].[Equipment]  WITH NOCHECK ADD  CONSTRAINT [FK__Equipment__depar__625A9A57] FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Equipment].[Equipment] CHECK CONSTRAINT [FK__Equipment__depar__625A9A57]
GO
ALTER TABLE [Equipment].[Equipment]  WITH NOCHECK ADD FOREIGN KEY([Equipment_category_id])
REFERENCES [Equipment].[Category] ([Equipment_category_id])
GO
ALTER TABLE [Equipment].[FuelActivitiesConsumption]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Equipment].[FuelActivitiesConsumption]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[FuelActivitiesConsumption]  WITH NOCHECK ADD FOREIGN KEY([fuel_type])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Equipment].[Incident]  WITH NOCHECK ADD  CONSTRAINT [FK__Incident__depart__6FB49575] FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Equipment].[Incident] CHECK CONSTRAINT [FK__Incident__depart__6FB49575]
GO
ALTER TABLE [Equipment].[Incident]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Inspection]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[Insurance]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[RepairRegularly]  WITH NOCHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Equipment].[RepairRegularly]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Equipment].[RepairRegularlyDetail]  WITH NOCHECK ADD FOREIGN KEY([maintain_id])
REFERENCES [Equipment].[RepairRegularly] ([maintain_id])
GO
ALTER TABLE [Equipment].[RepairRegularlyDetail]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [HumanResources].[AdditionalHistoryResume]  WITH CHECK ADD FOREIGN KEY([records_id])
REFERENCES [HumanResources].[Records] ([records_id])
GO
ALTER TABLE [HumanResources].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__status__090A5324] FOREIGN KEY([current_status_id])
REFERENCES [HumanResources].[Status] ([status_id])
GO
ALTER TABLE [HumanResources].[Employee] CHECK CONSTRAINT [FK__Employee__status__090A5324]
GO
ALTER TABLE [HumanResources].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([current_department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [HumanResources].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [HumanResources].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Salary] FOREIGN KEY([current_salary_id])
REFERENCES [HumanResources].[Salary] ([salary_id])
GO
ALTER TABLE [HumanResources].[Employee] CHECK CONSTRAINT [FK_Employee_Salary]
GO
ALTER TABLE [HumanResources].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Work] FOREIGN KEY([current_work_id])
REFERENCES [HumanResources].[Work] ([work_id])
GO
ALTER TABLE [HumanResources].[Employee] CHECK CONSTRAINT [FK_Employee_Work]
GO
ALTER TABLE [HumanResources].[EmployeeTask]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeT__emplo__0CDAE408] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[EmployeeTask] CHECK CONSTRAINT [FK__EmployeeT__emplo__0CDAE408]
GO
ALTER TABLE [HumanResources].[EmployeeTask]  WITH CHECK ADD FOREIGN KEY([task_id])
REFERENCES [HumanResources].[Task] ([task_id])
GO
ALTER TABLE [HumanResources].[Family]  WITH CHECK ADD  CONSTRAINT [FK__Family__employee__0EC32C7A] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Family] CHECK CONSTRAINT [FK__Family__employee__0EC32C7A]
GO
ALTER TABLE [HumanResources].[Family]  WITH CHECK ADD FOREIGN KEY([family_relationship_id])
REFERENCES [HumanResources].[FamilyRelationship] ([family_relationship_id])
GO
ALTER TABLE [HumanResources].[Family]  WITH CHECK ADD FOREIGN KEY([family_type_id])
REFERENCES [HumanResources].[FamilyType] ([family_type_id])
GO
ALTER TABLE [HumanResources].[Papers]  WITH CHECK ADD FOREIGN KEY([papers_type_id])
REFERENCES [HumanResources].[PapersType] ([papers_type_id])
GO
ALTER TABLE [HumanResources].[Records]  WITH CHECK ADD  CONSTRAINT [FK__Records__deliver__1293BD5E] FOREIGN KEY([delivery_employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Records] CHECK CONSTRAINT [FK__Records__deliver__1293BD5E]
GO
ALTER TABLE [HumanResources].[Records]  WITH CHECK ADD  CONSTRAINT [FK__Records__employe__1387E197] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Records] CHECK CONSTRAINT [FK__Records__employe__1387E197]
GO
ALTER TABLE [HumanResources].[Records]  WITH CHECK ADD  CONSTRAINT [FK__Records__handove__147C05D0] FOREIGN KEY([handover_employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Records] CHECK CONSTRAINT [FK__Records__handove__147C05D0]
GO
ALTER TABLE [HumanResources].[Records]  WITH CHECK ADD  CONSTRAINT [FK__Records__managem__15702A09] FOREIGN KEY([management_employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Records] CHECK CONSTRAINT [FK__Records__managem__15702A09]
GO
ALTER TABLE [HumanResources].[Records]  WITH CHECK ADD FOREIGN KEY([records_status_id])
REFERENCES [HumanResources].[RecordsStatus] ([records_status_id])
GO
ALTER TABLE [HumanResources].[RecordsGettingAuthorize]  WITH CHECK ADD FOREIGN KEY([family_relationship_id])
REFERENCES [HumanResources].[FamilyRelationship] ([family_relationship_id])
GO
ALTER TABLE [HumanResources].[RecordsGettingAuthorize]  WITH CHECK ADD FOREIGN KEY([records_id])
REFERENCES [HumanResources].[Records] ([records_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__caree__762C88DA] FOREIGN KEY([career_id])
REFERENCES [HumanResources].[Career] ([career_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__caree__762C88DA]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__durat__7720AD13] FOREIGN KEY([duration_type_id])
REFERENCES [HumanResources].[DurationType] ([duration_type_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__durat__7720AD13]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__paper__7814D14C] FOREIGN KEY([papers_id])
REFERENCES [HumanResources].[Papers] ([papers_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__paper__7814D14C]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__paper__7908F585] FOREIGN KEY([papers_storage_type_id])
REFERENCES [HumanResources].[PapersStorageType] ([papers_storage_type_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__paper__7908F585]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__quali__79FD19BE] FOREIGN KEY([qualification_id])
REFERENCES [HumanResources].[Qualification] ([qualification_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__quali__79FD19BE]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__recor__7AF13DF7] FOREIGN KEY([records_id])
REFERENCES [HumanResources].[Records] ([records_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__recor__7AF13DF7]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK__RecordsPa__schoo__7BE56230] FOREIGN KEY([school_id])
REFERENCES [HumanResources].[School] ([school_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK__RecordsPa__schoo__7BE56230]
GO
ALTER TABLE [HumanResources].[RecordsPapers]  WITH CHECK ADD  CONSTRAINT [FK_RecordsPapers_Specializations] FOREIGN KEY([specializations_id])
REFERENCES [HumanResources].[Specializations] ([specializations_id])
GO
ALTER TABLE [HumanResources].[RecordsPapers] CHECK CONSTRAINT [FK_RecordsPapers_Specializations]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK__Recruitme__decis__7DCDAAA2] FOREIGN KEY([decision_id])
REFERENCES [HumanResources].[Decision] ([decision_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK__Recruitme__decis__7DCDAAA2]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK__Recruitme__depar__7EC1CEDB] FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK__Recruitme__depar__7EC1CEDB]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK__Recruitme__emplo__7FB5F314] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK__Recruitme__emplo__7FB5F314]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK__Recruitme__quali__00AA174D] FOREIGN KEY([qualification_id])
REFERENCES [HumanResources].[Qualification] ([qualification_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK__Recruitme__quali__00AA174D]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK__Recruitme__salar__019E3B86] FOREIGN KEY([salary_id])
REFERENCES [HumanResources].[Salary] ([salary_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK__Recruitme__salar__019E3B86]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK__Recruitme__work___038683F8] FOREIGN KEY([work_id])
REFERENCES [HumanResources].[Work] ([work_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK__Recruitme__work___038683F8]
GO
ALTER TABLE [HumanResources].[Recruitment]  WITH CHECK ADD  CONSTRAINT [FK_Recruitment_Specializations] FOREIGN KEY([specializations_id])
REFERENCES [HumanResources].[Specializations] ([specializations_id])
GO
ALTER TABLE [HumanResources].[Recruitment] CHECK CONSTRAINT [FK_Recruitment_Specializations]
GO
ALTER TABLE [HumanResources].[Salary]  WITH CHECK ADD FOREIGN KEY([pay_rate_id])
REFERENCES [HumanResources].[PayRate] ([pay_rate_id])
GO
ALTER TABLE [HumanResources].[Salary]  WITH CHECK ADD FOREIGN KEY([pay_table_id])
REFERENCES [HumanResources].[PayTable] ([pay_table_id])
GO
ALTER TABLE [HumanResources].[SalaryProcess]  WITH CHECK ADD  CONSTRAINT [FK__SalaryPro__emplo__297722B6] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[SalaryProcess] CHECK CONSTRAINT [FK__SalaryPro__emplo__297722B6]
GO
ALTER TABLE [HumanResources].[Specializations]  WITH CHECK ADD FOREIGN KEY([career_id])
REFERENCES [HumanResources].[Career] ([career_id])
GO
ALTER TABLE [HumanResources].[Specializations]  WITH CHECK ADD FOREIGN KEY([education_level_id])
REFERENCES [HumanResources].[EducationLevel] ([education_level_id])
GO
ALTER TABLE [HumanResources].[Task]  WITH CHECK ADD FOREIGN KEY([papers_id])
REFERENCES [HumanResources].[Papers] ([papers_id])
GO
ALTER TABLE [HumanResources].[Task]  WITH CHECK ADD FOREIGN KEY([task_type_id])
REFERENCES [HumanResources].[TaskType] ([task_type_id])
GO
ALTER TABLE [HumanResources].[Termination]  WITH CHECK ADD FOREIGN KEY([decision_id])
REFERENCES [HumanResources].[Decision] ([decision_id])
GO
ALTER TABLE [HumanResources].[Termination]  WITH CHECK ADD  CONSTRAINT [FK__Terminati__emplo__2F2FFC0C] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Termination] CHECK CONSTRAINT [FK__Terminati__emplo__2F2FFC0C]
GO
ALTER TABLE [HumanResources].[Termination]  WITH CHECK ADD FOREIGN KEY([termination_type_id])
REFERENCES [HumanResources].[TerminationType] ([termination_type_id])
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD FOREIGN KEY([decision_id])
REFERENCES [HumanResources].[Decision] ([decision_id])
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK__Transfer__employ__320C68B7] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[Transfer] CHECK CONSTRAINT [FK__Transfer__employ__320C68B7]
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD FOREIGN KEY([new_department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD FOREIGN KEY([new_salary_id])
REFERENCES [HumanResources].[Salary] ([salary_id])
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK__Transfer__new_wo__10E07F16] FOREIGN KEY([new_work_id])
REFERENCES [HumanResources].[Work] ([work_id])
GO
ALTER TABLE [HumanResources].[Transfer] CHECK CONSTRAINT [FK__Transfer__new_wo__10E07F16]
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD FOREIGN KEY([old_department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD FOREIGN KEY([old_salary_id])
REFERENCES [HumanResources].[Salary] ([salary_id])
GO
ALTER TABLE [HumanResources].[Transfer]  WITH CHECK ADD  CONSTRAINT [FK__Transfer__old_wo__13BCEBC1] FOREIGN KEY([old_work_id])
REFERENCES [HumanResources].[Work] ([work_id])
GO
ALTER TABLE [HumanResources].[Transfer] CHECK CONSTRAINT [FK__Transfer__old_wo__13BCEBC1]
GO
ALTER TABLE [HumanResources].[Work]  WITH CHECK ADD  CONSTRAINT [FK__Work__pay_table___14B10FFA] FOREIGN KEY([pay_table_id])
REFERENCES [HumanResources].[PayTable] ([pay_table_id])
GO
ALTER TABLE [HumanResources].[Work] CHECK CONSTRAINT [FK__Work__pay_table___14B10FFA]
GO
ALTER TABLE [HumanResources].[WorkGroup]  WITH CHECK ADD  CONSTRAINT [FK_WorkGroup_WorkGroupType] FOREIGN KEY([work_group_type_id])
REFERENCES [HumanResources].[WorkGroupType] ([work_group_type_id])
GO
ALTER TABLE [HumanResources].[WorkGroup] CHECK CONSTRAINT [FK_WorkGroup_WorkGroupType]
GO
ALTER TABLE [HumanResources].[WorkingProcess]  WITH CHECK ADD  CONSTRAINT [FK__WorkingPr__emplo__39AD8A7F] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [HumanResources].[WorkingProcess] CHECK CONSTRAINT [FK__WorkingPr__emplo__39AD8A7F]
GO
ALTER TABLE [HumanResources].[WorkWorkGroup]  WITH CHECK ADD  CONSTRAINT [FK__WorkWorkG__work___1699586C] FOREIGN KEY([work_id])
REFERENCES [HumanResources].[Work] ([work_id])
GO
ALTER TABLE [HumanResources].[WorkWorkGroup] CHECK CONSTRAINT [FK__WorkWorkG__work___1699586C]
GO
ALTER TABLE [HumanResources].[WorkWorkGroup]  WITH CHECK ADD FOREIGN KEY([work_group_id])
REFERENCES [HumanResources].[WorkGroup] ([work_group_id])
GO
ALTER TABLE [Manufacturing].[AbsenceReason]  WITH CHECK ADD FOREIGN KEY([absence_reason_type_id])
REFERENCES [Manufacturing].[AbsenceReasonType] ([absence_reason_type_id])
GO
ALTER TABLE [Manufacturing].[Criteria]  WITH CHECK ADD FOREIGN KEY([criteria_group_id])
REFERENCES [Manufacturing].[CriteriaGroup] ([criteria_group_id])
GO
ALTER TABLE [Manufacturing].[Criteria]  WITH CHECK ADD FOREIGN KEY([measure_unit_id])
REFERENCES [Manufacturing].[MeasureUnit] ([measure_unit_id])
GO
ALTER TABLE [Manufacturing].[DepartmentAttendanceAndProductivity]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[DepartmentAttendanceAndProductivity]  WITH CHECK ADD FOREIGN KEY([header_attendance_and_productivity_id])
REFERENCES [Manufacturing].[HeaderAttendanceAndProductivity] ([header_attendance_and_productivity_id])
GO
ALTER TABLE [Manufacturing].[DepartmentCriteriaByMonth]  WITH CHECK ADD FOREIGN KEY([criteria_id])
REFERENCES [Manufacturing].[Criteria] ([criteria_id])
GO
ALTER TABLE [Manufacturing].[DepartmentCriteriaByMonth]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[DepartmentCriteriaByYear]  WITH CHECK ADD FOREIGN KEY([criteria_id])
REFERENCES [Manufacturing].[Criteria] ([criteria_id])
GO
ALTER TABLE [Manufacturing].[DepartmentCriteriaByYear]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[EmployeeAttendanceAndProductivity]  WITH CHECK ADD FOREIGN KEY([absence_reason_id])
REFERENCES [Manufacturing].[AbsenceReason] ([absence_reason_id])
GO
ALTER TABLE [Manufacturing].[EmployeeAttendanceAndProductivity]  WITH CHECK ADD FOREIGN KEY([actual_header_fetched])
REFERENCES [Manufacturing].[HeaderAttendanceAndProductivity] ([header_attendance_and_productivity_id])
GO
ALTER TABLE [Manufacturing].[EmployeeAttendanceAndProductivity]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeA__emplo__4707859D] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [Manufacturing].[EmployeeAttendanceAndProductivity] CHECK CONSTRAINT [FK__EmployeeA__emplo__4707859D]
GO
ALTER TABLE [Manufacturing].[EmployeeAttendanceAndProductivity]  WITH CHECK ADD FOREIGN KEY([header_attendance_and_productivity_id])
REFERENCES [Manufacturing].[HeaderAttendanceAndProductivity] ([header_attendance_and_productivity_id])
GO
ALTER TABLE [Manufacturing].[FakeAPI]  WITH CHECK ADD  CONSTRAINT [FK__FakeAPI__employe__48EFCE0F] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [Manufacturing].[FakeAPI] CHECK CONSTRAINT [FK__FakeAPI__employe__48EFCE0F]
GO
ALTER TABLE [Manufacturing].[FakeAPI]  WITH CHECK ADD FOREIGN KEY([shifts_id])
REFERENCES [Manufacturing].[Shifts] ([shifts_id])
GO
ALTER TABLE [Manufacturing].[File]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [Account].[Account] ([ID])
GO
ALTER TABLE [Manufacturing].[File]  WITH CHECK ADD FOREIGN KEY([report_file_id])
REFERENCES [Manufacturing].[ReportFile] ([report_file_id])
GO
ALTER TABLE [Manufacturing].[HeaderAttendanceAndProductivity]  WITH CHECK ADD FOREIGN KEY([shifts_id])
REFERENCES [Manufacturing].[Shifts] ([shifts_id])
GO
ALTER TABLE [Manufacturing].[HeaderPlanManufacturingByMonth]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[HeaderPlanManufacturingByMonth]  WITH CHECK ADD FOREIGN KEY([plan_manufacturing_month_information_id])
REFERENCES [Manufacturing].[PlanManufacturingMonthInformation] ([plan_manufacturing_month_information_id])
GO
ALTER TABLE [Manufacturing].[HeaderPlanManufacturingByShifts]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[HeaderPlanManufacturingByShifts]  WITH CHECK ADD FOREIGN KEY([shifts_id])
REFERENCES [Manufacturing].[Shifts] ([shifts_id])
GO
ALTER TABLE [Manufacturing].[HeaderPlanManufacturingByYear]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[HeaderRealityManufacturing]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[HeaderRealityManufacturing]  WITH CHECK ADD FOREIGN KEY([reality_manufacturing_day_information_id])
REFERENCES [Manufacturing].[RealityManufacturingDayInformation] ([reality_manufacturing_day_information_id])
GO
ALTER TABLE [Manufacturing].[HeaderRealityManufacturing]  WITH CHECK ADD FOREIGN KEY([shifts_id])
REFERENCES [Manufacturing].[Shifts] ([shifts_id])
GO
ALTER TABLE [Manufacturing].[MealRegistration]  WITH NOCHECK ADD  CONSTRAINT [FK__MealRegis__depar__7A3223E8] FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[MealRegistration] CHECK CONSTRAINT [FK__MealRegis__depar__7A3223E8]
GO
ALTER TABLE [Manufacturing].[PlanManufacturingByMonth]  WITH CHECK ADD FOREIGN KEY([criteria_id])
REFERENCES [Manufacturing].[Criteria] ([criteria_id])
GO
ALTER TABLE [Manufacturing].[PlanManufacturingByMonth]  WITH CHECK ADD FOREIGN KEY([header_plan_manufacturing_by_month_id])
REFERENCES [Manufacturing].[HeaderPlanManufacturingByMonth] ([header_plan_manufacturing_by_month_id])
GO
ALTER TABLE [Manufacturing].[PlanManufacturingByShifts]  WITH CHECK ADD FOREIGN KEY([criteria_id])
REFERENCES [Manufacturing].[Criteria] ([criteria_id])
GO
ALTER TABLE [Manufacturing].[PlanManufacturingByShifts]  WITH CHECK ADD FOREIGN KEY([header_phan_manufacturing_by_shifts_id])
REFERENCES [Manufacturing].[HeaderPlanManufacturingByShifts] ([header_phan_manufacturing_by_shifts_id])
GO
ALTER TABLE [Manufacturing].[PlanManufacturingByYear]  WITH CHECK ADD FOREIGN KEY([criteria_id])
REFERENCES [Manufacturing].[Criteria] ([criteria_id])
GO
ALTER TABLE [Manufacturing].[PlanManufacturingByYear]  WITH CHECK ADD FOREIGN KEY([header_plan_manufacturing_by_year_id])
REFERENCES [Manufacturing].[HeaderPlanManufacturingByYear] ([header_plan_manufacturing_by_year_id])
GO
ALTER TABLE [Manufacturing].[RealityManufacturing]  WITH CHECK ADD FOREIGN KEY([criteria_id])
REFERENCES [Manufacturing].[Criteria] ([criteria_id])
GO
ALTER TABLE [Manufacturing].[RealityManufacturing]  WITH CHECK ADD FOREIGN KEY([header_reality_manufacturing_id])
REFERENCES [Manufacturing].[HeaderRealityManufacturing] ([header_reality_manufacturing_id])
GO
ALTER TABLE [Manufacturing].[ReportFile]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Manufacturing].[ReportFile]  WITH CHECK ADD FOREIGN KEY([shifts_id])
REFERENCES [Manufacturing].[Shifts] ([shifts_id])
GO
ALTER TABLE [Manufacturing].[SafetyWork]  WITH CHECK ADD  CONSTRAINT [FK__SafetyWor__emplo__5FD33367] FOREIGN KEY([employee_id])
REFERENCES [HumanResources].[Employee] ([employee_id])
GO
ALTER TABLE [Manufacturing].[SafetyWork] CHECK CONSTRAINT [FK__SafetyWor__emplo__5FD33367]
GO
ALTER TABLE [Manufacturing].[SafetyWork]  WITH CHECK ADD FOREIGN KEY([safety_work_type_id])
REFERENCES [Manufacturing].[SafetyWorkType] ([safety_work_type_id])
GO
ALTER TABLE [Manufacturing].[SafetyWork]  WITH CHECK ADD FOREIGN KEY([shifts_id])
REFERENCES [Manufacturing].[Shifts] ([shifts_id])
GO
ALTER TABLE [Supply].[BigMaintainEquipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_big_maintain_id])
REFERENCES [Documentary].[BigMaintainDetails] ([documentary_big_maintain_id])
GO
ALTER TABLE [Supply].[BigMaintainEquipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[BigMaintainEquipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[Consumption]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[Consumption]  WITH NOCHECK ADD  CONSTRAINT [FK__Supply_ti__depar__078C1F06] FOREIGN KEY([departmentid])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Supply].[Consumption] CHECK CONSTRAINT [FK__Supply_ti__depar__078C1F06]
GO
ALTER TABLE [Supply].[ImproveEquipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_improve_id])
REFERENCES [Documentary].[ImproveDetails] ([documentary_improve_id])
GO
ALTER TABLE [Supply].[ImproveEquipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[ImproveEquipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[MaintainEquipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_maintain_id])
REFERENCES [Documentary].[MaintainDetails] ([documentary_maintain_id])
GO
ALTER TABLE [Supply].[MaintainEquipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[MaintainEquipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[MonthlyPlan]  WITH NOCHECK ADD FOREIGN KEY([equipmentid])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[MonthlyPlan]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[MonthlyPlan]  WITH NOCHECK ADD FOREIGN KEY([supplyid])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[MonthlyPlan]  WITH NOCHECK ADD  CONSTRAINT [FK__SupplyPla__depar__09746778] FOREIGN KEY([departmentid])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Supply].[MonthlyPlan] CHECK CONSTRAINT [FK__SupplyPla__depar__09746778]
GO
ALTER TABLE [Supply].[MonthlyPlan]  WITH NOCHECK ADD  CONSTRAINT [FK__SupplyPla__depar__0A688BB1] FOREIGN KEY([departmentid])
REFERENCES [General].[Department] ([department_id])
GO
ALTER TABLE [Supply].[MonthlyPlan] CHECK CONSTRAINT [FK__SupplyPla__depar__0A688BB1]
GO
ALTER TABLE [Supply].[RepairCamera]  WITH NOCHECK ADD FOREIGN KEY([documentary_id])
REFERENCES [Documentary].[Documentary] ([documentary_id])
GO
ALTER TABLE [Supply].[RepairCamera]  WITH NOCHECK ADD FOREIGN KEY([room_id])
REFERENCES [Camera].[Room] ([room_id])
GO
ALTER TABLE [Supply].[RepairCamera]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[RepairEquipment]  WITH NOCHECK ADD FOREIGN KEY([documentary_repair_id])
REFERENCES [Documentary].[RepairDetails] ([documentary_repair_id])
GO
ALTER TABLE [Supply].[RepairEquipment]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[RepairEquipment]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
ALTER TABLE [Supply].[RepairRegularly]  WITH NOCHECK ADD FOREIGN KEY([equipmentId_dikem])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[RepairRegularly]  WITH NOCHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[RepairRegularly]  WITH NOCHECK ADD FOREIGN KEY([equipmentId_dikem])
REFERENCES [Equipment].[Equipment] ([equipmentId])
GO
ALTER TABLE [Supply].[RepairRegularly]  WITH NOCHECK ADD FOREIGN KEY([supply_id])
REFERENCES [Supply].[Supply] ([supply_id])
GO
USE [master]
GO
ALTER DATABASE [QuangHanhManufacturing] SET  READ_WRITE 
GO
