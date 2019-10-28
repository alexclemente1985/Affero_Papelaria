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



<link rel="stylesheet" href="css/materialize.min.css">

<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script type="text/javascript"
	src="js/lib/jquery-2.1.1.min.js"></script>
<script src="js/materialize/materialize.min.js"></script>
<script src="js/materialize/init.js"></script>
<script src="js/lib/angular.min.js"></script>

<script src="js/lib/angular-route.min.js"></script>

<script src="js/app/app.js"></script>
<script src="js/app/controllers.js"></script>

<title>{{titulo}}</title>

</head>
<body ng-controller="papelariaController">
	<div class="container">
		<div class="row">
			<nav class="nav-wrapper grey darken-4 white-text" style="padding:0px 10px;">
				<h2 class="brand-logo" ng-bind="titulo"></h2>
			</nav>
		</div>
	</div>


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
						<th>Código</th>
						<th>Produto</th>
						<th>Descrição</th>
						<th>Quantidade</th>
						<th>Categoria</th>

					</tr>
				</thead>
				<tr ng-repeat="produto in produtos | filter:busca">
					<td>{{produto.barcode}}</td>
					<td>{{produto.nome}}</td>
					<td>{{produto.descricao}}</td>
					<td>{{produto.quantidade}}</td>
					<td>{{produto.categoria.descricao}}</td>
					<td>
						<button ng-click="exibirProduto(produto)" class="btn green">Exibir</button>
					</td>
					
					<td><button ng-click="atualizarProduto(produto)"
							class="btn blue">Editar</button></td>
					<td>
						<button ng-click="removerProduto(produto)" class="btn red">Remover</button>
					</td>

				</tr>

			</table>
		</div>

		<div class="row">
			<!-- Modal Trigger -->
			<a ng-click="cadastrarProdutoOn()"
				class="waves-effect waves-light btn grey darken-4" href="#modal1">Cadastrar
				produto</a>
		</div>
	</main>

	<!-- Modal Structure -->
	<div id="modal1" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h4 ng-if="!edicao">Cadastro de produtos</h4>
			<p ng-if="!edicao">Preencha os dados do novo produto</p>
			<h4 ng-if="edicao">Edição de produtos</h4>
			<p ng-if="edicao">Atualize os dados do produto</p>

			<div class="row">
				<div class="input-field col m6 s6" ng-if="!edicao">
					<input type="text" class="validate" ng-model="produto.barcode"
						pattern="[0-9]*" placeholder="Código de Barras" required/>
						
				</div>
				
				<div class="input-field col m6 s6" ng-if="edicao">
					<input type="text" ng-model="produto.barcode"
						  value="{{produto.barcode}}" placeholder="{{produto.barcode}}" disabled/>
						 
				</div>

				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.nome" placeholder="Nome do Produto"
						required />
						
				</div>

				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.descricao" placeholder="Descrição do Produto"
						 />
						
				</div>

				<div class="input-field col m6 s6">
					<input type="text" class="validate" ng-model="produto.quantidade"
						pattern="[0-9]*" placeholder="Quantidade" required />
						
				</div>

				<div class="input-field col m6 s6">
					<p ng-if="!edicao" style="color: #9e9e9e;">Categoria do Produto: </p>
					<p ng-if="edicao" style="color: #9e9e9e;">Categoria do Produto: <b ng-disable="categoria && $invalid"> {{categoria.descricao}}</b> </p>
					<select class="browser-default" ng-model="categoria" required>
						
						<option ng-repeat="categoria in categorias" value="{{categoria}}">{{categoria.descricao}}</option>
						
					</select>
					
					{{categoria}}
				</div>
			</div>
			

		</div>
		<div class="modal-footer">
			<a ng-if="!edicao" ng-click="cadastrarProduto(produto,categoria)"
				class="waves-effect waves-light btn-flat btn grey darken-4 white-text" ng-disable="!$valid">Adicionar</a> <a
				ng-if="edicao" ng-click="salvarProduto(produto,categoria)"
				class="waves-effect waves-light btn-flat btn grey darken-4 white-text" ng-disable="!$valid">Salvar</a> <a
				href="#!" class="modal-close waves-effect waves-grey darken-1 btn-flat">Cancelar</a>
		</div>

	</div>



</body>
</html>