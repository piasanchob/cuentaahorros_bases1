use cuentaAhorros

CREATE PROCEDURE validarUsuario @Usuario varchar(64), @Contraseņa varchar(64)
AS
	BEGIN

		select 1 from dbo.Usuarios where Username = @Usuario AND Pass = @Contraseņa;

	

END;

--EXEC validarUsuario @Usuario = 'username',@Contraseņa = 'password'

