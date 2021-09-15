<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit

Dim rec
Dim user
Dim password


user =Request.form("username")
password =Request.form("pass")

Response.write(user)
Response.write("<br>") 

Response.write(password) 
Set Con = Server.CreateObject("ADODB.Connection")

Con.ConnectionString= "Provider=SQLOLEDB; Data Source=DESKTOP-94UDDNK\gmora(55);Database=cuentaAhorros;User Id =sa; Password= "
Con.open


%>
Exito