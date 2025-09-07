<%-- 
    Document   : deleteBug
    Created on : 11 Jul, 2024, 12:11:10 AM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.util.*" %>
        <% 

            String myString = request.getParameter("id");

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");

                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                PreparedStatement ps = con.prepareStatement("delete FROM bug where BUG_ID = ? ");
                ps.setString(1, myString);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %><script>
            alert("Delete successfully");
            window.history.back();
        </script><%
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

