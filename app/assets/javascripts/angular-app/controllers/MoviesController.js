angular
  .module('app')
  .controller('MoviesController', MoviesController);
function MoviesController(Movie) {
  var ctrl = this;
  ctrl.movies = Movie.query();
  // ctrl.genres = Genre.query();
}