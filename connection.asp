<%

Dim con
Dim user
Dim password
Dim query
Dim rs
Dim ra


user =Request.form("username")
password =Request.form("pass")

Response.write(user)
Response.write("<br>") 

Response.write(password) 
Response.write("<br>") 
Set con = Server.createObject("ADODB.Connection")



con.ConnectionString= "Provider=SQLNCLI11;Server=DESKTOP-94UDDNK;Database=cuentaAhorros;uid=sa;pwd=4321;"

con.open    


DIM cmd
SET cmd = Server.CreateObject("ADODB.Command")
SET cmd.ActiveConnection = con


'Prepare the stored procedure
cmd.CommandText = "validarUsuario"
cmd.CommandType = 4  'adCmdStoredProc

cmd.Parameters("@Usuario") = user
cmd.Parameters("@Contra") = password

'Execute the stored procedure
'This returns recordset but you dont need it

cmd.Execute()
rs = cmd.Parameters(0)
Response.write(rs)

if rs="1" then
    Response.Redirect("inicio.asp")

else
    Response.Redirect("login.asp")

end if

' ... more params goes (here ...


'query="select * from Usuarios where Username = '"&user&"' AND Pass = '"&password&"'"

'query="EXEC validarUsuario @Usuario = '"&user&"',@Contraseña = '"&password&"'"

'set rs=con.execute(query)





%>