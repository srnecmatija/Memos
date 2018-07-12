<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		
		<title>About | Memos</title>

		<link href="${pageContext.request.contextPath}/resources/css/materialize.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/spacings.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
	</head>
<body>
	
	<nav class="nav-extended">
	
	    <div class="nav-wrapper">
	      <a href="${pageContext.request.contextPath}/" class="brand-logo pl-20">About</a>
	      <a href="${pageContext.request.contextPath}/" class="sidenav-trigger"><i class="material-icons">keyboard_backspace</i></a>
	      
	      <!--  nav for desktop -->
	      <ul class="right hide-on-med-and-down">
	      	<li><a href="${pageContext.request.contextPath}/">Back</a></li>
		  </ul>
		  
	    </div>
    
  	</nav>
  	
  	<!-- sidenav for mobile -->
  	<ul id="sidenav-main" class="sidenav">
	    <li>
	    	<div class="user-view">
	        	<div class="background red accent-1"></div>
			    <a href="#"><i class="material-icons large white-text">cloud_circle</i></a>
			    <a href="#"><span class="white-text name">Memos</span></a>
			    <a href="#"><span class="white-text email">Hi, <security:authentication property="principal.username" /></span></a>
		    </div>
	    </li>
	    <li><a href="${pageContext.request.contextPath}/about" class="waves-effect"><i class="material-icons">info_outline</i>About</a></li>
	    <li><div class="divider"></div></li>
	    <li>
	    	<a class="waves-effect" href="#"><i class="material-icons">exit_to_app</i>
	    		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
					<input type="submit" value="Logout" class="button-logout" />
				</form:form>
	    	</a>
	    </li>
	</ul>
	
	<div class="row mt-20">
		<div class="col l8 offset-l2 m12 s12">
		
			<div class="card white">
			
		        <div class="card-content">
		          
		          <span class="card-title">Memos</span>
		          <p>This is simple Web app that saves your memories.</p>
		          <br>
		          <p>Author: Matija Srnec</p>
		          <p>srnec.matija@gmail.com</p>
		          <br><br>
		          <p>The app was made using the course "Spring &amp; Hibernate for Beginners" from Chad Darby</p>
	
		        </div>
		        
		    </div>
		
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	
</body>
</html>