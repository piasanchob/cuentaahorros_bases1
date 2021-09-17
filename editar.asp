<%
Dim identificacion
Dim user
Dim password
Dim query
Dim rs


ident =Request.form("id")

Response.write(identificacion)

Set con = Server.createObject("ADODB.Connection")

con.ConnectionString= "Provider=SQLNCLI11;Server=DESKTOP-94UDDNK;Database=cuentaAhorros;uid=sa;pwd=4321;"

con.open    
query="select * from Beneficiarios where Cedula='"&ident&"'"

set rs=con.execute(query)


if not rs.EOF  then
	Response.Write("encontro")
else
    Response.Redirect( "error.asp")
end if

%>







