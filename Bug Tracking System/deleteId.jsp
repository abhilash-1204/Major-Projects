<%-- 
    Document   : delete
    Created on : 10 Jul, 2024, 11:58:59 PM
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
        <%   String myString = request.getParameter("id");
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
    PreparedStatement ps = con.prepareStatement("delete FROM finallogin where USERID = ?  ");
                ps.setString(1, myString);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %><script>
            alert("Delete successful");
            window.history.back();
        </script><%
                            } else {
                                out.print("in else");
                            }
                        } catch (Exception e) {
                            out.print("in catch");
                        } %>
    </body>
</html>
