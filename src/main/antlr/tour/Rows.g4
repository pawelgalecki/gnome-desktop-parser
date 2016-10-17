grammar Rows;



file : (row NL)+;
row:STUFF+;

TAB : '\t' -> skip;
NL: '\r'?'\n';
STUFF: ~[\t\r\n]+;