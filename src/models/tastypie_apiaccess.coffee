module.exports = (bookshelf) ->
  bookshelf.plugin 'registry'

  unless bookshelf.model('TastypieApiAccess')?
    bookshelf.model 'TastypieApiAccess',
      tableName: 'tastypie_apiaccess'

  unless bookshelf.collection('TastypieApiAccesses')?
    bookshelf.collection 'TastypieApiAccesses',
      model: bookshelf.model 'TastypieApiAccess'

  Model: bookshelf.model 'TastypieApiAccess'
  Collection: bookshelf.collection 'TastypieApiAccesses'
