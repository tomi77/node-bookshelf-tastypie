module.exports = (bookshelf) ->
  bookshelf.plugin 'registry'

  unless bookshelf.model('Tastypie.ApiAccess')?
    bookshelf.model 'Tastypie.ApiAccess',
      tableName: 'tastypie_apiaccess'

  unless bookshelf.collection('Tastypie.ApiAccesses')?
    bookshelf.collection 'Tastypie.ApiAccesses',
      model: bookshelf.model 'Tastypie.ApiAccess'

  Model: bookshelf.model 'Tastypie.ApiAccess'
  Collection: bookshelf.collection 'Tastypie.ApiAccesses'
