/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SYNTACTICAL_TAB_H_INCLUDED
# define YY_YY_SYNTACTICAL_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TABLE = 258,                   /* TABLE  */
    VALUE = 259,                   /* VALUE  */
    FIELD = 260,                   /* FIELD  */
    NUMBER = 261,                  /* NUMBER  */
    ENDLINE = 262,                 /* ENDLINE  */
    INSERT = 263,                  /* INSERT  */
    SELECT = 264,                  /* SELECT  */
    UPDATE = 265,                  /* UPDATE  */
    SET = 266,                     /* SET  */
    DELETE = 267,                  /* DELETE  */
    FROM = 268,                    /* FROM  */
    WHERE = 269,                   /* WHERE  */
    JOIN = 270,                    /* JOIN  */
    ASC = 271,                     /* ASC  */
    DESC = 272,                    /* DESC  */
    DISTINCT = 273,                /* DISTINCT  */
    ALL = 274,                     /* ALL  */
    GREATER = 275,                 /* GREATER  */
    GREATEREQUAL = 276,            /* GREATEREQUAL  */
    LESS = 277,                    /* LESS  */
    LESSEQUAL = 278,               /* LESSEQUAL  */
    DIFERENT = 279,                /* DIFERENT  */
    AND = 280,                     /* AND  */
    OR = 281,                      /* OR  */
    GROUP_BY = 282,                /* GROUP_BY  */
    ORDER_BY = 283,                /* ORDER_BY  */
    INTO = 284,                    /* INTO  */
    EQUAL = 285,                   /* EQUAL  */
    THE = 286,                     /* THE  */
    ROWS = 287,                    /* ROWS  */
    THAT = 288,                    /* THAT  */
    HAVE = 289,                    /* HAVE  */
    TO = 290,                      /* TO  */
    WITH = 291,                    /* WITH  */
    BY = 292                       /* BY  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "syntactical.y"

    char* str;
    int num;

#line 106 "syntactical.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SYNTACTICAL_TAB_H_INCLUDED  */
