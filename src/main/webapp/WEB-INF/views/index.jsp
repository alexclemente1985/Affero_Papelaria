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

<!-- <link rel="stylesheet" -->
<!-- href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" /> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script src="js/materialize/init.js"></script>
<script
	src="js/lib/angular.min.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular-route.min.js"></script>
<script src="js/app/app.js"></script>
<script src="js/app/controllers.js"></script>	
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> -->



<!-- <script type="text/javascript">
	 document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('#modal1');
		var instances = M.Modal.init(elems,options);
	}); 
</script> -->


<!-- <script type="text/javascript" src="js/app/app.js"></script> -->

</head>
<body ng-controller="papelariaController">
	<header class="container">
		<div class="row">
			<h2 ng-bind="titulo"></h2>
		</div>
	</header>
	<main class="container">

	<div class="row">
		<input type="text" ng-model="busca.nome"
			placeholder="Busca de produtos" />
	</div>
	<div class="App">
		<br />
		<!-- <h4 class="papelaria">Gerenciador Papelaria</h4> -->
		<div class="row">
			<table class="highlight">
				<thead>
					<tr>
						<th>Código de barras</th>
						<th>Nome do produto</th>
						<th>Descrição do produto</th>
						<th>Quantidade</th>

					</tr>
				</thead>
				<tr ng-repeat="produto in produtos | filter:busca">
					<td>{{produto.barcode}}</td>
					<td>{{produto.nome}}</td>
					<td>{{produto.descricao}}</td>
					<td>{{produto.quantidade}}</td>
					<!-- 	<td>{{produto.descCategoria}}</td> -->
					<td><button ng-click="atualizarProduto(produto)"
							class="btn blue">Editar</button></td>
					<td>
						<button ng-click="removerProduto(produto)" class="btn red">Remover</button>
					</td>

				</tr>
				<tr>
					<td>Média da quantidade de produtos:</td>
					<td>{{media(produtos)}}</td>
				</tr>
			</table>
		</div>

		<div class="row">
			<!-- Modal Trigger -->
			<a ng-click="cadastrarProdutoOn()"
				class="waves-effect waves-light btn" href="#modal1">Cadastrar
				produto</a>
		</div>
	</main>

	<!-- Modal Structure -->
	<div id="modal1" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h4 ng-if="!edicao">Cadastro de produtos</h4>
			<h4 ng-if="edicao">Edição de produtos</h4>
			<p>Preencha os dados do novo produto</p>

			<div class="row">
				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.barcode"
						pattern="[0-9]*" placeholder="Código de barras" required />
				</div>

				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.nome" placeholder="Nome" required/>
				</div>

				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.descricao" placeholder="Descrição"/>
				</div>

				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.quantidade"
						pattern="[0-9]*" placeholder="Quantidade" required/>
				</div>

				<!-- <div class="input-field col m6 s6">
						
						<input type="text" class="validate" ng-model="categoria.descricao"/>
						<label>Categoria do produto</label>
					</div> -->
			</div>


		</div>
		<div class="modal-footer">
			<a ng-if="!edicao" ng-click="cadastrarProduto(produto)"
				class="waves-effect waves-light btn-flat btn blue">Adicionar</a>
			<a ng-if="edicao" ng-click="salvarProduto(produto)"
				class="waves-effect waves-light btn-flat btn blue">Salvar</a>
			<a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancelar</a>
		</div>

	</div>



</body>
</html>