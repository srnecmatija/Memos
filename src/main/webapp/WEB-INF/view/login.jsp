<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="msapplication-tap-highlight" content="no">
		<meta name="description" content="">
		
		<link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon" sizes="180x180">
		<link href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png" rel="icon" type="image/png" sizes="32x32">
		<link href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png" rel="icon" type="image/png" sizes="16x16">
		
		<title>Login | Memos</title>
		  
		<link href="${pageContext.request.contextPath}/resources/css/materialize.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/css/spacings.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
	</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col s10 offset-s1 m10 offset-m1 l4 offset-l4">
				<h4 class="mt-100 center-align white-text">Memos</h4>
				<h6 class="center-align white-text">Keeps yours memories</h6>
				
				<div class="card">
					<div class="card-content">
					
						<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
						
							<div class="input-field">
								<input id="username" name="username" type="text" class="validate"> 
								<label for="username">Username</label>
							</div>
							
							<div class="input-field">
								<input id="password" name="password" type="password" class="validate"> 
								<label for="password">Password</label>
							</div>
							
							<input class="btn blue lighten-1 right" type="submit" value="Log In">
							<br>
						</form:form>
						
					</div>
				</div>
				
				<c:if test="${param.error != null}">
					<div class="row">
					    <div class="col s12 m12 l12">
					      <div class="card red lighten-1">
					        <div class="card-content white-text">
					          <p>Invalid username/password</p>
					        </div>
					      </div>
					    </div>
					</div>
				</c:if>
				
				<c:if test="${param.logout != null}">
					<div class="row">
					    <div class="col s12 m12 l12">
					      <div class="card green lighten-1">
					        <div class="card-content white-text">
					          <p>You have been logged out</p>
					        </div>
					      </div>
					    </div>
					</div>
				</c:if>
				
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js" type="text/javascript"></script>
	
</body>
</html>