<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Magazines</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>

<link type="text/css" href="jsp/css/home.css" rel="stylesheet">
<script type="text/javascript">
	function test() {
		var tabsNewAnim = $('#navbarSupportedContent');
		var selectorNewAnim = $('#navbarSupportedContent').find('li').length;
		var activeItemNewAnim = tabsNewAnim.find('.active');
		var activeWidthNewAnimHeight = activeItemNewAnim.innerHeight();
		var activeWidthNewAnimWidth = activeItemNewAnim.innerWidth();
		var itemPosNewAnimTop = activeItemNewAnim.position();
		var itemPosNewAnimLeft = activeItemNewAnim.position();
		$(".hori-selector").css({
			"top" : itemPosNewAnimTop.top + "px",
			"left" : itemPosNewAnimLeft.left + "px",
			"height" : activeWidthNewAnimHeight + "px",
			"width" : activeWidthNewAnimWidth + "px"
		});
		$("#navbarSupportedContent").on("click", "li", function(e) {
			$('#navbarSupportedContent ul li').removeClass("active");
			$(this).addClass('active');
			var activeWidthNewAnimHeight = $(this).innerHeight();
			var activeWidthNewAnimWidth = $(this).innerWidth();
			var itemPosNewAnimTop = $(this).position();
			var itemPosNewAnimLeft = $(this).position();
			$(".hori-selector").css({
				"top" : itemPosNewAnimTop.top + "px",
				"left" : itemPosNewAnimLeft.left + "px",
				"height" : activeWidthNewAnimHeight + "px",
				"width" : activeWidthNewAnimWidth + "px"
			});
		});
	}
	$(document).ready(function() {
		setTimeout(function() {
			test();
		});
	});
	$(window).on('resize', function() {
		setTimeout(function() {
			test();
		}, 500);
	});
	$(".navbar-toggler").click(function() {
		$(".navbar-collapse").slideToggle(300);
		setTimeout(function() {
			test();
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var selItem = localStorage.getItem("locales");
		$('#locales').val(selItem ? selItem : 'en');
		$("#locales").change(function() {
			var selectedOption = $('#locales').val();
			if (selectedOption) {
				window.location.replace('?lang=' + selectedOption);
				localStorage.setItem("locales", selectedOption);
			}
		});
	});
</script>
</head>
<body>
<body>
	<!-- Sidebar -->
	<nav class="navbar navbar-expand-custom navbar-mainbg">
		<a class="navbar-brand navbar-logo" href="/home"><spring:message
				code='navbar.magazines' /></a>
		<button class="navbar-toggler" type="button"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars text-white"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<div class="hori-selector">
					<div class="left"></div>
					<div class="right"></div>
				</div>
				<li class="nav-item "><a class="nav-link" href="/home"><i
						class="	fas fa-book"></i>
					<spring:message code='navbar.home' /></a></li>
				<li class="nav-item  "><security:authorize
						access="hasRole('ROLE_ADMIN')">
						<a class="nav-link" href="/create-magazine"><i
							class="	fas fa-plus"></i>
						<spring:message code='navbar.сreate_magazines' />a> 
					</security:authorize></li>
				<li class="nav-item active"><security:authorize
						access="hasRole('ROLE_USER')">
						<a class="nav-link" href="/buckets"><i
							class="fas fa-cart-plus"></i>
						<spring:message code='navbar.bucket' /></a>
					</security:authorize></li>
			</ul>
		</div>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<i class="fas fa-sign-out" aria-hidden="true"></i>
			<button onclick="document.forms['logoutForm'].submit()" type="button"
				class="btn btn-default btn-sm">
				<span class="glyphicon glyphicon-log-out"></span> Log out
			</button>
		</c:if>
	</nav>
	<div class="container">




		<!-- Page Content -->
		<div style="margin-left: 10%">
			<div class="w3-container">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Description</th>
							<th>Price</th>
							<th>Image</th>
							<th>Purchase Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bucket" items="${bucketItems}">
							<tr>
								<td>${bucket.id}</td>
								<td>${bucket.magazine.name}</td>
								<td>${bucket.magazine.description}</td>
								<td>${bucket.magazine.price}</td>
								<td><img
									src="data:image/jpg;base64,${bucket.magazine.encodedImage}"
									alt="image" style="width: 10%"></td>
								<td>${bucket.purchaseDate}</td>
								<td><a href="bucket?id= ${bucket.id}">delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>