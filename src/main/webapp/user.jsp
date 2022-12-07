<%@page import="com.manoj.dao.UserDao"%>
<%@page import="com.manoj.services.DatabaseConnection"%>
<%@ page import="java.util.List"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>user page</title>
</head>
<body>

	<%!UserDao userDao = new UserDao();%>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("logedInUser") == null) {
		response.sendRedirect(request.getContextPath());
		return;
	}
	%>

	<%
	User logedInUser = (User) session.getAttribute("logedInUser");

	out.println("<section class='vh-100' style='background-color: #8fc4b7;'>");
	out.println("<div class='container py-5 h-100'>");
	out.println("<div class='row d-flex justify-content-center align-items-center h-100'>");
	out.println("<div class='col col-lg-9 col-xl-7'>");
	out.println("<div class='card'>");
	out.println("<div class='rounded-top text-white d-flex flex-row' style='background-color: #000; height: 200px;'>");
	out.println("<div class='ms-4 mt-5 d-flex flex-column' style='width: 150px;'>");
	out.println(
			"<img src='https://cdn1.iconfinder.com/data/icons/neutro-essential/32/user-512.png' alt='Generic placeholder image' class='img-fluid img-thumbnail mt-4 mb-2' style='width: 150px; z-index: 1'>");
	out.println(
			"<a href='logout' type='button' class='btn btn-outline-success text-capitalize' data-mdb-ripple-color='dark' style='z-index: 1;'>log out</a>");
	out.println("</div>");
	out.println("<div class='ms-3' style='margin-top: 130px;'>");
	out.println("<div class='h5'>");
	out.println("<span class='text-capitalize'>welcome</span> <span>" + logedInUser.getName() + "</span>");
	out.println("</div>");
	out.println("<div>");
	out.println("<span class='text-capitalize'>user id: </span> <span>" + logedInUser.getId() + "</span>");
	out.println("</div>");
	out.println("</div>");
	out.println("</div>");
	out.println("<div class='p-4 text-black' style='background-color: #f8f9fa;'>");
	out.println("<div class='d-flex justify-content-end text-center py-1'>");
	out.println("<div class='me-3'>");
	out.println("<a class='btn btn-success btn-sm text-capitalize' href='editPage?id=" + logedInUser.getId()
			+ "'>edit profile</a>");
	out.println("</div>");
	out.println("<div>");
	out.println("<a class='btn btn-success btn-sm text-capitalize' href='changePasswordPage?id=" + logedInUser.getId()
			+ "'>change my password</a>");
	out.println("</div>");

	if (!logedInUser.getName().equals("admin")) {
		out.println("<div class='ms-3'>");
		out.println("<a class='btn btn-danger btn-sm text-capitalize' href='delete?id=" + logedInUser.getId()
		+ "'>Delete my account</a>");
		out.println("</div>");
	}
	if (logedInUser.getName().equals("admin")) {
		out.println("<div class='ms-3'>");
		out.println("<a class='btn btn-success btn-sm text-capitalize' href='signUpPage.jsp'>add user</a>");
		out.println("</div>");
	}
	
	out.println("</div>");
	out.println("</div>");
	out.println("</div>");
	out.println("</div>");


	if (logedInUser.getName().equals("admin")) {
		out.println("<div class='card mt-3'>");
		out.println("<p class='h4 text-center text-capitalize'>list of users</p>");
		out.println("<hr class='m-0'>");
		out.println("<table class='table'>");
		
		out.println("<tr>");
		out.println("<td class='text-capitalize h6'>user id</td>");
		out.println("<td class='text-capitalize h6'>name</td>");
		out.println("<td class='text-capitalize h6'>password</td>");
		out.println("<td class='text-capitalize h6'>address</td>");
		out.println("<td class='text-capitalize h6'>phoneNumber</td>");
		out.println("<td class='text-capitalize h6'>email</td>");
		out.println("<td class='text-capitalize h6'>edit profile</td>");
		out.println("<td class='text-capitalize h6'>change password</td>");
		out.println("<td class='text-capitalize h6'>delete account</td>");
		out.println("</tr>");

		List<User> users = userDao.selectAllUsersExceptAdmin();
		for (int i = 0; i < users.size(); i++) {
			User temp = users.get(i);
			out.println("<tr>");
			out.println("<td>" + temp.getId() + "</td>");
			out.println("<td>" + temp.getName() + "</td>");
			out.println("<td>" + temp.getPassword() + "</td>");
			out.println("<td>" + temp.getAddress() + "</td>");
			out.println("<td>" + temp.getPhoneNumber() + "</td>");
			out.println("<td class='text-wrap'>" + temp.getEmail() + "</td>");
			out.println("<td><a class='text-success text-capitalize' href='editPage?id=" + temp.getId() + "'>edit</a></td>");
			out.println("<td><a class='text-success text-capitalize' href='changePasswordPage?id=" + temp.getId() + "'>edit</a></td>");
			out.println("<td><a class='text-danger text-capitalize' href='delete?id=" + temp.getId() + "'>delete</a></td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</div>");
	}
	
	out.println("</div>");
	out.println("</div>");
	out.println("</section>");
	%>


































	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>