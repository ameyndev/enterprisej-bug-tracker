
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resolve Bugs</title>
        <style>
            div {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 75px; padding-right: 75px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}
            input[type = submit] {background-color: #04AA6D; color: white; border-radius: 20px;
                padding: 10px 16px; border: none; cursor: pointer;}
            input[type = submit]:hover {opacity: 0.8;}
            input[type = button] {background-color: #04AA6D; color: white; border-radius: 20px;
                padding: 10px 16px; border: none; cursor: pointer;}
            input[type = button]:hover {opacity: 0.8;}
        </style>
    </head>
    <body style="background-color:powderblue;">
        <div>
            <h1 align="center">Bug Tracker.</h1>
            <form>
                <input type="button" name="BackToDash" value="< Go Back to Dashboard" onclick="location.href='Dashboard.jsp';">
            </form>
            <h2 align="center">Resolve Bug Report</h2><hr>
            
            <%
                HttpSession UserSession = request.getSession(false);
                String username = (String)UserSession.getAttribute("user");
                // out.println("hello, " + username);
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/BugTrackerDB", "app", "app");
                PreparedStatement ps = c.prepareStatement("select * from TICKETS where TICK_USER=? and TICK_STATE='unresolved'");
                ps.setString(1, username);
                
                
                
                // Code if the user tries to access this page through URL
                if(UserSession.getAttribute("user") == null)
                {
                    response.sendRedirect("LoginPage.html");
                }
            %>
            
            <form action="Resolution.jsp" method="post">
                <h3>Select Bugs to be resolved:</h3>
                <%
                    ResultSet rs = ps.executeQuery();
                    int BugCount = 1;
                    while (rs.next())
                    {
                        String title = rs.getString(2);
                        out.println("<input type='checkbox' name='bugs' id='bug" + BugCount + "' value='" + title +"'><label for='bug" + BugCount + "'>" + title + "</label><br>");
                        BugCount++;
                    }
                    %><br>
                <input type="submit" name="Resolution" value="Resolve">
            </form>
            <br><br>
        </div>
    </body>
</html>
