<%
if(session.getAttribute("user")!=null){
	response.sendRedirect("index.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application Login</title>
</head>
<body>
<h2>Application Login</h2>
<hr/>
<%
	if(request.getParameter("msg")!=null){
		out.print(request.getParameter("msg"));
	}
%>
<form method="post" action="authenticate.jsp">
	<label>Username</label><br/>
	<input type="text" name="txt_username" required placeholder="Enter username"/> <br/>
	<label>Password</label><br/>
	<input type="password" name="txt_password"  required placeholder="Enter Password"/> <br/>
<br/>
<button type="submit">Login</button>
<br/>
<a href="signup.jsp">Dont have an account? Signup Here</a>
</form>

</body>
</html>