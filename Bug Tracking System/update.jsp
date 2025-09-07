<%-- 
    Document   : update
    Created on : 11 Jul, 2024, 11:15:35 AM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.DriverManager" %>
<%@page import ="java.sql.ResultSet" %>
<%@page import ="java.sql.Statement" %>
<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.*,java.util.*" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Page</title>
        <style>
            body{
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial,sans-serif;
                background-color: #f2f2f2;
            }
            .back-arrow{
            font-weight: bolder;
            background-color: #cfdbd1;
            color: #ccc;
        }
            .registration-container {
                width: 400px;
                padding: 20px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            .registration-container h2{
                text-align: center;
                margin-bottom: 20px;
            }
            .registration-container input[type="text"],
            .registration-container input[type="tel"],
            .registration-container textarea,
            .registration-container select {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
            .registration-container input[type="radio"] {
                margin-right: 5px;
            } 
            .registration-container .gender {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }        
            .registration-container button{
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }
            .registration-container button:hover{
                background-color: #45a049;
            }
            .back-arrow {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 18px;
            cursor: pointer;
            text-decoration: none;
            color: #333;         
         }
        </style>
    </head>
    <body style="background-color:cornflowerblue;">
        <div class="registration-container">
            <div class="back">
            <a href="index.html" class="back-arrow">&#8592; Back</a> 
        </div>
            <h2 style="color: blue;">UPDATE PROFILE</h2>

            <%

                String myId = (String) session.getAttribute("id");
                try {
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM FINALLOGIN WHERE USERID=?");
                    ps.setString(1, myId);

                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
            %>
            <form action="updateId.jsp">
                <label for="userid">USER ID:</label>
                <input type="text" id="userid" name="id" value="<%= rs.getString("USERID")%>" readonly>
                <label for="fname">First Name:</label>
                <input type="text" id="fname" name="fname" value="<%= rs.getString("FIRSTNAME")%>" required>
                <label for="lname">Last Name:</label>
                <input type="text" id="lname" name="lname" value="<%= rs.getString("LASTNAME")%>" required>
                <label for="email">Email :</label>
                <input type="text" id="email" name="email" value="<%=rs.getString("EMAIL")%>" required>
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" value="<%=rs.getString("PHONE")%>" required>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" maxlength="" value="<%=rs.getString("ADDRESS")%>" required>
                <%
                        } else {
                            out.print("in else");
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }
                %>
                <button type="Submit">UPDATE</button>
            </form>
        </div> 
    </body>
</html>