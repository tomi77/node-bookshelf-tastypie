module.exports = (bookshelf) ->
  bookshelf.plugin 'registry'

  unless bookshelf.model('Tastypie.ApiKey')?
    require('bookshelf-django/models/auth_user') bookshelf

    bookshelf.model 'Tastypie.ApiKey',
      tableName: 'tastypie_apikey'

      user: () -> @belongsTo 'AuthUser'

      toString: () -> "#{ @get 'key' } for #{ @related 'user' }"

    # Add `apiKey` relation to `AuthUser` model
    AuthUser = bookshelf.model 'AuthUser'
    AuthUser::apiKey = () -> @hasOne 'Tastypie.ApiKey', 'user_id'

  unless bookshelf.collection('Tastypie.ApiKeys')?
    bookshelf.collection 'Tastypie.ApiKeys',
      model: bookshelf.model 'Tastypie.ApiKey'

  Model: bookshelf.model 'Tastypie.ApiKey'
  Collection: bookshelf.collection 'Tastypie.ApiKeys'
