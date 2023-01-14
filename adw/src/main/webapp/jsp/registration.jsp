<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>
    
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
<link type="text/css" href="jsp/css/log.css" rel="stylesheet">
</head>

<body>
<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>     
						<div class="card-3d-wrap mx-auto " id="reg-f-height" >
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3"><spring:message
																code='registration.reg' /></h4>
											<form:form method="POST" modelAttribute="userForm"
												class="form-group">
												<div class="form-group">
													<spring:bind path="firstName">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<form:input type="text" path="firstName"
																class="form-style" placeholder="First name"
																autofocus="true"></form:input>
															<form:errors path="firstName"></form:errors>
														</div>
													</spring:bind>
												</div>
												<div class="form-group mt-2">
													<spring:bind path="lastName">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<form:input type="text" path="lastName"
																class="form-style" placeholder="Last name"
																autofocus="true"></form:input>
															<form:errors path="lastName"></form:errors>
														</div>
													</spring:bind>
												</div>
												<div class="form-group mt-2">
													<spring:bind path="email">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<form:input type="text" path="email" class="form-style"
																placeholder="Email" autofocus="true"></form:input>
															<form:errors path="email"></form:errors>
														</div>
													</spring:bind>
												</div>
												<div class="form-group mt-2">
													<spring:bind path="password">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<form:input type="password" path="password"
																class="form-style" placeholder="Password"></form:input>
															<form:errors path="password"></form:errors>
														</div>
													</spring:bind>
												</div>
												<div class="form-group mt-2">
													<spring:bind path="passwordConfirm">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<form:input type="password" path="passwordConfirm"
																class="form-style" placeholder="Confirm your password"></form:input>
															<form:errors path="passwordConfirm"></form:errors>
														</div>
													</spring:bind>
												</div>
												<button class="btn mt-4" type="submit">Submit</button>
											</form:form>
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