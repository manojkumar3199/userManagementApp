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
<title>sign up page</title>
</head>
<body>

	<section class="h-100 h-custom" style="background-color: #8fc4b7;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card rounded-3">
						<div class="card-body p-4 p-md-5">
							<h3
								class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2 text-capitalize text-decoration-underline">registration
								info: -</h3>

							<form action="signUp" method="post" name="form"
								onsubmit="return validate()" class="px-md-2">
								<div class="form-outline mb-3">
									<input type="text" id="form3Example1q" class="form-control"
										name="userName" /> <label class="form-label"
										for="form3Example1q">Enter your name</label>
								</div>
								<div class="form-outline mb-3">
									<input type="password" id="form3Example1q" class="form-control"
										name="password" /> <label class="form-label"
										for="form3Example1q">Enter your password</label>
								</div>
								<div class="form-outline mb-3">
									<input type="password" id="form3Example1q" class="form-control"
										name="confirmPassword" /> <label class="form-label"
										for="form3Example1q">Enter your password again</label>
								</div>
								<div class="form-outline mb-3">
									<input type="text" id="form3Example1q" class="form-control"
										name="address" /> <label class="form-label"
										for="form3Example1q">Enter your address</label>
								</div>
								<div class="form-outline mb-3">
									<input type="text" id="form3Example1q" class="form-control"
										name="phoneNumber" /> <label class="form-label"
										for="form3Example1q">Enter your phone number</label>
								</div>
								<div class="form-outline mb-3">
									<input type="text" id="form3Example1q" class="form-control"
										name="email" /> <label class="form-label"
										for="form3Example1q">Enter your email</label>
								</div>

								<input type="submit" value="Register" class="btn btn-success">
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function validate() {
			const userName = document.forms["form"]["userName"];
			const password = document.forms["form"]["password"];
			const confirmPassword = document.forms["form"]["confirmPassword"];
			const address = document.forms["form"]["address"];
			const phoneNumber = document.forms["form"]["phoneNumber"];
			const email = document.forms["form"]["email"];

			userName.value = userName.value.trim();
			password.value = password.value.trim();
			confirmPassword.value = confirmPassword.value.trim();
			address.value = address.value.trim();
			phoneNumber.value = phoneNumber.value.trim();
			email.value = email.value.trim();

			if (userName.value == "") {
				alert("Plz enter your name!");
				return false;
			} else if (password.value == "") {
				alert("Plz enter your password!");
				return false;
			} else if (confirmPassword.value == "") {
				alert("Plz confirm your password!");
				return false;
			} else if (password.value != confirmPassword.value) {
				alert("Password does't match!");
				return false;
			} else if (phoneNumber.value == "") {
				alert("Plz enter your phone number!");
				return false;
			} else if (isNaN(phoneNumber.value)) {
				alert("Plz enter valid phone number!");
				return false;
			}

			if (address.value == "") {
				address.value = "null";
			}
			if (email.value == "") {
				email.value = "null";
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