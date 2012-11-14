@app.controller('DashboardController', 
  [ '$scope','$rootScope','TwitterUser', 'TwitterUserTimeline'
    ($scope, $rootScope, TwitterUser, TwitterUserTimeline) ->

      # Current application for breadcrumbs
      # TODO try to find better way to recognize current application
      $rootScope.current_application = 'destylace'

      # If is this controller routable set $rootScope.current_action
      $rootScope.current_action = "dashboard"
      
      TwitterUserTimeline.hashtags(screen_name: window.config.username, (hashtags) =>
        $scope.hashtags = hashtags
        # set hashtag search polling
        
      )
  ]
)
