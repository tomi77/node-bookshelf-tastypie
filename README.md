# bookshelf-tastypie

Django Tastypie models for Bookshelf

[![Code Climate](https://codeclimate.com/github/tomi77/node-bookshelf-tastypie/badges/gpa.svg)](https://codeclimate.com/github/tomi77/node-bookshelf-tastypie)
[![dependencies Status](https://david-dm.org/tomi77/node-bookshelf-tastypie/status.svg)](https://david-dm.org/tomi77/node-bookshelf-tastypie)
[![devDependencies Status](https://david-dm.org/tomi77/node-bookshelf-tastypie/dev-status.svg)](https://david-dm.org/tomi77/node-bookshelf-tastypie?type=dev)

## Installation

~~~bash
npm install bookshelf-tastypie --save
~~~

## Usage

Load models to ``registry``

~~~js
require('bookshelf-tastypie')(bookshelf);
~~~

or load model/collection

~~~js
var TastypieApiKey = require('bookshelf-tastypie')(bookshelf).TastypieApiKey;
~~~

## Available models / collections

``TastypieApiKey`` / ``TastypieApiKeys`` - Tastypie ApiKey

## TODO

* tests
* create ApiKey when Django user is created
