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
<title>edit page</title>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("editUser") == null) {
		response.sendRedirect("user.jsp");
		return;
	}
	%>

	<%
	User logedInUser = (User) session.getAttribute("logedInUser");
	User editUser = (User) session.getAttribute("editUser");

	out.println("<section class='h-100' style='background-color: #8fc4b7;'>");
	out.println("<div class='container py-5 h-100'>");
	out.println("<div class='row d-flex justify-content-center align-items-center h-100'>");
	out.println("<div class='col-lg-8 col-xl-6'>");
	out.println("<div class='card rounded-3'>");
	out.println("<div class='card-body p-4 p-md-5'>");
	out.println("<h3 class='text-capitalize text-center'>personal info</h3>");
	out.println("<hr class='mb-5'>");

	out.println("<form action='updateDetails' method='post' name='form' onsubmit='return validateForm()' class='px-md-2'>");
	out.println("<div class='container px-4'>");

	out.println("<div class='row my-3'>");
	out.println("<div class='col'>");
	out.println("<p class='text-capitalize'>user id</p>");
	out.println("</div>");
	out.println("<div class='col'>");
	out.println("<p>" + editUser.getId() + "</p>");
	out.println("</div>");
	out.println("</div>");

	out.println("<input type='hidden' value='" + editUser.getId() + "' name='userId'>");

	out.println("<div class='row my-3'>");
	out.println("<div class='col'>");
	out.println("<p class='text-capitalize'>user name</p>");
	out.println("</div>");
	out.println("<div class='col'>");
	out.println("<p>" + editUser.getName() + "</p>");
	out.println("</div>");
	out.println("</div>");

	out.println("<input type='hidden' value='" + editUser.getName() + "' name='userName'>");

	out.println("<div class='row my-3'>");
	out.println("<div class='col'>");
	out.println("<p class='text-capitalize'>password</p>");
	out.println("</div>");
	out.println("<div class='col'>");
	out.println("<p>" + editUser.getPassword() + "</p>");
	out.println("</div>");
	out.println("</div>");

	out.println("<input type='hidden' value='" + editUser.getPassword() + "' name='password'>");

	out.println("<div class='row my-3'>");
	out.println("<div class='col'>");
	out.println("<p class='text-capitalize'>address</p>");
	out.println("</div>");
	out.println("<div class='col'>");
	out.println("<input type='text' value='" + editUser.getAddress() + "' name='address' class='form-control' >");
	out.println("</div>");
	out.println("</div>");

	out.println("<div class='row my-3'>");
	out.println("<div class='col'>");
	out.println("<p class='text-capitalize'>phone number</p>");
	out.println("</div>");
	out.println("<div class='col'>");
	out.println("<input type='text' value='" + editUser.getPhoneNumber() + "' name='phoneNumber' class='form-control' >");
	out.println("</div>");
	out.println("</div>");

	out.println("<div class='row my-3'>");
	out.println("<div class='col'>");
	out.println("<p class='text-capitalize'>email</p>");
	out.println("</div>");
	out.println("<div class='col'>");
	out.println("<input type='text' value='" + editUser.getEmail() + "' name='email' class='form-control' >");
	out.println("</div>");
	out.println("</div>");

	out.println("<div class='row'>");
	out.println("<input type='submit' value='Update' class='btn btn-success mt-5'>");
	out.println("</div>");
	out.println("<div class='row'>");
	out.println("<a href='user.jsp' class='text-success text-center' >Cancel</a>");
	out.println("</div>");

	out.println("</form>");

	out.println("</div>");
	out.println("</div>");
	out.println("</div>");
	out.println("</div>");
	out.println("</div>");
	out.println("</section>");
	%>

	<%
	session.removeAttribute("editUser");
	%>

	<script type="text/javascript">
		function validateForm() {
			const address = document.forms["form"]["address"];
			const phoneNumber = document.forms["form"]["phoneNumber"];
			const email = document.forms["form"]["email"];

			address.value = address.value.trim();
			phoneNumber.value = phoneNumber.value.trim();
			email.value = email.value.trim();

			if (address.value == "")
				address.value = "null";

			if (phoneNumber.value == "") {
				alert("plz enter your phone number!");
				return false
			} else if (isNaN(phoneNumber.value)) {
				alert("plz enter valid phone number!");
				return false;
			}

			if (email.value == "")
				email.value = "null";

			return ture;
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>