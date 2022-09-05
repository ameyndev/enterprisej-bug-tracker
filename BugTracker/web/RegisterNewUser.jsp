
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New User</title>
    </head>
    <body>
        <%
            try
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String repassword = request.getParameter("repassword");
                
                if(password.equals(repassword))
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/BugTrackerDB", "app", "app");
                    PreparedStatement ps = c.prepareStatement("insert into BT_USERS values(?,?)");
                    ps.setString(1, username);
                    ps.setString(2, password);
                    
                    int i = ps.executeUpdate();
                    if(i > 0)
                    {
                        out.println("<h1>Data Saved!</h1>");
                        out.println("Now, Log In <a href='LoginPage.html'>here</a>.");
                    }
                    else
                    {
                        out.println("<h1>Data not Saved!</h1>");
                    }
                }
                else
                {
                    out.println("<h1>Password did not match</h1>");
                    out.println("Try Again <a href='index.html'>here</a>.");
                }
            }
            catch(Exception e)
            {
                out.println("ERROR: " + e);
            }
        %>
    </body>
</html>
