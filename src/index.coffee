module.exports = (bookshelf) ->
  require('./models/tastypie_apikey') bookshelf
  require('./models/tastypie_apiaccess') bookshelf

  ApiKey: bookshelf.model 'Tastypie.ApiKey'
  ApiKeys: bookshelf.collection 'Tastypie.ApiKeys'
  ApiAccess: bookshelf.model 'Tastypie.ApiAccess'
  ApiAccesses: bookshelf.collection 'Tastypie.ApiAccesses'
