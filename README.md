# bookshelf-tastypie

Django Tastypie models for Bookshelf

[![Build Status](https://travis-ci.org/tomi77/node-bookshelf-tastypie.svg)](https://travis-ci.org/tomi77/node-bookshelf-tastypie)
[![Coverage Status](https://coveralls.io/repos/github/tomi77/node-bookshelf-tastypie/badge.svg?branch=master)](https://coveralls.io/github/tomi77/node-bookshelf-tastypie?branch=master)
[![Code Climate](https://codeclimate.com/github/tomi77/node-bookshelf-tastypie/badges/gpa.svg)](https://codeclimate.com/github/tomi77/node-bookshelf-tastypie)
[![dependencies Status](https://david-dm.org/tomi77/node-bookshelf-tastypie/status.svg)](https://david-dm.org/tomi77/node-bookshelf-tastypie)
[![devDependencies Status](https://david-dm.org/tomi77/node-bookshelf-tastypie/dev-status.svg)](https://david-dm.org/tomi77/node-bookshelf-tastypie?type=dev)
[![peerDependencies Status](https://david-dm.org/tomi77/node-bookshelf-tastypie/peer-status.svg)](https://david-dm.org/tomi77/node-bookshelf-tastypie?type=peer)
![Downloads](https://img.shields.io/npm/dt/bookshelf-tastypie.svg)

## Table of contents

* [Installation](#installation)
* [Usage](#usage)
* [Available models / collections](#available-models--collections)
  * [Tastypie.ApiKey](#tastypieapikey)
  * [Tastypie.ApiKeys](#tastypieapikeys)
  * [Tastypie.ApiAccess](#tastypieapiaccess)
  * [Tastypie.ApiAccesses](#tastypieapiaccesses)

## Installation

### NPM

~~~bash
npm install bookshelf-tastypie --save
~~~

### Yarn

~~~bash
yarn add bookshelf-tastypie
~~~

## Usage

Load models to ``registry``

~~~js
require('bookshelf-tastypie')(bookshelf);
~~~

or load model/collection

~~~js
let ApiKey = require('bookshelf-tastypie')(bookshelf).ApiKey;
~~~

## Available models / collections

### Tastypie.ApiKey

ApiKey model

#### `toString() -> string`

String representation of api key

#### `generateKey() -> string`

Static function to generate unique keys

~~~js
ApiKey = bookshelf.model('Tastypie.ApiKey')
new_key = ApiKey.generateKey()
~~~

### Tastypie.ApiKeys

ApiKey collection

### Tastypie.ApiAccess

#### `toString() -> string`

String representation od api access

### Tastypie.ApiAccesses
