
<%@page import="java.sql.PreparedStatement"%>
<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
try {
	String userId = request.getParameter("txt_id");
	String accountType = request.getParameter("selAccountType");
	String mobile = request.getParameter("txt_mobile");
	//

	Connection conn = DbConnection.connect();
	//sql prepare

	String sql = "INSERT INTO tbl_bank_accounts(user_id, account_type, account_number, initial_amount, balance, status) VALUES(?,?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(userId));
	stmt.setString(2, accountType);
	stmt.setString(3, mobile);
	stmt.setDouble(4, 20000);
	stmt.setDouble(5, 20000);
	stmt.setInt(6, 0);

	//execute
	int res = stmt.executeUpdate();
	//connection close
	conn.close();
	if (res > 0) {
		response.sendRedirect("index.jsp?msg=Success");
	} else {
		response.sendRedirect("request_bank_account.jsp?msg=Sorry");
	}
	
} catch (Exception e) {
	out.print(e);
}
%>