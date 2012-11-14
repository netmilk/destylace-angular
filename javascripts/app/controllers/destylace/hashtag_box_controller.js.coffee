@app.controller('HashtagBoxController', 
  [ '$scope','$rootScope','TwitterSearch'
    ($scope, $rootScope, TwitterSearch) ->

      $scope.searches = []
      $scope.since_id = 0

      update_hashtag_search = () =>
        TwitterSearch.not_own({q: $scope.hashtag, since_id: $scope.since_id},
          (data) => 
            if(data.results.length != 0)
              $scope.searches.unshift(data)
              $scope.since_id = data.max_id_str

          #setup next polling
          setTimeout(
            -> $scope.$apply(
              update_hashtag_search()
            ),
            window.config.interval
          )

        )
      
      #load first search
      update_hashtag_search()

  ]
)
