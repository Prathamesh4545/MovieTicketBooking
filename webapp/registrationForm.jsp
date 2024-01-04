<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

#uname, #uemail, #country, #upass, #urepass {
	border-radius: 5px;
	height: 20px;
	margin: 5px;
	align-items: end;
	border-color: blue;
}

#uname, #uemail {
	margin-left: 87px;
}

#country {
	margin-left: 73px;
}

#upass {
	margin-left: 64px;
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

a {
	margin-top: 20px;
	padding: 40px;
	margin-left: 15%;
}
</style>
</head>

<body>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<form method="post" action="register" name="myForm"
		onsubmit="return formValidation()">


		<h3>Registration form</h3>

		Enter Name : <input type="text" name="uname" id="uname" required>
		<br> Enter Email : <input type="email" name="uemail" id="uemail"
			required> <br> Enter Country : <input type="text"
			name="country" id="country" required> <br> Enter
		Password : <input type="password" name="upass" id="upass" required>
		<br> <input type="submit" value="Submit" id="button"><br> 
		<br> <a href="loginForm.jsp">If Register Click Here To Login</a>
	</form>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	var status = document.getElementById("status").value;
	if (status == "success") {
		swal("Register Successfully", "You clicked the button!", "success");
	}
</script>
</html>