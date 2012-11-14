# DOC: https://dev.twitter.com/docs/api/1.1/get/users/show
@services.factory('TwitterUser', 
  ['$resource', ($resource) ->
    url = 'https://api.twitter.com/1/users/show.json'
    TwitterUser = $resource(url, {callback: 'JSON_CALLBACK'}, {
      query: { 
        method: 'JSONP',
        params: {include_entities: 'true'}
      }
    })

    TwitterUser
  ]
)

