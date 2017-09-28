knex = require('knex')
  client: 'sqlite3'
  connection:
    filename: ':memory:'
  useNullAsDefault: yes

bookshelf = require('bookshelf') knex
sinon = require 'sinon'
uuid = require 'uuid'

require('../src') bookshelf

assert = require('chai').assert

ApiKey = bookshelf.model 'Tastypie.ApiKey'
AuthUser = bookshelf.model 'Django.Auth.User'

before () ->
  bookshelf.knex.migrate.latest directory: 'node_modules/bookshelf-django/migrations/', tableName: 'knex_migrations_django'
  .then () -> bookshelf.knex.migrate.latest directory: 'src/migrations/', tableName: 'knex_migrations_tastypie'

after () ->
  bookshelf.knex.migrate.rollback directory: 'src/migrations/', tableName: 'knex_migrations_tastypie'
  .then () -> bookshelf.knex.migrate.rollback directory: 'node_modules/bookshelf-django/migrations/', tableName: 'knex_migrations_django'

describe 'Tastypie.ApiKey', () ->
  before () -> knex.seed.run directory: 'test/seeds/'

  after () ->
    knex.table('auth_user').del()
    .then () -> knex.table('tastypie_apikey').del()

  describe '#generateKey', () ->
    it 'should return api key like implementation in python', () ->
      sinon.stub(uuid, 'v4').returns Buffer.from([0x82, 0x90, 0xb7, 0x27, 0xdf, 0x94, 0x40, 0x04, 0x87, 0x31, 0xca, 0xb7, 0x67, 0x0d, 0xaa, 0x48])
      key = ApiKey.generateKey()
      uuid.v4.restore()

      assert.equal key, '8b20c89151686da21fcbaeeb078949970837baf9'

  describe '#user', () ->
    it 'should be a reference to Django.Auth.User', () ->
      ApiKey.forge id: 1
      .fetch()
      .then (api_key) ->
        assert.instanceOf api_key.user(), AuthUser
        assert.instanceOf api_key.related('user'), AuthUser

  describe '#toString', () ->
    it 'should return string representation of apiKey', () ->
      ApiKey.forge id: 1
      .fetch withRelated: ['user']
      .then (api_key) ->
        assert.isString api_key.toString()
        assert.equal api_key.toString(), 'qaz123 for user'

describe 'Django.Auth.User', () ->
  before () -> knex.seed.run directory: 'test/seeds/'

  after () ->
    knex.table('auth_user').del()
    .then () -> knex.table('tastypie_apikey').del()

  describe '#apiKey', () ->
    it 'should be a reference to Tastypie.ApiKey', () ->
      AuthUser.forge id: 1
      .fetch()
      .then (user) ->
        assert.instanceOf user.apiKey(), ApiKey
        assert.instanceOf user.related('apiKey'), ApiKey

  describe '#addApiKey', () ->
    it 'should add Tastypie.ApiKey for user', () ->
      AuthUser.forge id: 2
      .fetch()
      .then (user) ->
        assert.isTrue user.related('apiKey').isNew()
        user.addApiKey()
      .then (user) ->
        assert.isFalse user.related('apiKey').isNew()
        assert.equal user.related('apiKey').get('user_id'), 2

  it 'should create apiKey for new user', () ->
    AuthUser.forge
      username: 'newuser'
      first_name: ''
      last_name: ''
      email: ''
      password: ''
      is_staff: no
      is_active: yes
      is_superuser: no
      date_joined: new Date()
    .save()
    .then (user) ->
      assert.isFalse user.related('apiKey').isNew()
