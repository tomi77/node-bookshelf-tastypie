module.exports = (bookshelf) ->
  bookshelf.plugin 'registry'

  unless bookshelf.model('Tastypie.ApiKey')?
    require('bookshelf-django/models/auth_user') bookshelf

    bookshelf.model 'Tastypie.ApiKey',
      tableName: 'tastypie_apikey'

      user: () -> @belongsTo 'Django.Auth.User', 'user_id'

      toString: () -> "#{ @get 'key' } for #{ @related 'user' }"
    ,
      generateKey: () ->
        uuid = require 'uuid'
        crypto = require 'crypto'
        crypto.createHmac('sha1', uuid.v4()).digest('hex')


    AuthUser = bookshelf.model 'Django.Auth.User'

    # Add `apiKey` relation to `Django.Auth.User` model
    AuthUser::apiKey = () -> @hasOne 'Tastypie.ApiKey', 'user_id'

    # Create apiKey, when user is created
    old_initialize = AuthUser::initialize
    AuthUser::initialize = () ->
      old_initialize.apply @, arguments

      @on 'created', @addApiKey
      return

    AuthUser::addApiKey = () ->
      ApiKey = bookshelf.model 'Tastypie.ApiKey'

      apiKey = @related('apiKey')
      apiKey.set user_id: @get('id'), key: ApiKey.generateKey()
      apiKey.save().then () => @


  unless bookshelf.collection('Tastypie.ApiKeys')?
    bookshelf.collection 'Tastypie.ApiKeys',
      model: bookshelf.model 'Tastypie.ApiKey'

  Model: bookshelf.model 'Tastypie.ApiKey'
  Collection: bookshelf.collection 'Tastypie.ApiKeys'
