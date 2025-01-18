<%
if(session!=null){
	session.setAttribute("user", null);
	session.setAttribute("userId",0);
	session.invalidate();
	response.sendRedirect("login.jsp?msg=Logout success");
}

%>