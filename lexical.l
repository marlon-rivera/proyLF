/** Seccion de definiciones **/
%{
#include "syntactical.tab.h"

%}

/** Seccion de reglas **/

numero [0-9]+
campo [a-z]+_[A-Za-z]+
tabla [A-Z]+
valor \"([^"]*)\"

%%

\n					{return ENDLINE;}
[Aa]greg(ar|a|ue)			{return INSERT;}
[Ii]nsert(ar|a|e)			{return INSERT;}
[Aa]ñad(ir|a|e)				{return INSERT;}
[Rr]egistr(ar|a|e)			{return INSERT;}
[Ii]ntrodu(cir|zca|ce)			{return INSERT;}
[Ss]eleccion(ar|a|e)			{return SELECT;}
[Rr]ecuper(ar|e|a)			{return SELECT;}
[Oo]bten(er|ga)*			{return SELECT;}
[Cc]onsult(ar|a|e)			{return SELECT;}
[Ee]le(gir|ja|ge)			{return SELECT;}
[Aa]ctuali(zar|za|ce)			{return UPDATE;}
[Mm]odifi(car|que|ca)			{return SET;}
[Cc]ambi(ar|a|e)			{return SET;}
[Ee]dit(ar|e|a)				{return SET;}
[Rr]en(ovar|ueve|ueva)			{return SET;}
[Ee]limin(ar|a|e)			{return DELETE;}
[Bb]orr(ar|a|e)				{return DELETE;}
[Qq]uit(ar|a|e)				{return DELETE;}
[Dd]esde				{return FROM;}
[Dd]e					{return FROM;}
[Ee]n					{return INTO;}
([Ee]l|[Ll](o|os|as|a))			{return THE;}
[Rr]egistros				{return ROWS;}
[Tt]enga[n]*				{return HAVE;}
[Qq]ue					{return THAT;}
[Cc]on					{return WITH;}
[Dd]onde				{return WHERE;}
[Pp]or					{return BY;}
[Uu]n(ir|e|a)				{return JOIN;}
[Aa]scendente[mente]*			{return ASC;}
[Dd]escendente[mente]*			{return DESC;}
[Dd]istinto				{return DISTINCT;}
[Dd]iferente[s]*			{return DISTINCT;}
[Tt]odos				{return ALL;}
[Ss]ea[ \t]+mayor			{return GREATER;}
[Ss]ea[ \t]+mayor[ \t]+o[ \t]igual	{return GREATEREQUAL;}
[Ss]ea[ \t]+igual			{return EQUAL;}
[Ss]ea[ \t]+menor			{return LESS;}
[Ss]ea[ \t]+menor[ \t]+o[ \t]igual	{return LESSEQUAL;}
[Ss]ea[ \t]+diferente			{return DIFERENT;}
[Yy]					{return AND;}
[Oo]					{return OR;}
[Aa]					{return TO;}
[Aa]grup(ar|e|a)[ \t]+por		{return GROUP_BY;}
[Oo]rden(ar|e|a)[ \t]+por		{return ORDER_BY;}
{numero}				{yylval.num = atoi(yytext); return NUMBER;}
{campo}					{yylval.str = strdup(yytext); return FIELD;}
{tabla}					{yylval.str = strdup(yytext); return TABLE;}
{valor}					{yylval.str = strdup(yytext); return VALUE;}
[ \t]+					{/** Ignorar espacios **/}
.					{printf("Error lexico, categoria no reconocida: %s.\n", yytext);}

%%

/** Seccion de codigo de usuario **/

int yywrap(){
	return 1;
}
