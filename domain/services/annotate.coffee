tokenize = require('parsimony').tokenize
getLeadspace = require('parsimony').getLeadspace

annotate = (dsl, annotationDelim, next) ->

  annotationDelim ?= "#>>"
  parsingDelim     = new RegExp( annotationDelim + '(.+)\n' )
  
  tokenize dsl, parsingDelim, (tokens) ->

    tokens.shift() # remove first token 

    # the first and then every other token is an annotation
    # immediately following a token is a codeblock

    blocks = []

    for annotation, index in tokens by 2

      # the next token is code
      code = tokens[index + 1]

      blocks.push
      # block:
        annotation: annotation.trim()
        code: code.trim()
        leadspace: getLeadspace code

    next blocks

module.exports = annotate
