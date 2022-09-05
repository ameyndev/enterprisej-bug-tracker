
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
    </head>
    <body>
        <%
            try
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/BugTrackerDB", "app", "app");
                PreparedStatement ps = c.prepareStatement("select * from BT_USERS where UNAME=? and upassword=?");
                ps.setString(1, username);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    HttpSession LoginSession = request.getSession(true);
                    LoginSession.setAttribute("user", username);
                    RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
                    rd.forward(request, response);
                }
                else
                {
                    out.println("User does not exist.");
                    out.println("Try Registering Again <a href='LoginPage.html'>here</a>.");
                }
            }
            catch(Exception e)
            {
                out.println("ERROR: " + e);
            }
        %>
    </body>
</html>
