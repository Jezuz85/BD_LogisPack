/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [LogisPack_v1]    Script Date: 22/9/2017 4:32:46 p. m. ******/
CREATE DATABASE [LogisPack_v1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogisPack_v1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.JEZUZ_MSSQLSERVER\MSSQL\DATA\LogisPack_v1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LogisPack_v1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.JEZUZ_MSSQLSERVER\MSSQL\DATA\LogisPack_v1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LogisPack_v1] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogisPack_v1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogisPack_v1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogisPack_v1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogisPack_v1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogisPack_v1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogisPack_v1] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogisPack_v1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LogisPack_v1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogisPack_v1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogisPack_v1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogisPack_v1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogisPack_v1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogisPack_v1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogisPack_v1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogisPack_v1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogisPack_v1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LogisPack_v1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogisPack_v1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogisPack_v1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogisPack_v1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogisPack_v1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogisPack_v1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LogisPack_v1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogisPack_v1] SET RECOVERY FULL 
GO
ALTER DATABASE [LogisPack_v1] SET  MULTI_USER 
GO
ALTER DATABASE [LogisPack_v1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogisPack_v1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogisPack_v1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogisPack_v1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LogisPack_v1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LogisPack_v1', N'ON'
GO
ALTER DATABASE [LogisPack_v1] SET QUERY_STORE = OFF
GO
USE [LogisPack_v1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [LogisPack_v1]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[id_almacen] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](15) NOT NULL,
	[nombre] [nvarchar](40) NOT NULL,
	[coeficiente_volumetrico] [float] NOT NULL,
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Almacen] PRIMARY KEY CLUSTERED 
(
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](25) NULL,
	[nombre] [varchar](40) NULL,
	[referencia_picking] [varchar](25) NULL,
	[referencia1] [varchar](25) NULL,
	[referencia2] [varchar](25) NULL,
	[referencia3] [varchar](25) NULL,
	[identificacion] [varchar](2) NULL,
	[valor_articulo] [float] NULL,
	[valoracion_stock] [float] NULL,
	[valoracion_seguro] [float] NULL,
	[valor_asegurado] [float] NULL,
	[peso] [float] NULL,
	[alto] [float] NULL,
	[largo] [float] NULL,
	[ancho] [float] NULL,
	[coeficiente_volumetrico] [float] NULL,
	[cubicaje] [float] NULL,
	[peso_volumen] [float] NULL,
	[observaciones_articulo] [varchar](300) NULL,
	[observaciones_generales] [varchar](300) NULL,
	[stock_fisico] [float] NULL,
	[stock_minimo] [float] NULL,
	[id_almacen] [int] NULL,
	[id_tipo_facturacion] [int] NULL,
	[id_tipo_unidad] [int] NULL,
	[tipoArticulo] [varchar](10) NULL,
 CONSTRAINT [PK_dbo.Articulo] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[id_cliente] [int] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[codigo] [varchar](10) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historico]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico](
	[id_historico] [int] IDENTITY(1,1) NOT NULL,
	[fecha_transaccion] [datetime] NOT NULL,
	[tipo_transaccion] [nvarchar](3) NULL,
	[referencia_ubicacion] [nvarchar](25) NULL,
	[documento_transaccion] [nvarchar](100) NULL,
	[cantidad_transaccion] [float] NOT NULL,
	[id_articulo] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Historico] PRIMARY KEY CLUSTERED 
(
	[id_historico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagen]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagen](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[url_imagen] [nvarchar](200) NULL,
	[id_articulo] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Imagen] PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picking_Articulo]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picking_Articulo](
	[id_picking_articulo] [int] IDENTITY(1,1) NOT NULL,
	[unidades] [float] NOT NULL,
	[id_picking] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Picking_Articulo] PRIMARY KEY CLUSTERED 
(
	[id_picking_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Facturacion]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Facturacion](
	[id_tipo_facturacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Tipo_Facturacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Unidad]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Unidad](
	[id_tipo_unidad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Tipo_Unidad] PRIMARY KEY CLUSTERED 
(
	[id_tipo_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 22/9/2017 4:32:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[id_ubicacion] [int] IDENTITY(1,1) NOT NULL,
	[zona] [varchar](4) NULL,
	[estante] [varchar](4) NULL,
	[fila] [varchar](4) NULL,
	[columna] [varchar](4) NULL,
	[panel] [varchar](4) NULL,
	[referencia_ubicacion] [varchar](40) NULL,
	[id_articulo] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Ubicacion] PRIMARY KEY CLUSTERED 
(
	[id_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_almacen]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_almacen] ON [dbo].[Articulo]
(
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_tipo_facturacion]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_tipo_facturacion] ON [dbo].[Articulo]
(
	[id_tipo_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_tipo_unidad]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_tipo_unidad] ON [dbo].[Articulo]
(
	[id_tipo_unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_articulo]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_articulo] ON [dbo].[Historico]
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_articulo]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_articulo] ON [dbo].[Imagen]
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_articulo]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_articulo] ON [dbo].[Picking_Articulo]
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_id_articulo]    Script Date: 22/9/2017 4:32:47 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_id_articulo] ON [dbo].[Ubicacion]
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Almacen_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [FK_Almacen_Cliente]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Articulo_dbo.Almacen_id_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[Almacen] ([id_almacen])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_dbo.Articulo_dbo.Almacen_id_almacen]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Articulo_dbo.Tipo_Facturacion_id_tipo_facturacion] FOREIGN KEY([id_tipo_facturacion])
REFERENCES [dbo].[Tipo_Facturacion] ([id_tipo_facturacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_dbo.Articulo_dbo.Tipo_Facturacion_id_tipo_facturacion]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Articulo_dbo.Tipo_Unidad_id_tipo_unidad] FOREIGN KEY([id_tipo_unidad])
REFERENCES [dbo].[Tipo_Unidad] ([id_tipo_unidad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_dbo.Articulo_dbo.Tipo_Unidad_id_tipo_unidad]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Cliente]
GO
ALTER TABLE [dbo].[Historico]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Historico_dbo.Articulo_id_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Historico] CHECK CONSTRAINT [FK_dbo.Historico_dbo.Articulo_id_articulo]
GO
ALTER TABLE [dbo].[Imagen]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Imagen_dbo.Articulo_id_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Imagen] CHECK CONSTRAINT [FK_dbo.Imagen_dbo.Articulo_id_articulo]
GO
ALTER TABLE [dbo].[Picking_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Picking_Articulo_dbo.Articulo_id_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[Picking_Articulo] CHECK CONSTRAINT [FK_dbo.Picking_Articulo_dbo.Articulo_id_articulo]
GO
ALTER TABLE [dbo].[Picking_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Picking_Articulo_Articulo] FOREIGN KEY([id_picking])
REFERENCES [dbo].[Articulo] ([id_articulo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Picking_Articulo] CHECK CONSTRAINT [FK_Picking_Articulo_Articulo]
GO
ALTER TABLE [dbo].[Ubicacion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Ubicacion_dbo.Articulo_id_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[Articulo] ([id_articulo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ubicacion] CHECK CONSTRAINT [FK_dbo.Ubicacion_dbo.Articulo_id_articulo]
GO
USE [master]
GO
ALTER DATABASE [LogisPack_v1] SET  READ_WRITE 
GO
