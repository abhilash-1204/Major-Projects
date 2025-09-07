<%-- 
    Document   : test
    Created on : 8 Jul, 2024, 10:33:12 PM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Page</title>
          <style>
        body{
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color:rgb(236, 229, 218);
        }
        header {
            background-color: #001F3F;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        } 
        
        .nav{
            display: flex;
            justify-content: center;
            background-color: #0e5dd2;
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
            color: #195f85;
            border-bottom: 2px solid #1b27ad;
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
            background-color: whitesmoke;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #d4c1c152;
            border-radius: 4px;
        }
        
        .submit-bug, .bug-list, #profile{
            background-color: rgb(169, 220, 239);
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .submit-bug h2, .bug-list h2 {
            
            margin-top: 0;
        }
        form label{
            display: block;
            margin-top: 10px;
        }
        form input, form textarea, form select{
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        form button:hover{
            background-color: #555;
        }
        table{
            width: 100%;
            border-collapse: collapse;
        }
        table,th,td{
            border: 2px solid #d6f662;
        }
        th,td{
            padding: 10px;
            text-align: center;
        }
        .button1{
            background-color: #0c3dc6;
            color: #16de2a;
            width:fit-content;
        }
        th{
            color: #1b21de;
            background-color: #d8bbbb;
        }
        table tr:nth-child(even){
            background-color: #f9f9f9;
        }
        table th:hover{
            background-color: #19dff1;
            color: #091a0c;
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
            <h1>Bug Tracking System - Test Engineer Page</h1>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#">Dashboard</a></li>
                    <li><a href="update.jsp">Update Profile</a></li>
                    <li><a href="#bug-list">View Bugs</a></li>
                    <li><a href="logout.jsp">LogOut</a></li> 
                </ul>
            </nav>
        </header>
        <main>

            <section id="profile">
                <h2>MY PROFILE</h2>
                <form>
                    <%String fullName = fname + " " + lname;%>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= fullName%>" readonly>
                    <label for="userid">User ID:</label>
                    <input type="number" id="userid" name="userid" value="<%= id%>" readonly>
                    <label for="username">User Name:</label>
                    <input type="text" id="username" name="username" value="<%= user%>" readonly>
                </form>
            </section>

            <section class="submit-bug">
                <h2>Submit a New Bug</h2>
                <form action="bug.jsp">
                    <label for="bug-title">Bug ID :</label>
                    <input type="number" id="bug-title" name="bug_title" required>

                    <label for="bug-type">Bug Type :</label>
                    <select id="bug-type" name="bug_type" required>
                        <option value="Null_Pointer">Null Pointer</option>
                        <option value="Array_Exception">Array Exception</option>
                        <option value="Sql_Exception">Sql Exception</option>
                        <option value="ClassNotFound_Exception">Class Not Found Exception</option>
                        <option value="ArithMatic_Exception">ArithMatic Exception</option>
                        <option value="NumberFormat_Exception">Number Format Exception</option>
                    </select>

                    <label for="bug-description">Bug Description :</label>
                    <input type="text" id="bug-description" name="bug_desc" required>

                    <label for="assign by">Assign By :</label>
                    <input type="text" id="name" value="<%= fullName%>" name="name" readonly>


                    <label for="Assigned">Assign To :</label>
                    <select id="Assigned" name="Assigned" >
                        <option value="">--select--</option>
                        <%
                            try {
                                Class.forName("oracle.jdbc.driver.OracleDriver");

                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                                Statement ps = con.createStatement();

                                ResultSet rs = ps.executeQuery("SELECT FIRSTNAME,LASTNAME FROM finallogin where department = 'DEVELOPER' ");

                                while (rs.next()) {
                                    String name = rs.getString("FIRSTNAME") + " " + rs.getString("LASTNAME");
                        %>
                        <option value="<%= name%>"> <%= name%> </option>
                        <%
                                }
                            } catch (Exception e) {
                                out.print("in catch");
                            }

                        %>
                    </select>
                    <label for="bug-priority">Priority:</label>
                    <select id="bug-priority" name="bug_priority" >
                        <option value="low">Low</option>
                        <option value="medium">Medium</option>
                        <option value="high">High</option>
                    </select>
                    <label for="bug-status">Status:</label>
                    <select id="bug-status" name="bug_status" >
                        <option value="open">Open</option>
                        <option value="closed">Closed</option>
                    </select>
                    <br>
                    <button type="submit" class="button1">Submit bug</button>
                </form>
            </section>
            <%                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");

                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                    PreparedStatement ps = con.prepareStatement("SELECT BUG_ID,BUG_TYPE,BUG_DESC,ASSIGN_TO,PRIORITY,STATUS FROM BUG where ASSIGN_BY=? ");

                    ps.setString(1, fullName);
                    ResultSet rs = ps.executeQuery();
            %>
            <section class="bug-list" id="bug-list">
                <h2>Existing bugs</h2>
                <table border="1">
                    <tr>
                        <th>BUG ID</th>
                        <th>BUG Type</th>
                        <th>Description</th>
                        <th>Assign To</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    <%        while (rs.next()) {
                            int bug = rs.getInt("BUG_ID");
                    %>
                    <tr>
                        <td><%= rs.getString("BUG_ID")%></td>
                        <td><%= rs.getString("BUG_TYPE")%></td>
                        <td><%= rs.getString("BUG_DESC")%></td>
                        <td><%= rs.getString("ASSIGN_TO")%></td>
                        <td><%= rs.getString("PRIORITY")%></td>
                        <td><%= rs.getString("STATUS")%></td>
                        <td>
                            <form action="EditBugTest.jsp" method="post">
                                <input type="hidden" name="id" value="<%= bug%>">
                                <input type="submit" value="Edit">
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%
                    } catch (Exception e) {
                        out.print("djfbgjdbf");
                    }
                %>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Bug Tracking System</p>
        </footer>
    </body>
</html>
