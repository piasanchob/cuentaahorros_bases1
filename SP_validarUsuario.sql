use cuentaAhorros

CREATE PROCEDURE validarUsuario @Usuario varchar(64), @Contrase�a varchar(64)
AS
	BEGIN

		select 1 from dbo.Usuarios where Username = @Usuario AND Pass = @Contrase�a;

END;

--EXEC validarUsuario @Usuario = 'username',@Contrase�a = 'password'




SELECT Beneficiarios.Id, IdParentesco, Porcentaje, Personas.Id, 
Beneficiarios.Cedula, NumCuenta, Enabled, FechaEliminacion 
FROM dbo.Beneficiarios
INNER JOIN dbo.Personas ON Beneficiarios.Cedula = Personas.Cedula
