grammar Desktop;

@header {
package desktop;
}

file : header version name+ comment+;



header: '[Desktop Entry]' NEWLINE;
name: 'Name' language? '=' STRING NEWLINE;
comment: 'Comment' language? '=' STRING NEWLINE;
language: '['LANGUAGE_SYMBOL']' ;
LANGUAGE_SYMBOL: [a-z][a-z][a-z]?('_'[A-Z][A-Z])?;
STRING: ValueChar+;
version:'Version=1.0' NEWLINE;


NEWLINE:'\n';     // return newlines to parser (is end-statement signal)

fragment
ValueChar : NameChar | [-–'()] | ' ';


fragment
NameChar
   : NameStartChar
   | '0'..'9'
   | '_'
   | '\u00B7'
   | '\u0300'..'\u036F'
   | '\u203F'..'\u2040'
   ;
fragment
NameStartChar
   : 'A'..'Z' | 'a'..'z'
   | '\u00C0'..'\u00D6'
   | '\u00D8'..'\u00F6'
   | '\u00F8'..'\u02FF'
   | '\u0370'..'\u037D'
   | '\u037F'..'\u1FFF'
   | '\u200C'..'\u200D'
   | '\u2070'..'\u218F'
   | '\u2C00'..'\u2FEF'
   | '\u3001'..'\uD7FF'
   | '\uF900'..'\uFDCF'
   | '\uFDF0'..'\uFFFD'
   ;
