use cuentaAhorros

CREATE PROCEDURE validarUsuario @Usuario varchar(64), @Contraseña varchar(64)
AS
	BEGIN

		select 1 from dbo.Usuarios where Username = @Usuario AND Pass = @Contraseña;

	

END;

--EXEC validarUsuario @Usuario = 'username',@Contraseña = 'password'

