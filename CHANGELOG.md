# Changelog

## master

* improve documentation
* create `Tastypie.ApiKey` for new `Django.Auth.User`

## 0.5.0

* fix compatibility with `bookshelf-django 0.2.0`
* add ``Tastypie.ApiKey#generate_key`` function
* add ``toString`` method to models
* fix schema (based on Python models)

## 0.4.0

* move ``bookshelf``, ``bookshelf-django`` and ``knex`` from `dependencies` to `peerDependencies`
* add ``knex`` migrations

### Breaking changes

* rename model/collection names in bookshelf registry (e.g. `TastypieApiKey` -> `Tastypie.ApiKey`)
* rename model/collection names in `index.js` (e.g. `TastypieApiKey` -> `ApiKey`)

## 0.3.0

* @deps update
* remove coffee-script dependency

## 0.2.1

* @deps update

## 0.2.0

* Add ``tastypie_apiaccess`` table

## 0.1.0

Initial version
