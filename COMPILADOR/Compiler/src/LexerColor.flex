import compilerTools.TextColor;
import java.awt.Color;

%%
%class LexerColor
%type TextColor
%char
%{
    private TextColor textColor(long start, int size, Color color){
        return new TextColor((int) start, size, color);
    }
%}
/* Variables básicas de comentarios y espacios */
TerminadorDeLinea = \r|\n|\r\n
EntradaDeCaracter = [^\r\n]
EspacioEnBlanco = {TerminadorDeLinea} | [ \t\f]
ComentarioTradicional = "/*" [^*] ~"*/" | "/*" "*"+ "/"
FinDeLineaComentario = "//" {EntradaDeCaracter}* {TerminadorDeLinea}?
ContenidoComentario = ( [^*] | \*+ [^/*] )*
ComentarioDeDocumentacion = "/**" {ContenidoComentario} "*"+ "/"

/* Comentario */
Comentario = {ComentarioTradicional} | {FinDeLineaComentario} | {ComentarioDeDocumentacion}

/* Identificador */
Letra = [A-Za-zÑñ_ÁÉÍÓÚáéíóúÜü]
Digito = [0-9]
Identificador = {Letra}({Letra}|{Digito})*

/* Número */
Numero = 0 | [1-9][0-9]*
%%

/* Comentarios o espacios en blanco */
{Comentario} { return textColor(yychar, yylength(), new Color(146, 146, 146)); }
{EspacioEnBlanco} { /*Ignorar*/ }


/* Número */
[+|-]?{Numero} { return textColor(yychar, yylength(), new Color(216, 52, 15));}
[+|-]?{Numero}\.{Numero} { return textColor(yychar, yylength(), new Color(216, 52, 15));}

/*DECLARACION Y DEFINICION*/
const { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
var { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
package { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
import { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
type { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
func { return textColor(yychar, yylength(), new Color(142, 9, 166)); }



/*String*/
\"([^\"\\]|\\.)*\" { return textColor(yychar, yylength(), new Color(19, 158, 9));}

/* Tipos de dato */
int |
float32 |
float64 |
complex64 |
complex128 |
rune |
byte |
uint8 |
uint16 |
uint32 |
uint64 |
uintptr |
uint |
string |
bool { return textColor(yychar, yylength(), new Color(0, 2, 146)); }

/* Operadores de agrupacion */
"(" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
")" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
"{" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
"}" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
"[" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
"]" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }

/* Signos de puntuacion */
"," { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
";" { return textColor(yychar, yylength(), new Color(142, 9, 166)); }
"." { return textColor(yychar, yylength(), new Color(142, 9, 166)); }

/*Operador de asignacion */
"=" { /*Ignorar*/ }
":=" { /*Ignorar*/ }

/*Operador de comparacion */
"==" { /*Ignorar*/ }
"!=" { /*Ignorar*/ }
"<" { /*Ignorar*/ }
"<=" { /*Ignorar*/ }
">" { /*Ignorar*/ }
">=" { /*Ignorar*/ }

/*PALABRAS RESERVADAS*/
/*DE CONTROL */
if { return textColor(yychar, yylength(), new Color(12, 158, 202)); }
else { return textColor(yychar, yylength(), new Color(12, 158, 202)); }
switch { return textColor(yychar, yylength(), new Color(12, 158, 202)); }
break { return textColor(yychar, yylength(), new Color(12, 158, 202)); }
case { return textColor(yychar, yylength(), new Color(12, 158, 202)); }
/*DE CICLO */
for { return textColor(yychar, yylength(), new Color(12, 158, 202)); }
while { return textColor(yychar, yylength(), new Color(12, 158, 202)); }

/*RETORNO*/
return { return textColor(yychar, yylength(), new Color(12, 158, 202)); }

/*OPERADORES */
"+" { return textColor(yychar, yylength(), new Color(117, 3, 232)); }
"-" { return textColor(yychar, yylength(), new Color(117, 3, 232)); }
"/" { return textColor(yychar, yylength(), new Color(117, 3, 232)); }
"%" { return textColor(yychar, yylength(), new Color(117, 3, 232)); }


/*Identificador */
{Identificador} { /* Ignorar */ }

. { /* Ignorar */ }