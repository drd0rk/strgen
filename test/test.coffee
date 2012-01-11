vows = require 'vows'
assert = require 'assert'
strgen = require '../'

vows
	.describe('StrGen')
	.addBatch
		"when generating without configuring":
			topic: () ->
				strgen.generate()
				
			"we get a string of length 64": (topic) ->
				assert.equal topic.length,64
				
		"when setting the alphabet to":
			"all printable ascii characters":
				topic: () ->
					strgen.setAlphabet "ascii"
					strgen
				
				"the alphabet is of length 222": (topic) ->
					assert.ok topic.alphabet.length == 222
				
		"when setting the length to": 
			"0":
				topic: () ->
					strgen
					
				"an error is thrown": (topic) ->
					assert.throws () -> topic.setLength 0
			
			"1":
				topic: () ->
					strgen.setLength 1
					strgen.generate()
				
				"we get a string of length 1": (topic) ->
					assert.equal topic.length,1
			
			"76":
				topic: () ->
					strgen.setLength 76
					strgen.generate()
				
				"we get a string of length 76": (topic) ->
					assert.equal topic.length,76
		
.exportTo(module)
