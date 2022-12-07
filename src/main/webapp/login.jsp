<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Login page</title>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("logedInUser") != null) {
		response.sendRedirect("user.jsp");
		return;
	}
	%>

	<section class="vh-100" style="background-color: #8fc4b7;">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						<div class="card-body p-4 p-md-5">

							<h3 class="text-uppercase text-center mb-0">log in to your account</h3>
							<hr class="mb-5">

							<form action="login" method="post" name="form"
								onsubmit="return validate()" class="px-md-2">
								<div class="form-outline mb-4">
									<input type="text" id="form3Example1q" class="form-control"
										name="userName" /> <label class="form-label"
										for="form3Example1q">Enter your name</label>
								</div>
								<div class="form-outline mb-4">
									<input type="password" id="form3Example1q" class="form-control"
										name="password" /> <label class="form-label"
										for="form3Example1q">Enter your password</label>
								</div>

								<input type="submit" value="Login" class="btn btn-success">
							</form>

							<div class="text-center">
								<p>
									Not a member? <a class="text-success" href="signUpPage.jsp">Register</a>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function validate() {
			const userName = document.forms["form"]["userName"].value;
			const password = document.forms["form"]["password"].value;
			if (userName == "") {
				alert("Enter your user name!");
				return false;
			} else if (password == "") {
				alert("Enter your password!");
				return false;
			} else {
				return true;
			}
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</body>
</html>