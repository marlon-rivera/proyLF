/** Seccion de definiciones **/
%{
#include <stdio.h>
extern int yylex(void);
extern char *yytext;
extern FILE *yyin, *yyout;
void yyerror(char *s);
int yylex();
FILE *input_file;
FILE *output_file;
%}
%union {
    char* str;
    int num;
}

%token <str> TABLE VALUE FIELD
%token <num> NUMBER
%token ENDLINE INSERT SELECT UPDATE SET DELETE FROM WHERE JOIN ASC DESC DISTINCT ALL GREATER GREATEREQUAL LESS LESSEQUAL 
%token DIFERENT AND OR GROUP_BY ORDER_BY INTO EQUAL THE ROWS THAT HAVE TO WITH BY

/** Seccion de reglas **/
%%

input:		line
	|	input line

line:		
	|	query
	|	query ENDLINE
	
query:		select
	|	delete
	|	insert
	|	update
	|	join
	|	order_by
	
select:		select_type ROWS FROM TABLE {fprintf(output_file, "SELECT * FROM %s;\n", $4);}
	|	select_type FIELD FROM TABLE {fprintf(output_file, "SELECT %s FROM %s;\n", $2, $4);}
	|	select_type ROWS THAT HAVE FIELD DISTINCT FROM TABLE {fprintf(output_file, "SELECT DISTINCT %s FROM %s;\n", $5, $8);}
	|	select_type TABLE WHERE THE FIELD EQUAL TO VALUE {fprintf(output_file, "SELECT * FROM %s WHERE %s = %s;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD EQUAL THAT NUMBER {fprintf(output_file, "SELECT * FROM %s WHERE %s = %i;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD EQUAL TO NUMBER {fprintf(output_file, "SELECT * FROM %s WHERE %s = %i;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD EQUAL THAT VALUE {fprintf(output_file, "SELECT * FROM %s WHERE %s = %s;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD GREATEREQUAL TO NUMBER {fprintf(output_file, "SELECT * FROM %s WHERE %s >= %i;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD LESSEQUAL TO NUMBER {fprintf(output_file, "SELECT * FROM %s WHERE %s <= %i;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD LESS THAT NUMBER {fprintf(output_file, "SELECT * FROM %s WHERE %s < %i;\n", $2, $5, $8);}
	|	select_type TABLE WHERE THE FIELD GREATER THAT NUMBER {fprintf(output_file, "SELECT * FROM %s WHERE %s > %i\n", $2, $5, $8);}
	|	select_type FIELD AND THE FIELD FROM TABLE {fprintf(output_file, "SELECT %s, %s FROM %s;\n", $2, $5, $7);}

select_type:	SELECT ALL THE
	|	SELECT THE

delete:		DELETE ALL THE ROWS FROM TABLE {fprintf(output_file, "DELETE FROM %s;\n", $6);}
	|	DELETE THE ROWS FROM TABLE WHERE THE FIELD EQUAL TO VALUE {fprintf(output_file, "DELETE FROM %s WHERE %s = %s;\n", $5, $8, $11);}

insert:		INSERT INTO TABLE THE FIELD VALUE WITH FIELD VALUE WITH FIELD NUMBER WITH FIELD VALUE AND FIELD VALUE {fprintf(output_file, "INSERT INTO %s(%s, %s, %s, %s, %s) VALUES(%s, %s, %i, %s, %s);\n", $3, $5, $8, $11, $14, $17, $6, $9, $12, $15, $18);}
	|	INSERT INTO TABLE THE FIELD VALUE {fprintf(output_file, "INSERT INTO %s(%s) VALUES (%s);\n", $3, $5, $6);}

update:		UPDATE TABLE SET THE FIELD TO VALUE WHERE THE FIELD EQUAL TO NUMBER {fprintf(output_file, "UPDATE %s SET %s = %s WHERE %s = %i;\n", $2, $5, $7, $10, $13);}

join:		JOIN TABLE WITH TABLE BY FIELD {fprintf(output_file, "SELECT * FROM %s INNER JOIN %s WHERE %s.%s = %s.%s;\n", $2, $4, $2, $6, $4, $6);}

order_by:	ORDER_BY FIELD ASC THE TABLE {fprintf(output_file, "SELECT * FROM %s ORDER BY %s ASC;\n", $5, $2);}
	|	ORDER_BY FIELD DESC THE TABLE {fprintf(output_file, "SELECT * FROM %s ORDER BY %s DESC;\n", $5, $2);}

%%
/** Seccion de codigo de usuario **/
void yyerror(char *s){
	printf("Error sintactico: %s\n", s);
}

int main(int argc, char **argv){

    if (argc != 3) {
	fprintf(stderr, "Usage: %s input_file output_file\n", argv[0]);
	return 1;
    }

    input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    output_file = fopen(argv[2], "w");
    if (!output_file) {
        perror("Error opening output file");
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yyparse();

    fclose(input_file);
    fclose(output_file);
    return 0;
}
