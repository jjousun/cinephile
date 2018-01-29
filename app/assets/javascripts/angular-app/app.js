angular
  .module('app', ['ui.router', 'ngResource', 'templates'])
  .config(function($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'home.html',
        controller: 'HomeController as ctrl'
      })
      .state('home.movies', {
        url: 'movies',
        templateUrl: 'home/movies.html',
        controller: 'MoviesController as ctrl'
      })
      .state('home.new', {
        url: 'new',
        templateUrl: 'home/new.html',
        controller: 'NewMovieController as ctrl'
      })
      .state('home.movie', {
        url: 'movie/:id',
        templateUrl: 'home/show.html',
        controller: 'ViewMovieController as ctrl'
      });
 
    $urlRouterProvider.otherwise('/');
  });