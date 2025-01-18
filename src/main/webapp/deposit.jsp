
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
	<h2>Deposit</h2>


	<form method="post" action="deposit_process.jsp">
		<label>Account Number</label> <input type="number"
			name="txt_account_number" /> <br /> <label>Deposit Amount</label> <input
			type="number" name="txt_amount" /> <br /> <label>Depositor
			Name</label> <input type="text" name="txt_depositor_name" /> <br /> <label>Depositor
			Contact Number</label> <input type="text" name="txt_contact" /> <br />

		<button type="submit">Deposit</button>


	</form>


</body>
</html>