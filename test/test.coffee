vows = require 'vows'
assert = require 'assert'
strgen = require '../'

vows
	.describe('StrGen')
	.addBatch
		"when setting the alphabet to":
			"all printable ascii characters":
				topic: () ->
					strgen.setAlphabet "ascii"
					strgen
				
				"the alphabet is of length 222": (topic) ->
					assert.ok topic.alphabet.length == 222
				
		"when setting the length to": 
			"1":
				topic: () ->
					strgen
					
				"an error is thrown": (topic) ->
					assert.throws () -> topic.setLength 1
			
			"64":
				topic: () ->
					strgen.setLength 64
					strgen.generate()
				
				"we get a string of length 64": (topic) ->
					assert.equal topic.length,64
		
.exportTo(module)
