module.exports = class StrGen

	# the length of the generated string
	@strLength = 64
	
	# available character sets
	@chars = 
		"abc": "abcdefghijklmnopqrstuvwxyz"
		"ABC": "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		"digits": "0123456789"
		"special_email": "-_."
		"special_other": "@|:;#~'`?}{][&%$§!><+*/()"
		
	@alphabet = @chars.abc.concat @chars.ABC.concat @chars.digits.concat @chars.special_email.concat @chars.special_other
	
	# generates the random string
	@generate: () ->
		resultStr = ""
		for i in [0..@strLength-1]
			randNum = Math.floor(Math.random() * @alphabet.length);
			resultStr += @alphabet[randNum];
		resultStr			
				
		
	# define the length of the generated string
	@setLength: (len) ->
		throw new Error "String length must be at least 2, "+len+" given" if len < 2
		@strLength = len
	
	# define the alphabet of the generated string
	@setAlphabet: (alphabet) ->
		switch alphabet
			when "ascii" then @alphabet = (String.fromCharCode(num) for num in [33..255] when num isnt 127)
			when "email" then @alphabet = @chars.abc.concat @chars.ABC.concat @chars.digits.concat @chars.special_email
			when "typical" then @alphabet = @chars.abc.concat @chars.ABC.concat @chars.digits.concat @chars.special_email.concat @chars.special_other
			else @alphabet = alphabet
		
		
