<%
Dim identificacion
Dim nombre
Dim parentesco
Dim email
Dim tel1
Dim tel2
Dim porcentaje 
Dim num
Dim fecha
Dim query
Dim rs

nombre =Request.form("nom")
parentesco =Request.form("parent")
porcentaje =Request.form("beneficio")
fecha =Request.form("fechaNa")
identificacion =Request.form("id")
tel1 =Request.form("Tel1")
tel2 =Request.form("Tel2")
email =Request.form("mail")
num = Request.form("numCuenta")


Set con = Server.createObject("ADODB.Connection")



con.ConnectionString= "Provider=SQLNCLI11;Server=DESKTOP-94UDDNK;Database=cuentaAhorros;uid=sa;pwd=4321;"

con.open    


DIM cmd
SET cmd = Server.CreateObject("ADODB.Command")
SET cmd.ActiveConnection = con

cmd.CommandText = "agregarBeneficiario"
cmd.CommandType = 4  'adCmdStoredProc

cmd.Parameters("@Nombre") = nombre
cmd.Parameters("@Parentezco") = parentesco
cmd.Parameters("@Porcentaje") = porcentaje
cmd.Parameters("@Fecha") = fecha
cmd.Parameters("@ident") = identificacion
cmd.Parameters("@tel1") = tel1
cmd.Parameters("@tel2") = tel2
cmd.Parameters("@Email") = email
cmd.Parameters("@Cuenta") = num

cmd.Execute()
rs = cmd.Parameters(0)


%>
