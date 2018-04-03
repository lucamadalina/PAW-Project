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
				<li style="margin-left:950px;float:right"><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>Cos</a></li>
				<li style="float:right"><a href="/logout">Logout</a></li>
			    <li ><a href="#">Meniu</a></li>   	
				<li ><a href="#">Utilizatori inregistrati</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>