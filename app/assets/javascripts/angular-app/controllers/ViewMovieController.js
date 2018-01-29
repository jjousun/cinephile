angular
  .module('app')
  .controller('ViewMovieController', ViewMovieController);
function ViewMovieController(Movie, $stateParams) {

  var ctrl = this;
  ctrl.movie = Movie.get({ id: $stateParams.id });
}