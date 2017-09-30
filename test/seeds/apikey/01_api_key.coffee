exports.seed = (knex, Promise) ->
  knex('tastypie_apikey').del()
  .then () ->
    knex('tastypie_apikey').insert [
      id: 1
      user_id: 1
      key: 'qaz123'
    ]
