<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma","no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("email") == null) {
	response.sendRedirect("adminLogin.jsp");
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

<title>Movie Booking Panel</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<style>
form {
	border: hidden;
	border-radius: 0;
	padding: 0;
	width: inherit;
}
</style>
<body>
	<h1>Movie Booking Panel</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="Deshboard.html"
						class="list-group-item list-group-item-action active">
						Dashboard </a> <a href="add.jsp"
						class="list-group-item list-group-item-action"> Add Movie </a> <a
						href="schedule.jsp" class="list-group-item list-group-item-action">
						Schedule Movie</a> <a href="delete.jsp"
						class="list-group-item list-group-item-action"> Delete Movie</a> <a
						href="detailInfo.jsp"
						class="list-group-item list-group-item-action"> Updated Info
						Movie</a>
					<form action="logout" method="post">
						<button type="submit"
							class="list-group-item list-group-item-action">Logout</button>
					</form>
				</div>
			</div>

			<div class="card w-75">
				<div class="card-body">
					<p class="card-text">
						Welcome Admin.<br> Please select the action you wish to
						perform.
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

</html>