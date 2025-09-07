<%-- 
    Document   : develope
    Created on : 10 Jul, 2024, 4:51:47 PM
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
            background-color: #ece6e6;
        }
        
        header {
            background-color: #001F3F;
            color: White;
            padding: 1rem 0;
            text-align: center;
        }
        header h1{
            margin: 0;
        }
        nav{
            display: flex;
            justify-content: center;
        }
.nav a{
            color: #98eab7;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }
        .nav a:hover{
            background-color: #3c79ab;
        }
        
        header h1{
            margin: 0;
        }
        nav ul{
            list-style-type: none;
            padding: 0;
        }
        nav ul li{
            display: inline;
            margin-right: 20px;
        }
        nav a{color: #98eab7;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
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
        table th:hover{
            background-color: #19dff1;
            color: #091a0c;
        }
        input[type="text"]{
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        footer{
            text-align: center;
            padding: 20px;
            background-color: #001F3F;
            color: rgb(234, 217, 231);
        }
    </style>
</head>
<body>
    <header>
        <h1>Bug Tracking System - Developer Page</h1>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#assigned-bugs">Assigned Bugs</a></li>
                    <li><a href="update.jsp">Update Profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
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
                                PreparedStatement ps = con.prepareStatement("SELECT BUG_ID,BUG_TYPE,BUG_DESC,ASSIGN_BY,PRIORITY,STATUS FROM BUG where ASSIGN_TO=? ");

                                ps.setString(1, fullName);
                                ResultSet rs = ps.executeQuery();


                        %>
        <section id="assigned-bugs">
            <h2>Assigned Bugs</h2>
            <table>
                <thead>
                    <tr>
                        <th>BUG ID</th>
                        <th>Bug Type</th>
                        <th>description</th>
                        <th>Assign By</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <%        while (rs.next()) {
                    int bug = rs.getInt("BUG_ID");
                                %>
                <tbody>
                     <tr>

                                    <td><%= rs.getString("BUG_ID")%></td>
                                    <td><%= rs.getString("BUG_TYPE")%></td>
                                    <td><%= rs.getString("BUG_DESC")%></td>
                                    <td><%= rs.getString("ASSIGN_BY")%></td>
                                    <td><%= rs.getString("PRIORITY")%></td>
                                    <td><%= rs.getString("STATUS")%></td>
                                    <td>
                                        <form action="EditBugDev.jsp" method="post">
                                    <input type="hidden" name="id" value="<%= bug%>">
                                    <input type="submit" value="Edit">
                                </form>
                                    </td>

                                </tr>
                                <%
                                    }
                                %>
                </tbody>
            </table>
                <%
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
        </section>
    </main>
        <br>
    <footer>
        <p>&copy; 2024 Bug Tracking System</p>
    </footer>
</body>
</html>
