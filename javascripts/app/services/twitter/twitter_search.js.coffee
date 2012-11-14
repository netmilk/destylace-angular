# DOC: https://dev.twitter.com/docs/api/1/get/search
@services.factory('TwitterSearch', 
  ['$resource', ($resource) ->
    url = 'http://search.twitter.com/search.json'
    TwitterSearch = $resource(url, {callback: 'JSON_CALLBACK'}, {
      query: { 
        method: 'JSONP'
      }
    })

    TwitterSearch.not_own = (params, callback_function) ->
      filter_results = (data) ->
        filtered = []

        angular.forEach(data.results, (value) ->
          if(value.from_user != window.config.username )
            filtered.push(value)
        )

        data.result = filtered 

        callback_function(data)
        return data

      TwitterSearch.query(params, filter_results)




    TwitterSearch
  ]
)

