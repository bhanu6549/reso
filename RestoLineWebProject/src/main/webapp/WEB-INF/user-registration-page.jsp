<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="background-color: black;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/"> Resto Line Portal</a>
			</div>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="/register"><span
						class="glyphicon glyphicon-user"></span> Register</a></li>
				<li><a href="/login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>

			</ul>
		</div>
	</nav>

	<div
		style="background-color: silver; width: 500px; height: 530px; margin: 10% auto; box-shadow: 0 10px 15px 0 rgba(0, 0, 0, 0.5), 0 10px 25px 0 rgba(0, 0, 0, 0.25);">

		<div style="margin-top: 20%; padding-top: 25px; margin-left: 25%;">
			<h2 style="font-weight: bold;">User Registration</h2>
		</div>
		<hr style="width: 30%; border-color: white;">
		<br>
		<div class="col-lg-8 m-auto d-block " style="margin-left: 17%;">
			<form:form method="post" modelAttribute="users" action="userregister">

				<div class="form-group">
					<lable for="user"> Email: </lable>
					<form:input path="email" name="email" id="email"
						class="form-control" placeholder="Enter Email" autocomplete="off" />
					<h5 id="usercheck"></h5>

				</div>
				<div class="form-group">
					<lable for="user"> Password: </lable>
					<form:password path="password" name="password" id="password"
						class="form-control" placeholder="Enter new Password"
						autocomplete="off" />
					<h5 id="passcheck"></h5>

				</div>
				<div class="form-group">
					<lable for="user"> Confirm Password: </lable>
					<input type="password" name="confpassword" id="confpassword"
						class="form-control" placeholder="Re-Enter your Password"
						autocomplete="off" />
					<h5 id="conpasscheck"></h5>

				</div>

				<button type="submit" id="submitbtn"
					style="margin-top: 6%; height: 50px; width: 300px; font-weight: bold;">Register</button>
			</form:form>
		</div>


	</div>

	<script type="text/javascript">
		$(document).ready(function() {

							$('#usercheck').hide();
							$('#passcheck').hide();
							$('#conpasscheck').hide();

							var email_err = true;
							var pass_err = true;
							var conpass_err = true;

							
							$('#email').keyup(function() {
								email_check();
							});

							function email_check() {
								var email_val = $('#email').val();
								var regax = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$/;

								if (email_val.length == '') {
									$('#usercheck').show();
									$('#usercheck').html("**Please Fill the Email");
									$('#usercheck').focus();
									$('#usercheck').css("color", "red");
									email_err = false;
									return false;

								} else {
									$('#usercheck').hide();
								}

								if ((email_val.match(regax))) {
									$('#usercheck').show();
									$('#usercheck').html("**Email required pattern is not matching");
									$('#usercheck').focus();
									$('#usercheck').css("color", "red");
									email_err = false;
									return false;

								} else {
									$('#usercheck').hide();
								}
							}

							
							$('#password').keyup(function() {
								password_check();
							});

							function password_check() {

								var passwrdstr = $('#password').val();

								if (passwrdstr.length == '') {
									$('#passcheck').show();
									$('#passcheck').html("**Please Fill the password");
									$('#passcheck').focus();
									$('#passcheck').css("color", "red");
									pass_err = false;
									return false;

								} else {
									$('#passcheck').hide();
								}

								if ((passwrdstr.length < 8) || (passwrdstr.length > 15)) {
									$('#passcheck').show();
									$('#passcheck').html("**password length must be between 8 and 10");
									$('#passcheck').focus();
									$('#passcheck').css("color", "red");
									pass_err = false;
									return false;

								} else {
									$('#passcheck').hide();
								}
							}

							
							$('#confpassword').keyup(function() {
								con_passwrd();
							});

							function con_passwrd() {

								var conpass = $('#confpassword').val();
								var passwrdstr = $('#password').val();

								if (conpass.length == '') {
									$('#conpasscheck').show();
									$('#conpasscheck').html("**Please Fill the Confirm password");
									$('#conpasscheck').focus();
									$('#conpasscheck').css("color", "red");
									conpass_err = false;
									return false;

								} else {
									$('#conpasscheck').hide();
								}

								if (passwrdstr != conpass) {
									$('#conpasscheck').show();
									$('#conpasscheck').html("** Password not Matching");
									$('#conpasscheck').focus();
									$('#conpasscheck').css("color", "red");
									conpass_err = false;
									return false;

								} else {
									$('#conpasscheck').hide();
								}

							}

							$('#submitbtn').click(
									function() {

										email_err = true;
										pass_err = true;
										conpass_err = true;

										email_check();
										password_check();
										con_passwrd();

										if ((email_err == true)
												&& (pass_err == true)
												&& (conpass_err == true)) {
											return true;
										} else {
											return false;
										}

									});

						});
	</script>


</body>
</html>