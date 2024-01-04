<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma","no-cache");
response.setHeader("Expires", "0");
if(session.getAttribute("email")==null){
	response.sendRedirect("adminDashboard.jsp");
}
%>
<!doctype html>
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

<title>Candidate Search</title>
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
	<div class="col-sm-6" style="margin-left: 50vh; margin-top: 70px;">
		<div class="card">
			<div class="card-header text-center">
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit" style="margin-right: 10px;">Search</button>
					<a href="adminDashboard.jsp"class="btn btn-primary" role="button">Cancel</a>

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
								<th scope="col">Movie Id</th>
								<th scope="col">Title</th>
								<th scope="col">Genere</th>
							</tr>
						</thead>
						<%
						try {
							Class.forName("org.postgresql.Driver");
							Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root8080");
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select * from movie");
							while (rs.next()) {
						%>
						<tbody>
							<tr>
								<th scope="row"><b></b></th>
								<th scope="row"><%=rs.getInt(1)%></th>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
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