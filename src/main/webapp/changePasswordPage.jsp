<%@ page import="com.manoj.model.User"%>
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

<title>change password page</title>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("changeUserPassword") == null) {
		response.sendRedirect("user.jsp");
		return;
	}

	User changeUserPassword = (User) session.getAttribute("changeUserPassword");
	%>


	<section class="vh-100" style="background-color: #8fc4b7;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						<div class="card-body p-4 p-md-5">

							<h3 class="text-capitalize text-center mb-0">update password</h3>
							<hr>
							<div class="text-center mb-5">
								<span class="text-capitalize">use id: </span> <span
									class="text-success"><%=changeUserPassword.getId()%></span> <span>,</span>
								<span class="text-capitalize">use name: </span> <span
									class="text-success"><%=changeUserPassword.getName()%></span>
							</div>

							<form action="updatePassword" method="post" name="form"
								onsubmit="return validate()" class="px-md-2">
								<div class="form-outline mb-4">
									<input type="password" id="form3Example1q" class="form-control"
										name="oldPassword" /> <label class="form-label text-capitalize"
										for="form3Example1q">old password</label>
								</div>
								<div class="form-outline mb-4">
									<input type="password" id="form3Example1q" class="form-control"
										name="newPassword" /> <label class="form-label text-capitalize"
										for="form3Example1q">new password</label>
								</div>
								<div class="form-outline mb-4">
									<input type="password" id="form3Example1q" class="form-control"
										name="confirmPassword" /> <label class="form-label text-capitalize"
										for="form3Example1q">confirm password</label>
								</div>

								<div class="text-center">
									<input type="submit" value="change password"
										class="btn btn-success text-capitalize">
								</div>

								<input type="hidden" value="<%=changeUserPassword.getId()%>"
									name="userId"> <input type="hidden"
									value="<%=changeUserPassword.getName()%>" name="userName">
								<input type="hidden"
									value="<%=changeUserPassword.getPassword()%>" name="password">
								<input type="hidden"
									value="<%=changeUserPassword.getAddress()%>" name="address">
								<input type="hidden"
									value="<%=changeUserPassword.getPhoneNumber()%>"
									name="phoneNumber"> <input type="hidden"
									value="<%=changeUserPassword.getEmail()%>" name="email">
							</form>

							<div class="text-center">
								<p>
									<a class="text-success text-capitalize" href="user.jsp">cancel</a>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%
	session.removeAttribute("changeUserPassword");
	%>

	<script type="text/javascript">
		function validate() {
			const oldPassword = document.forms["form"]["oldPassword"];
			const newPassword = document.forms["form"]["newPassword"];
			const confirmPassword = document.forms["form"]["confirmPassword"];

			if (oldPassword.value == "") {
				alert("plz enter your old password!");
				return false
			} else if (newPassword.value == "") {
				alert("plz enter your new password!");
				return false
			} else if (confirmPassword.value == "") {
				alert("plz confirm your new password!");
				return false
			}

			if (newPassword.value != confirmPassword.value) {
				alert("password does't match!");
				return false
			}
			return true;
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>