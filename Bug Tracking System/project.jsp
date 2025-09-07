<%-- 
    Document   : Project
    Created on : 10 Jul, 2024, 10:33:52 AM
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
    
    try {
        
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
        PreparedStatement ps = con.prepareStatement("SELECT FIRSTNAME,LASTNAME,USERID,USERNAME,EMAIL,PHONE,department,ADDRESS FROM finallogin where PASSWORD = ? ");

        ps.setString(1, myString);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            fname = rs.getString("FIRSTNAME");
            lname = rs.getString("LASTNAME");
            id = rs.getString("USERID");
            user = rs.getString("USERNAME");
            session.setAttribute("id", id);
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Manager</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }
            body{
                background-color: #f4f4f4;
                color: #333;
            }
            header{
                background-color: #333;
                color: #fff;
                padding: 10px 0;
                text-align: center;
            }
            header h1{
                margin-bottom: 10px;
            }
            nav ul{
                list-style-type: none;
                padding: 0;
            }
            nav ul li{
                display: inline;
                margin-right: 20px;
            }
            nav ul  a{
                color: white;
                text-decoration: none;
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
            .overview{
                background-color: #fff;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .overview h2{
                margin-bottom: 5px;
            }
            .project-info p{
                margin-bottom: 5px;
            }
            .bugs{
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .bugs h2{
                margin-bottom: 10px;
            }
            table{
                width: 100%;
                border-collapse: collapse;
            }
            th, td{
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th{
                background-color: #f4f4f4;
            }
            button{
                padding: 5px 10px;
                background-color: #333;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            button:hover{
                background-color: #555;
            }
            footer{
                text-align: center;
                padding: 20px;
                background-color: #333;
                color: white;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Bug Tracking System - Project Manager Page</h1>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="update.jsp">Update Profile</a></li>
                    <li><a href="#bugs">Bugs</a></li>
                    <li><a href="logout.jsp">Logout</a></li> 
                </ul>
            </nav>
        </header>
        <main>
            <section id="profile">
                <h2>MY PROFILE</h2>
                <form>
                    <label for="userid">User ID:</label>
                    <input type="number" id="userid" name="userid" value="<%= id%>" readonly>
                    
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= fname + " " + lname%>" readonly>
                    
                    <label for="username">User Name:</label>
                    <input type="text" id="username" name="username" value="<%= user%>" readonly>
                    
                </form>
            </section>

            <%        } else {
                    out.print("in else");
                }

                ps = con.prepareStatement("select * from bug");
                rs = ps.executeQuery();


            %>
            <section class="bugs" id="bugs">
                <h2>Bug List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Bug ID</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Assigned To</th>
                            <th>Assigned By</th>
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
                            <td><%= rs.getString("ASSIGN_TO")%></td>
                            <td><%= rs.getString("ASSIGN_BY")%></td>
                            <td><%= rs.getString("PRIORITY")%></td>
                            <td><%= rs.getString("STATUS")%></td>
                            <td>
                                <form action="deleteBug.jsp" method="post">
                                    <input type="hidden" name="id" value="<%= bug%>">
                                    <input type="submit" value="Delete">
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
        <footer>
            <p>&copy; 2024 Bug Tracking System</p>
        </footer>
    </body>
</html>
