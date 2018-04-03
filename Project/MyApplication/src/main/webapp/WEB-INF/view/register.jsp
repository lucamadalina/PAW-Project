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
			<a href="/" class="navbar-brand">PAW</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				<li><a href="/">Inapoi</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
		        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		        </ul>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<h3>Creaza cont nou</h3>
			<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Prenume</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Nume</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email </label>
						<div class="col-md-7">
							<input type="email" class="form-control" name="email"
								value="${user.email }" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Parola</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" required="required" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Creaza cont" />
					</div>
				</form>
	</div>
</body>
</home>