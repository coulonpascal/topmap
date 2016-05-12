angular.module 'topMapApp'
  .controller 'mapPageController', ($scope, $location, $route, $timeout, $modal) ->
    $scope.broadcastParameterChange = (parameters) -> 
      $scope.$broadcast 'parameterUpdate', parameters
  
    #Init Page
    $scope.pageParameters = $location.search()
    angular.extend $scope.pageParameters, {'hash' : $location.hash() }
    
    angular.extend($scope, {
    # Make Leaflet map fit to page height automatically
      contentDivHeight: {
        height: "calc(100% - 120px)"
      }
    })
    
    #Handle Events
    # Hide the footer
    $scope.$on '$routeChangeSuccess', ($currentRoute, $previousRoute) ->
      footer = angular.element '#footer'
      footer.addClass 'hidden'

      
    #Trigger query change event in timout to ensure all handlers have registered.
    $timeout (->
      console.log('send trigger')
      $scope.broadcastParameterChange($scope.pageParameters)
    ), 0


    
    