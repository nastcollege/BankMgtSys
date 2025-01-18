<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {

	String firstName = request.getParameter("txt_firstname");
	String lastName = request.getParameter("txt_lastname");
	String email = request.getParameter("txt_email");
	String password = request.getParameter("txt_password");
	String confirm = request.getParameter("txt_confirmpassword");
	
	if (password.equals(confirm)) {
		Connection conn = DbConnection.connect();
		//sql prepare

		String sql = "INSERT INTO tbl_users(first_name, last_name, email, password, role,	status) VALUES(?,?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, firstName);
		stmt.setString(2, lastName);
		stmt.setString(3, email);
		stmt.setString(4, password);
		stmt.setString(5, "CUST");
		stmt.setInt(6, 1);

		//execute
		int res = stmt.executeUpdate();
		conn.close();
		if (res > 0) {
	response.sendRedirect("login.jsp?msg=Success");
		} else {
	response.sendRedirect("signup.jsp?msg=Sorry");
		}
		//connection close
	} else {
		response.sendRedirect("signup.jsp?msg=Password and Confirm Password Not Matched");
	}
} catch (Exception e) {
	out.print(e);
}
%>