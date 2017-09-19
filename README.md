# bookshelf-tastypie

Django Tastypie models for Bookshelf

[![Code Climate](https://codeclimate.com/github/tomi77/node-bookshelf-tastypie/badges/gpa.svg)](https://codeclimate.com/github/tomi77/node-bookshelf-tastypie)
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
* [TODO](#todo)

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

### Tastypie.ApiKeys

ApiKey collection

### Tastypie.ApiAccess

### Tastypie.ApiAccesses

## TODO

* tests
* create ApiKey when Django user is created
