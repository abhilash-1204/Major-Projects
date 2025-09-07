<%-- 
    Document   : login
    Created on : 7 Jul, 2024, 10:12:21 PM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login action</title>
    </head>
    <body>
    <center>
        <%@page import ="java.sql.DriverManager" %>
        <%@page import ="java.sql.ResultSet" %>
        <%@page import ="java.sql.Statement" %>
        <%@page import ="java.sql.Connection" %>
        <%@page import ="java.sql.*,java.util.*" %>
        <%
            try {
                String myString = request.getParameter("pass");
                session.setAttribute("myString", myString);

                Class.forName("oracle.jdbc.driver.OracleDriver");

                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                PreparedStatement ps = con.prepareStatement("Select department,USERID from finallogin where username= ? and password=?");
                ps.setString(1, request.getParameter("user"));
                ps.setString(2, request.getParameter("pass"));
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                        
                    if (rs.getString(1).equals("DEVELOPER")) {
        %>
        <script>
            window.location.href = "develope.jsp";
        </script>
        <%
            }
            if (rs.getString(1).equals("TEST_ENGINEER")) {
        %>
        <script>
            window.location.href = "test.jsp";
        </script>
        <%
            }
            if (rs.getString(1).equals("ADMINISTRATOR")) {
        %>
        <script>
            window.location.href = "admin.jsp";
        </script>
        <%
            }
            if (rs.getString(1).equals("PROJECT_MANAGER")) {
        %>
        <script>
            window.location.href = "Project.jsp";
        </script>
        <%
            }
        } else {
        %>
        <script>
            alert("Wrong username or password");
            window.history.back();
        </script>
        <%
            }
        } catch (Exception e) {
                %>
                      <script>
                           alert("exception");
                           window.window.history.back();
                     </script>
                    <%
                out.print("exception");
            }


        %>
    </center>
</body>
</html>
