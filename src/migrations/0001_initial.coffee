exports.up = (knex, Promise) ->
  knex.schema
  .createTableIfNotExists 'tastypie_apikey', (table) ->
    table.increments().primary()
    table.integer('user_id').unique().notNullable().references('auth_user.id')
    table.string('key', 256).notNullable().defaultTo('')
    table.timestamp('created').notNullable().defaultTo(new Date())
    return
  .createTableIfNotExists 'tastypie_apiaccess', (table) ->
    table.increments().primary()
    table.string('identifier', 255).notNullable().defaultTo('')
    table.string('url', 255).notNullable().defaultTo('')
    table.string('request_method', 10).notNullable()
    table.integer('accessed').notNullable()
    return


exports.down = (knex, Promise) ->
  knex.schema
  .dropTableIfExists('tastypie_apiaccess')
  .dropTableIfExists('tastypie_apikey')
