<%@page import="java.sql.Timestamp"%>
<%@page import="onlinebanking.db.BankAccount"%>
<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {

	String accNum = request.getParameter("txt_account_number");
	String amount = request.getParameter("txt_amount");
	String depositedBy = request.getParameter("txt_depositor_name");
	String contact = request.getParameter("txt_contact");

	double amt = Double.parseDouble(amount);
	Connection conn = DbConnection.connect();
	//sql prepare

	int accountId = BankAccount.getBankAccountIdByAccountNumber(accNum);
	Timestamp currentTime = new Timestamp(System.currentTimeMillis());

	String sql = "INSERT INTO tbl_transactions(bank_account_id, transaction_type, amount, transaction_by, transation_holder_contact, transaction_at) VALUES(?,?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, accountId);
	stmt.setString(2, "CREDIT");
	stmt.setDouble(3, amt);
	stmt.setString(4, depositedBy);
	stmt.setString(5, contact);
	stmt.setTimestamp(6, currentTime);

	//execute
	int res = stmt.executeUpdate();
	conn.close();
	if (res > 0) {
		boolean updateBalance = BankAccount.updateBalance(accountId, amt);
		if (updateBalance) {
				response.sendRedirect("deposit.jsp?msg=Success");
		} else {
			response.sendRedirect("deposit.jsp?msg=Sorry");
		}
	} else {
		response.sendRedirect("deposit.jsp?msg=Sorry");
	}

} catch (Exception e) {
	out.print(e);
}
%>