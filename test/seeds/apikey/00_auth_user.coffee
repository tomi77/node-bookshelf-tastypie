exports.seed = (knex, Promise) ->
  knex('auth_user').del()
  .then () ->
    knex('auth_user').insert [
      id: 1
      username: 'user'
      first_name: ''
      last_name: ''
      email: ''
      password: ''
      is_staff: no
      is_active: yes
      is_superuser: no
      date_joined: new Date()
    ,
      id: 2
      username: 'user2'
      first_name: ''
      last_name: ''
      email: ''
      password: ''
      is_staff: no
      is_active: yes
      is_superuser: no
      date_joined: new Date()
    ]
