<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>RegistraturaClone| home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script type="text/javascript">
</script>
</head>
<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Catering</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/login">Login</a></li>
					<li><a href="/register">New Registration</a>
				</ul>
			</div>
		</div>
	</div>
<body onload="/cale-intrare">
			<div class="container text-center">
				<h3>New Product</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-product" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${product.id }" />
				
				<div class="form-group">
						<label class="control-label col-md-3" for="text"> Nume</label>
						<div class="col-md-7 row-md-5">
							<textarea rows=5 class="form-control" name="name"></textarea>
						</div>
					</div>
				
				  <div class="form-group">
				  <label class="control-label col-md-3">Category</label>
				 <div class="col-md-7" style="margin-left:290px">
						<select class="form-control " id="type" name="type">
						   <c:forEach var="type" items="${listc}">
								<option  >${type.type}</option>
							</c:forEach>
						  </select>
						  </div>
				    </div>
				   
					
					<div class="form-group">
						<label class="control-label col-md-3" for="comment"> Detalii</label>
						<div class="col-md-7 row-md-5">
							<textarea rows=5 class="form-control" name="details"></textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3" for="text"> pret</label>
						<div class="col-md-7 row-md-5">
							<textarea rows=5 class="form-control" name="price"></textarea>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Imagine</label>
						<div class="col-md-7">
							<input type="file" class="form-control" name="file"
								value="${document.image }" />
						</div>
					</div>
					
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
</body>
</html>