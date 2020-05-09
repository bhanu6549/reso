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
<body >
	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="background-color: black;">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/homepage"> Resto Line Portal</a>
			</div>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-menu-hamburger"></span> Menu</a>
                            <ul class="dropdown-menu">
                            <li><a href="/restaurants">Show Restaurant</a></li>
							<li><a href="/">Reservation History</a></li>
						
                            </ul></li>

				<li><a href="/"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>

			</ul>
		</div>
	</nav>
	<br />

	<div align="center"
		style="background-color: gray; width: 70%; margin-top: 5%; margin-left: 15%; box-shadow: 0 10px 15px 0 rgba(0, 0, 0, 0.5), 0 10px 25px 0 rgba(0, 0, 0, 0.25);">
		<div style="padding-top: 25px;">
			<h2 style="font-weight: bold;">Restaurants</h2>
		</div>
		<hr style="width: 25%; border-color: white;">
		<br>

		<table class="table table-striped table-hover table-bordered"
			style="margin-left: auto; margin-right: auto; border-width: 15px;">

			<tr style="background-color: black; color: white;">
				<th>#</th>
				<th>Restaurant Name</th>
				<th>No Of Seat</th>
				<th>Fee</th>
				<th>Revenue</th>
			</tr>

			<tbody>
				<c:forEach var="rest" items="${restaurantlist}">
					<tr>
						
						<td>${rest.restaurantId}</td>
						<td>${rest.restaurantName}</td>						
						<td>${rest.noOfSeat}</td>						
						<td>${rest.fee}</td>
						<td>${rest.revenue}</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>