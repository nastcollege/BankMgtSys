
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.Instant"%>
<%@page import="java.sql.Timestamp"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp?msg=Please login");
}
if (!((session.getAttribute("role").toString()).equals("ADMIN"))) {
	response.sendRedirect("index.jsp?msg=Access Denied");
}
%>

<%!
Double balance=0D;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statement</title>

<style>
     
        @media print {
           .noprint {
              visibility: hidden;
              margin-top:-160px;
           }
        }
    </style>
</head>
<body>
<div class="noprint">
	Welcome,
	<%=session.getAttribute("role") + " (" + session.getAttribute("user") + ")"%>
	<a href="logout.jsp">Logout</a>
	<hr />

	<jsp:include page="admin_menu.jsp"></jsp:include>
	<hr />
	<h2>Statement</h2>

	<form method="post" action="#">
		<input type="number" required name="txt_account"
			placeholder="Account Number" /> <label>Date From</label> <input
			type="date" required name="txt_from" /> <label>Date To</label> <input
			type="date" required name="txt_to" />

		<button type="submit" name="btn_serch">Search</button>

	</form>
	<br />
	<br />
		</div>
	<table width="100%">
	<%
		if (request.getParameter("btn_serch") != null) {
			try {
				String acc = request.getParameter("txt_account");
				String from = request.getParameter("txt_from");
				String to = request.getParameter("txt_to");
				
				Connection conn1 = DbConnection.connect();

				String sql1 = "SELECT * FROM tbl_bank_accounts as b INNER JOIN tbl_users as u on b.user_id=u.id WHERE b.account_number=?";
				PreparedStatement stmt1 = conn1.prepareStatement(sql1);
				stmt1.setString(1, acc);
				
				ResultSet rs1 = stmt1.executeQuery();
				while (rs1.next()) {
					balance=rs1.getDouble("initial_amount") ;

		%>
	
		<tr>
			<th colspan="2"><u>Account Statement</u></th>
		</tr>
		
		<tr>
			<td>Account Holder Name:<%=rs1.getString("first_name")+ " "+rs1.getString("last_name") %></td>
			<td>Account Number:<%=rs1.getString("account_number") %></td>

		</tr>

		<tr>
			<td>Account Type:<%=rs1.getString("account_type") %></td>
			<td>Initial Balance:<%=balance %></td>

		</tr>
		<%
		
		
				} %>
	</table>
	<table width="100%" border="1">
		<tr>
			<th>#</th>
			<th>Date</th>
			<th>Particular</th>
			<th>Debit</th>
			<th>Credit</th>
			<th>Balance</th>
		</tr>
		<tr>
			<th colspan="5"></th><th align="center"><%=balance %></th>
		</tr>
		<%		
				Instant fromInstance = Instant.parse(from + "T00:00:00Z");
				Timestamp fromTimestamp = Timestamp.from(fromInstance);

				Instant toInstance = Instant.parse(to + "T00:00:00Z");
				Timestamp toTimestamp = Timestamp.from(toInstance);

				Connection conn = DbConnection.connect();

				String sql = "SELECT * FROM tbl_transactions as t INNER JOIN tbl_bank_accounts as b ON b.id = t.bank_account_id WHERE b.account_number=? AND t.transaction_at BETWEEN ? AND ?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setString(1, acc);
				stmt.setTimestamp(2, fromTimestamp);
				stmt.setTimestamp(3, toTimestamp);

				ResultSet rs = stmt.executeQuery();
				int count = 0;
				while (rs.next()) {
			count++;
		%>
		<tr>
			<td><%=count%>.</td>
			<td><%=rs.getString("transaction_at")%></td>
			<td><%=rs.getString("transaction_by")+"("+rs.getString("transation_holder_contact")+")"%></td>
			<%
			
			if(rs.getString("transaction_type").equals("DEBIT")){
				balance=balance+(rs.getDouble("amount"));
				%>
				<td align="Center"><%=Math.abs(rs.getDouble("amount"))%></td>
				<td></td>
				<td align="Center"><%=balance%></td>
				<%
			}else{
				balance=balance+(rs.getDouble("amount"));
				%>
				<td></td>
				<td align="Center"><%=rs.getDouble("amount")%></td>
				<td align="Center"><%=balance%></td>
				<%
			}
			
			%>
			
		</tr>
		<%
		}
			conn.close();
		} catch (Exception e) {
			out.print(e.getMessage());
		}
		}
		%>
	</table>



</body>
</html>