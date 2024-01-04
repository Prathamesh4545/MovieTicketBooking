
<%@page import="java.sql.*"%>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma", "no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("email") == null) {
	response.sendRedirect("index.jsp");
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

<title>Gold Class</title>

</head>
<style>
* {
	font-family: ui-monospace;
}

.card {
	margin-left: 45vh;
	margin-right: 45vh;
	margin-top: 138px;
}
</style>
<body>
	<form action="logout" method="post">
		<nav class="navbar bg-dark border-bottom border-body"
			data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp">Movie Ticket Booking </a>
				<ul class="nav justify-content-end">
					<li class="nav-item">
						<button type="submit" class="btn btn-outline-light">Logout</button>
					</li>
				</ul>
			</div>
		</nav>
	</form>
	<div class="card text-center">
		<div class="card-header">
			<h2>Silver Ticket</h2>
		</div>

		<div class="card-body">
			<%
			int id = (int) request.getAttribute("id");
			try {
				Class.forName("org.postgresql.Driver");
				Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(
				"SELECT movie.title,movie.genere,movie.duration,movie.director FROM movie INNER JOIN show ON show.mid = movie.id where show.id ="
						+ id);
				rs.next();
				String title = rs.getString(1);
				String genere = rs.getString(2);
				String duration = rs.getString(3);
				String director = rs.getString(4);
			%>


			<h2 class="card-title">Movie Details</h2>
			<h4>
				<b>Movie Name =</b>
				<%=title%><br> <b>Genere =</b>
				<%=genere%>
				<b>Duration =</b>
				<%=duration%>-Hours<br> <b>Director =</b>
				<%=director%>
			</h4>
			<br>
			<h2>Customer Details</h2>
			<h4>
				<b>Name =</b>
				<%=request.getAttribute("name")%>
				<b>Email =</b>
				<%=request.getParameter("email")%><br> <b>Country =</b>
				<%=request.getAttribute("country")%>
				<b>Booked Seats =</b>
				<%=request.getAttribute("booked")%><br> <b>Price Total =</b>
				<%
				int total = (int) request.getAttribute("booked");
				total *= 100;
				%>
				<%=total%>
			</h4>
			<%
			} catch (Exception e) {
			out.print(e);
			}
			%>

		</div>
		<input type="hidden" id="status" value="success">

	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Movie Booked Successfully", "You clicked the button!",
					"success");
		}
	</script>
	<script type="text/javascript">
	windows.addEventListener('beforeupload',()=>{
		event.preventDefault();
		event.returnValue= "";
	})
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>

</body>

</html>