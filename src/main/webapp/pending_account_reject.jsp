<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {
	int id = Integer.parseInt(request.getParameter("account_id"));
	Connection conn = DbConnection.connect();
	//sql prepare

	String sql = "UPDATE tbl_bank_accounts SET status=? WHERE id=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, 2);
	stmt.setInt(2, id);

	//execute
	int res = stmt.executeUpdate();
	conn.close();
	if (res > 0) {
		response.sendRedirect("list_all_pending_account.jsp");
	} else {
		response.sendRedirect("list_all_pending_account.jsp?msg=Sorry");
	}
	//connection close

} catch (Exception e) {
	out.print(e);
}
%>
