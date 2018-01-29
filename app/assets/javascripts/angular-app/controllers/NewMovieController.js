angular 
  .module('app') 
  .controller('NewMovieController', NewMovieController); 
function NewMovieController(Movie, $location) {
  var ctrl = this; 
  ctrl.movie = new Movie();
  ctrl.addMovie = function() {
    ctrl.movie.$save(function() {
      $location.path('movies');
    });
  };
}