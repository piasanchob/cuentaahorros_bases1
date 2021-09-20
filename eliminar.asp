<<<<<<< HEAD

<%
Dim cedula
=======
<%
Dim identificacion
>>>>>>> master
Dim user
Dim password
Dim query
Dim rs
<<<<<<< HEAD
Dim porcentaje
Dim cuenta

cedula =Request.form("ced")
cuenta =Request.form("num") 
porcentaje =Request.form("porcentaje") 

Response.write(cedula)
Response.write("<br>")
=======


ident =Request.form("id")

Response.write(identificacion)
>>>>>>> master

Set con = Server.createObject("ADODB.Connection")

con.ConnectionString= "Provider=SQLNCLI11;Server=DESKTOP-94UDDNK;Database=cuentaAhorros;uid=sa;pwd=4321;"

con.open    
<<<<<<< HEAD

DIM cmd

SET cmd = Server.CreateObject("ADODB.Command")
SET cmd.ActiveConnection = con




'Prepare the stored procedure
cmd.CommandText = "ValidarElim"
cmd.CommandType = 4  'adCmdStoredProc
cmd.Parameters("@cedula") = cedula
cmd.Parameters("@porcentaje") = porcentaje
cmd.Parameters("@numCuenta") = cuenta


'Execute the stored procedure
'This returns recordset but you dont need it

cmd.Execute()
rs = cmd.Parameters(0)

if rs="1" then
    Dim upd
    SET upd = Server.CreateObject("ADODB.Command")
    SET upd.ActiveConnection = con
    upd.CommandText = "Eliminar"
    upd.CommandType = 4  'adCmdStoredProc
    upd.Parameters("@Cedula") = cedula
    upd.Execute()
    Response.Redirect("mensajeEliminado.asp")
else
    Response.Redirect("DatosNoEncontrados.asp")


=======
query="select * from Beneficiarios where Cedula='"&ident&"'"

set rs=con.execute(query)


if not rs.EOF  then
	Response.Write("encontro")
else
    Response.Redirect( "error.asp")
>>>>>>> master
end if

%>
