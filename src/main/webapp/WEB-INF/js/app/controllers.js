angular.module("papelariaManager").controller("papelariaController",function($scope){
	$scope.titulo = "Papelaria";
	
			
	$scope.produtos=[
		{barcode:1,nome:"maçã",descricao:"maçã",quantidade:1},
		{barcode:2,nome:"batata",descricao:"batata",quantidade:2},
		{barcode:3,nome:"acerola",descricao:"acerola",quantidade:3},
		{barcode:4,nome:"arroz",descricao:"arroz",quantidade:4},
		{barcode:5,nome:"feijão",descricao:"feijão",quantidade:5}
	];
	
	
	var init = function(){
		limpaForm();
	};
	
	$scope.media = function(produtos){
		var sum = 0;
		for(var produto of produtos){
			sum +=parseFloat(produto.quantidade);
			
		}
		console.log("quantidade de produtos = "+produtos.length);
		var media = sum/produtos.length;
		console.log("soma = "+sum);
		return media;
	};
	
	$scope.cadastrarProdutoOn = function(){
		$scope.edicao = false;
		$('#modal1').openModal();
		limpaForm();
	}	
	
	$scope.cadastrarProduto = function(produto){
			
			produto.quantidade = parseInt(produto.quantidade);
			
			$scope.produtos.push(produto);
			$('#modal1').closeModal();
			limpaForm();
			
	};
	
	$scope.edicao = false;
	var produtoEdit;
	
	$scope.atualizarProduto = function(produto){
		$scope.edicao = true;
		angular.copy(produto,$scope.produto);
		$('#modal1').openModal();
		produtoEdit = produto;
	};
	
	$scope.salvarProduto = function(produto){
		produtoEdit.barcode = produto.barcode;
		produtoEdit.nome = produto.nome;
 		produtoEdit.descricao = produto.descricao;
 		produtoEdit.quantidade = produto.quantidade;
 		$('#modal1').closeModal();
 	};
	
	$scope.removerProduto = function(produto){
		for(var index in $scope.produtos){
			var aux = $scope.produtos[index];
			if(produto === aux){
				$scope.produtos.splice(index,1);
			}
		}
	};
	
	var limpaForm = function(){
		$scope.produto={barcode:'' ,nome:"", descricao:"",quantidade:''};
	};
	
	init();
 });
