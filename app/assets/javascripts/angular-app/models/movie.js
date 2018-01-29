angular 
  .module('app')
  .factory('Movie', Movie)
function Movie($resource) {
  
  var Movie = $resource('http://localhost:3000/api/movies/:id.json', {id: '@id'}, {
  update: { method: 'PUT' }
});
  return Movie; 
}