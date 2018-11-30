USE [master]
GO
/****** Object:  Database [tekus]    Script Date: 30/11/2018 12:58:06 a.m. ******/
CREATE DATABASE [tekus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tekus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\tekus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tekus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\tekus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tekus] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tekus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tekus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tekus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tekus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tekus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tekus] SET ARITHABORT OFF 
GO
ALTER DATABASE [tekus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tekus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tekus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tekus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tekus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tekus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tekus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tekus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tekus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tekus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tekus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tekus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tekus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tekus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tekus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tekus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tekus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tekus] SET RECOVERY FULL 
GO
ALTER DATABASE [tekus] SET  MULTI_USER 
GO
ALTER DATABASE [tekus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tekus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tekus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tekus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tekus] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tekus', N'ON'
GO
ALTER DATABASE [tekus] SET QUERY_STORE = OFF
GO
USE [tekus]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [tekus]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 30/11/2018 12:58:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nit] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[correo] [nvarchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 30/11/2018 12:58:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[id] [int] NULL,
	[pais] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 30/11/2018 12:58:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[valor] [real] NULL,
	[idcliente] [int] NULL,
 CONSTRAINT [PK_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pais]  WITH CHECK ADD  CONSTRAINT [FK_pais_servicio] FOREIGN KEY([id])
REFERENCES [dbo].[servicio] ([id])
GO
ALTER TABLE [dbo].[pais] CHECK CONSTRAINT [FK_pais_servicio]
GO
ALTER TABLE [dbo].[servicio]  WITH CHECK ADD  CONSTRAINT [FK_servicio_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[servicio] CHECK CONSTRAINT [FK_servicio_cliente]
GO
USE [master]
GO
ALTER DATABASE [tekus] SET  READ_WRITE 
GO
