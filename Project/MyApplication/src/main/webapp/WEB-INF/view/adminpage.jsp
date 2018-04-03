<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>PAW | home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a style="float:right" href="#" class="navbar-brand">${currentuser.firstname} ${currentuser.lastname}</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				<li style="float:right"><a  href="/logout">Logout</a></li>
			        <li><a href="#">Comenzi</a>
					<li ><a href="#">Utilizatori inregistrati</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container text-center" id="tasksDiv">
	<h3>Comenzi</h3>
		<div class="table-responsive">
	<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody id="myTable">
						<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
						</tbody>
						</table>
						</div>
						</div>
						
</body>
</html>