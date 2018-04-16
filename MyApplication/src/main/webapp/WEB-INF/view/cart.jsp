<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>RegistraturaClone| home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" /><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<jsp:include page="welcomepage.jsp" />
<div class="container text-center" id="tasksDiv">
	<h3>Cart</h3>
		<div class="table-responsive">
		
	  <table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th></th>
								<th>Name</th>
								<th>Price</th>
								<th>Cant</th>
								<th>Sterge</th>
								<th>Pret total</th>
							</tr>
						</thead>
						<tbody id="myTable">
						<c:set var="i" value="${0}"/> 
							<c:forEach var="p" items="${cart}">
								<tr >
									<td><c:out value="${i=i+1}"/></td>
									<td>${p.key.name}</td>
									<td>${p.key.price} RON</td>
									<td><input type="number" name="quantity" id="quantity" min="1" max="20" value="${p.value}"></td>
									<td><a href="/delete?id=${p.key.id}"><span
											class="glyphicon glyphicon-trash"></span></a></td>
									<td><a href="/edit?id=${p.key.id}"><span
											class="glyphicon glyphicon-pencil"></span>+</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
				<div class="totals">
    <div class="totals-item">
      <label>Subtotal</label>
      <div class="totals-value" id="cart-subtotal">${total }</div>
    </div>

    <div class="totals-item">
      <label>Shipping</label>
      <c:choose>
      <c:when test="${total>0}">
      <div class="totals-value" id="cart-shipping">10.00 RON</div>
      </c:when>
      <c:otherwise><div class="totals-value" id="cart-shipping">0.00 RON</div></c:otherwise>
      </c:choose>
     
    </div>
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <c:choose>
      <c:when test="${total>0}">
      <div class="totals-value" id="cart-total">${total+ 10} RON</div>
      </c:when>
      <c:otherwise><div class="totals-value" id="cart-total">0.00 RON</div></c:otherwise>
      </c:choose>
    </div>
  </div>
      
      <button class="checkout">Checkout</button>
			</div>
</body>
<script>
var taxRate = 0.05;
var shippingRate = 15.00; 
var fadeTime = 300;


/* Assign actions */
$('.product-quantity input').change( function() {
  updateQuantity(this);
});

$('.product-removal button').click( function() {
  removeItem(this);
});


/* Recalculate cart */
function recalculateCart()
{
  var subtotal = 0;
  
  /* Sum up row totals */
  $('.product').each(function () {
    subtotal += parseFloat($(this).children('.product-line-price').text());
  });
  
  /* Calculate totals */
  var tax = subtotal * taxRate;
  var shipping = (subtotal > 0 ? shippingRate : 0);
  var total = subtotal + tax + shipping;
  
  /* Update totals display */
  $('.totals-value').fadeOut(fadeTime, function() {
    $('#cart-subtotal').html(subtotal.toFixed(2));
    $('#cart-tax').html(tax.toFixed(2));
    $('#cart-shipping').html(shipping.toFixed(2));
    $('#cart-total').html(total.toFixed(2));
    if(total == 0){
      $('.checkout').fadeOut(fadeTime);
    }else{
      $('.checkout').fadeIn(fadeTime);
    }
    $('.totals-value').fadeIn(fadeTime);
  });
}


/* Update quantity */
function updateQuantity(quantityInput)
{
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.product-price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;
  
  /* Update line price display and recalc cart totals */
  productRow.children('.product-line-price').each(function () {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });  
}


/* Remove item from cart */
function removeItem(removeButton)
{
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
  });
}
</script>
</html>