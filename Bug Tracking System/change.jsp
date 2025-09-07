<%-- 
    Document   : change
    Created on : 7 Jul, 2024, 10:26:12 PM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
    </head>
    <body>
        <center>
        <%@page import ="java.sql.DriverManager" %>
        <%@page import ="java.sql.ResultSet" %>
        <%@page import ="java.sql.Statement" %>
        <%@page import ="java.sql.Connection" %>
        <%@page import ="java.sql.*,java.util.*" %>
        <%
          if(request.getParameter("new-password").equals(request.getParameter("confirm-password"))){
           try{
            
               Class.forName("oracle.jdbc.driver.OracleDriver");
          
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","Abhilash");
            PreparedStatement ps = con.prepareStatement("UPDATE finallogin SET password = ? WHERE email = ?");
            ps.setString(1, request.getParameter("new-password"));
            ps.setString(2, request.getParameter("email"));
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                %>
                <script>
                    alert("Password updated successfully");
                    window.location.href = "login.html";
                </script>
            <%
            }else{
                %>
              <script>
                  alert("wrong account login");
                  window.window.history.back();
              </script>
              <%
            }    
           }catch(Exception e){
               out.print("exception");
           }
        }else{
              %>
              <script>
                  alert("Mis-match password");
                  window.window.history.back();
              </script>
              <%
          }
       %>
    </body>
</html>
