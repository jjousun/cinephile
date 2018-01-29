angular
  .module('app')
  .controller('GenresController', GenresController);
function GenresController(Genre) {
  var ctrl = this;
  ctrl.genres = Genre.query();
}