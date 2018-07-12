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
		
		<title>Save Memo | Memos</title>

		<link href="${pageContext.request.contextPath}/resources/css/materialize.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/spacings.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
	</head>
<body>
	
	<nav class="nav-extended">
	
	    <div class="nav-wrapper">
	      <a href="${pageContext.request.contextPath}/" class="brand-logo pl-20">Save Memo</a>
	      <a href="${pageContext.request.contextPath}/" class="sidenav-trigger"><i class="material-icons">keyboard_backspace</i></a>
	      
	      <!--  nav for desktop -->
	      <ul class="right hide-on-med-and-down">
	      	<li><a href="${pageContext.request.contextPath}/">Back</a></li>
		  </ul>
		  
	    </div>
    
  	</nav>
	
	<div class="row mt-20">
		<div class="col l8 offset-l2 m12 s12">
		
			<div class="card white">
			
		        <div class="card-content">
		          
		          <form:form action="${pageContext.request.contextPath}/saveMemo" modelAttribute="memo" method="POST">
		          		<form:hidden path="id" />
		          
						<div class="input-field">
							<form:input path="title" name="title" type="text" class="validate"/> 
							<form:errors path="title" cssClass="red-text lighten-1" />
							<label for="title">Title</label>
						</div>
						
						<div class="input-field">
							<form:input path="datetime" name="datetime" class="datepicker" type="text"/>
							<form:errors path="datetime" cssClass="red-text lighten-1" />
							<label for="datetime">Date</label>
						</div>
						
						<br>
						<div class="input-field">
							<form:select path="category_id.id"> 
							
								<c:forEach var="item" items="${categories}">
								    <c:choose>
								        <c:when test="${memo.category_id.id == item.key}">
								            <form:option selected="true" value="${item.key}" label="${item.value}" />
								        </c:when>
								
								        <c:otherwise>
								            <form:option value="${item.key}" label="${item.value}" />
								        </c:otherwise>
								    </c:choose>
								</c:forEach>
								
							</form:select>
							<label>Category</label>
						</div>
						
						<br>
						<div class="input-field">
							<form:textarea path="description" name="description" class="materialize-textarea"></form:textarea>
							<label for="description">Description</label>
						</div>
						
						<br>
						<button class="btn waves-effect waves-light blue lighten-1 right" type="submit">Save</button>
						
						<c:if test="${param.memoId != null}">
							<!-- construct an "delete" link with memo id -->
							<c:url var="deleteLink" value="/delete">
								<c:param name="memoId" value="${memo.id}" />
							</c:url>
							<a href="${deleteLink}"
							   class="btn waves-effect waves-light red lighten-1 left"
							   onclick="if (!(confirm('Are you sure you want to delete this Memo?'))) return false">Delete</a>
						</c:if>
						
						<br>
					</form:form>
	
		        </div>
		        
		    </div>
		    
		    <c:if test="${addError != null}">
				<div class="row">
				    <div class="col s12 m12 l12">
				      <div class="card red lighten-1">
				        <div class="card-content white-text">
				          <p>${addError}</p>
				        </div>
				      </div>
				    </div>
				</div>
			</c:if>
		
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/materialize.min.js"></script>
	<script>
		$(function() {
			$('.datepicker').datepicker({
				format: 'yyyy-mm-dd'
			});
			$('select').formSelect();
		});
	</script>
	
</body>
</html>