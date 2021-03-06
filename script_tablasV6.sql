USE [master]
GO
/****** Object:  Database [cuentaAhorros]    Script Date: 17/9/2021 18:32:56 ******/
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
/****** Object:  User [sa2]    Script Date: 17/9/2021 18:32:57 ******/
CREATE USER [sa2] FOR LOGIN [sa2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Beneficiarios]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdParentesco] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
	[IdPersona] [int] NULL,
	[Cedula] [varchar](64) NOT NULL,
	[NumCuenta] [varchar](64) NOT NULL,
	[Enabled] [bit] NULL,
	[FechaEliminacion] [date] NULL,
 CONSTRAINT [PK_Beneficiarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaAhorros]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaAhorros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoCuenta] [int] NOT NULL,
	[IdPersona] [int] NULL,
	[IdUsuario] [int] NULL,
	[NumCuenta] [varchar](64) NOT NULL,
	[Saldo] [float] NOT NULL,
	[Cedula] [varchar](64) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
 CONSTRAINT [PK_CuentaAhorros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parentescos]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parentescos](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Parentescos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoDoc] [int] NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Tel1] [bigint] NOT NULL,
	[Tel2] [bigint] NULL,
	[Email] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocsIdentidad]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocsIdentidad](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoCedulas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMonedas]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMonedas](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoMonedas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposCuentaAhorros]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposCuentaAhorros](
	[Id] [int] NOT NULL,
	[IdTipoMoneda] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[SaldoMin] [float] NOT NULL,
	[MultaSaldoMin] [float] NOT NULL,
	[CargoAnual] [int] NOT NULL,
	[NumRetirosHumano] [int] NOT NULL,
	[NumRetirosAutomatico] [int] NOT NULL,
	[ComisionHumano] [int] NOT NULL,
	[ComisionCajero] [int] NOT NULL,
	[TasaInteres] [int] NOT NULL,
 CONSTRAINT [PK_TiposCuentaAhorros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioPuedeVer]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioPuedeVer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[Username] [varchar](64) NOT NULL,
	[NumCuenta] [varchar](64) NOT NULL,
 CONSTRAINT [PK_UsuarioPuedeVer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](64) NOT NULL,
	[Pass] [varchar](64) NOT NULL,
	[Cedula] [varchar](64) NOT NULL,
	[EsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Beneficiarios]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiarios_Parentescos1] FOREIGN KEY([IdParentesco])
REFERENCES [dbo].[Parentescos] ([Id])
GO
ALTER TABLE [dbo].[Beneficiarios] CHECK CONSTRAINT [FK_Beneficiarios_Parentescos1]
GO
ALTER TABLE [dbo].[Beneficiarios]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiarios_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Beneficiarios] CHECK CONSTRAINT [FK_Beneficiarios_Personas]
GO
ALTER TABLE [dbo].[CuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorros_Beneficiarios] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Beneficiarios] ([Id])
GO
ALTER TABLE [dbo].[CuentaAhorros] CHECK CONSTRAINT [FK_CuentaAhorros_Beneficiarios]
GO
ALTER TABLE [dbo].[CuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorros_Personas] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[CuentaAhorros] CHECK CONSTRAINT [FK_CuentaAhorros_Personas]
GO
ALTER TABLE [dbo].[CuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorros_TiposCuentaAhorros1] FOREIGN KEY([IdTipoCuenta])
REFERENCES [dbo].[TiposCuentaAhorros] ([Id])
GO
ALTER TABLE [dbo].[CuentaAhorros] CHECK CONSTRAINT [FK_CuentaAhorros_TiposCuentaAhorros1]
GO
ALTER TABLE [dbo].[CuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorros_UsuarioPuedeVer] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[UsuarioPuedeVer] ([Id])
GO
ALTER TABLE [dbo].[CuentaAhorros] CHECK CONSTRAINT [FK_CuentaAhorros_UsuarioPuedeVer]
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Personas_TipoCedulas] FOREIGN KEY([IdTipoDoc])
REFERENCES [dbo].[TipoDocsIdentidad] ([Id])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Personas_TipoCedulas]
GO
ALTER TABLE [dbo].[TiposCuentaAhorros]  WITH CHECK ADD  CONSTRAINT [FK_TiposCuentaAhorros_TipoMonedas] FOREIGN KEY([IdTipoMoneda])
REFERENCES [dbo].[TipoMonedas] ([Id])
GO
ALTER TABLE [dbo].[TiposCuentaAhorros] CHECK CONSTRAINT [FK_TiposCuentaAhorros_TipoMonedas]
GO
ALTER TABLE [dbo].[UsuarioPuedeVer]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPuedeVer_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[UsuarioPuedeVer] CHECK CONSTRAINT [FK_UsuarioPuedeVer_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[InsercionXML]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsercionXML]
AS
BEGIN
	--lectura del XML

	DECLARE @datos XML
	SELECT @datos = CAST(xmlfile AS xml)
	FROM OPENROWSET(BULK 'C:\Users\user\Documents\TEC\BASES1 FRANCO\XMLFILE.xml', SINGLE_BLOB) AS T(xmlfile)


	--insercion tipo docs identidad

	INSERT INTO dbo.TipoDocsIdentidad(Id, Nombre)
	SELECT  
		Id = T.Item.value('@Id', 'int'),
		Nombre = T.Item.value('@Nombre', 'varchar(64)')
	FROM @datos.nodes('Datos/Tipo_Doc/TipoDocuIdentidad') as T(Item)

	--DELETE FROM dbo.TipoDocsIdentidad
	SELECT * FROM dbo.TipoDocsIdentidad
	--insercion tipo monedas

	INSERT INTO dbo.TipoMonedas(Id, Nombre)
	SELECT  
		Id = T.Item.value('@Id', 'int'),
		Nombre = T.Item.value('@Nombre', 'varchar(64)')
	FROM @datos.nodes('Datos/Tipo_Moneda/TipoMoneda') as T(Item)

	SELECT * FROM dbo.TipoMonedas
	--DELETE FROM dbo.TipoMonedas
	--insercion tipo parentescos

	INSERT INTO dbo.Parentescos(Id, Nombre)
	SELECT  
		Id = T.Item.value('@Id', 'int'),
		Nombre = T.Item.value('@Nombre', 'varchar(64)')
	FROM @datos.nodes('Datos/Parentezcos/Parentezco') as T(Item)

	--DELETE FROM dbo.Parentescos
	SELECT * FROM dbo.Parentescos
	--insercion tipo cuentas de ahorro

	INSERT INTO dbo.TiposCuentaAhorros(Id, Nombre,IdTipoMoneda,SaldoMin,MultaSaldoMin,CargoAnual,NumRetirosHumano,NumRetirosAutomatico,ComisionHumano,ComisionCajero,TasaInteres)
	SELECT  
		Id = T.Item.value('@Id', 'int'),
		Nombre = T.Item.value('@Nombre', 'varchar(64)'),
		IdTipoMoneda = T.Item.value('@IdTipoMoneda', 'int'),
		SaldoMin = T.Item.value('@SaldoMinimo', 'float'),
		MultaSaldoMin = T.Item.value('@MultaSaldoMin', 'float'),
		CargoAnual = T.Item.value('@CargoAnual', 'int'),
		NumRetirosHumano = T.Item.value('@NumRetirosHumano', 'int'),
		NumRetirosAutomatico = T.Item.value('@NumRetirosAutomatico', 'int'),
		ComisionHumano = T.Item.value('@ComisionHumano', 'int'),
		ComisionCajero = T.Item.value('@ComisionAutomatico', 'int'),
		TasaInteres = T.Item.value('@Interes', 'int')


	FROM @datos.nodes('Datos/Tipo_Cuenta_Ahorros/TipoCuentaAhorro') as T(Item)

	--DELETE FROM dbo.TiposCuentaAhorros
	SELECT * FROM dbo.TiposCuentaAhorros
	--insercion Personas

	INSERT INTO dbo.Personas(Cedula,Nombre,FechaNac,Tel1,Tel2,Email,IdTipoDoc)
	SELECT  
		Cedula = T.Item.value('@ValorDocumentoIdentidad', 'int'),
		Nombre = T.Item.value('@Nombre', 'varchar(64)'),
		FechaNac = T.Item.value('@FechaNacimiento', 'date'),
		Tel1 = T.Item.value('@Telefono1', 'bigint'),
		Tel2 = T.Item.value('@Telefono2', 'bigint'),
		Email = T.Item.value('@Email', 'varchar(64)'),
		IdTipoDoc = T.Item.value('@TipoDocuIdentidad', 'int')
	FROM @datos.nodes('Datos/Personas/Persona') as T(Item)

	--DELETE FROM dbo.Personas
	SELECT * FROM dbo.Personas
	--insercion cuentas

	INSERT INTO dbo.CuentaAhorros(FechaCreacion,Saldo,IdTipoCuenta,Cedula,NumCuenta)
	SELECT  
		FechaCreacion = T.Item.value('@FechaCreacion', 'date'),
		Saldo = T.Item.value('@Saldo', 'float'),
		IdTipoCuenta = T.Item.value('@TipoCuentaId', 'int'),
		Cedula = T.Item.value('@ValorDocumentoIdentidadDelCliente', 'varchar(64)'),
		NumCuenta = T.Item.value('@NumeroCuenta', 'varchar(64)')
	
	FROM @datos.nodes('Datos/Cuentas/Cuenta') as T(Item)

	--DELETE FROM dbo.CuentaAhorros
	SELECT * FROM dbo.CuentaAhorros
	--insercion beneficiarios

	INSERT INTO dbo.Beneficiarios(IdParentesco,Porcentaje,NumCuenta,Cedula)
	SELECT  
		IdParentesco = T.Item.value('@ParentezcoId', 'int'),
		Porcentaje = T.Item.value('@Porcentaje', 'int'),
		NumCuenta = T.Item.value('@NumeroCuenta', 'varchar(64)'),
		Cedula = T.Item.value('@ValorDocumentoIdentidadBeneficiario', 'varchar(64)')
	
	
	FROM @datos.nodes('Datos/Beneficiarios/Beneficiario') as T(Item)

	--DELETE FROM dbo.Beneficiarios
	SELECT * FROM dbo.Beneficiarios
	--insertar Usuarios

	INSERT INTO dbo.Usuarios(Username,Pass,EsAdmin,Cedula)
	SELECT  
		Username = T.Item.value('@User', 'varchar(64)'),
		Pass = T.Item.value('@Pass', 'varchar(64)'),
		EsAdmin = T.Item.value('@EsAdministrador', 'bit'),
		Cedula = T.Item.value('@ValorDocumentoIdentidad', 'varchar(64)')
	
	
	FROM @datos.nodes('Datos/Usuarios/Usuario') as T(Item)

	--DELETE FROM dbo.Usuarios
	SELECT * FROM dbo.Usuarios
	-- insercion usuarios puede ver

	INSERT INTO dbo.UsuarioPuedeVer(Username,NumCuenta)
	SELECT  
		Username = T.Item.value('@User', 'varchar(64)'),
		NumCuenta = T.Item.value('@NumeroCuenta', 'varchar(64)')
	
	FROM @datos.nodes('Datos/Usuarios_Ver/UsuarioPuedeVer') as T(Item)

	--DELETE FROM dbo.UsuarioPuedeVer
	SELECT * FROM dbo.UsuarioPuedeVer

END;
GO
/****** Object:  StoredProcedure [dbo].[validarUsuario]    Script Date: 17/9/2021 18:32:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[validarUsuario] @Usuario varchar(64), @Contraseña varchar(64)
AS
	BEGIN

		select 1 from dbo.Usuarios where Username = @Usuario AND Pass = @Contraseña;

	

END;
GO
USE [master]
GO
ALTER DATABASE [cuentaAhorros] SET  READ_WRITE 
GO
