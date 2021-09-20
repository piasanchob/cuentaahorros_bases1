<%
    Do Until rs.EOF
        Response.Write("<tr>")
            For Each X In rs.Fields
                Response.Response.Write("<td>"&x.value & "</td>")

            Next
        Response.Write("</tr>")
        rs.movenext
    Loop
    
    %>