angular 
  .module('app')
  .factory('Genre', Genre)
function Genre($resource) {
  
  var Genre = $resource('http://localhost:3000/api/genres/:id.json', {id: '@id'}, {
  update: { method: 'PUT' }
});
  return Genre; 
}