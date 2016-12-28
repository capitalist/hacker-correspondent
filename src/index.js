'use strict'

require('tachyons/css/tachyons.css')

require('./index.html')

var Elm = require('./Main.elm')
var mountNode = document.getElementById('main')

Elm.Main.embed(mountNode)
