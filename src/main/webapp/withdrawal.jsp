
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
<title>Withdrawal</title>
</head>
<body>
	Welcome,
	<%=session.getAttribute("role") + " (" + session.getAttribute("user") + ")"%>
	<a href="logout.jsp">Logout</a>
	<hr />

	<jsp:include page="admin_menu.jsp"></jsp:include>
	<hr />
	<h2>Withdrawal</h2>


	<form method="post" action="withdrawal_process.jsp">
		<label>Account Number</label> 
		<input type="number"
			name="txt_account_number" /> <br /> 
			
			<label>Withdrawal Amount</label> <input
			type="number" name="txt_amount" /> <br /> 
			
			<label>Withdrawer
			Name</label> <input type="text" name="txt_withdrawer_name" /> <br /> 
			
			<label>Withdrawer
			Contact Number</label> <input type="text" name="txt_contact" /> <br />

		<button type="submit">Withdrawal</button>


	</form>


</body>
</html>