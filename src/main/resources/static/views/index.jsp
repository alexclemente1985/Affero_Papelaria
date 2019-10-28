<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="pt-br" ng-app="papelariaManager">
<head>
<meta charset="utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>{{titulo}}</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script src="js/materialize/init.js"></script>
<script
	src="js/lib/angular.min.js"></script>
<script
	src="js/lib/angular-route.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular-route.min.js"></script>
<script src="js/app/app.js"></script>
<script src="js/app/papelariaController.js"></script>	


</head>
<body> <!-- ng-controller="papelariaController"> -->
	<header class="container">
		<div class="row">
			<h2 ng-bind="titulo"></h2>
		</div>
	</header>
	<div ng-view></div>

</body>
</html>