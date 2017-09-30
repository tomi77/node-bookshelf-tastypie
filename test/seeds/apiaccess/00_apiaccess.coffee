exports.seed = (knex, Promise) ->
  knex('tastypie_apiaccess').del()
  .then () ->
    knex('tastypie_apiaccess').insert [
      id: 1
      identifier: 'qaz'
      request_method: 'GET'
      accessed: 123
    ]
