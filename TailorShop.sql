USE [master]
GO
/****** Object:  Database [clothes]    Script Date: 24.07.2023 16:10:19 ******/
CREATE DATABASE [clothes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clothes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\clothes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clothes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\clothes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [clothes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clothes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clothes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clothes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clothes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clothes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clothes] SET ARITHABORT OFF 
GO
ALTER DATABASE [clothes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clothes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clothes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clothes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clothes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clothes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clothes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clothes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clothes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clothes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clothes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clothes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clothes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clothes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clothes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clothes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clothes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clothes] SET RECOVERY FULL 
GO
ALTER DATABASE [clothes] SET  MULTI_USER 
GO
ALTER DATABASE [clothes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clothes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clothes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clothes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clothes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clothes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'clothes', N'ON'
GO
ALTER DATABASE [clothes] SET QUERY_STORE = ON
GO
ALTER DATABASE [clothes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [clothes]
GO
/****** Object:  Table [dbo].[clothingspec]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clothingspec](
	[Clothes_ID] [int] IDENTITY(1,1) NOT NULL,
	[Clothes_Type] [varchar](50) NULL,
	[Clothes_Quantity] [int] NULL,
	[Clothes_Size] [varchar](50) NULL,
	[Clothes_Colour] [varchar](50) NULL,
	[Clothes_Description] [varchar](max) NULL,
	[Clothes_IssueDate] [smalldatetime] NULL,
	[Customer_Name] [varchar](50) NULL,
 CONSTRAINT [PK_clothingspec] PRIMARY KEY CLUSTERED 
(
	[Clothes_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[Customer_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Customer_Phone] [varchar](50) NULL,
	[Customer_Location] [varchar](50) NULL,
	[Customer_Date] [smalldatetime] NULL,
	[Customer_Type] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[process]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[process](
	[prid] [int] IDENTITY(1,1) NOT NULL,
	[prtype] [varchar](50) NULL,
	[prtime] [int] NULL,
	[prcost] [int] NULL,
	[prgenexpenses] [int] NULL,
	[prtoplam] [int] NULL,
	[prest] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[prid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceInformation]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceInformation](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[Service_Name] [varchar](50) NULL,
	[Service_CostGreen] [float] NULL,
	[Service_TimeGreen] [int] NULL,
	[Service_CostSilver] [float] NULL,
	[Service_TimeSilver] [int] NULL,
	[Service_CostGold] [float] NULL,
	[Service_TimeGold] [int] NULL,
	[Clothes_Type] [varchar](50) NULL,
 CONSTRAINT [PK_ServiceInformation] PRIMARY KEY CLUSTERED 
(
	[ProcessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertClothing]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertClothing]


-- kaydetme pros
@Clothes_Type varchar(50),
@Clothes_Quantity int,
@Clothes_Size varchar(50),
@Clothes_Colour varchar(50),
@Clothes_Description varchar(max),
@Clothes_IssueDate smalldatetime,
@Customer_Name varchar(50)
as begin
Insert into clothingspec (Clothes_Type,Clothes_Quantity,Clothes_Size,Clothes_Colour,Clothes_Description,Clothes_IssueDate,Customer_Name) Values(@Clothes_Type,@Clothes_Quantity,@Clothes_Size,@Clothes_Colour,@Clothes_Description,@Clothes_IssueDate,@Customer_Name)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[InsertCustomer]


-- kaydetme pros
@Customer_Name varchar(50),
@Customer_Phone varchar(50),
@Customer_Location varchar(50),
@Customer_Date smalldatetime,
@Customer_Type varchar(50)

as begin
Insert into customer (Customer_Name,Customer_Phone,Customer_Location,Customer_Date,Customer_Type) Values(@Customer_Name,@Customer_Phone,@Customer_Location,@Customer_Date,@Customer_Type)
end
GO
/****** Object:  StoredProcedure [dbo].[ListClothing]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[ListClothing]  --listeleme prosedürü

as begin
Select * from clothingspec 
end
GO
/****** Object:  StoredProcedure [dbo].[ListCustomer]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListCustomer]  --listeleme prosedürü

as begin
Select * from customer 
end
GO
/****** Object:  StoredProcedure [dbo].[ListMemType]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ListMemType]  --listeleme prosedürü
@Customer_Name varchar(50)
as begin
Select Customer_Type from customer where Customer_Name=@Customer_Name 
end
GO
/****** Object:  StoredProcedure [dbo].[SearchClothing]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[SearchClothing] @Customer_Name varchar(50)

as begin
select * from clothingspec where Customer_Name like '%'+@Customer_Name+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomer]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchCustomer] 
@Customer_Name varchar(50)

as begin
select * from customer where Customer_Name like '%'+@Customer_Name+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[tailorcusdelete]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tailorcusdelete]
@Customer_ID int
as begin
delete from customer where Customer_ID=@Customer_ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 24.07.2023 16:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UpdateCustomer]
@Customer_ID int,
@Customer_Name varchar(50),
@Customer_Phone varchar(50),
@Customer_Location varchar(50),
@Customer_Date smalldatetime,
@Customer_Type varchar(50)
as begin
Update customer set Customer_Name=@Customer_Name , Customer_Phone=@Customer_Phone, Customer_Location=@Customer_Location,Customer_Date=@Customer_Date,Customer_Type=@Customer_Type
WHERE Customer_ID=@Customer_ID
end
GO
USE [master]
GO
ALTER DATABASE [clothes] SET  READ_WRITE 
GO
