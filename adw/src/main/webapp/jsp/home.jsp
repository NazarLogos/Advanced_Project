<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Magazines</title>

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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

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
				<li class="nav-item active"><a class="nav-link" href="/home"><i
						class="	fas fa-book"></i>
					<spring:message code='navbar.home' /></a></li>
				<li class="nav-item "><security:authorize
						access="hasRole('ROLE_ADMIN')">
						<a class="nav-link" href="/create-magazine"><i
							class="	fas fa-plus"></i>
						<spring:message code='navbar.сreate_magazines' /></a>
					</security:authorize></li>

				<li class="nav-item"><security:authorize
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

	<!-- Page Content  -->
	<div class="container d-flex justify-content-center mt-50 mb-50">
		<h1>
			<spring:message code='navbar.magazines' />
		</h1>
	</div>
	<div style="margin-left: 10%">
		<div class="container d-flex justify-content-center mt-50 mb-50">

			<div class="row">
				<div class="col-md-10">

					<div class="card card-body">
						<div
							class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
							<div class="mr-2 mb-3 mb-lg-0">

								<img src="https://i.imgur.com/5Aqgz7o.jpg" width="150"
									height="150" alt="">

							</div>

							<div class="media-body">
								<h6 class="media-title font-weight-semibold">
									<a href="#" data-abc="true">Apple iPhone XR (Red, 128 GB)</a>
								</h6>
								<p class="mb-3">128 GB ROM | 15.49 cm (6.1 inch) Display
									12MP Rear Camera | 7MP Front Camera A12 Bionic Chip Processor |
									Gorilla Glass with high quality display</p>
							</div>

							<div class="mt-3 mt-lg-0 ml-lg-3 text-center">
								<h3 class="mb-0 font-weight-semibold">$459.99</h3>
								<div>
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i>

								</div>
								<button type="button" class="btn btn-warning mt-4 text-white">
									<i class="icon-cart-add mr-2"></i> Add to cart
								</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<c:if test="${not empty magazines}">
			<c:forEach items="${magazines}" var="currentMagazine">
				<div class="container d-flex justify-content-center mt-50 mb-50">
					<div class="row">
						<div class="col-md-10">

							<div class="card card-body">
								<div
									class="media align-items-center align-items-lg-start text-center text-lg-left flex-column flex-lg-row">
									<div class="mr-2 mb-3 mb-lg-0">
										<img
											src="data:image/jpg;base64, ${currentMagazine.encodedImage}"
											width="150" height="150" alt="">
									</div>
									<div class="media-body">
										<h6 class="media-title font-weight-semibold">
											<a href="#" data-abc="true">${currentMagazine.name}</a>
										</h6>
										<p class="mb-3">${currentMagazine.description}</p>
									</div>
									<div class="mt-3 mt-lg-0 ml-lg-3 text-center">
										<h3 class="mb-0 font-weight-semibold">$
											${currentMagazine.price}</h3>

										<div>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i>

										</div>

										<security:authorize access="hasRole('ROLE_USER')">
											<form:form action="${contextPath}/bucket" method="POST"
												enctype="multipart/form-data">
												<input type="hidden" value="${currentMagazine.id}"
													class="form-control" name="magazineId">
												<input type="submit" class="btn btn-warning mt-4 text-white"
													value="+ add to bucket">
											</form:form>
										</security:authorize>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<div class="w3-container"></div>
	</div>
</body>
</html>