(function() {
  var StrGen, pgkinfo;

  pgkinfo = require("pkginfo")(module, "version");

  module.exports = StrGen = (function() {

    function StrGen() {}

    StrGen.strLength = 64;

    StrGen.chars = {
      "abc": "abcdefghijklmnopqrstuvwxyz",
      "ABC": "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      "digits": "0123456789",
      "special_email": "-_.",
      "special_other": "@|:;#~'`?}{][&%$§!><+*/()"
    };

    StrGen.alphabet = StrGen.chars.abc.concat(StrGen.chars.ABC.concat(StrGen.chars.digits.concat(StrGen.chars.special_email.concat(StrGen.chars.special_other))));

    StrGen.generate = function() {
      var i, randNum, resultStr, _ref;
      resultStr = "";
      for (i = 0, _ref = this.strLength - 1; 0 <= _ref ? i <= _ref : i >= _ref; 0 <= _ref ? i++ : i--) {
        randNum = Math.floor(Math.random() * this.alphabet.length);
        resultStr += this.alphabet[randNum];
      }
      return resultStr;
    };

    StrGen.setLength = function(len) {
      if (len < 2) {
        throw new Error("String length must be at least 2, " + len + " given");
      }
      return this.strLength = len;
    };

    StrGen.setAlphabet = function(alphabet) {
      var num;
      switch (alphabet) {
        case "ascii":
          return this.alphabet = (function() {
            var _results;
            _results = [];
            for (num = 33; num <= 255; num++) {
              if (num !== 127) _results.push(String.fromCharCode(num));
            }
            return _results;
          })();
        case "email":
          return this.alphabet = this.chars.abc.concat(this.chars.ABC.concat(this.chars.digits.concat(this.chars.special_email)));
        case "typical":
          return this.alphabet = this.chars.abc.concat(this.chars.ABC.concat(this.chars.digits.concat(this.chars.special_email.concat(this.chars.special_other))));
        default:
          return this.alphabet = alphabet;
      }
    };

    return StrGen;

  })();

}).call(this);
