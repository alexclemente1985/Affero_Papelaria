/**
 * 
 */
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
});

