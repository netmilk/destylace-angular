@app.controller('SubmenuController', 
  [ '$scope','$rootScope','$location'
    ($scope, $rootScope, $location) ->

      # on controller instantiation

      $rootScope.submenus = {}
      $rootScope.submenus.Support = [
        {
          name: "Dashboard" 
          href: '/support'
        },
        {
          name: "Steering wheel" 
          href: '/support/steering_wheel'
        },

      ]

  ]
)
