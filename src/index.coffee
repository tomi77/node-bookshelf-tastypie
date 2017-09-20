module.exports = (bookshelf) ->
  require('./models/apikey') bookshelf
  require('./models/apiaccess') bookshelf

  ApiKey: bookshelf.model 'Tastypie.ApiKey'
  ApiKeys: bookshelf.collection 'Tastypie.ApiKeys'
  ApiAccess: bookshelf.model 'Tastypie.ApiAccess'
  ApiAccesses: bookshelf.collection 'Tastypie.ApiAccesses'
