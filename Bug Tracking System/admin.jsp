<%-- 
    Document   : admin
    Created on : 10 Jul, 2024, 9:40:57 PM
    Author     : abhilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    String fname = "";
    String lname = "";
    String id = "";
    String user = "";
    
    String myString = (String) session.getAttribute("myString");
//        out.println("The string value is: " + myString);
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
        PreparedStatement ps = con.prepareStatement("SELECT FIRSTNAME,LASTNAME,USERID,USERNAME FROM finallogin where PASSWORD = ? ");
        ps.setString(1, myString);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            fname = rs.getString("FIRSTNAME");
            lname = rs.getString("LASTNAME");
            id = rs.getString("USERID");
            user = rs.getString("USERNAME");
    session.setAttribute("id", id);
        } else {
            out.print("in else");
        }
    } catch (Exception e) {
        out.print("in catch");
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header{
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }.nav{
            display: flex;
            justify-content: center;
            background-color: #444;
        }
        .nav a{
            color: #fff;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }
        .nav a:hover{
            background-color: #555;
        }
        main{
            margin: 20px;
        }
        section {
            margin-bottom: 20px;
        }
        
        h2 {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }       
        form {
            display: flex;
            flex-direction: column;
        } 
        form label {
            margin-bottom: 5px;
            margin-top: 10px;
        } 
        form input {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        } 
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        } 
        table, th, td {
            border: 1px solid #ccc;
        } 
        th, td {
            padding: 10px;
            text-align: left;
        } 
        th {
            background-color: #eee;
        }
        label{
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"]{
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        footer {
            text-align: center;
            padding: 10px 0;
            background: #333;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="header">
            <h1>Bug Tracking System - Admin Page</h1>
    </div>
        <div class="nav">
            <a href="index.html">Home</a>
            <a href="#">Dashboard</a>
            <a href="update.jsp">Update Profile</a>
            <a href="logout.jsp">LogOut</a>
        </div>
        <main>
            <section id="profile">
                <h2>MY PROFILE</h2>
                <form>
                    <%String fullName =fname+" "+lname;%>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= fullName%>" readonly>
                    <label for="userid">User ID:</label>
                    <input type="number" id="userid" name="userid" value="<%= id%>" readonly>
                    <label for="username">User Name:</label>
                    <input type="text" id="username" name="username" value="<%= user%>" readonly>
                </form>
            </section> 
                 <%                try {
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                                Statement ps = con.createStatement();
ResultSet rs = ps.executeQuery("SELECT * FROM FINALLOGIN ");
%>
            <section id="Employee">
                <h2> EMPLOYEE INFORMATION</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Employee ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>EMAIL</th>
                            <th>Department</th>
                            <th>UserName</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <%        while (rs.next()) {
                         int userid = rs.getInt("USERID");
                                %>
                    <tbody>
                        <tr>
                                    <td><%= rs.getString("USERID")%></td>
                                    <td><%= rs.getString("FIRSTNAME")%></td>
                                    <td><%= rs.getString("LASTNAME")%></td>
                                    <td><%= rs.getString("GENDER")%></td>
                                    <td><%= rs.getString("EMAIL")%></td>
                                    <td><%= rs.getString("DEPARTMENT")%></td>
                                    <td><%= rs.getString("USERNAME")%></td>
                                    <td><%= rs.getString("PHONE")%></td>
                                    <td><%= rs.getString("ADDRESS")%></td>
                                    <td>
            <form action="delete.jsp" method="post">
                <input type="hidden" name="id" value="<%= userid %>">
                <input type="submit" value="Delete">
            </form>
        </td>
          </tr>
     <%    }
        %> </tbody>
                </table>
                                <%
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Bug Tracking System</p>
        </footer>
</body>
</html>
