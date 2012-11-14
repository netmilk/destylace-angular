@app.config [ '$routeProvider', ($routeProvider) ->
  $routeProvider
    # Support application
    # TODO conditional routing according to backend availability
    
    # default controller in application
    .when('/destylace/dashboard', 
      {
        templateUrl: '/destylace/destylace/dashboard.html',
        controller:  'DashboardController'
      })

    .otherwise({redirectTo: '/destylace/dashboard'})
  ]
