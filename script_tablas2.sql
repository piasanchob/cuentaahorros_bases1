USE [master]
GO
/****** Object:  Database [cuentaAhorros]    Script Date: 26/8/2021 21:46:45 ******/
CREATE DATABASE [cuentaAhorros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cuentaAhorros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cuentaAhorros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cuentaAhorros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cuentaAhorros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cuentaAhorros] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cuentaAhorros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cuentaAhorros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cuentaAhorros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cuentaAhorros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cuentaAhorros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cuentaAhorros] SET ARITHABORT OFF 
GO
ALTER DATABASE [cuentaAhorros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cuentaAhorros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cuentaAhorros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cuentaAhorros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cuentaAhorros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cuentaAhorros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cuentaAhorros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cuentaAhorros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cuentaAhorros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cuentaAhorros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cuentaAhorros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cuentaAhorros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cuentaAhorros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cuentaAhorros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cuentaAhorros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cuentaAhorros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cuentaAhorros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cuentaAhorros] SET RECOVERY FULL 
GO
ALTER DATABASE [cuentaAhorros] SET  MULTI_USER 
GO
ALTER DATABASE [cuentaAhorros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cuentaAhorros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cuentaAhorros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cuentaAhorros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cuentaAhorros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cuentaAhorros] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cuentaAhorros', N'ON'
GO
ALTER DATABASE [cuentaAhorros] SET QUERY_STORE = OFF
GO
USE [cuentaAhorros]
GO
/****** Object:  User [sa2]    Script Date: 26/8/2021 21:46:46 ******/
CREATE USER [sa2] FOR LOGIN [sa2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Beneficiarios]    Script Date: 26/8/2021 21:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiarios](
	[beneficiarioid] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellido1] [varchar](64) NOT NULL,
	[apellido2] [varchar](64) NULL,
	[parentescoid] [int] NOT NULL,
	[porcentaje] [decimal](5, 4) NOT NULL,
	[usuarioid] [int] NULL,
 CONSTRAINT [PK_Beneficiarios] PRIMARY KEY CLUSTERED 
(
	[beneficiarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaAhorros]    Script Date: 26/8/2021 21:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaAhorros](
	[cuentaid] [int] IDENTITY(1,1) NOT NULL,
	[fechacreacion] [date] NULL,
	[saldo] [float] NULL,
	[usuarioid] [int] NULL,
	[tipocuentaid] [int] NULL,
 CONSTRAINT [PK_CuentaAhorros] PRIMARY KEY CLUSTERED 
(
	[cuentaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parentescos]    Script Date: 26/8/2021 21:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parentescos](
	[parentescoid] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
 CONSTRAINT [PK_Parentescos] PRIMARY KEY CLUSTERED 
(
	[parentescoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposCuentaAhorros]    Script Date: 26/8/2021 21:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCuentaAhorros](
	[tipocuentaid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](64) NULL,
	[tipomonedaid] [varchar](64) NULL,
	[saldomin] [int] NULL,
	[multasaldomin] [int] NULL,
	[mensualidad] [int] NULL,
	[maxaccionescajero_sinrecargo] [int] NULL,
	[maxaccionescajero] [int] NULL,
	[comisionhumano] [int] NULL,
	[comisioncajero] [int] NULL,
	[tasainteres] [int] NULL,
 CONSTRAINT [PK_TiposCuentaAhorros] PRIMARY KEY CLUSTERED 
(
	[tipocuentaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/8/2021 21:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuarioid] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NOT NULL,
	[nombre] [varchar](64) NOT NULL,
	[apellido1] [varchar](64) NOT NULL,
	[apellido2] [varchar](64) NULL,
	[fechanac] [date] NULL,
	[tel1] [bigint] NULL,
	[tel2] [bigint] NULL,
	[email] [varchar](max) NULL,
	[tipodocid] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Beneficiarios]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiarios_Parentescos] FOREIGN KEY([parentescoid])
REFERENCES [dbo].[Parentescos] ([parentescoid])
GO
ALTER TABLE [dbo].[Beneficiarios] CHECK CONSTRAINT [FK_Beneficiarios_Parentescos]
GO
ALTER TABLE [dbo].[Beneficiarios]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiarios_Usuarios] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[Usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[Beneficiarios] CHECK CONSTRAINT [FK_Beneficiarios_Usuarios]
GO
ALTER TABLE [dbo].[CuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorros_TiposCuentaAhorros] FOREIGN KEY([tipocuentaid])
REFERENCES [dbo].[TiposCuentaAhorros] ([tipocuentaid])
GO
ALTER TABLE [dbo].[CuentaAhorros] CHECK CONSTRAINT [FK_CuentaAhorros_TiposCuentaAhorros]
GO
ALTER TABLE [dbo].[CuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorros_Usuarios] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[Usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[CuentaAhorros] CHECK CONSTRAINT [FK_CuentaAhorros_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [cuentaAhorros] SET  READ_WRITE 
GO
