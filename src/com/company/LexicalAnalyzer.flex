package com.company;

%%

%class LexicalAnalyzer
%public
%unicode
%line
%column
%function nextToken
%type Symbol


%{
    public int ICV;
    public double RCV;
    public static class Symbol{
        public int tokenType;
        public String text;
        public double valueD;
        public int valueI;
        public static int LET = 0;
        public static int VOID = 1;
        public static int INT = 2;
        public static int REAL = 3;
        public static int BOOL = 4;
        public static int STRING = 5;
        public static int STATIC = 6;
        public static int CLASS = 7;
        public static int FOR = 8;
        public static int ROF = 9;
        public static int LOOP = 10;
        public static int POOL = -1;
        public static int WHILE = 11;
        public static int BREAK = 12;
        public static int CONTINUE = 13;
        public static int IF = 14;
        public static int FI = 15;
        public static int ELSE = 16;
        public static int THEN = 17;
        public static int NEW = 18;
        public static int ARRAY = 19;
        public static int RETURN = 20;
        public static int INSTRING = 21;
        public static int ININT = 22;
        public static int PRINT = 23;
        public static int LEN = 24;
        public static int ADD = 25;
	    public static int MINUS = 26;
        public static int MULT = 27;
        public static int DIV = 28;
	    public static int ADDASSIGN = 29;
        public static int SUBASSIGN = 30;
        public static int MULTASSIGN = 31;
	    public static int DIVASSIGN = 32;
	    public static int INCREASE = 33;
	    public static int DECREASE = 34;
        public static int LESS = 35;
        public static int LESSEQUAL = 36;
        public static int GREATER = 37;
        public static int GREATEREQUAL = 38;
        public static int EQUAL = 39;
        public static int NOTEQUAL = 40;
	    public static int ASSIGN = 41;
        public static int MOD = 42;
        public static int LOGICAND = 43;
        public static int LOGICOR = 44;
        public static int BITWISEAND = 45;
	    public static int BITWISEOR = 46;
        //string literal
        public static int XOR = 47;
	    public static int NOT = 48;
        public static int DOT = 49;
        public static int COMMA = 50;
        public static int SEMICOLON = 51;
        public static int OPENBRACE = 52;
	    public static int CLOSEBRACE = 53;
        public static int OPENPAREN = 54;
	    public static int CLOSEPAREN = 55;
        public static int OPENCURLY = 56;
	    public static int CLOSECURLY = 57;
        public static int ID = 58;
        public static int INTCONST = 59;
        public static int REALCONST = 60;
        public static int STRINGCONST = 61;
        public static int SPECIAL_CHARACTER = 62;
        public static int COMMENT = 63;
        public static int WHITESPACE = 64;
        public static int UNDEFINED = 65;
        public static int TAB = 66;
        public static int ENTER = 67;

        public Symbol(int tokenType, String text){
            this.tokenType = tokenType;
            this.text = text;
        }
        public Symbol(int tokenType, double valueD){
            this.tokenType = tokenType;
            this.valueD = valueD;
        }
        public Symbol(int tokenType, int valueI){
            this.tokenType = tokenType;
            this.valueI = valueI;
        }
    }
    public Symbol symbol(int tokenType){
      System.out.println(yytext());
      return new Symbol(tokenType, yytext());
  }
%}


LineTerminator = \r|\n|\r\n
SimpleCharacter = [^\r\n]
WhiteSpace = [ ]
Tab = \t

Digit = [0-9]
Alphabet = [a-zA-Z]
hexDigit = [0-9a-fA-F]
HexadecimalInteger = 0[xX]{hexDigit}+
DecimalInteger = [0-9]+

ScientificNotation = ({DecimalInteger}|{RealNumber})[eE][\+\-]?{DecimalInteger}
RealNumber = {Digit}+\.{Digit}*

Identifier = {Alphabet}(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?(_|{Alphabet}|{Digit})?

InlineComment = \/\/[^\n\r]+{LineTerminator}
MultilineComment = \/\*([^\/\*][^\*]*\*+)?\*\/
Comment = {InlineComment} | {MultilineComment}

IntegerLiteral = {DecimalInteger} | {HexadecimalInteger}


%state STRING

%%

<YYINITIAL> {

    // Reserved keywords
    "let"                { return symbol(Symbol.LET); }
    "void"               { return symbol(Symbol.VOID); }
    "int"                { return symbol(Symbol.INT); }
    "real"               { return symbol(Symbol.REAL); }
    "bool"               { return symbol(Symbol.BOOL); }
    "string"             { return symbol(Symbol.STRING); }
    "static"             { return symbol(Symbol.STATIC); }
    "class"              { return symbol(Symbol.CLASS); }
    "for"                { return symbol(Symbol.FOR); }
    "rof"                { return symbol(Symbol.ROF); }
    "loop"               { return symbol(Symbol.LOOP); }
    "pool"               { return symbol(Symbol.POOL); }
    "while"              { return symbol(Symbol.WHILE); }
    "break"              { return symbol(Symbol.BREAK); }
    "continue"           { return symbol(Symbol.CONTINUE); }
    "if"                 { return symbol(Symbol.IF); }
    "fi"                 { return symbol(Symbol.FI); }
    "else"               { return symbol(Symbol.ELSE); }
    "then"               { return symbol(Symbol.THEN); }
    "new"                { return symbol(Symbol.NEW); }
    "Array"              { return symbol(Symbol.ARRAY); }
    "return"             { return symbol(Symbol.RETURN); }
    "in_string"          { return symbol(Symbol.INSTRING); }
    "in_int"             { return symbol(Symbol.ININT); }
    "print"              { return symbol(Symbol.PRINT); }
    "len"                { return symbol(Symbol.LEN); }

    "+"					 { return symbol(Symbol.ADD); }
	"-"					 { return symbol(Symbol.MINUS); }
    "*"					 { return symbol(Symbol.MULT); }
    "/"					 { return symbol(Symbol.DIV); }
	"+="				 { return symbol(Symbol.ADDASSIGN); }
    "-="				 { return symbol(Symbol.SUBASSIGN); }
    "*="				 { return symbol(Symbol.MULTASSIGN); }
	"/="				 { return symbol(Symbol.DIVASSIGN); }
	"++"				 { return symbol(Symbol.INCREASE); }
	"--"				 { return symbol(Symbol.DECREASE); }
    "<"					 { return symbol(Symbol.LESS); }
    "<="				 { return symbol(Symbol.LESSEQUAL); }
    ">"					 { return symbol(Symbol.GREATER); }
    ">="				 { return symbol(Symbol.GREATEREQUAL); }
    "=="				 { return symbol(Symbol.EQUAL); }
    "!="				 { return symbol(Symbol.NOTEQUAL); }
	"="					 { return symbol(Symbol.ASSIGN); }
    "%"					 { return symbol(Symbol.MOD); }
    "&&"				 { return symbol(Symbol.LOGICAND); }
    "||"				 { return symbol(Symbol.LOGICOR); }
    "&"					 { return symbol(Symbol.BITWISEAND); }
	"|"					 { return symbol(Symbol.BITWISEOR); }
    "^"					 { return symbol(Symbol.XOR); }
	"!" 				 { return symbol(Symbol.NOT); }
    "."					 { return symbol(Symbol.DOT); }
    ","					 { return symbol(Symbol.COMMA); }
    ";"					 { return symbol(Symbol.SEMICOLON); }
    "["					 { return symbol(Symbol.OPENBRACE); }
	"]"					 { return symbol(Symbol.CLOSEBRACE); }
    "("					 { return symbol(Symbol.OPENPAREN); }
	")"					 { return symbol(Symbol.CLOSEPAREN); }
    "{"					 { return symbol(Symbol.OPENCURLY); }
	"}"					 { return symbol(Symbol.CLOSECURLY); }

    {Identifier} { return symbol(Symbol.ID); }

    {IntegerLiteral} { return symbol(Symbol.INTCONST); }

    {RealNumber} { return symbol(Symbol.REALCONST); }

    {ScientificNotation} { return symbol(Symbol.REALCONST); }

    {Comment} { return symbol(Symbol.COMMENT);}

    {Tab}            { return symbol(Symbol.TAB); }

	{WhiteSpace}     { return symbol(Symbol.WHITESPACE); }

    {LineTerminator}    {return new Symbol( Symbol.ENTER,  "\n"); }

	"\""                      { yybegin( STRING ); return symbol(Symbol.STRINGCONST); }

    [^] {return symbol(Symbol.UNDEFINED);}
}


<STRING> {

	"\""        { yybegin( YYINITIAL ); return new Symbol(Symbol.STRINGCONST, yytext()); }
	"\\n"       { return new Symbol( Symbol.SPECIAL_CHARACTER, yytext()); }
	"\\t"       { return new Symbol( Symbol.SPECIAL_CHARACTER, yytext()); }
	"\\r"       { return new Symbol( Symbol.SPECIAL_CHARACTER, yytext()); }
	"\\\\"      { return new Symbol( Symbol.SPECIAL_CHARACTER, yytext()); }
	"\\'"       { return new Symbol( Symbol.SPECIAL_CHARACTER, yytext()); }
	"\\\""      { return new Symbol( Symbol.SPECIAL_CHARACTER, yytext()); }
	.           { return new Symbol( Symbol.STRINGCONST, yytext()); }
}

