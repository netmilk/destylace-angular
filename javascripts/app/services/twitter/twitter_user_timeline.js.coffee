# DOC: https://dev.twitter.com/docs/api/1.1/get/users/show
@services.factory('TwitterUserTimeline', 
  ['$resource', ($resource) ->
    url = 'https://api.twitter.com/1/statuses/user_timeline.json'
    TwitterUserTimeline = $resource(url, {callback: 'JSON_CALLBACK'}, {
      query: { 
        method: 'JSONP',
        params: { trim_user: 'true', include_rts: 'true', count: 200 }
        isArray: true
      }
    })

    TwitterUserTimeline.hashtags = (params, callback_function) ->
      filter_hashtags = (data) ->
        hashtags = []
        angular.forEach(data, (tweet) ->
          hashtags_in_tweet = tweet.text.match(/(^|\s)#(\w*[a-zA-Z_]+\w*)/g)
          if(hashtags_in_tweet != null)
            angular.forEach(hashtags_in_tweet, (tag) ->
              hashtags.push(tag.trim())
            )
        )
        unique_hashtags = hashtags.getUnique()

        callback_function(unique_hashtags)

        return unique_hashtags
    
      TwitterUserTimeline.query(params, filter_hashtags)

    TwitterUserTimeline

    TwitterUserTimeline
  ]
)

