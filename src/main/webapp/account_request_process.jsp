<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {

	String userId = request.getParameter("txt_user_id");
	String mobile = request.getParameter("txt_mobile");
	String type = request.getParameter("acc_type");

	Connection conn = DbConnection.connect();
	//sql prepare

	////

	String sql = "INSERT INTO tbl_bank_accounts(user_id, account_type, account_number, initial_amount, balance, status) VALUES(?,?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, Integer.parseInt(userId));
	stmt.setString(2, type);
	stmt.setString(3, mobile);
	stmt.setDouble(4, 200000);
	stmt.setDouble(5, 200000);
	stmt.setInt(6, 0);

	//execute
	int res = stmt.executeUpdate();
	conn.close();
	if (res > 0) {
		response.sendRedirect("index.jsp?msg=Request Success");
	} else {
		response.sendRedirect("account_request.jsp.jsp?msg=Sorry, Try Again");
	}
	//connection close
} catch (Exception e) {
	out.print(e);
}
%>