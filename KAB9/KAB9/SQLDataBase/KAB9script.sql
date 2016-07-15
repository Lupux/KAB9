USE [master]
GO
/****** Object:  Database [KAB9]    Script Date: 2016-07-15 11:36:31 ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 2016-07-15 11:36:31 ******/
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
/****** Object:  Table [dbo].[CtA]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtA](
	[CID] [int] NOT NULL,
	[AID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NULL,
	[PhoneNr] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[Oid] [int] NOT NULL,
	[Cid] [int] NOT NULL,
	[OrderTime] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[PlanedShipping] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OtP]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtP](
	[Oid] [int] NOT NULL,
	[Pid] [int] NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Password]    Script Date: 2016-07-15 11:36:31 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 2016-07-15 11:36:31 ******/
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
	[PDescription] [varchar](max) NULL,
	[ManufProdNr] [varchar](max) NOT NULL,
	[Manufacturer] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ItemsInStock] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[OrderView]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderView]
AS
SELECT        dbo.Orders.OrderId, dbo.Orders.PlanedShipping, dbo.OtP.Quantity, dbo.OtP.Pid, dbo.Product.Price, dbo.Product.ProductName
FROM            dbo.Orders INNER JOIN
                         dbo.OtP ON dbo.Orders.OrderId = dbo.OtP.Oid INNER JOIN
                         dbo.Product ON dbo.OtP.Pid = dbo.Product.ProductId

GO
/****** Object:  View [dbo].[OrderHistoryView]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OrderHistoryView]
AS
SELECT        dbo.OrderHistory.Cid, dbo.OrderHistory.OrderTime, dbo.OrderView.PlanedShipping, dbo.OrderView.Quantity, dbo.OrderView.Pid, dbo.OrderView.Price, dbo.OrderView.ProductName, dbo.OrderView.OrderId
FROM            dbo.OrderHistory INNER JOIN
                         dbo.OrderView ON dbo.OrderHistory.Oid = dbo.OrderView.OrderId

GO
/****** Object:  StoredProcedure [dbo].[spAddOrderHistory]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-15
-- Description:	Adds an order to the OrderHistory
-- =============================================
CREATE PROCEDURE [dbo].[spAddOrderHistory] 
	@oid int,
	@cid int,
	@ordertime smalldatetime
AS
BEGIN
	insert into OrderHistory(Oid,Cid, OrderTime) values (@oid,@cid,@ordertime)
	
END



GO
/****** Object:  StoredProcedure [dbo].[spAddToOrder]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-15
-- Description:	Adds a product to an order
-- =============================================
CREATE PROCEDURE [dbo].[spAddToOrder] 
@oid int,
@pid int,
@quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   insert into OtP (Oid,Pid,Quantity) values (@oid,@pid,@quantity)
	
END


GO
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	Change Password at site.
--- =============================================
CREATE PROCEDURE [dbo].[spChangePassword] 
	@newpassword varchar(MAX),
	@cid int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Password set Password = @newpassword where CustomerId = @cid
END



GO
/****** Object:  StoredProcedure [dbo].[spChangeStock]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-13
-- Description:	Change Stock value
-- =============================================
CREATE PROCEDURE [dbo].[spChangeStock] 
	@pid int,
	@addToStock int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Stock set ItemsInStock = ItemsInStock+@addToStock where ProductId = @pid


END



GO
/****** Object:  StoredProcedure [dbo].[spCreateAddress]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	Create a Adress
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
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	Create a Customer
-- =============================================
CREATE PROCEDURE [dbo].[spCreateCustomer]
	@firstName varchar(255), 
	@lastname varchar(255),
	@phone varchar(255),
	@email varchar(255),
	@new_id int output
AS
BEGIN
	insert into Customer(FirstName,LastName, PhoneNr, Email) values (@firstName,@lastname,@phone,@email)
	select @new_id = scope_identity() -- gets id value from line above
	select @new_id as id
END



GO
/****** Object:  StoredProcedure [dbo].[spCreateOrder]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-15
-- Description:	Creates a Order and returns the OrderId to be used to fill OtP table with what is ordered. 
-- =============================================
CREATE PROCEDURE [dbo].[spCreateOrder] 
	@cid int,
	@planedshipping smalldatetime,
	@orderdate smalldatetime,
	@orderid int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into Orders(PlanedShipping) values (@planedshipping)
	select @orderid = scope_identity() -- gets id value from line above
	select @orderid as id

   insert into OrderHistory(Oid,Cid, Ordertime) values (@orderid,@cid,@orderdate)
END


GO
/****** Object:  StoredProcedure [dbo].[spCreatePassword]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	Creates a Password and connects it to a customer
-- =============================================
CREATE PROCEDURE [dbo].[spCreatePassword] 
@cid	int,
@password varchar(max)

AS
BEGIN
	insert into Password(CustomerId,Password) values (@cid,@password)
END



GO
/****** Object:  StoredProcedure [dbo].[spCreateProduct]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	To create a product
-- =============================================
CREATE PROCEDURE [dbo].[spCreateProduct]
	@productname varchar(255), 
	@price varchar(255),
	@description varchar(255),
	@manufacturer varchar(255),
	@manufProdNr varchar(255),
	@ItemsInStock int, -- Ser gärna att man kan sätta in ett antal produkter direkt i lagret. Öppen för diskussion!
	@new_id int output
AS
BEGIN
	insert into Product(ProductName,Price, PDescription, ManufProdNr, Manufacturer) values (@productname,@price,@description,@manufProdNr,@manufacturer)
	select @new_id = scope_identity() -- gets id value from line above

	insert into Stock(ProductId,ItemsInStock) values (@new_id, 0)

	select @new_id as ProductId
END



GO
/****** Object:  StoredProcedure [dbo].[spDeleteAddress]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	Use for deleting an address
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
/****** Object:  StoredProcedure [dbo].[spDeleteCustomer]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-12
-- Description:	Use for deleting a customer
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteCustomer]
	@cid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Customer where CustomerId = @cid
END



GO
/****** Object:  StoredProcedure [dbo].[spDeleteProduct]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-14
-- Description:	Removing product from database and also removng it from stock
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
/****** Object:  StoredProcedure [dbo].[spUpdateCustomer]    Script Date: 2016-07-15 11:36:31 ******/
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
	update Customer set FirstName =@firstname, LastName = @lastname, Email = @email, PhoneNr = @phone where CustomerId = @cid

END



GO
/****** Object:  StoredProcedure [dbo].[spUpdateOrder]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-15
-- Description:	This makes it possible to update an order with new shipping date.
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateOrder] 
	@oid int,
	@shippingdate smalldatetime
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Orders set PlanedShipping = @shippingdate where OrderId = @oid
END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateProduct]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Timothy Jalgard
-- Create date: 2016-07-13
-- Description:	A procedure for updating a Product post.
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateProduct] 
	@productName varchar(255),
	@description varchar(255),
	@price money,
	@manufacturer varchar(255),
	@manufProdNr varchar(255),
	@pid int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Product set ProductName =@productName, PDescription = @description, Price = @price, ManufProdNr = @manufProdNr, Manufacturer = @manufacturer where ProductId = @pid

END



GO
/****** Object:  StoredProcedure [dbo].[spViewOrder]    Script Date: 2016-07-15 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johan Ekblom
-- Create date: 2016-07-15
-- Description:	To view a Order
-- =============================================
CREATE PROCEDURE [dbo].[spViewOrder] 
	@orderid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM OrderView where OrderId = @orderid 
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderHistory"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderView"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderHistoryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderHistoryView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OtP"
            Begin Extent = 
               Top = 95
               Left = 568
               Bottom = 208
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 91
               Left = 860
               Bottom = 221
               Right = 1030
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 96
               Left = 315
               Bottom = 192
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2370
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderView'
GO
USE [master]
GO
ALTER DATABASE [KAB9] SET  READ_WRITE 
GO
