
<%@page import="java.io.PrintWriter"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma", "no-cache");
response.setHeader("Expires", "0");
if (session.getAttribute("email") == null) {
	response.sendRedirect("loginForm.jsp");
}
%>

<%@page import="java.sql.*"%>
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

<title>Movie Ticket Booking</title>
</head>
<style>
body {
	counter-reset: my-sec-counter;
}

b::before {
	counter-increment: my-sec-counter;
	content: counter(my-sec-counter);
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
						<button type="submit" class="btn btn-outline-light" type="submit">Logout</button>
					</li>
				</ul>
			</div>
		</nav>
	</form>

	<div class="col-sm-6" style="margin-left: 50vh; margin-top: 70px;">
		<div class="card">
			<div class="card-header text-center">
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
				</form>
			</div>
			<div class="card-body">
				<div class="card">
					<figure class="text-center">
						<blockquote class="blockquote">
							<p>A well-known quote, contained in a blockquote element.</p>
						</blockquote>
						<figcaption class="blockquote-footer">
							Someone famous in <cite title="Source Title">Source Title</cite>
						</figcaption>
					</figure>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Movie Title</th>
								<th scope="col">Show Slot</th>
								<th scope="col">Duration</th>
								<th scope="col">Screen</th>
								<th scope="col">Available</th>
								<th scope="col">Select</th>
							</tr>
						</thead>
						<%
						try {
							Class.forName("org.postgresql.Driver");
							Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery(
							"select movie.title,show.slot,movie.duration,show.screen,show.booked,show.id from movie,show where movie.id = show.mid");
							while (rs.next()) {
						%>
						<tbody>
							<tr>
								<th scope="row" id="rowCount"><b></b></th>
								<th scope="row"><%=rs.getString("title")%></th>
								<td scope="row"><%=rs.getInt("slot")%></td>
								<td scope="row"><%=rs.getInt("duration")%> Hours</td>
								<td scope="row"><%=rs.getInt("screen")%></td>
								<td scope="row">
									<%
									int slot = rs.getInt("slot");
									int booked = rs.getInt("booked");
									int total;
									if (booked > 0) {
										total = slot - booked;
									} else {
										total = 0;
									}
									%> <%=total%>
								</td>
								<td><a class="btn btn-outline-dark"
									style="pointer-events: auto;"
									href='collectMovieInfo?id=<%=rs.getString("id")%>'>Select</a></td>
							</tr>
						</tbody>
						<%
						}
						} catch (Exception e) {
						out.print(e);
						}
						%>
					</table>

				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
		integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
		crossorigin="anonymous"></script>
</body>

</html>