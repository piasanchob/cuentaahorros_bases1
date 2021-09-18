<%

Dim con
Dim user
Dim password
Dim query
Dim rs


user =Request.form("username")
password =Request.form("pass")

Response.write(user)
Response.write("<br>") 

Response.write(password) 
Response.write("<br>") 
Set con = Server.createObject("ADODB.Connection")

con.ConnectionString= "Provider=SQLNCLI11;Server=DESKTOP-94UDDNK;Database=cuentaAhorros;uid=sa;pwd=4321;"

con.open    
query="select * from Usuarios where Username = '"&user&"' AND Pass = '"&password&"'"
set rs=con.execute(query)

if rs.BOF and rs.EOF then
	Response.Redirect "login.asp"
else
    Response.Redirect "inicio.asp"
end if

%>