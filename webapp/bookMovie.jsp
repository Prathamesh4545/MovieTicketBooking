
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<style>
* {
	font-family: ui-monospace;
}

#inputSeat {
	margin-left: 146px;
}

label {
	font-size: 26px;
	margin-left: 146px;
}

#card {
	width: 260px;
	height: 385px;
	overflow: clip;
	border-radius: 50px 50px;
	box-shadow: 10px 10px 25px rgb(207, 209, 207);
	text-align: center;
	float: left;
	margin: 20px;
	padding: 15px;
}

#card-img {
	height: 62%;
}

#card-p {
	overflow: hidden;
	height: 20px;
}

#card-name {
	margin: 0px;
}

#btn {
	width: 17vh;
	padding: 10px;
	margin-left: 7vh;
	background-color: rgb(114, 185, 230);
	box-shadow: 5px 5px 3px rgb(207, 209, 207);
	cursor: pointer;
	border-radius: 20px;
	color: navy;
	border: none;
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
	<div class="card text-bg-info ">
		<div class="card-body">
			<h2>
				Movie Name :
				<%=request.getAttribute("title")%></h2>
		</div>
		<div class="container">
			<div class="row">

				<form class="row gy-2 gx-3 align-items-center"
					action="updateBookedTicket" method="post">
					<div class="col-auto" style="margin-right: 169vh;">
						<label for="inputSeat" class="form-label">No. Of Seat </label> <input
							type="number" class="form-control" id="inputSeat"
							name="inputSeat" placeholder="2" required> <input type="hidden"
							name="id" value="<%=request.getParameter("id")%>">
							<input type="hidden"
							name="email" value="<%=session.getAttribute("email")%>">
					</div>
					<div class="card" id="card" style="margin-left: 42vh;">
						<img src="./img/Screenshot 2023-09-04 222608.png" class="card-img">
						<h3 class="card-name" style="margin-top: 43px;">Gold Ticket</h3>
						<p class="card-p">Price of Gold Class will be 150</p>
						<input type="submit" name="btn" id="btn" value="Gold">
					</div>
					<div class="card" id="card">
						<img src="./img/Screenshot 2023-09-04 222045.png" class="card-img">
						<h3 class="card-name" style="margin-top: 51px;">Silver Ticket</h3>
						<p class="card-p">Price of Silver Class will be 100</p>
						<input type="submit" name="btn" id="btn" value="Silver">
					</div>
					<div class="card" id="card">
						<img src="./img/18966075.jpg" class="card-img">
						<h3 class="card-name">Platinum</h3>
						<p class="card-p">Price of Gold Class will be 200</p>
						<input type="submit" name="btn" id="btn" value="Platinum">
					</div>

				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
		integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
		crossorigin="anonymous"></script>
</body>

</html>