
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma","no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("email") == null) {
	response.sendRedirect("adminDashboard.jsp");
}
%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Schedule - Movie</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<h1>Schedule - Movie</h1>
	<form class="row g-3 needs-validation" method="post"
		action="shedulerServlet">
		<div class="col-md-10">
			<label for="mid" class="form-label">Movie Id</label> <input
				type="number" class="form-control" name="mid" id="mid">
		</div>
		<div class="col-md-10">
			<label for="sno" class="form-label">Screen No</label> <input
				type="number" class="form-control" name="sno" id="sno">
		</div>
		<div class="col-md-10">
			<label for="slot" class="form-label">Slot</label> <input
				type="number" class="form-control" name="slot" id="slot">
		</div>
		<div class="col-12">
			<button class="btn btn-primary" type="submit">Save</button>
			<button type="reset" name="reset" class="btn btn-primary">Reset</button>
			<a href="adminDashboard.jsp"class="btn btn-primary" role="button">Cancel</a>
		</div>

	</form>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Schedule Movie Successfully", "You clicked the button!", "success");
		}else if(status == "failed"){
			swal("Movie Not Found", "You clicked the button!", "error");
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>

</html>