USE [master]
GO
/****** Object:  Database [VentasMobile]    Script Date: 6/13/2019 11:25:57 PM ******/
CREATE DATABASE [VentasMobile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VentasMobile', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VentasMobile.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VentasMobile_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VentasMobile_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VentasMobile] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VentasMobile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VentasMobile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VentasMobile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VentasMobile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VentasMobile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VentasMobile] SET ARITHABORT OFF 
GO
ALTER DATABASE [VentasMobile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VentasMobile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VentasMobile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VentasMobile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VentasMobile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VentasMobile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VentasMobile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VentasMobile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VentasMobile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VentasMobile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VentasMobile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VentasMobile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VentasMobile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VentasMobile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VentasMobile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VentasMobile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VentasMobile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VentasMobile] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VentasMobile] SET  MULTI_USER 
GO
ALTER DATABASE [VentasMobile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VentasMobile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VentasMobile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VentasMobile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VentasMobile] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VentasMobile] SET QUERY_STORE = OFF
GO
USE [VentasMobile]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[nro_Cliente] [int] NOT NULL,
	[nombre_Cliente] [nvarchar](max) NULL,
	[apellido_Cliente] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[nro_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemPedido]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPedido](
	[id_itemProducto] [int] NOT NULL,
	[id_Producto] [int] NULL,
	[id_Pedido] [int] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [PK_ItemPedido] PRIMARY KEY CLUSTERED 
(
	[id_itemProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[nro_Pedido] [int] IDENTITY(1,1) NOT NULL,
	[nro_Cliente] [int] NULL,
	[nro_Vendedor] [int] NULL,
	[id_Producto] [int] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[nro_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Nombre_Producto] [nvarchar](max) NULL,
	[id_Producto] [int] NOT NULL,
	[Precio_Producto] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id_Producto] [int] NULL,
	[id_Stock] [int] NOT NULL,
	[cantidadDisponible_Producto] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[id_Stock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[nombre_Vendedor] [nvarchar](max) NULL,
	[apellido_Vendedor] [nvarchar](max) NULL,
	[zona_Vendedor] [nvarchar](max) NULL,
	[nro_Vendedor] [int] NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[nro_Vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_itemPedido_Pedido] FOREIGN KEY([id_Pedido])
REFERENCES [dbo].[Pedido] ([nro_Pedido])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemPedido] CHECK CONSTRAINT [FK_itemPedido_Pedido]
GO
ALTER TABLE [dbo].[ItemPedido]  WITH CHECK ADD  CONSTRAINT [FK_Producto] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Producto] ([id_Producto])
GO
ALTER TABLE [dbo].[ItemPedido] CHECK CONSTRAINT [FK_Producto]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente_nroCliente] FOREIGN KEY([nro_Cliente])
REFERENCES [dbo].[Cliente] ([nro_Cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente_nroCliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Vendedor_nroVendedor] FOREIGN KEY([nro_Vendedor])
REFERENCES [dbo].[Vendedor] ([nro_Vendedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Vendedor_nroVendedor]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Producto_idProducto] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Producto] ([id_Producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Stock_Producto_idProducto]
GO
ALTER TABLE [dbo].[Stock]  WITH NOCHECK ADD  CONSTRAINT [FK_Producto_idProducto] FOREIGN KEY([id_Producto])
REFERENCES [dbo].[Producto] ([id_Producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Producto_idProducto]
GO
/****** Object:  StoredProcedure [dbo].[SP_CargarDatos]    Script Date: 6/13/2019 11:25:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CargarDatos]
    -- Add the parameters for the stored procedure here
AS
BEGIN
    -- SET NOCOUNT ON agregado para no mostrar la cantidad de rows afectadas.

    SET NOCOUNT ON;
 
    -- Indico las tablas a ser usadas ( se eliminan y se insertan con nulk insert)
delete from [dbo].[Cliente] /*Elimino las tablas de la base de datos*/
delete from [dbo].[Producto]/*Estas son tablas que se van a cargar en un periodo determinado*/
delete from [dbo].[Stock]/*habria que generar un trigger para chequear updates en cliente,producto,stock y vendedor*/
delete from [dbo].[Vendedor]



BULK INSERT [dbo].[Cliente]
FROM 'C:\VentasMobile\Cliente.csv' /*Creo una ruta para almacenar mis archivos que contienen los datos de prueba*/
WITH
(
    FORMAT = 'CSV', 
    FIELDQUOTE = '"',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --Delimitidor de campo del CSV
    ROWTERMINATOR = '\n',   --Lo utilizo para pasar leer la siguiente linea del documento
    TABLOCK
)

 

BULK INSERT [dbo].[Stock]
FROM 'C:\VentasMobile\Stock.csv'
WITH
(
    FORMAT = 'CSV', 
    FIELDQUOTE = '"',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --Delimitidor de campo del CSV
    ROWTERMINATOR = '0x0a',   --Lo utilizo para pasar leer la siguiente linea del documento
    TABLOCK
)

BULK INSERT [dbo].[Producto]
FROM 'C:\VentasMobile\Producto.csv'
WITH
(
    FORMAT = 'CSV', 
    FIELDQUOTE = '"',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --Delimitidor de campo del CSV
    ROWTERMINATOR = '\n',   --Lo utilizo para pasar leer la siguiente linea del documento
    TABLOCK
)
 

BULK INSERT [dbo].[Vendedor]
FROM 'C:\VentasMobile\Vendedor.csv'
WITH
(
    FORMAT = 'CSV', 
    FIELDQUOTE = '"',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --Delimitidor de campo del CSV
    ROWTERMINATOR = '\n',   --Lo utilizo para pasar leer la siguiente linea del documento
    TABLOCK
)
 

END
GO
USE [master]
GO
ALTER DATABASE [VentasMobile] SET  READ_WRITE 
GO
