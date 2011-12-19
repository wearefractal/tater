#>> Setup

should = require 'should'
annotate = require '../annotate'

#>> Given some DSL code

code = 
  '''
  >> Given some dsl code
    foo = "foo"
  '''

#>> when it is tokenized

annotate code, '>>', (blocks) ->

#>> Then
  
  blocks[0].annotation.should.equal "Given some dsl code"
  blocks[0].code.should.equal 'foo = "foo"'
  blocks[0].leadspace.should.equal "  "
