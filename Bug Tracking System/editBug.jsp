<%-- 
    Document   : editBug
    Created on : 11 Jul, 2024, 8:31:30 PM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UpdateId Page</title>
    </head>
    <body>
       
            <%@page import ="java.sql.DriverManager" %>
<%@page import ="java.sql.ResultSet" %>
<%@page import ="java.sql.Statement" %>
<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.*,java.util.*" %>
<%
    try{
Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                    
        PreparedStatement ps = con.prepareStatement("update bug set BUG_TYPE=?,BUG_DESC=?,STATUS=? WHERE BUG_ID=? ");
                        ps.setString(1, request.getParameter("type"));
                        ps.setString(2, request.getParameter("desc"));
                        ps.setString(3, request.getParameter("status"));
                        ps.setString(4, request.getParameter("id"));

                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                          %>
                           <script>
                               alert("update successfully")
            window.history.back();
            window.history.back();
        </script>
                          <%
                            
                        }else{
                            out.print("data not present");
                        }

                    } catch (Exception e) {
                        out.print(e);
                    }
%>
    </body>
</html>
