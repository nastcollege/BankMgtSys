<%@page import="onlinebanking.db.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try {

	String username = request.getParameter("txt_username");
	String pass = request.getParameter("txt_password");

	Connection conn = DbConnection.connect();

	String sql = "SELECT * FROM tbl_users WHERE email=? AND password=? AND status=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, username);
	stmt.setString(2, pass);
	stmt.setInt(3, 1);

	//execute
	boolean auth = false;
	ResultSet rs = stmt.executeQuery();
	while (rs.next()) {
		session.setAttribute("user", username);
		session.setAttribute("userId", rs.getInt("id"));
		session.setAttribute("role", rs.getString("role"));
		auth = true;
	}
	conn.close();
	if (auth && (session.getAttribute("role").toString()).equals("ADMIN")) {
		response.sendRedirect("admin.jsp");
	} else if (auth) {
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("login.jsp?msg=Invalid username and password!!!");
	}
} catch (Exception e) {
	out.print(e.getMessage());
}
%>