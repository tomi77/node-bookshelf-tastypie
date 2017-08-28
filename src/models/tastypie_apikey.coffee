module.exports = (bookshelf) ->
  bookshelf.plugin 'registry'

  unless bookshelf.model('TastypieApiKey')?
    require('bookshelf-django/models/auth_user') bookshelf

    bookshelf.model 'TastypieApiKey',
      tableName: 'tastypie_apikey'

      user: () -> @belongsTo 'AuthUser'

    # Add `apiKey` relation to `AuthUser` model
    AuthUser = bookshelf.model 'AuthUser'
    AuthUser::apiKey = () -> @hasOne 'TastypieApiKey', 'user_id'

  unless bookshelf.collection('TastypieApiKeys')?
    bookshelf.collection 'TastypieApiKeys',
      model: bookshelf.model 'TastypieApiKey'

  Model: bookshelf.model 'TastypieApiKey'
  Collection: bookshelf.collection 'TastypieApiKeys'
