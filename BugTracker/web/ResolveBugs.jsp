

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
            <form>
                Select the Bug Report that is to be resolved:<br>
                <select>
                    <option></option>
                </select>
            </form>
            
            <%
                HttpSession UserSession = request.getSession(false);
                String username = (String)UserSession.getAttribute("user");
                
                out.println("hello, " + username);
                
                
                
                // Code if the user tries to access this page through URL
                if(UserSession.getAttribute("user") == null)
                {
                    response.sendRedirect("LoginPage.html");
                }
            %>
        </div>
    </body>
</html>
