angular.module("papelariaManager").controller("papelariaController",function($scope,$http){
	$scope.titulo = "Gerenciador de Produtos";
	
	$scope.produto={};
	
	$scope.produtos=[];		
	/*
	 * $scope.produtos=[ {barcode:1,nome:"maçã",descricao:"maçã",quantidade:1},
	 * {barcode:2,nome:"batata",descricao:"batata",quantidade:2},
	 * {barcode:3,nome:"acerola",descricao:"acerola",quantidade:3},
	 * {barcode:4,nome:"arroz",descricao:"arroz",quantidade:4},
	 * {barcode:5,nome:"feijão",descricao:"feijão",quantidade:5} ];
	 */
	
	$scope.categoria={};
	$scope.categorias=[];
	
	
	var init = function(){
		cargaProdutos();
		$scope.categorias = cargaCategorias();
		console.log($scope.categorias);
		
		limpaForm();
	
	};
	
	/*
	 * $scope.media = function(produtos){ var sum = 0; for(var produto of
	 * produtos){ sum +=parseFloat(produto.quantidade); }
	 * console.log("quantidade de produtos = "+produtos.length); var media =
	 * sum/produtos.length; console.log("soma = "+sum); return media; };
	 */
	
	
	
	$scope.cadastrarProdutoOn = function(){
		$scope.edicao = false;
		$('#modal1').openModal();
		limpaForm();
	}	
	
	$scope.cadastrarProduto = function(produto,categoria){
		var prodExists = false;	
		for(var index in $scope.produtos){
			var aux = $scope.produtos[index];
			if(parseInt(produto.barcode) === aux.barcode){
	
				prodExists = true;
				break;
	
			}
		}
			
			if(prodExists){
				alert("Código de barras já existente na base de dados!!!"+aux.barcode);
			}else if(produto.barcode==null || produto.barcode=="" || produto.barcode.match(/\D+/g)){
				alert("Código de barras incorreto!!!");
			}else{
				
				if(produto.quantidade==null || produto.quantidade==""){
					produto.quantidade=0;
				}
				
				console.log(produto);
				console.log(categoria);
								
				produto.barcode=parseInt(produto.barcode);
				produto.quantidade=parseInt(produto.quantidade);
				
				categoria.id=parseInt(categoria.id);
				produto.categoria = JSON.parse(categoria);
				console.log(produto);
				
				cadastrar(produto);
				$('#modal1').closeModal();
				limpaForm();
			}
	};
			
			// $scope.produtos.push(produto);
			
	
	
	$scope.atualizarProduto = function(produto){
		$scope.edicao = true;
		
		angular.copy(produto,$scope.produto);
		
		$scope.categoria.descricao = produto.categoria.descricao;
		
		
		console.log($scope.categoria.descricao);
		
		
		
		$('#modal1').openModal();
	}
		
	
	
	var produtoEdit;
	var categoriaEdit;
	
	$scope.salvarProduto = function(produto,categoria){
		console.log(produto);
		console.log(categoria);
						
		produto.barcode=parseInt(produto.barcode);
		produto.quantidade=parseInt(produto.quantidade);
		
		categoria.id=parseInt(categoria.id);
		produto.categoria.id = categoria.id;
		produto.categoria.descricao = categoria.descricao;
		console.log(produto);
		
		editar(produto);
		$('#modal1').closeModal();
		limpaForm();
		
	
	}
	
	
	$scope.removerProduto = function(produto){
		for(var index in $scope.produtos){
			var aux = $scope.produtos[index];
			if(produto === aux){
				// $scope.produtos.splice(index,1);
				deletar(produto);
			}
		}
	};
	
	var limpaForm = function(){
		$scope.categoria = {id:'',descricao:''};
		$scope.produto={barcode:'' ,nome:"", descricao:"",quantidade:'',categoria:$scope.categoria};
	};
	
	var cargaProdutos = function(){
		
		$http({
			method: 'GET',
			url: 'http://localhost:8080/papelaria/listarprodutos'
		}).then(function successCallback(response){
			$scope.produtos = response.data;
		},function errorCallback(response){
			console.log(response.statusText);
		});
	};
	
	var cadastrar = function(produto){
		console.log(angular.toJson(produto));
		
		$http({
			method: 'POST',
			url: 'http://localhost:8080/papelaria/cadastrarproduto',
			data: angular.toJson(produto),
			headers: {
				'Content-Type' : 'application/json'
			}
			}).then(_success, _error);
		
		
		};
	
	
	var editar = function(produto){
		$http({
			method: 'PUT',
			url: 'http://localhost:8080/papelaria/atualizarproduto',
			data: angular.toJson(produto),
			headers: {
				'Content-Type' : 'application/json'
			}
			}).then(_success, _error);
		};
		
	var deletar = function(produto){
		$http({
			method: 'DELETE',
			url: 'http://localhost:8080/papelaria/removerproduto/'+produto.barcode,
			data: angular.toJson(produto),
			headers: {
				'Content-Type' : 'application/json'
			}
			}).then(_success, _error);
		};
	
	
	var cargaCategorias = function(){
		$http({
			method: 'GET',
			url: 'http://localhost:8080/papelaria/categorias/listarcategorias'
		}).then(function successCallback(response){
			$scope.categorias = response.data;
		},function errorCallback(response){
			console.log(response.statusText);
		});
	};
	
	function _success(response){
		cargaProdutos();
		limpaForm();
	};
	
	function _error(response){
		console.log(response.statusText);
	};
	
		
	init();
 });
