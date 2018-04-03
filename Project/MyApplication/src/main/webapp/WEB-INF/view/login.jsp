<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>RegistraturaClone | home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">

</head>
<body>


	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">RegistraturaClone</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				<li><a href="/">Inapoi</a></li>
				</ul>
			<ul class="nav navbar-nav navbar-right">
		      <li><a href="/register"><span class="glyphicon glyphicon-user"></span>Creaza-ti cont</a></li>
		    </ul>
			</div>
		</div>
	</div>
	<div class="container text-center">
	<h3>User Login</h3>
		<hr>
			<form class="form-horizontal" method="post" action="/login-user">
				<c:if test="${not empty error }">
					<div class= "alert alert-danger">
						<c:out value="${error }"></c:out>
						</div>
				</c:if>
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									value="${user.username}" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Parola</label>
							<div class="col-md-7">
								<input type="password" class="form-control" name="password"
									value="${user.password}" required="required" />
							</div>
						</div>
						<div class="form-group ">
							<input type="submit" class="btn btn-primary" value="Login" />
						</div>
						</form>
						<p>Nu esti inca inregistrat? Inscrie-te acum </p>
						<a href="/register">Inregistrare</a>
						</div>
</body>
</html>