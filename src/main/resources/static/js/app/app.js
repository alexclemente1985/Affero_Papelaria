'use script';
var app = angular.module("papelariaManager",[]);

app.controller("papelariaController",function($scope){
	$scope.titulo = "Papelaria";
	
	$scope.produtos=[
		{barcode:1,nome:"maçã",descricao:"maçã",quantidade:1},
		{barcode:2,nome:"batata",descricao:"batata",quantidade:2},
		{barcode:3,nome:"acerola",descricao:"acerola",quantidade:3},
		{barcode:4,nome:"arroz",descricao:"arroz",quantidade:4},
		{barcode:5,nome:"feijão",descricao:"feijão",quantidade:5}
	];
	
	$scope.media = function(produtos){
		var sum = 0;
		for(var produto of produtos){
			sum +=produto.quantidade;
			
		}
		console.log("quantidade de produtos = "+produtos.length);
		var media = sum/produtos.length;
		console.log("soma = "+sum);
		return media;
	}
});

