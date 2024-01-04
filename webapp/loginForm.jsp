
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<style>
body {
	width: max-content;
	margin-top: 10%;
	margin-left: 37%;
}

form {
	border-radius: 20px;
	padding: 50px;
	background-color: aquamarine;
}

h3 {
	text-align: center;
}

#uemail, #upass {
	border-radius: 5px;
	height: 20px;
	margin: 5px;
	border-color: blue;
}

#uemail {
	margin-left: 28px;
}

#button {
	margin: 10px;
	border-radius: 10px;
	padding: 10px;
	font-weight: bold;
	box-shadow: 5px 2px;
	cursor: pointer;
	margin-left: 43%;
	margin-top: 20px;
}

</style>
</head>

<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<form method="post" action="login">
		<h3>Login form</h3>
		Enter Email : <input type="email" name="uemail" id="uemail" required>
		<br> Enter Password : <input type="password" name="upass"
			id="upass" required> <br> <input type="submit"
			value="Submit" id="button">
			<br> <a href="registrationForm.jsp" style="margin-left: 48px">If Not Register, Please Register First!!</a>
			<br>
			<br> <a href="adminLogin.jsp" style="margin-left: 48px">If you are Admin, Click here</a>
	</form>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	var status = document.getElementById("status").value;
	if (status == "failed") {
		swal("Login Failed", "You clicked the button!", "error");
	}
</script>
</html>