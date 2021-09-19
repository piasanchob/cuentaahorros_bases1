use cuentaAhorros 
GO
CREATE PROCEDURE Eliminar
AS
	BEGIN
	DELETE FROM dbo.Personas;
	DBCC CHECKIDENT ('[Personas]', RESEED, 0);
	SELECT * FROM dbo.Personas;
	DELETE FROM dbo.TipoDocsIdentidad;
	DBCC CHECKIDENT ('[TipoDocsIdentidad]', RESEED, 0);
	SELECT * FROM dbo.TipoDocsIdentidad;
	DELETE FROM dbo.CuentaAhorros;
	DBCC CHECKIDENT ('[CuentaAhorros]', RESEED, 0);
	SELECT * FROM dbo.CuentaAhorros;
	DELETE FROM dbo.TiposCuentaAhorros
	DBCC CHECKIDENT ('[TiposCuentaAhorros]', RESEED, 0);
	SELECT * FROM dbo.TiposCuentaAhorros;
	DELETE FROM dbo.TipoMonedas
	DBCC CHECKIDENT ('[TipoMonedas]', RESEED, 0);
	SELECT * FROM dbo.TipoMonedas;
	DELETE FROM dbo.Beneficiarios
	DBCC CHECKIDENT ('[Beneficiarios]', RESEED, 0);
	SELECT * FROM dbo.Beneficiarios;
	DELETE FROM dbo.Parentescos
	DBCC CHECKIDENT ('[Parentescos]', RESEED, 0);
	SELECT * FROM dbo.Parentescos;
	DELETE FROM dbo.Usuarios
	DBCC CHECKIDENT ('[Usuarios]', RESEED, 0);
	SELECT * FROM dbo.Usuarios;
	DELETE FROM dbo.UsuarioPuedeVer;
	DBCC CHECKIDENT ('[UsuarioPuedeVer]', RESEED, 0);
	SELECT * FROM dbo.UsuarioPuedeVer;
END;
EXEC Eliminar;