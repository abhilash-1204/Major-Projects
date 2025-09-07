<%-- 
    Document   : bug
    Created on : 10 Jul, 2024, 4:59:58 PM
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
        <%@page import ="java.sql.DriverManager" %>
        <%@page import ="java.sql.ResultSet" %>
        <%@page import ="java.sql.Statement" %>
        <%@page import ="java.sql.Connection" %>
        <%@page import ="java.sql.*,java.util.*" %>
        <%
            try{
               Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","Abhilash");
            PreparedStatement ps = con.prepareStatement("insert into BUG values(?,?,?,?,?,?,?)");
                    ps.setString(1, request.getParameter("bug_title"));
                    ps.setString(2, request.getParameter("bug_type"));
                    ps.setString(3, request.getParameter("bug_desc"));
                    ps.setString(4, request.getParameter("name"));
                    ps.setString(5, request.getParameter("Assigned"));
                    ps.setString(6, request.getParameter("bug_priority"));
                    ps.setString(7, request.getParameter("bug_status"));
             
           ResultSet rs = ps.executeQuery();  
            if(rs.next()){
                    %><script>
                            alert("Bug Added successfully")
                            window.history.back();
                        </script><%

                    
             }else{
                          %><script>
                            alert("not matched");
                            window.history.back();
                        </script><% 
                        
                  }  
            
           }catch(Exception e){
                %><script>
                            alert("some data previously present");
                            window.history.back();
                        </script><%
           }
        
            %>
    </body>
</html>

