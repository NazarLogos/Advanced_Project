<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<title>Log in with your account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"></script>
	<script
		src="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link type="text/css" href="jsp/css/log.css" rel="stylesheet">
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
	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<input class="checkbox" type="checkbox" id="reg-log"
							name="reg-log" />
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3"><spring:message
																code='login.logIn' /></h4>
											<form method="POST" action="${contextPath}/login"
												class="form-group">
												<div class="form-group ${error != null ? 'has-error' : ''}">
													<span>${message}</span> <input name="email" type="text"
														class="form-control form-style "
														placeholder=<spring:message
																code='login.email' />
														autofocus="true" /> <i class="input-icon uil uil-at"></i>
												</div>
												<div
													class="form-group mt-2 ${error != null ? 'has-error' : ''}">
													<input name="password" type="password"
														class="form-control form-style" placeholder=<spring:message
																code='login.password' /> />
													<%-- <span>${error}</span> --%>
													<i class="input-icon uil uil-lock-alt"></i> <input
														type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" /> <a
														href="${contextPath}/registration" class="btn mt-4"><spring:message
																code='login.signup' /></a>
													<button class="btn mt-4" type="submit"><spring:message
																code='login.logIn' /></button>
												</div>
												<fieldset>
													<select class="selectpicker" data-width="fit" id="locales">
														<option value="en"
															data-content='<span class="flag-icon flag-icon-us"></span> English'><i
																class="flag flag-us"></i><spring:message
																code='login.english' /></option>
														<option value="ua"
															data-content='<span class="flag-icon flag-icon-mx"></span> Español'><spring:message
																code='login.ukrainian' /></option>
													</select>
												</fieldset>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>