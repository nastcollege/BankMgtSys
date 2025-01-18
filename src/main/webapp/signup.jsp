<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
</head>
<body>
<h2>Signup</h2>
<%
if(request.getParameter("msg")!=null){
	out.print("<hr/>");
	out.print(request.getParameter("msg"));
	out.print("<hr/>");
}

%>


<form method="post" action="register.jsp">
<label>First Name</label>
<input type="text" name="txt_firstname" required placeholder="Enter First Name" /> <br/>
<label>Last Name</label>
<input type="text" name="txt_lastname" required placeholder="Enter Last Name" /> <br/>
<label>Email</label>
<input type="email" name="txt_email" required placeholder="Enter Email" /> <br/>
<label>Password</label>
<input type="password" name="txt_password" required placeholder="Enter Password" /> <br/>
<label>Confirm Password</label>
<input type="password" name="txt_confirmpassword" required placeholder="Enter Confirm Password" /> <br/>
<br/>
<button type="submit">Register</button>
<br/>
<br/>
<a href="login.jsp">Already have an account? Login Here</a>
</form>
</body>
</html>