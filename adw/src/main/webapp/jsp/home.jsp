
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>



<!DOCTYPE html>
<html lang="en">
<head>


<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="container">


		<!-- Sidebar -->
		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
			<h3 class="w3-bar-item">Menu</h3>
			<a href="/home" class="w3-bar-item w3-button">Home</a>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/create-magazine" class="w3-bar-item w3-button">Create
					magazine</a>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_USER')">
				<a href="/buckets" class="w3-bar-item w3-button">Bucket</a>
			</security:authorize>
		</div>


		<!-- Page Content -->
		<div style="margin-left: 10%">

			<div class="w3-container w3-teal">
				<h1>Periodicals</h1>
			</div>

			<div class="w3-container">

				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<form id="logoutForm" method="POST" action="${contextPath}/logout">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					<h2>
						Welcome ${pageContext.request.userPrincipal.name} | <a
							onclick="document.forms['logoutForm'].submit()">Logout</a>
					</h2>
				</c:if>



				<c:if test="${not empty magazines}">
					<c:forEach items="${magazines}" var="currentMagazine">

						<div class="w3-card-4" style="width: 20%; margin: 2%">
							<img
								src="data:image/jpg;base64, ${currentMagazine.encodedImage}"
								alt="Norway" style="width: 100%">
							<div class="w3-container w3-center">
								<h3>${currentMagazine.name}</h3>
								<p>${currentMagazine.description}</p>
								<p>${currentMagazine.price}</p>
							</div>
							<security:authorize access="hasRole('ROLE_USER')">
								<form:form action="${contextPath}/bucket" method="POST"
									enctype="multipart/form-data">
									<input type="hidden" value="${currentMagazine.id}"
										class="form-control" name="magazineId">
									<input type="submit" class="w3-button w3-block w3-dark-grey"
										value="+ add to bucket">
								</form:form>
							</security:authorize>




						</div>

					</c:forEach>
				</c:if>
			</div>

		</div>


	</div>
</body>
</html>
