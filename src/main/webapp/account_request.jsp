
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp?msg=Please login");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Request Page</title>
</head>
<body>
	Welcome,
	<%=session.getAttribute("user")%>
	<a href="logout.jsp">Logout</a>
	<hr />
	<a href="account_request.jsp">Request Bank Account</a>
	&nbsp;&nbsp;&nbsp;
	<a href="fund_transfer.jsp">Fund Transfer</a> &nbsp;&nbsp;&nbsp;
	<a href="fund_request.jsp">Fund Request</a> &nbsp;&nbsp;&nbsp;
	<a href="transaction_history.jsp">Transaction History</a>
	&nbsp;&nbsp;&nbsp;

	<hr />
	<form method="post" action="account_request_process.jsp">
	

<input type="hidden" name="txt_user_id" value="<%=session.getAttribute("userId")%>" />
		<label>Mobile Number</label> <input type="text" name="txt_mobile"
			placeholder="Enter Mobile Number" /> <br /> <label>Prefered
			Account Type</label> 
			<select name="acc_type"> <option value="SAVING">Saving Account</option>
			<option value="CURRENT">Current Account</option>
			<option value="FIXED">Fixed Account</option>
		</select> <br />
		
		<button type="submit">Send Request</button>
	</form>
</body>
</html>

