<%-- 
    Document   : EditBug
    Created on : 11 Jul, 2024, 7:58:29 PM
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
    <title>Document</title>
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
        .update1 {
            width: 400px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .update1 h2{
            text-align: center;
            margin-bottom: 20px;
        }
        .update1 input[type="text"],
        .update1 input[type="number"],

        .update1 textarea,
        .update1 select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: block;
            margin-left: auto;
            margin-right: auto;
         }
         .update1 button{
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
         }
         .update1 button:hover{
            background-color: #45a049;
         }
    </style>
</head>
<body style="background-color: aquamarine;">
    <div class="update1">
        <h2 style="color: blue;">UPDATE BUG STATUS</h2>
        <%

                String myId = request.getParameter("id");
                try {
                   
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Abhilash");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM BUG WHERE BUG_ID=?");
                    ps.setString(1, myId);

                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
            %>
        <form action="editBug.jsp">
            <label for="id">BUG ID:</label>
            <input type="number" id="id" name="id" value="<%= rs.getString("BUG_ID")%>" readonly>
            <label for="type">BUG TYPE:</label>
            <input type="text" id="type" name="type" value="<%= rs.getString("BUG_TYPE")%>" required>
            <label for="desc">DESCRIPTION:</label>
            <input type="text" id="desc" name="desc" value="<%= rs.getString("BUG_DESC")%>" rows="3" required>
            <label for="assigned">ASSIGN BY:</label>
            <input type="text" id="assigned" name="assignby" value="<%= rs.getString("ASSIGN_BY")%>" readonly>
            <label for="assign">ASSIGN TO:</label>
            <input type="text" id="assign" name="assignto" value="<%= rs.getString("ASSIGN_TO")%>" readonly>
            <label for="priority">PRIORITY:</label>
            <input type="text" id="priority" name="priority" value="<%= rs.getString("PRIORITY")%>" readonly>
            <label type="status">STATUS:</label>
            <select id="status" name="status">
                <option value="open">Open</option>
                <option value="closed">Closed</option>
            </select>
            <%
                        } else {
                            out.print("in else");
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }
                %>
            <button type="submit">UPDATE BUG</button>
        </form>
    </div>
</body>
</html>
