
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp?msg=Please login");
}
if (!((session.getAttribute("role").toString()).equals("ADMIN"))) {
	response.sendRedirect("index.jsp?msg=Access Denied");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
</head>
<body>
	Welcome,
	<%=session.getAttribute("role") + " (" + session.getAttribute("user") + ")"%>
	<a href="logout.jsp">Logout</a>
	<hr />

	<jsp:include page="admin_menu.jsp"></jsp:include>
	<hr />
	<h2>Welcome Admin</h2>




</body>
</html>