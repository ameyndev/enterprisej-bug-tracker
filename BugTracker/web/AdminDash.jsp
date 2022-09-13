
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard</title>
        <style>
            div {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 25px; padding-right: 25px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}
            .logoutbutton
            {
                position: absolute; top: 3.5%; left: 85%;
                background-color: #04AA6D; color: white; border-radius: 20px; padding: 12px 24px;
                border: none; cursor: pointer;
            }
            input[type = button]:hover {opacity: 0.8;}
            table {border: 1px solid black; width: 100%;}
            th {border: 1px solid black;}
            td {border: 1px solid black;}
            input[type = submit] {background-color: #04AA6D; color: white; border-radius: 20px;
                                  padding: 12px 24px; border: none; cursor: pointer;}
            input[type = submit]:hover {opacity: 0.8;}
            input[type = button] {background-color: #04AA6D; color: white; border-radius: 20px;
                padding: 10px 16px; border: none; cursor: pointer;}
            input[type = button]:hover {opacity: 0.8;}
            tr:nth-child(even) {background-color: #f2f2f2;}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <div>
            <form>
                <input type="button" value="LOG OUT" name="logout" onclick="location.href='Logout.jsp';" class="logoutbutton">
            </form>
            <h1 align="center">Bug Tracker.</h1>
            <form>
                <input type="button" value="Create Report" name="CreateReport" onclick="location.href='CreateReport.jsp'">
                <input type="button" name="ResolveBugs" value="Resolve Bug Reports" onclick="location.href='ResolveBugs.jsp'">
                <input type="button" name="DeleteBugs" value="Delete Bug Reports" onclick="location.href='DeleteBugs.jsp'">
            </form>
        <%
            
            // Creating a user session
            HttpSession UserSession = request.getSession(false);
            String username = (String)UserSession.getAttribute("user");
            
            out.println("<h1>Welcome " + username + "</h1>");
            out.println("<hr>");
            
            // To display list of unresolved bugs (tickets)
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/BugTrackerDB", "app", "app");
            PreparedStatement ps = c.prepareStatement("select * from TICKETS where TICK_STATE='unresolved'");
            // ps.setString(1, username);
            out.println("<br><br><h2><u>Reported Bugs</u></h2>");
            ResultSet rs = ps.executeQuery();   // Table to display bugs V
            out.println("<table><tr><th>Sr</th><th>Username</th><th>Title</th><th>Description</th></tr>");
            int BugCount = 1;
            while (rs.next()) 
            {
                String name = rs.getString(1);
                String title = rs.getString(2);
                String desc = rs.getString(3);
                out.println("<tr><td>" + BugCount + "</td><td>" + name + "</td><td>" + title + "</td><td>" + desc + "</td></tr>");
                BugCount += 1;
            }
            out.println("</table><br><br><hr>");    // End of table

            out.println("<h2><u>Resolved Bugs</u></h2>");
            PreparedStatement ps1 = c.prepareStatement("select * from TICKETS where TICK_STATE='resolved'");
            // ps1.setString(1, username);
            ResultSet rs1 = ps1.executeQuery();
            out.println("<table><tr><th>Sr</th><th>Username</th><th>Title</th><th>Description</th></tr>");
            int UnBugCount = 1;
            while (rs1.next())
            {
                String name = rs1.getString(1);
                String title = rs1.getString(2);
                String desc = rs1.getString(3);
                out.println("<tr><td>" + UnBugCount + "</td><td>" + name + "</td><td>" + title + "</td><td>" + desc + "</td></tr>");
                UnBugCount += 1;
            }
            out.println("</table><br><br><hr>");
            
            // Code if the user tries to access this page through URL
            
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }
            
        %>
        </div>
    </body>
</html>
