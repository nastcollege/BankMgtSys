<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Request</title>
</head>
<body>

<h1>Online Account Request</h1>
<form method="post" action="request_bank_account_process.jsp">
<input type="hidden" name="txt_id" value="<%=session.getAttribute("userId") %>"/>
<label>Account type</label>
<select name="selAccountType">
	<option value="S">Saving</option>
	<option value="F">Fixed</option>
	<option value="C">Current</option>
</select>
<br/>
<label>Mobile</label>
<input type="number" name="txt_mobile"/>
<br/>

<button type="submit">Request</button>
</form>

</body>
</html>