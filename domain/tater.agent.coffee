annotate = require './services/annotate'

tater =

  parse: (dsl, delim, next) -> annotate dsl, delim, next


module.exports = tater
