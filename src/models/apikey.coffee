module.exports = (bookshelf) ->
  bookshelf.plugin 'registry'

  unless bookshelf.model('Tastypie.ApiKey')?
    require('bookshelf-django/models/auth_user') bookshelf

    bookshelf.model 'Tastypie.ApiKey',
      tableName: 'tastypie_apikey'

      user: () -> @belongsTo 'AuthUser'

      toString: () -> "#{ @get 'key' } for #{ @related 'user' }"
    ,
      generate_key: () ->
        uuid = require 'uuid'
        crypto = require 'crypto'
        crypto.createHmac('sha1', uuid.v4()).digest('hex')


    # Add `apiKey` relation to `AuthUser` model
    bookshelf.model('AuthUser')::apiKey = () -> @hasOne 'Tastypie.ApiKey', 'user_id'

  unless bookshelf.collection('Tastypie.ApiKeys')?
    bookshelf.collection 'Tastypie.ApiKeys',
      model: bookshelf.model 'Tastypie.ApiKey'

  Model: bookshelf.model 'Tastypie.ApiKey'
  Collection: bookshelf.collection 'Tastypie.ApiKeys'
