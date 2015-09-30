<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Order</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">

</head>
<body>
	<div>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Service Station</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/ServiceStation/clients">Clients</a></li>
						<li><a href="#">Orders</a></li>
					</ul>
					<form:form method="get" action="find"
						class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" name="firstName" class="form-control"
								placeholder="First Name"> <input type="text"
								name="lastName" class="form-control" placeholder="Last Name">
						</div>
						<button type="submit" class="btn btn-default">Find</button>
					</form:form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<h2>Car</h2>
		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>Year</th>
						<th>Make</th>
						<th>Model</th>
						<th>VIN</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${car.modelYearId.yearId.year}</td>
						<td>${car.modelYearId.modelId.makeId.make}</td>
						<td>${car.modelYearId.modelId.model}</td>
						<td>${car.vin}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<h3>Orders</h3>
		<div>
			<spring:url value="/orders/${car.carId}/add" var="urlNewOrder" />
			<button class="btn btn-info" onclick="location.href='${urlNewOrder}'">New
				order</button>
		</div>

		<div class="row">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>Date</th>
						<th>Order amount</th>
						<th>Order status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="order" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${order.date}</td>
							<td>${order.orderAmount}</td>
							<td>${order.orderStatus}</td>
							<td><spring:url value="/orders/${order.serviceOrderId}/delete"
									var="deleteUrl" /> <spring:url
									value="/orders/${order.serviceOrderId}/update" var="updateUrl" />

								<button class="btn btn-primary"
									onclick="location.href='${updateUrl}'">Edit</button>
								<button class="btn btn-danger"
									onclick="this.disabled=true;post('${deleteUrl}')">Delete</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

</body>
</html>