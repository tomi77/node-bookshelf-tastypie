module.exports = (bookshelf) ->
  require('./models/tastypie_apikey') bookshelf

  TastypieApiKey: bookshelf.model 'TastypieApiKey'
  TastypieApiKeys: bookshelf.collection 'TastypieApiKeys'
  TastypieApiAccess: bookshelf.model 'TastypieApiAccess'
  TastypieApiAccesses: bookshelf.collection 'TastypieApiAccesses'
