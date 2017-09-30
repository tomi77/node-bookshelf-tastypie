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

ApiAccess = bookshelf.model 'Tastypie.ApiAccess'
AuthUser = bookshelf.model 'Django.Auth.User'

before () ->
  bookshelf.knex.migrate.latest directory: 'node_modules/bookshelf-django/migrations/', tableName: 'knex_migrations_django'
  .then () -> bookshelf.knex.migrate.latest directory: 'src/migrations/', tableName: 'knex_migrations_tastypie'

after () ->
  bookshelf.knex.migrate.rollback directory: 'src/migrations/', tableName: 'knex_migrations_tastypie'
  .then () -> bookshelf.knex.migrate.rollback directory: 'node_modules/bookshelf-django/migrations/', tableName: 'knex_migrations_django'

describe 'Tastypie.ApiAccess', () ->
  before () -> knex.seed.run directory: 'test/seeds/apiaccess/'

  after () ->
    knex.table('tastypie_apiaccess').del()

  describe '#toString', () ->
    it 'should return string representation', () ->
      ApiAccess.forge id: 1
      .fetch()
      .then (api_access) ->
        assert.isString api_access.toString()
        assert.equal api_access.toString(), 'qaz @ 123'
