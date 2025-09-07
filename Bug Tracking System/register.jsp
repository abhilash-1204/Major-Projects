<%-- 
    Document   : register
    Created on : 7 Jul, 2024, 10:22:22 PM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Form Submission</title>
    </head>
    <body>
        <%@page import ="java.sql.DriverManager" %>
        <%@page import ="java.sql.ResultSet" %>
        <%@page import ="java.sql.Statement" %>
        <%@page import ="java.sql.Connection" %>
        <%@page import ="java.sql.*,java.util.*" %>
        <%
          if(request.getParameter("password").equals(request.getParameter("confirm-password"))){
           try{
               Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","Abhilash");
            PreparedStatement ps = con.prepareStatement("SELECT DEPACODE FROM DEPARTMENT WHERE DEPART=? ");
            ps.setString(1, request.getParameter("department"));
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
               if(rs.getString(1).equals(request.getParameter("dcode"))){
                
                    
                    ps = con.prepareStatement("insert into finallogin values(?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1, request.getParameter("id"));
                    ps.setString(2, request.getParameter("fname"));
                    ps.setString(3, request.getParameter("lname"));
                    ps.setString(4, request.getParameter("gender"));
                    ps.setString(5, request.getParameter("email"));
                    ps.setString(6, request.getParameter("department"));
                    ps.setString(7, request.getParameter("username"));
                    ps.setString(8, request.getParameter("password"));
                    ps.setString(9, request.getParameter("phone"));
                    ps.setString(10, request.getParameter("address"));
                    rs = ps.executeQuery();
                    if(rs.next()){
                        %><script>
                            alert("Registration successful")
                            window.location.href = "login.html";
                        </script><%
                    }
                 }else{
                        %><script>
                            alert("Invalid Department code");
                            window.history.back();
                        </script><%    
                    }
            }
           }catch(Exception e){
               out.print(e);
                
           }
        }else{
            %><script>
                            alert("password didn't match");
                            window.history.back();
                        </script><%
        }
%>
    </body>
</html>
