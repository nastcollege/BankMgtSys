
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="onlinebanking.db.DbConnection"%>
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
<title>Rejected Account</title>
</head>
<body>
	Welcome,
	<%=session.getAttribute("role") + " (" + session.getAttribute("user") + ")"%>
	<a href="logout.jsp">Logout</a>
	<hr />
	<jsp:include page="admin_menu.jsp"></jsp:include>


	<h2>Rejected Account</h2>
	<hr />

	<table width="100%" border="1">
		<tr>
			<th>#</th>
			<th>Account Holder Name</th>
			<th>Mobile Number</th>
			<th>Action?</th>
		</tr>
		<%
		try {

			Connection conn = DbConnection.connect();

			String sql = "SELECT b.id as account_id, u.first_name, u.last_name, b.account_number"+
					" FROM tbl_users as u "+
					" INNER JOIN tbl_bank_accounts as b ON u.id = b.user_id WHERE b.status=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, 2);

			ResultSet rs = stmt.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
		%>
		<tr>
			<td><%=count%>.</td>
			<td><%=rs.getString("first_name")+ " "+rs.getString("last_name")%></td>
			<td><%=rs.getString("account_number")%></td>
			<td>Deactive</td>
		</tr>
		<%
		}
		conn.close();
		} catch (Exception e) {

		}
		%>
	</table>
</body>
</html>