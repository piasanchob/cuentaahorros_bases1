<%
Dim identificacion
Dim parentesco
Dim porcentaje 
Dim num
Dim rs

parentesco =Request.form("parent")
porcentaje =Request.form("beneficio")
identificacion =Request.form("id")
num = Request.form("numCuenta")


Set con = Server.createObject("ADODB.Connection")



con.ConnectionString= "Provider=SQLNCLI11;Server=DESKTOP-94UDDNK;Database=cuentaAhorros;uid=sa;pwd=4321;"

con.open    
DIM upd
SET upd = Server.CreateObject("ADODB.Command")
SET upd.ActiveConnection = con

upd.CommandText = "ValidarBeneficiarios"
upd.CommandType = 4  'adCmdStoredProc

upd.Parameters("@Cedula") = identificacion
upd.Execute()


rs = upd.Parameters(0)

if rs="1" then
    SET exc = Server.CreateObject("ADODB.Command")
    SET exc.ActiveConnection = con

    exc.CommandText = "validarIdenPersona"
    exc.CommandType = 4  'adCmdStoredProc

    exc.Parameters("@ident") = identificacion

    exc.Execute()
    rs = exc.Parameters(0)
    if rs="1" then
        SET cmd = Server.CreateObject("ADODB.Command")
        SET cmd.ActiveConnection = con

        cmd.CommandText = "validarPorcentaje2"
        cmd.CommandType = 4  'adCmdStoredProc

        cmd.Parameters("@Porcentaje") = porcentaje
        cmd.Parameters("@Cedula") = identificacion
        cmd.Execute()
        rs = cmd.Parameters(0)

        if rs="1" then
        
            SET cmd = Server.CreateObject("ADODB.Command")
            SET cmd.ActiveConnection = con

            cmd.CommandText = "agregarBeneficiario"
            cmd.CommandType = 4  'adCmdStoredProc

            cmd.Parameters("@Parentezco") = parentesco
            cmd.Parameters("@Porcentaje") = porcentaje
            cmd.Parameters("@ident") = identificacion
            cmd.Parameters("@Cuenta") = num
            cmd.Execute()


            Response.Redirect"porcentaje.asp"


        elseif rs="0" then
            Response.Redirect"porcentajeMayor.asp"

        else
            SET cmd = Server.CreateObject("ADODB.Command")
            SET cmd.ActiveConnection = con

            cmd.CommandText = "agregarBeneficiario"
            cmd.CommandType = 4  'adCmdStoredProc

            cmd.Parameters("@Parentezco") = parentesco
            cmd.Parameters("@Porcentaje") = porcentaje
            cmd.Parameters("@ident") = identificacion
            cmd.Parameters("@Cuenta") = num
            cmd.Execute()
            Response.Redirect"mensajeBeneficiarios.asp"
        end if



    else

        SET cmd = Server.CreateObject("ADODB.Command")
        SET cmd.ActiveConnection = con

        cmd.CommandText = "validarPorcentaje"
        cmd.CommandType = 4  'adCmdStoredProc

        cmd.Parameters("@Porcentaje2") = porcentaje
        cmd.Parameters("@Cedula") = identificacion
        cmd.Execute()
        rs = cmd.Parameters(0)

         if rs="1" then
        
            SET cmd = Server.CreateObject("ADODB.Command")
            SET cmd.ActiveConnection = con

            cmd.CommandText = "agregarBeneficiario"
            cmd.CommandType = 4  'adCmdStoredProc

            cmd.Parameters("@Parentezco") = parentesco
            cmd.Parameters("@Porcentaje") = porcentaje
            cmd.Parameters("@ident") = identificacion
            cmd.Parameters("@Cuenta") = num
            cmd.Execute()


            Response.Redirect"porcentaje.asp"
            SET cmd = Server.CreateObject("ADODB.Command")
            SET cmd.ActiveConnection = con

            cmd.CommandText = "agregarBeneficiario"
            cmd.CommandType = 4  'adCmdStoredProc

            cmd.Parameters("@Parentezco") = parentesco
            cmd.Parameters("@Porcentaje") = porcentaje
            cmd.Parameters("@ident") = identificacion
            cmd.Parameters("@Cuenta") = num
            cmd.Execute()
            Response.Redirect"agregarPersona.asp"


         elseif rs="0" then
            Response.Redirect"porcentajeMayor.asp"

         else
            SET cmd = Server.CreateObject("ADODB.Command")
            SET cmd.ActiveConnection = con

            cmd.CommandText = "agregarBeneficiario"
            cmd.CommandType = 4  'adCmdStoredProc

            cmd.Parameters("@Parentezco") = parentesco
            cmd.Parameters("@Porcentaje") = porcentaje
            cmd.Parameters("@ident") = identificacion
            cmd.Parameters("@Cuenta") = num
            cmd.Execute()
            Response.Redirect"mensajeBeneficiarios.asp"
            SET cmd = Server.CreateObject("ADODB.Command")
            SET cmd.ActiveConnection = con

            cmd.CommandText = "agregarBeneficiario"
            cmd.CommandType = 4  'adCmdStoredProc

            cmd.Parameters("@Parentezco") = parentesco
            cmd.Parameters("@Porcentaje") = porcentaje
            cmd.Parameters("@ident") = identificacion
            cmd.Parameters("@Cuenta") = num
            cmd.Execute()
            Response.Redirect"agregarPersona.asp"
        end if
        
    end if


else    
    Response.Redirect"mensajeBeneficiariosError.asp"
end if

%>
 