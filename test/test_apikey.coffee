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

describe 'Tastypie.ApiKey', () ->
  describe '#generateKey function', () ->
    it 'should return api key like implementation in python', () ->
      ApiKey = bookshelf.model 'Tastypie.ApiKey'

      sinon.stub(uuid, 'v4').returns Buffer.from([0x82, 0x90, 0xb7, 0x27, 0xdf, 0x94, 0x40, 0x04, 0x87, 0x31, 0xca, 0xb7, 0x67, 0x0d, 0xaa, 0x48])
      key = ApiKey.generateKey()
      uuid.v4.restore()

      assert.equal key, '8b20c89151686da21fcbaeeb078949970837baf9'
      return
    return
  return
return
