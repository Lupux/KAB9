USE [master]
GO
/****** Object:  Database [KAB9]    Script Date: 2016-07-12 20:49:13 ******/
CREATE DATABASE [KAB9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KAB9', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KAB9.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KAB9_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\KAB9_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KAB9] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KAB9].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KAB9] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KAB9] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KAB9] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KAB9] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KAB9] SET ARITHABORT OFF 
GO
ALTER DATABASE [KAB9] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KAB9] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KAB9] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KAB9] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KAB9] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KAB9] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KAB9] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KAB9] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KAB9] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KAB9] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KAB9] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KAB9] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KAB9] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KAB9] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KAB9] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KAB9] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KAB9] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KAB9] SET RECOVERY FULL 
GO
ALTER DATABASE [KAB9] SET  MULTI_USER 
GO
ALTER DATABASE [KAB9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KAB9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KAB9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KAB9] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KAB9] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KAB9', N'ON'
GO
USE [KAB9]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CtA]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtA](
	[CID] [int] NOT NULL,
	[AID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Custmer]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Custmer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NULL,
	[PhoneNr] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DateTime] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Password]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Password](
	[CustomerId] [int] NOT NULL,
	[Password] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ItemsInStock] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[spAddOrderHistory]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddOrderHistory] 
	@pid int,
	@cid int,
	@timestamp smalldatetime
AS
BEGIN
	insert into OrderHistory(ProductId,CustomerId, DateTime) values (@pid,@cid,@timestamp)
	
END

GO
/****** Object:  StoredProcedure [dbo].[spChangeStock]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spChangeStock] 
	@prodId int,
	@value int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Stock set itemsInStock = @value where ProductId = @prodId


END

GO
/****** Object:  StoredProcedure [dbo].[spCreateAddress]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCreateAddress] 
		@cid int,
	@street varchar(255), 
	@zipcode varchar(255),
	@city varchar(255),
	@country varchar(255),
	@new_id int output
AS
BEGIN
	insert into Address(Street,ZipCode, City, Country) values (@street,@zipcode,@city,@country)
	select @new_id = scope_identity() -- gets id value from line above

	insert into CtA(CID,AID) values (@cid,@new_id)
	select @new_id as id
END

GO
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCreateCustomer]
	@firstName varchar(255), 
	@lastname varchar(255),
	@phone varchar(255),
	@email varchar(255),
	@new_id int output
AS
BEGIN
	insert into Custmer(FirstName,LastName, PhoneNr, Email) values (@firstName,@lastname,@phone,@email)
	select @new_id = scope_identity() -- gets id value from line above
	select @new_id as id
END

GO
/****** Object:  StoredProcedure [dbo].[spCreatePassword]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCreatePassword] 
@cid	int,
@password varchar(max)

AS
BEGIN
	insert into Password(CustomerId,Password) values (@cid,@password)
END

GO
/****** Object:  StoredProcedure [dbo].[spCreateProduct]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCreateProduct]
	@productname varchar(255), 
	@price varchar(255),
	@description varchar(255),
	@new_id int output
AS
BEGIN
	insert into Product(ProductName,Price, Description) values (@productname,@price,@description)
	select @new_id = scope_identity() -- gets id value from line above

	insert into Stock(ProductId,ItemsInStock) values (@new_id, 0)

	select @new_id as id
END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteAddress]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteAddress]
	@aid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Address where AddressId = @aid
END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteCustomer]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteCustomer]
	@cid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Custmer where CustomerId = @cid
END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteProduct]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteProduct]
	@pid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Product where ProductId = @pid
	Delete from Stock where ProductId = @pid
	
END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateCustomer]    Script Date: 2016-07-12 20:49:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	A procedure for updating a customer post.
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateCustomer] 
	@firstname varchar(MAX),
	@lastname varchar(MAX),
	@email varchar(MAX),
	@phone varchar(MAX),
	@cid int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Custmer set FirstName =@firstname, LastName = @lastname, Email = @email, PhoneNr = @phone where CustomerId = @cid

END

GO
USE [master]
GO
ALTER DATABASE [KAB9] SET  READ_WRITE 
GO
