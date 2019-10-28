angular.module("papelariaManager",['ngRoute'])
.config(function($routeProvider, $locationProvider){
	$locationProvider.html5Mode({
		enable: true,
		requireBase: false
	});
	
	$routeProvider
	.when('/',{
		controller: 'papelariaController'
	})
	.otherwise({
		redirectTo: '/'
	});
	
});
