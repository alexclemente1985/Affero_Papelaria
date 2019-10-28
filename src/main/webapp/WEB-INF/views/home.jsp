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
