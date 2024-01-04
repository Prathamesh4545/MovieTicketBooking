
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

<title>Add - Movie Information</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<h1>Add - Movie Information</h1>
	<form class="row g-3 needs-validation" method="post"
		action="addMovieServlet" novalidate>
		<div class="col-md-10">
			<label for="inputName" class="form-label">Movie Name</label> <input
				type="text" class="form-control" name="inputName" id="inputName">
		</div>
		<div class="col-md-10">
			<label for="inputGenere" class="form-label">Genere</label> <input
				type="text" class="form-control" name="inputGenere" id="inputGenere">
		</div>
		<div class="col-md-10">
			<label for="inputDuration" class="form-label">Duration</label> <input
				type="text" class="form-control" name="inputDuration"
				id="inputDuration">
		</div>
		<div class="col-md-10">
			<label for="inputDirector" class="form-label">Direction</label> <input
				type="text" class="form-control" name="inputDirector"
				id="inputDirector">
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
			swal("Add Movie Successfully", "You clicked the button!", "success");
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>

</html>