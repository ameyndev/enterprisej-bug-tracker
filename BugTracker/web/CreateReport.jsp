

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a Bug Report</title>
        <style>
            div {margin-left: 7%; margin-right: 7%; background-color: white; padding-left: 75px; padding-right: 75px;
                 box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);}
            input[name = TicketTitle] {width: 25%; padding: 6px 14px; display: inline-block; 
                border: 1px solid #ccc; box-sizing: border-box;}
            input[name = TicketDesc] {width: 50%; padding: 6px 14px; display: inline-block; 
                border: 1px solid #ccc; box-sizing: border-box;}
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
            <h2 align="center">Create Bug Report</h2><hr>
            <form action="SubmitReport.jsp" method="post">
                Enter Bug Report Title:<br>
                <input type="text" name="TicketTitle" placeholder="Enter Bug Report Title" required><br><br>
                Enter Bug Report Description:<br>
                <input type="text" name="TicketDesc" placeholder="Enter Bug Report Description" height="1000" required><br><br>
                <input type="submit" name="SubmitReport" value="Create">
                <br><br>
            </form>
        <%
            HttpSession UserSession = request.getSession(false);
            String username = (String)UserSession.getAttribute("user");
            
            // Code if the user tries to access this page through URL
            if(UserSession.getAttribute("user") == null)
            {
                response.sendRedirect("LoginPage.html");
            }
        %>
        </div>
    </body>
</html>
