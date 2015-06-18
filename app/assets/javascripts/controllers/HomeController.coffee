angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$stateParams'
    '$scope'
    '$http'
    ($stateParams, $scope, $http) ->
      get = (page) ->
        page ||= 1 
        data = $http.get("/posts?&page=#{page}").then(
          (response) ->
            response.data
        ).then (response)->
          $scope.posts = response.posts
          $scope.totalItems = response.total_entries
          $scope.itemsPerPage = response.per_page
          $scope.currentPage = parseInt(response.page, 10)

      get($stateParams.id)

      $scope.setPage = (pageNo) ->
        $scope.currentPage = pageNo
        return
  ]