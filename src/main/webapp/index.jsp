<%@page import="onlinebanking.db.BankAccount"%>
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp?msg=Please login");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	Welcome,
	<%=session.getAttribute("user")%>
	<a href="logout.jsp">Logout</a>
	<hr />
	<%
	Long userId = Long.parseLong(session.getAttribute("userId").toString());

	if (BankAccount.getAcountStatus(userId)==1) {
		%>
		<jsp:include page="customer_menu.jsp"></jsp:include>
		<%
		} else if(BankAccount.getAcountStatus(userId)==0) {
			out.print("Account Activation in Process From Bank End!");
		}else if(BankAccount.getAcountStatus(userId)==2){
			out.print("Your Account is Blocked!, Contact Bank Admin");
		}else{
			%>
		<a href="request_bank_account.jsp">Request Bank Account</a>
		<%
}

%>


</body>
</html>