use cuentaAhorros

CREATE PROCEDURE validarUsuario @Usuario varchar(64), @Contraseña varchar(64)
AS
	BEGIN

		select 1 from dbo.Usuarios where Username = @Usuario AND Pass = @Contraseña;

END;

--EXEC validarUsuario @Usuario = 'username',@Contraseña = 'password'

CREATE PROCEDURE CuentasXUsuario @Usuario varchar(64), @Contraseña varchar(64)
AS
BEGIN
	
	return SELECT Cedula FROM dbo.Usuarios WHERE Username = @Usuario

END;

CREATE PROCEDURE EnseñarCuentas @cedulaP varchar(64)
AS 
BEGIN
	return SELECT NumCuenta FROM dbo.CuentaAhorros WHERE @cedulaP = Cedula

END;

SELECT Beneficiarios.Id, IdParentesco, Porcentaje, Personas.Id, 
Beneficiarios.Cedula, NumCuenta, Enabled, FechaEliminacion 
FROM dbo.Beneficiarios
INNER JOIN dbo.Personas ON Beneficiarios.Cedula = Personas.Cedula
