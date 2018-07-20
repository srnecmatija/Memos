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
		
		<title>Your memories list | Memos</title>

		<link href="${pageContext.request.contextPath}/resources/css/materialize.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/spacings.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
	</head>
<body>
	
	<nav class="nav-extended">
	
	    <div class="nav-wrapper">
	      <a href="${pageContext.request.contextPath}/" class="brand-logo pl-20">Memos</a>
	      <a href="#" data-target="sidenav-main" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	      
	      <!--  nav for desktop -->
	      <ul class="right hide-on-med-and-down">
	      	<li><a href="${pageContext.request.contextPath}/add"><i class="material-icons left">add</i>Add New Memo</a></li>
	      	<li><a href="${pageContext.request.contextPath}/about">About</a></li>
      		<li>
      			<a href="#">
      				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
						<input type="submit" value="Logout" class="button-logout-2" />
					</form:form>
      			</a>
      		</li>
		  </ul>
		  
		  <!-- reload for mobile -->
		  <ul class="right hide-on-large-only">
	      	<li><a href="${pageContext.request.contextPath}/"><i class="material-icons">replay</i></a></li>
		  </ul>
		  
	    </div>
	    
	    <!-- tabs -->
	    <div class="nav-content">
	      <ul class="tabs tabs-transparent">
	        <li class="tab"><a href="#listAll" class="active">All</a></li>
	        <li class="tab"><a href="#listFavorites">Favorites</a></li>
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
	
	<!-- search by title or description -->
	<div class="row mt-20">
		<div class="col l8 offset-l2 m12 s12">
			
			<nav>
			    <div class="nav-wrapper">
			      <form:form action="${pageContext.request.contextPath}/search" method="POST">
			        <div class="input-field">
			          <input id="search" type="search" name="titleSearch" placeholder="Type title or description ...">
			          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
			          <i class="material-icons">close</i>
			        </div>
			      </form:form>
			    </div>
			</nav>
		
		</div>
	</div>
	
	<!-- tabs content -->
	<div id="listAll" class="row">
		<div class="col l8 offset-l2 m12 s12">
		
			<ul class="collection with-header">
				
				<c:forEach var="tempMemo" items="${memoList}">
				
					<!-- construct an "update" link with memo id -->
					<c:url var="updateLink" value="/update">
						<c:param name="memoId" value="${tempMemo.id}" />
					</c:url>
				
					<li class="collection-header valign-wrapper">
						<div class="col l6 m6 s6 nopadding">
							<h6 class="text-bold left">
								<fmt:formatDate pattern = "dd.MM.yyyy. E" value="${tempMemo.datetime}" />
							</h6>
						</div>
						<div class="col l6 m6 s6 nopadding">
							<i class="material-icons blue-text lighten-1 right" onclick="M.toast({html: 'Memo id ' + ${tempMemo.id}})">
						      	<c:choose> 
						      		<c:when test="${tempMemo.favorite == 1}">favorite</c:when>
						      		<c:when test="${tempMemo.favorite == 0}">favorite_border</c:when>
						      	</c:choose>
					      	</i>
						</div>
					</li>
					
			        <a href="${updateLink}" class="collection-item avatar">
				      <i class="material-icons circle red accent-1">${tempMemo.category.iconName}</i>
				      <span class="title black-text">${tempMemo.title}</span>
				      <p class="grey-text lighten-3"><br>
				         ${tempMemo.description}
				      </p>
				    </a>
				    
		        </c:forEach>
		        
		     </ul>
		</div>
	</div>
	
  	<div id="listFavorites" class="row">
		<div class="col l8 offset-l2 m12 s12">
		
			<ul class="collection with-header">
				
				<c:forEach var="tempFavoriteMemo" items="${memoFavoriteList}">
				
					<!-- construct an "update" link with memo id -->
					<c:url var="updateLink" value="/update">
						<c:param name="memoId" value="${tempMemo.id}" />
					</c:url>
				
					<li class="collection-header valign-wrapper">
						<h6 class="text-bold">
							<fmt:formatDate pattern = "dd.MM.yyyy. E" value="${tempFavoriteMemo.datetime}" />
						</h6>
					</li>
					
			        <a href="${updateLink}" class="collection-item avatar">
				      <i class="material-icons circle red accent-1">${tempFavoriteMemo.category_id.iconName}</i>
				      <span class="title black-text">${tempFavoriteMemo.title}</span>
				      <p class="grey-text lighten-3"><br>
				         ${tempFavoriteMemo.description}
				      </p>
				      <div href="#!" class="secondary-content" onclick="M.toast({html: 'Memo id ' + ${tempFavoriteMemo.id}})">
				      	<i class="material-icons blue-text lighten-1">
					      	<c:choose> 
					      		<c:when test="${tempFavoriteMemo.favorite == 1}">favorite</c:when>
					      		<c:when test="${tempFavoriteMemo.favorite == 0}">favorite_border</c:when>
					      	</c:choose>
				      	</i>
				      </div>
				    </a>
				    
		        </c:forEach>
		        
		     </ul>
		</div>
	</div>
  	
  	<!-- fab on mobile only -->
	<div class="fixed-action-btn hide-on-large-only">
	  <a href="${pageContext.request.contextPath}/add" class="btn-floating btn-large blue lighten-1 waves-effect waves-light">
	    <i class="large material-icons">add</i>
	  </a>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script>
		$(function() {
			$('.tabs').tabs();
			$('.sidenav').sidenav();
		});
	</script>
	
</body>
</html>