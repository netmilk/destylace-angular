@app.controller('MenuController', 
  [ '$scope','$rootScope','$location'
    ($scope, $rootScope, $location) ->

      # on controller instantiation
      # Render available aplication in menu according to available backends
      $rootScope.applications = ['destylace']

  ]
)
