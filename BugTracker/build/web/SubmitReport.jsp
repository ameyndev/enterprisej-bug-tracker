

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Report</title>
    </head>
    <body>
        <%
            HttpSession UserSession = request.getSession(false);
            String username = (String)UserSession.getAttribute("user");
            String TickTitle = request.getParameter("TicketTitle");
            String TickDesc = request.getParameter("TicketDesc");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/BugTrackerDB", "app", "app");
            PreparedStatement ps = c.prepareStatement("insert into TICKETS values(?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, TickTitle);
            ps.setString(3, TickDesc);
            ps.setString(4, "unresolved");
            ps.executeUpdate();
            response.sendRedirect("Dashboard.jsp");
            
            // Code if the user tries to access this page through URL
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }
        %>
    </body>
</html>
