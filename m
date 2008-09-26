From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH 7/9 V3] Introduce new DTS language.
Date: Fri, 26 Sep 2008 15:25:46 -0500
Message-ID: <1222460748-20127-8-git-send-email-jdl@jdl.com>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222460748-20127-7-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Introduce function defs and statements.
Added support for expressions.
Added if, for, assign and return statements.
Added support for BUILTIN functions.
Added support for /const/ definitions.
Added support for command line defines, eg: -D x=1
Unified /memreserve/ into declaration list.
Add lexical support for column source position information.
    Notably, this involved identifying all the newline
    characters to reset the column count.  Had to rewrite
    the C comment rules, and break \n out of the {WS} set.
Prevent lone +, -, and ? chars from being property names.
Add lexical source positions to all IR nodes.
Change error reporting to use IR source positions.

Passes test suite.

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Makefile     |    2 +-
 Makefile.dtc |   18 ++-
 dtc-lexer.l  |  271 ++++++++++++++++++----
 dtc-parser.y |  711 ++++++++++++++++++++++++++++++++++++++++++++++------------
 dtc.c        |    7 +-
 dtc.h        |    1 +
 ir.h         |    1 -
 ir_dump.c    |    9 -
 ir_emit.c    |   67 +++---
 ir_eval.c    |    2 -
 ir_scope.c   |    3 +-
 livetree.c   |   16 ++
 nv.c         |  108 +++++++++
 nv.h         |   34 +++
 srcpos.c     |   75 +++++--
 srcpos.h     |   10 +-
 treesource.c |    3 +
 17 files changed, 1068 insertions(+), 270 deletions(-)
 create mode 100644 nv.c
 create mode 100644 nv.h

diff --git a/Makefile b/Makefile
index 5ad0189..1ae5577 100644
--- a/Makefile
+++ b/Makefile
@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
 CPPFLAGS = -I libfdt
 CFLAGS = -Wall -g -Os -Wpointer-arith -Wcast-qual
 
-BISON = bison
+BISON = bison -v
 LEX = flex
 
 INSTALL = /usr/bin/install
diff --git a/Makefile.dtc b/Makefile.dtc
index 6ddf9ec..dd53276 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -3,7 +3,21 @@
 # This is not a complete Makefile of itself.  Instead, it is designed to
 # be easily embeddable into other systems of Makefiles.
 #
-DTC_SRCS = dtc.c flattree.c fstree.c data.c livetree.c treesource.c srcpos.c \
-	checks.c
+DTC_SRCS = \
+	checks.c \
+	data.c \
+	dtc.c \
+	flattree.c \
+	fstree.c \
+	ir.c \
+	ir_builtin.c \
+	ir_dump.c \
+	ir_emit.c \
+	ir_eval.c \
+	ir_scope.c \
+	livetree.c \
+	nv.c \
+	srcpos.c \
+	treesource.c
 DTC_GEN_SRCS = dtc-lexer.lex.c dtc-parser.tab.c
 DTC_OBJS = $(DTC_SRCS:%.c=%.o) $(DTC_GEN_SRCS:%.c=%.o)
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 6b862d2..d4efdef 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -18,19 +18,20 @@
  *                                                                   USA
  */
 
-%option noyywrap nounput noinput yylineno
+%option noyywrap nounput noinput yylineno stack
 
-%x INCLUDE
 %x BYTESTRING
 %x PROPNODENAME
+%x COMMENT
 %s V1
 
+NOTPROPNAMES	[+?-]
 PROPNODECHAR	[a-zA-Z0-9,._+*#?@-]
 PATHCHAR	({PROPNODECHAR}|[/])
 LABEL		[a-zA-Z_][a-zA-Z0-9_]*
+ID		\\[a-zA-Z_][a-zA-Z0-9_]*
 STRING		\"([^\\"]|\\.)*\"
-WS		[[:space:]]
-COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"
+WS		[[:blank:]]
 LINECOMMENT	"//".*\n
 
 %{
@@ -49,6 +50,22 @@ LINECOMMENT	"//".*\n
 
 static int dts_version = 1;
 
+/*
+ * Track column positions too.  Brute force.
+ */
+int yycolno = 1;
+
+#define SET_SRCPOS(yylloc)	do { \
+					yylloc.file = srcpos_file; \
+					yylloc.first_line = yylineno; \
+					yylloc.last_line = yylineno; \
+					yylloc.first_column = yycolno; \
+					yycolno += yyleng; \
+					yylloc.last_column = yycolno - 1; \
+					DPRINT("Set srcpos: %s\n", \
+						srcpos_string(&yylloc)); \
+				} while (0)
+
 #define BEGIN_DEFAULT()		DPRINT("<V1>\n"); \
 				BEGIN(V1); \
 
@@ -59,29 +76,27 @@ static int pop_input_file(void);
 %%
 <*>"/include/"{WS}*{STRING} {
 			char *name = strchr(yytext, '\"') + 1;
+			SET_SRCPOS(yylloc);
 			yytext[yyleng-1] = '\0';
 			push_input_file(name);
 		}
 
-<*><<EOF>>		{
+<*><<EOF>>	{
 			if (!pop_input_file()) {
 				yyterminate();
 			}
 		}
 
 <*>{STRING}	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("String: %s\n", yytext);
-			yylval.data = data_copy_escape_string(yytext+1,
-					yyleng-2);
-			yylloc.first_line = yylineno;
+			yytext[yyleng-1] = 0; /* remove close quote */
+			yylval.litstr = strdup(yytext + 1);
 			return DT_STRING;
 		}
 
 <*>"/dts-v1/"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("Keyword: /dts-v1/\n");
 			dts_version = 1;
 			BEGIN_DEFAULT();
@@ -89,41 +104,31 @@ static int pop_input_file(void);
 		}
 
 <*>"/memreserve/"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
 			return DT_MEMRESERVE;
 		}
 
 <*>{LABEL}:	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = strdup(yytext);
 			yylval.labelref[yyleng-1] = '\0';
 			return DT_LABEL;
 		}
 
-<V1>[0-9]+|0[xX][0-9a-fA-F]+      {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
-			yylval.literal = strdup(yytext);
-			DPRINT("Literal: '%s'\n", yylval.literal);
-			return DT_LITERAL;
-		}
-
-\&{LABEL}	{	/* label reference */
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+<*>\&{LABEL}	{
+			/* label reference */
+			SET_SRCPOS(yylloc);
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = strdup(yytext+1);
 			return DT_REF;
 		}
 
-"&{/"{PATHCHAR}+\}	{	/* new-style path reference */
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+<*>"&{/"{PATHCHAR}+\}	{
+			/* new-style path reference */
+			SET_SRCPOS(yylloc);
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
 			yylval.labelref = strdup(yytext+2);
@@ -131,44 +136,210 @@ static int pop_input_file(void);
 		}
 
 <BYTESTRING>[0-9a-fA-F]{2} {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			yylval.byte = strtol(yytext, NULL, 16);
 			DPRINT("Byte: %02x\n", (int)yylval.byte);
 			return DT_BYTE;
 		}
 
 <BYTESTRING>"]"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("/BYTESTRING\n");
 			BEGIN_DEFAULT();
 			return ']';
 		}
 
+<*>[0-9]+|0[xX][0-9a-fA-F]+      {
+			SET_SRCPOS(yylloc);
+			yylval.literal = strdup(yytext);
+			DPRINT("Literal: '%s'\n", yylval.literal);
+			return DT_LITERAL;
+		}
+
+<*>"for"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: for\n");
+			BEGIN_DEFAULT();
+			return DT_FOR;
+		}
+
+<*>"if"		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: if\n");
+			BEGIN_DEFAULT();
+			return DT_IF;
+		}
+
+<*>"void"		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: void\n");
+			return DT_VOID;
+		}
+
+<*>"in"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: in\n");
+			BEGIN_DEFAULT();
+			return DT_IN;
+		}
+
+<*>"else"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: else\n");
+			BEGIN_DEFAULT();
+			return DT_ELSE;
+		}
+
+<*>"return"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: return\n");
+			return DT_RETURN;
+		}
+
+<*>"/define/"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: define\n");
+			return DT_DEFINE;
+		}
+
+<*>"/const/"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: const\n");
+			return DT_CONST;
+}
+
+<*>"/incbin/"	{
+			SET_SRCPOS(yylloc);
+			DPRINT("Binary Include\n");
+			return DT_INCBIN;
+		}
+
+<*>{ID}		{
+			SET_SRCPOS(yylloc);
+			DPRINT("Id: %s\n", yytext);
+			yylval.id = strdup(yytext + 1); /* drop \ */
+			BEGIN_DEFAULT();
+			return DT_ID;
+		}
+
+<PROPNODENAME>{NOTPROPNAMES} {
+			/*
+			 * Lone +, - and ? chars shouldn't be
+			 * property names.
+			 */
+			SET_SRCPOS(yylloc);
+			BEGIN_DEFAULT();
+			return yytext[0];
+		}
+
+
 <PROPNODENAME>{PROPNODECHAR}+ {
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("PropNodeName: %s\n", yytext);
 			yylval.propnodename = strdup(yytext);
 			BEGIN_DEFAULT();
 			return DT_PROPNODENAME;
 		}
 
-"/incbin/"	{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
-			DPRINT("Binary Include\n");
-			return DT_INCBIN;
+
+<*>{WS}+	{
+			/* eat whitespace, but not newline */
+			SET_SRCPOS(yylloc);
+		}
+
+<*>"/*"		{
+			SET_SRCPOS(yylloc);
+			yy_push_state(COMMENT);
+		}
+
+<COMMENT>{
+[^*\n]*		{
+			/* munch */
+			SET_SRCPOS(yylloc);
+		}
+
+[^*\n]*\n	{
+			yycolno = 1;
+		}
+
+"*"+[^*/\n]*	{
+			/* munch */
+			SET_SRCPOS(yylloc);
+		}
+
+"*"+[^*/\n]*\n {
+			yycolno = 1;
+		}
+
+"*"+"/"		{
+			SET_SRCPOS(yylloc);
+			yy_pop_state();
+		}
+}
+
+
+<*>{LINECOMMENT}+ {
+			/* eat C++-style comments including newline */
+			yycolno = 1;
 		}
 
-<*>{WS}+	/* eat whitespace */
-<*>{COMMENT}+	/* eat C-style comments */
-<*>{LINECOMMENT}+ /* eat C++-style comments */
+<*>":="		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: <<\n");
+			return DT_ASSIGN;
+		}
+<*>"<<"		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: <<\n");
+			return DT_LSHIFT;
+		}
+<*>">>"		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: >>\n");
+			return DT_RSHIFT;
+		}
+<*>"<="		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: <=\n");
+			return DT_LE;
+		}
+<*>">="		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: >=\n");
+			return DT_GE;
+		}
+<*>"=="		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: ==\n");
+			return DT_EQ;
+		}
+<*>"!="		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: !=\n");
+			return DT_NE;
+		}
+<*>"&&"		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: &&\n");
+			return DT_AND;
+		}
+<*>"||"		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: ||\n");
+			return DT_OR;
+		}
+<*>".."		{
+			SET_SRCPOS(yylloc);
+			DPRINT("token: ..\n");
+			return DT_RANGE;
+		}
+
+<*>\n		{
+			yycolno = 1;
+		}
 
 <*>.		{
-			yylloc.file = srcpos_file;
-			yylloc.first_line = yylineno;
+			SET_SRCPOS(yylloc);
 			DPRINT("Char: %c (\\x%02x)\n", yytext[0],
 				(unsigned)yytext[0]);
 			if (yytext[0] == '[') {
@@ -176,7 +347,9 @@ static int pop_input_file(void);
 				BEGIN(BYTESTRING);
 			}
 			if ((yytext[0] == '{')
-			    || (yytext[0] == ';')) {
+			    || (yytext[0] == ';')
+			    || (yytext[0] == ':')
+			) {
 				DPRINT("<PROPNODENAME>\n");
 				BEGIN(PROPNODENAME);
 			}
@@ -194,6 +367,7 @@ struct incl_file {
 	struct dtc_file *file;
 	YY_BUFFER_STATE yy_prev_buf;
 	int yy_prev_lineno;
+	int yy_prev_colno;
 	struct incl_file *prev;
 };
 
@@ -235,6 +409,7 @@ static void push_input_file(const char *filename)
 	 */
 	incl_file->yy_prev_buf = YY_CURRENT_BUFFER;
 	incl_file->yy_prev_lineno = yylineno;
+	incl_file->yy_prev_lineno = yycolno;
 	incl_file->file = srcpos_file;
 	incl_file->prev = incl_file_stack;
 
@@ -245,6 +420,7 @@ static void push_input_file(const char *filename)
 	 */
 	srcpos_file = newfile;
 	yylineno = 1;
+	yycolno = 1;
 	yyin = newfile->file;
 	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
 }
@@ -272,6 +448,7 @@ static int pop_input_file(void)
 	yy_delete_buffer(YY_CURRENT_BUFFER);
 	yy_switch_to_buffer(incl_file->yy_prev_buf);
 	yylineno = incl_file->yy_prev_lineno;
+	yycolno = incl_file->yy_prev_colno;
 	srcpos_file = incl_file->file;
 	yyin = incl_file->file ? incl_file->file->file : NULL;
 
diff --git a/dtc-parser.y b/dtc-parser.y
index 3762181..f976623 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -25,309 +25,722 @@
 
 #include "dtc.h"
 #include "srcpos.h"
+#include "ir.h"
 
 extern int yylex(void);
+extern void yyerror(char const *s);
 
-extern struct boot_info *the_boot_info;
 extern int treesource_error;
 
-static unsigned long long eval_literal(const char *s, int base, int bits);
+#define YYERROR_VERBOSE
+
 %}
 
 %union {
+	struct ir *ir;
 	char *propnodename;
+	char *id;
+	char *litstr;
 	char *literal;
 	char *labelref;
-	unsigned int cbase;
 	uint8_t byte;
-	struct data data;
-
-	uint64_t addr;
-	cell_t cell;
-	struct property *prop;
-	struct property *proplist;
-	struct node *node;
-	struct node *nodelist;
-	struct reserve_info *re;
 }
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_INCBIN
+%token DT_DEFINE
+%token DT_CONST
+%token DT_FOR
+%token DT_IN
+%token DT_RANGE
+%token DT_VOID
+%token DT_IF
+%token DT_ELSE
+%token DT_RETURN
+
 %token <propnodename> DT_PROPNODENAME
+%token <id> DT_ID
 %token <literal> DT_LITERAL
-%token <cbase> DT_BASE
 %token <byte> DT_BYTE
-%token <data> DT_STRING
+%token <litstr> DT_STRING
 %token <labelref> DT_LABEL
 %token <labelref> DT_REF
-%token DT_INCBIN
 
-%type <data> propdata
-%type <data> propdataprefix
-%type <re> memreserve
-%type <re> memreserves
-%type <addr> addr
-%type <data> celllist
-%type <cell> cellval
-%type <data> bytestring
-%type <prop> propdef
-%type <proplist> proplist
-
-%type <node> devicetree
-%type <node> nodedef
-%type <node> subnode
-%type <nodelist> subnodes
-%type <labelref> label
+%token DT_OR
+%token DT_AND
+%token DT_EQ DT_NE
+%token DT_LE DT_GE
+%token DT_LSHIFT DT_RSHIFT
+%token DT_ASSIGN
+
+%type <ir> sourcefile
+%type <ir> memreserve
+%type <ir> devicetree
+%type <ir> declaration_list
+%type <ir> declaration
+%type <ir> funcdef
+%type <ir> constdef
+%type <ir> errordef
+%type <ir> subnode
+%type <ir> paramdecl_list
+%type <ir> paramdecls
+%type <ir> paramdecl
+
+%type <ir> statement_block
+%type <ir> statement_list
+%type <ir> statement
+%type <ir> for_statement
+%type <ir> if_statement
+%type <ir> return_statement
+%type <ir> assign_statement
+%type <ir> trivial_statement
+%type <ir> error_statement
+
+%type <ir> propdef
+%type <ir> celllist
+%type <ir> cellval
+%type <ir> literal
+%type <ir> string
+%type <ir> addr
+%type <ir> byte
+%type <ir> propnodename
+%type <ir> label
+%type <ir> opt_label
+%type <ir> node_label
+%type <ir> propdata
+%type <ir> propdataitem
+%type <ir> propdataprefix
+%type <ir> bytestring
+
+%type <ir> param_list
+
+%type <ir> expr
+%type <ir> expr_primary
+%type <ir> expr_postfix
+%type <ir> expr_unary
+%type <ir> expr_mul
+%type <ir> expr_add
+%type <ir> expr_shift
+%type <ir> expr_rela
+%type <ir> expr_eq
+%type <ir> expr_bitand
+%type <ir> expr_bitxor
+%type <ir> expr_bitor
+%type <ir> expr_and
+%type <ir> expr_or
+%type <ir> expr_conditional
+
+%type <ir> range
+%type <ir> identifier
 
 %%
 
 sourcefile:
-	  DT_V1 ';' memreserves devicetree
+	  DT_V1 ';' declaration_list devicetree
 		{
-			the_boot_info = build_boot_info($3, $4, 0);
+			the_ir_tree = ir_alloc(IR_ROOT, &@4);
+			the_ir_tree->ir_declarations = $3;
+			the_ir_tree->ir_statements = $4;
 		}
 	;
 
-memreserves:
+declaration_list:
 	  /* empty */
 		{
 			$$ = NULL;
 		}
-	| memreserve memreserves
+	| declaration_list declaration
 		{
-			$$ = chain_reserve_entry($1, $2);
+			$$ = ir_list_append($1, $2);
 		}
 	;
 
+declaration:
+	  memreserve
+	| constdef
+	| funcdef
+	| errordef
+	;
+
 memreserve:
-	  label DT_MEMRESERVE addr addr ';'
+	  opt_label DT_MEMRESERVE addr addr ';'
 		{
-			$$ = build_reserve_entry($3, $4, $1);
+			$$ = ir_alloc_binop(IR_MEM_RESERVE, $3, $4, &@2);
+			$$->ir_label = $1;
 		}
 	;
 
-addr:
-	  DT_LITERAL
+
+constdef:
+	  DT_CONST identifier '=' expr ';'
 		{
-			$$ = eval_literal($1, 0, 64);
+			$$ = ir_alloc_binop(IR_CONST_DEF, $2, $4, &@1);
 		}
-	  ;
+	;
 
-devicetree:
-	  '/' nodedef
+funcdef:
+	  DT_DEFINE propnodename paramdecls statement_block
+		{
+			$$ = ir_alloc(IR_FUNC_DEF, &@1);
+			$$->ir_name = $2;
+			$$->ir_declarations = $3;
+			$$->ir_statements = $4;
+		}
+	;
+
+errordef:
+	  error
 		{
-			$$ = name_node($2, "", NULL);
+			$$ = NULL
 		}
 	;
 
-nodedef:
-	  '{' proplist subnodes '}' ';'
+paramdecls:
+	  '(' paramdecl_list ')'
 		{
-			$$ = build_node($2, $3);
+			$$ = $2;
 		}
 	;
 
-proplist:
+paramdecl_list:
 	  /* empty */
 		{
 			$$ = NULL;
 		}
-	| proplist propdef
+	| paramdecl
+		{
+			$$ = ir_list_append(NULL, $1);
+		}
+	| paramdecl_list ',' paramdecl
 		{
-			$$ = chain_property($2, $1);
+			$$ = ir_list_append($1, $3);
 		}
 	;
 
-propdef:
-	  label DT_PROPNODENAME '=' propdata ';'
+paramdecl:
+	  identifier
+	;
+
+
+devicetree:
+	  '/' statement_block ';'
 		{
-			$$ = build_property($2, $4, $1);
+			$$ = ir_alloc(IR_NODE, &@2);
+			$$->ir_statements = $2;
+			$$->ir_name = ir_alloc(IR_PROPNODENAME, &@1);
+			$$->ir_name->ir_lit_str = "";
+			$$->ir_label = NULL;
 		}
-	| label DT_PROPNODENAME ';'
+	;
+
+
+statement_block:
+	  '{' statement_list '}'
 		{
-			$$ = build_property($2, empty_data, $1);
+			$$ = $2;
 		}
 	;
 
-propdata:
-	  propdataprefix DT_STRING
+statement_list:
+	  /* empty */
 		{
-			$$ = data_merge($1, $2);
+			$$ = NULL;
 		}
-	| propdataprefix '<' celllist '>'
+	| statement_list statement
 		{
-			$$ = data_merge($1, $3);
+			$$ = ir_list_append($1, $2);
 		}
-	| propdataprefix '[' bytestring ']'
+	;
+
+statement:
+	  for_statement
+	| if_statement
+	| return_statement
+	| assign_statement
+	| propdef
+	| subnode
+	| statement_block
+	| trivial_statement
+	| error_statement
+	;
+
+
+subnode:
+	  node_label expr statement_block ';'
 		{
-			$$ = data_merge($1, $3);
+			$$ = ir_alloc(IR_NODE, &@3);
+			$$->ir_statements = $3;
+			$$->ir_label = $1;
+			$$->ir_name = $2;
 		}
-	| propdataprefix DT_REF
+	| label expr statement_block ';'
 		{
-			$$ = data_add_marker($1, REF_PATH, $2);
+			$$ = ir_alloc(IR_NODE, &@3);
+			$$->ir_statements = $3;
+			$$->ir_label = $1;
+			$$->ir_name = $2;
 		}
-	| propdataprefix DT_INCBIN '(' DT_STRING ',' addr ',' addr ')'
+	| expr statement_block ';'
 		{
-			struct search_path path = { srcpos_file->dir, NULL, NULL };
-			struct dtc_file *file = dtc_open_file($4.val, &path);
-			struct data d = empty_data;
+			$$ = ir_alloc(IR_NODE, &@2);
+			$$->ir_statements = $2;
+			$$->ir_label = NULL;
+			$$->ir_name = $1;
+		}
+	;
 
-			if ($6 != 0)
-				if (fseek(file->file, $6, SEEK_SET) != 0)
-					yyerrorf("Couldn't seek to offset %llu in \"%s\": %s",
-						 (unsigned long long)$6,
-						 $4.val, strerror(errno));
+for_statement:
+	  DT_FOR identifier DT_IN range statement_block
+		{
+			$$ = ir_alloc_binop(IR_FOR, $2, $4, &@1);
+			$$->ir_statements = $5;
+		}
+	;
 
-			d = data_copy_file(file->file, $8);
+range:
+	  expr DT_RANGE expr
+		{
+			$$ = ir_alloc_binop(IR_RANGE, $1, $3, &@2);
+		}
+	;
 
-			$$ = data_merge($1, d);
-			dtc_close_file(file);
+if_statement:
+	  DT_IF '(' expr ')' statement_block
+		{
+			$$ = ir_alloc_unop(IR_IF, $3, &@1);
+			$$->ir_statements = $5;
 		}
-	| propdataprefix DT_INCBIN '(' DT_STRING ')'
+	| DT_IF '(' expr ')' statement_block DT_ELSE statement_block
 		{
-			struct search_path path = { srcpos_file->dir, NULL, NULL };
-			struct dtc_file *file = dtc_open_file($4.val, &path);
-			struct data d = empty_data;
+			$$ = ir_alloc_unop(IR_IF, $3, &@1);
+			$$->ir_statements = $5;
+			$$->ir_statements2 = $7;
+		}
+	;
 
-			d = data_copy_file(file->file, -1);
+return_statement:
+	  DT_RETURN expr ';'
+		{
+			$$ = ir_alloc_unop(IR_RETURN, $2, &@1);
+		}
+	;
 
-			$$ = data_merge($1, d);
-			dtc_close_file(file);
+assign_statement:
+	  identifier DT_ASSIGN expr ';'
+		{
+			$$ = ir_alloc_binop(IR_ASSIGN, $1, $3, &@2);
 		}
-	| propdata DT_LABEL
+	;
+
+trivial_statement:
+	  ';'
 		{
-			$$ = data_add_marker($1, LABEL, $2);
+			$$ = NULL;
+		}
+	;
+
+error_statement:
+	  error
+		{
+			$$ = NULL;
+		}
+	;
+
+propdef:
+	  expr ';'
+		{
+			$$ = ir_alloc_unop(IR_PROP_DEF,
+					   ir_alloc_unop(IR_CVT_PROPNODENAME,
+							 $1,
+							 &@1),
+					   &@1);
+			$$->ir_label = NULL;
+		}
+	| expr '=' propdata ';'
+		{
+			$$ = ir_alloc_binop(IR_PROP_DEF,
+					    ir_alloc_unop(IR_CVT_PROPNODENAME,
+							  $1,
+							  &@1),
+					    $3,
+					    &@2);
+			$$->ir_label = NULL;
+		}
+	| label expr ';'
+		{
+			$$ = ir_alloc_unop(IR_PROP_DEF,
+					   ir_alloc_unop(IR_CVT_PROPNODENAME,
+							 $2,
+							 &@2),
+					   &@2);
+			$$->ir_label = $1;
+		}
+	| label expr '=' propdata ';'
+		{
+			$$ = ir_alloc_binop(IR_PROP_DEF,
+					    ir_alloc_unop(IR_CVT_PROPNODENAME,
+							  $2,
+							  &@2),
+					    $4,
+					    &@3);
+			$$->ir_label = $1;
+		}
+	;
+
+propdata:
+	  propdataprefix propdataitem
+		{
+			$$ = ir_list_append($1, $2);
+		}
+	| propdata label
+		{
+			$$ = ir_list_append($1, $2);
+		}
+	;
+
+propdataitem:
+	  string
+		{
+			$$ = $1;
+		}
+	| '<' celllist '>'
+		{
+			$$ = $2;
+		}
+	| '[' bytestring ']'
+		{
+			$$ = $2;
+		}
+	| DT_REF
+		{
+			$$ = ir_alloc(IR_REF_PATH, &@1);
+			$$->ir_label_name = $1;
+		}
+	| DT_INCBIN '(' expr ')'
+		{
+			$$ = ir_alloc_unop(IR_INCBIN, $3, &@1);
+		}
+	| DT_INCBIN '(' expr ',' expr ',' expr ')'
+		{
+			$$ = ir_alloc_triop(IR_INCBIN, $3, $5, $7, &@1);
 		}
 	;
 
 propdataprefix:
 	  /* empty */
 		{
-			$$ = empty_data;
+			$$ = NULL;
 		}
 	| propdata ','
 		{
 			$$ = $1;
 		}
-	| propdataprefix DT_LABEL
+	| propdataprefix label
 		{
-			$$ = data_add_marker($1, LABEL, $2);
+			$$ = ir_list_append($1, $2);
 		}
 	;
 
 celllist:
 	  /* empty */
 		{
-			$$ = empty_data;
+			$$ = NULL;
 		}
 	| celllist cellval
 		{
-			$$ = data_append_cell($1, $2);
+			$$ = ir_list_append($1, $2);
+		}
+	| celllist '&' '(' expr ')'
+		{
+			$$ = ir_alloc(IR_REF_PHANDLE, &@2);
+			$$->ir_label = $4;
+			$$ = ir_list_append($1, $$);
+
 		}
 	| celllist DT_REF
 		{
-			$$ = data_append_cell(data_add_marker($1, REF_PHANDLE,
-							      $2), -1);
+			$$ = ir_alloc(IR_REF_PHANDLE, &@2);
+			$$->ir_label_name = $2;
+			$$ = ir_list_append($1, $$);
 		}
-	| celllist DT_LABEL
+	| celllist label
 		{
-			$$ = data_add_marker($1, LABEL, $2);
+			$$ = ir_list_append($1, $2);
 		}
 	;
 
 cellval:
-	  DT_LITERAL
+	  expr_primary
 		{
-			$$ = eval_literal($1, 0, 32);
+			$$ = ir_alloc_unop(IR_CELL, $1, &@1);
 		}
 	;
 
-bytestring:
-	  /* empty */
+
+expr:
+	  expr_conditional
+	;
+
+expr_conditional:
+	  expr_or
+	| expr_or '?' expr_or ':' expr_conditional
 		{
-			$$ = empty_data;
+			$$ = ir_alloc_triop(IR_SELECT, $1, $3, $5, &@2);
 		}
-	| bytestring DT_BYTE
+	;
+
+expr_or:
+	  expr_and
+	| expr_or DT_OR expr_and
+		{
+			$$ = ir_alloc_binop(IR_OR, $1, $3, &@2);
+		};
+
+expr_and:
+	  expr_bitor
+	| expr_and DT_AND expr_bitor
+		{
+			$$ = ir_alloc_binop(IR_AND, $1, $3, &@2);
+		};
+	;
+
+expr_bitor:
+	  expr_bitxor
+	| expr_bitor '|' expr_bitxor
 		{
-			$$ = data_append_byte($1, $2);
+			$$ = ir_alloc_binop(IR_BIT_OR, $1, $3, &@2);
+		};
+	;
+
+expr_bitxor:
+	  expr_bitand
+	| expr_bitxor '^' expr_bitand
+		{
+			$$ = ir_alloc_binop(IR_BIT_XOR, $1, $3, &@2);
+		};
+	;
+
+expr_bitand:
+	  expr_eq
+	| expr_bitand '&' expr_eq
+		{
+			$$ = ir_alloc_binop(IR_BIT_AND, $1, $3, &@2);
+		};
+	;
+
+expr_eq:
+	  expr_rela
+	| expr_eq DT_EQ expr_rela
+		{
+			$$ = ir_alloc_binop(IR_EQ, $1, $3, &@2);
+		}
+	| expr_eq DT_NE expr_rela
+		{
+			$$ = ir_alloc_binop(IR_NE, $1, $3, &@2);
+		}
+	;
+
+expr_rela:
+	  expr_shift
+	| expr_rela '<' expr_shift
+		{
+			$$ = ir_alloc_binop(IR_LT, $1, $3, &@2);
+		}
+	| expr_rela '>' expr_shift
+		{
+			$$ = ir_alloc_binop(IR_GT, $1, $3, &@2);
+		}
+	| expr_rela DT_LE expr_shift
+		{
+			$$ = ir_alloc_binop(IR_LE, $1, $3, &@2);
+		}
+	| expr_rela DT_GE expr_shift
+		{
+			$$ = ir_alloc_binop(IR_GE, $1, $3, &@2);
+		}
+	;
+
+expr_shift:
+	  expr_add
+	| expr_shift DT_LSHIFT expr_add
+		{
+			$$ = ir_alloc_binop(IR_LSHIFT, $1, $3, &@2);
+		}
+	| expr_shift DT_RSHIFT expr_add
+		{
+			$$ = ir_alloc_binop(IR_RSHIFT, $1, $3, &@2);
+		}
+	;
+
+expr_add:
+	  expr_mul
+	| expr_add '+' expr_mul
+		{
+			$$ = ir_alloc_binop(IR_ADD, $1, $3, &@2);
+		}
+	| expr_add '-' expr_mul
+		{
+			$$ = ir_alloc_binop(IR_MINUS, $1, $3, &@2);
+		}
+	;
+
+expr_mul:
+	  expr_unary
+	| expr_mul '*' expr_unary
+		{
+			$$ = ir_alloc_binop(IR_MULT, $1, $3, &@2);
+		}
+	| expr_mul '/' expr_unary
+		{
+			$$ = ir_alloc_binop(IR_DIV, $1, $3, &@2);
+		}
+	| expr_mul '%' expr_unary
+		{
+			$$ = ir_alloc_binop(IR_MOD, $1, $3, &@2);
+		}
+	;
+
+expr_unary:
+	  expr_postfix
+	| '-' expr_unary
+		{
+			$$ = ir_alloc_unop(IR_UMINUS, $2, &@1);
+		}
+	| '~' expr_unary
+		{
+			$$ = ir_alloc_unop(IR_BIT_COMPL, $2, &@1);
+		}
+	| '!' expr_unary
+		{
+			$$ = ir_alloc_unop(IR_NOT, $2, &@1);
+		}
+	;
+
+expr_postfix:
+	  expr_primary
+	| expr_postfix '(' ')'
+		{
+			$$ = ir_alloc_binop(IR_FUNC_CALL, $1, NULL, &@2);
 		}
-	| bytestring DT_LABEL
+	| expr_postfix '(' param_list ')'
 		{
-			$$ = data_add_marker($1, LABEL, $2);
+			$$ = ir_alloc_binop(IR_FUNC_CALL, $1, $3, &@2);
 		}
 	;
 
-subnodes:
+param_list:
+	  expr
+		{
+			$$ = ir_list_append(NULL, $1);
+		}
+	| param_list ',' expr
+		{
+			$$ = ir_list_append($1, $3);
+		}
+	;
+
+
+
+expr_primary:
+	  literal
+	| string
+	| propnodename
+	| identifier
+	| '(' expr ')'
+		{
+			$$ = $2;
+		}
+	;
+
+addr:
+	  expr_primary
+	;
+
+
+bytestring:
 	  /* empty */
 		{
 			$$ = NULL;
 		}
-	|  subnode subnodes
+	| bytestring byte
 		{
-			$$ = chain_node($1, $2);
+			$$ = ir_list_append($1, $2);
 		}
-	| subnode propdef
+	| bytestring label
 		{
-			yyerror("syntax error: properties must precede subnodes");
-			YYERROR;
+			$$ = ir_list_append($1, $2);
 		}
 	;
 
-subnode:
-	  label DT_PROPNODENAME nodedef
+propnodename:
+	  DT_PROPNODENAME
 		{
-			$$ = name_node($3, $2, $1);
+			$$ = ir_alloc(IR_PROPNODENAME, &@1);
+			$$->ir_lit_str = $1;
 		}
 	;
 
-label:
+identifier:
+	  DT_ID
+		{
+			$$ = ir_alloc(IR_ID, &@1);
+			$$->ir_lit_str = $1;
+		}
+	;
+
+literal:
+	  DT_LITERAL
+		{
+			$$ = ir_alloc(IR_LITERAL, &@1);
+			$$->ir_lit_str = $1;
+		}
+	;
+
+byte:
+	  DT_BYTE
+		{
+			$$ = ir_alloc(IR_LIT_BYTE, &@1);
+			$$->ir_literal = $1;
+		}
+	;
+
+string:
+	  DT_STRING
+		{
+			$$ = ir_alloc(IR_LIT_STR, &@1);
+			$$->ir_lit_str = $1;
+		}
+	;
+
+opt_label:
 	  /* empty */
 		{
 			$$ = NULL;
 		}
-	| DT_LABEL
+	| label
 		{
 			$$ = $1;
 		}
 	;
 
-%%
-
-void yyerrorf(char const *s, ...)
-{
-	const char *fname = srcpos_file ? srcpos_file->name : "<no-file>";
-	va_list va;
-	va_start(va, s);
-
-	if (strcmp(fname, "-") == 0)
-		fname = "stdin";
+label:
+	  DT_LABEL
+		{
+			$$ = ir_alloc(IR_LABEL, &@1);
+			$$->ir_label_name = $1;
+		}
+	;
 
-	fprintf(stderr, "%s:%d ", fname, yylloc.first_line);
-	vfprintf(stderr, s, va);
-	fprintf(stderr, "\n");
+node_label:
+	  expr ':'
+	;
 
-	treesource_error = 1;
-	va_end(va);
-}
 
-void yyerror (char const *s)
-{
-	yyerrorf("%s", s);
-}
+%%
 
-static unsigned long long eval_literal(const char *s, int base, int bits)
+void yyerror(char const *s)
 {
-	unsigned long long val;
-	char *e;
-
-	errno = 0;
-	val = strtoull(s, &e, base);
-	if (*e)
-		yyerror("bad characters in literal");
-	else if ((errno == ERANGE)
-		 || ((bits < 64) && (val >= (1ULL << bits))))
-		yyerror("literal out of range");
-	else if (errno != 0)
-		yyerror("bad literal");
-	return val;
+	srcpos_error(&yylloc, "%s", s);
+	treesource_error = 1;
 }
diff --git a/dtc.c b/dtc.c
index 84bee2d..ccaf89c 100644
--- a/dtc.c
+++ b/dtc.c
@@ -20,6 +20,7 @@
 
 #include "dtc.h"
 #include "srcpos.h"
+#include "nv.h"
 
 #include "version_gen.h"
 
@@ -127,7 +128,7 @@ int main(int argc, char *argv[])
 	minsize    = 0;
 	padsize    = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fcqb:v")) != EOF) {
+	while ((opt = getopt(argc, argv, "hD:I:O:o:V:R:S:p:fcqb:v")) != EOF) {
 		switch (opt) {
 		case 'I':
 			inform = optarg;
@@ -162,6 +163,9 @@ int main(int argc, char *argv[])
 		case 'b':
 			cmdline_boot_cpuid = strtoll(optarg, NULL, 0);
 			break;
+		case 'D':
+			nv_note_define(optarg);
+			break;
 		case 'v':
 			printf("Version: %s\n", DTC_VERSION);
 			exit(0);
@@ -203,7 +207,6 @@ int main(int argc, char *argv[])
 	fill_fullpaths(bi->dt, "");
 	process_checks(force, bi);
 
-
 	if (streq(outname, "-")) {
 		outf = stdout;
 	} else {
diff --git a/dtc.h b/dtc.h
index ec636f8..327fc15 100644
--- a/dtc.h
+++ b/dtc.h
@@ -187,6 +187,7 @@ struct property *reverse_properties(struct property *first);
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *name_node(struct node *node, char *name, char *label);
 struct node *chain_node(struct node *first, struct node *list);
+struct node *reverse_nodes(struct node *first);
 
 void add_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
diff --git a/ir.h b/ir.h
index 630ec52..b17b87d 100644
--- a/ir.h
+++ b/ir.h
@@ -100,7 +100,6 @@ struct ir {
 	struct ir *ir_expr2;
 	struct ir *ir_expr3;
 
-	struct ir *ir_mem_reserves;
 	struct ir *ir_statements;
 	struct ir *ir_statements2;
 	struct ir *ir_declarations;
diff --git a/ir_dump.c b/ir_dump.c
index f949423..edf11a7 100644
--- a/ir_dump.c
+++ b/ir_dump.c
@@ -152,15 +152,6 @@ ir_dump_node(struct ir *ir, unsigned int level)
 		       indent, "", ir->ir_prev);
 
 	/*
-	 * Dump mem-reserves.
-	 */
-	if (ir->ir_mem_reserves) {
-		printf("%*sir_mem_reserves: %p\n",
-		       indent, "", ir->ir_mem_reserves);
-		ir_dump_node(ir->ir_mem_reserves, level + 1);
-	}
-
-	/*
 	 * Dump sub-expressions
 	 */
 	if (ir->ir_expr1) {
diff --git a/ir_emit.c b/ir_emit.c
index 31005ca..54b5a00 100644
--- a/ir_emit.c
+++ b/ir_emit.c
@@ -323,6 +323,34 @@ ir_emit_const_def(struct ir *ir_const_def)
 
 
 void
+ir_emit_mem_reserve(struct ir *ir_mem)
+{
+	struct reserve_info *ri;
+	uint64_t addr;
+	uint64_t size;
+	char *lab;
+
+	if (ir_mem == NULL)
+		return;
+
+	addr = ir_eval_for_addr(ir_mem->ir_expr1);
+	size = ir_eval_for_addr(ir_mem->ir_expr2);
+	lab = ir_eval_for_label(ir_mem->ir_label);
+
+	debug("ir_emit_mem_reserve(0x%llx, 0x%llx, ",
+	      (unsigned long long)addr, (unsigned long long)size);
+	if (lab) {
+		debug("%s)\n", lab);
+	} else {
+		debug("<no-label>)\n");
+	}
+
+	ri = build_reserve_entry(addr, size, lab);
+	irs_append_reserve(ri);
+}
+
+
+void
 ir_emit_declaration_list(struct ir *ir_list)
 {
 	struct ir *ir;
@@ -343,9 +371,13 @@ ir_emit_declaration_list(struct ir *ir_list)
 			ir_emit_func_def(ir);
 			break;
 
+		case IR_MEM_RESERVE:
+			ir_emit_mem_reserve(ir);
+			break;
+
 		default:
 			ir_error(ir,
-				 "Unknown devlaration type %s\n",
+				 "Unknown declaration type %s\n",
 				 ir_type_string(ir->ir_type));
 			break;
 		}
@@ -391,37 +423,6 @@ ir_emit_node(struct ir *ir)
 
 
 void
-ir_emit_mem_reserves(struct ir *ir_mem)
-{
-	struct ir *ir;
-	struct reserve_info *ri;
-	uint64_t addr;
-	uint64_t size;
-	char *lab;
-
-	if (ir_mem == NULL)
-		return;
-
-	for (ir = ir_mem->ir_first; ir != NULL; ir = ir->ir_next) {
-		addr = ir_eval_for_addr(ir->ir_expr1);
-		size = ir_eval_for_addr(ir->ir_expr2);
-		lab = ir_eval_for_label(ir->ir_label);
-
-		debug("emit: build_reserve_entry(0x%llx, 0x%llx, ",
-		      (unsigned long long)addr, (unsigned long long)size);
-		if (lab) {
-			debug("%s)\n", lab);
-		} else {
-			debug("<no-label>)\n");
-		}
-
-		ri = build_reserve_entry(addr, size, lab);
-		irs_append_reserve(ri);
-	}
-}
-
-
-void
 ir_add_cmd_line_constant_defs(void)
 {
 	struct nv_pair *nv;
@@ -460,8 +461,6 @@ ir_emit_root(struct ir *ir)
 	 */
 	ir_add_cmd_line_constant_defs();
 
-	ir_emit_mem_reserves(ir->ir_mem_reserves);
-
 	/*
 	 * Fast-and-loose... These are definitions, not declarations!
 	 */
diff --git a/ir_eval.c b/ir_eval.c
index bd667cb..ba6da6a 100644
--- a/ir_eval.c
+++ b/ir_eval.c
@@ -1461,8 +1461,6 @@ ir_simplify(struct ir *ir, unsigned int ctxt)
 
 	case IR_ROOT:
 		ir_new = ir_copy(ir);
-		ir_new->ir_mem_reserves =
-			ir_simplify(ir->ir_mem_reserves, ctxt);
 		ir_new->ir_declarations =
 			ir_simplify(ir->ir_declarations, ctxt);
 		ir_new->ir_statements =
diff --git a/ir_scope.c b/ir_scope.c
index c9a52e8..20d784d 100644
--- a/ir_scope.c
+++ b/ir_scope.c
@@ -97,8 +97,7 @@ irs_append_reserve(struct reserve_info *ri)
 	struct ir_scope *irs;
 
 	irs = irs_find_scope(IRS_ROOT);
-	irs->irs_reserve_list = chain_reserve_entry(ri,
-						    irs->irs_reserve_list);
+	irs->irs_reserve_list = add_reserve_entry(irs->irs_reserve_list, ri);
 }
 
 
diff --git a/livetree.c b/livetree.c
index 0ca3de5..fec33b4 100644
--- a/livetree.c
+++ b/livetree.c
@@ -97,6 +97,22 @@ struct node *chain_node(struct node *first, struct node *list)
 	return first;
 }
 
+struct node *reverse_nodes(struct node *first)
+{
+	struct node *p = first;
+	struct node *head = NULL;
+	struct node *next;
+
+	while (p) {
+		next = p->next_sibling;
+		p->next_sibling = head;
+		head = p;
+		p = next;
+	}
+	return head;
+}
+
+
 void add_property(struct node *node, struct property *prop)
 {
 	struct property **p;
diff --git a/nv.c b/nv.c
new file mode 100644
index 0000000..f02b8bc
--- /dev/null
+++ b/nv.c
@@ -0,0 +1,108 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include "dtc.h"
+#include "nv.h"
+
+struct nv_pair *nv_list;
+
+
+struct nv_pair *
+nv_alloc(void)
+{
+	struct nv_pair *nv;
+
+	nv = xmalloc(sizeof(struct nv_pair));
+	memset(nv, 0, sizeof(struct nv_pair));
+
+	return nv;
+}
+
+
+int
+nv_is_present(char *name)
+{
+	struct nv_pair *nv;
+
+	for (nv = nv_list; nv != NULL; nv = nv->nv_next) {
+		if (strcmp(nv->nv_name, name) == 0) {
+			return 1;
+		}
+	}
+	return 0;
+}
+
+
+void
+nv_dump(void)
+{
+	struct nv_pair *nv;
+
+	for (nv = nv_list; nv != NULL; nv = nv->nv_next) {
+		printf("NV: %s = \"%s\"\n", nv->nv_name, nv->nv_value);
+	}
+}
+
+
+/*
+ * Accept a string like "foo=123", or "cpu=mpc8548".
+ * Split it on the = for name and value parts.
+ * Record it in a name-value pairing list for later
+ * use when setting up the IR evaluation environment.
+ */
+
+void
+nv_note_define(char *defstr)
+{
+	struct nv_pair *nv;
+	char *name;
+	char *value;
+
+	if (!defstr || ! *defstr)
+		return;
+
+	name = strdup(defstr);
+
+	/*
+	 * Separate name and value at equal sign.
+	 */
+	value = strchr(name, '=');
+	if (value) {
+		*value = 0;
+		value++;
+		if (! *value) {
+			value = NULL;
+		}
+	}
+
+	if (nv_is_present(name)) {
+		printf("Warning: Ignored duplicate value %s for %s\n",
+		       value, name);
+		return;
+	}
+
+	debug("nv_note_define(): %s = \"%s\"\n", name, value);
+
+	nv = nv_alloc();
+	nv->nv_name = name;
+	nv->nv_value = value;
+
+	nv->nv_next = nv_list;
+	nv_list = nv;
+}
diff --git a/nv.h b/nv.h
new file mode 100644
index 0000000..70ed718
--- /dev/null
+++ b/nv.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#ifndef _NV_H_
+#define _NV_H_
+
+
+struct nv_pair {
+	char *nv_name;
+	char *nv_value;
+	struct nv_pair *nv_next;
+};
+
+extern struct nv_pair *nv_list;
+
+extern void nv_note_define(char *defstr);
+
+#endif /* _NV_H_ */
diff --git a/srcpos.c b/srcpos.c
index 59d1835..ac1fdab 100644
--- a/srcpos.c
+++ b/srcpos.c
@@ -17,9 +17,14 @@
  *                                                                   USA
  */
 
+#define _GNU_SOURCE
+
+#include <stdio.h>
+
 #include "dtc.h"
 #include "srcpos.h"
 
+
 /*
  * Like yylineno, this is the current open file pos.
  */
@@ -129,9 +134,6 @@ dtc_close_file(struct dtc_file *file)
 {
 	if (fclose(file->file))
 		die("Error closing \"%s\": %s\n", file->name, strerror(errno));
-
-	free(file->dir);
-	free(file);
 }
 
 
@@ -164,34 +166,75 @@ srcpos_dump(srcpos *pos)
 char *
 srcpos_string(srcpos *pos)
 {
-#	define POS_BUF_SIZE	(100)
-
 	const char *fname;
-	char buf[POS_BUF_SIZE];
+	char col_buf[100];
+	char *pos_str;
 
-	if (pos->file && pos->file->name)
+	if (!pos) {
+		fname = "<no-file>";
+	} else if (pos->file->name) {
 		fname = pos->file->name;
-	else
+		if (strcmp(fname, "-") == 0)
+			fname = "stdin";
+	} else {
 		fname = "<no-file>";
+	}
 
 	if (pos->first_line == pos->last_line) {
 		if (pos->first_column == pos->last_column) {
-			snprintf(buf, POS_BUF_SIZE, "%s %d:%d",
-				 fname, pos->first_line, pos->first_column);
+			snprintf(col_buf, sizeof(col_buf),
+				 "%d:%d",
+				 pos->first_line, pos->first_column);
 		} else {
-			snprintf(buf, POS_BUF_SIZE, "%s %d:%d-%d",
-				 fname, pos->first_line,
+			snprintf(col_buf, sizeof(col_buf),
+				 "%d:%d-%d",
+				 pos->first_line,
 				 pos->first_column, pos->last_column);
 		}
 
 	} else {
-		snprintf(buf, POS_BUF_SIZE, "%s %d:%d - %d:%d",
-			 fname,
+		snprintf(col_buf, sizeof(col_buf),
+			 "%d:%d - %d:%d",
 			 pos->first_line, pos->first_column,
 			 pos->last_line, pos->last_column);
 	}
 
-	return strdup(buf);
+	if (asprintf(&pos_str, "%s %s", fname, col_buf) == -1)
+		return "<unknown source position?";
+
+	return pos_str;
+}
+
+
+void
+srcpos_error(srcpos *pos, char const *fmt, ...)
+{
+	const char *srcstr;
+	va_list va;
+	va_start(va, fmt);
+
+	srcstr = srcpos_string(pos);
+
+	fprintf(stderr, "Error: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
+
+	va_end(va);
+}
+
+
+void
+srcpos_warn(srcpos *pos, char const *fmt, ...)
+{
+	const char *srcstr;
+	va_list va;
+	va_start(va, fmt);
+
+	srcstr = srcpos_string(pos);
+
+	fprintf(stderr, "Warning: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
 
-#	undef POS_BUF_SIZE
+	va_end(va);
 }
diff --git a/srcpos.h b/srcpos.h
index 3c39dd0..a6d0077 100644
--- a/srcpos.h
+++ b/srcpos.h
@@ -81,11 +81,6 @@ typedef YYLTYPE srcpos;
  */
 extern srcpos srcpos_empty;
 
-
-
-extern void yyerror(char const *);
-extern void yyerrorf(char const *, ...) __attribute__((format(printf, 1, 2)));
-
 extern struct dtc_file *srcpos_file;
 
 struct search_path {
@@ -101,4 +96,9 @@ extern srcpos *srcpos_copy(srcpos *pos);
 extern char *srcpos_string(srcpos *pos);
 extern void srcpos_dump(srcpos *pos);
 
+extern void srcpos_error(srcpos *pos, char const *, ...)
+     __attribute__((format(printf, 2, 3)));
+extern void srcpos_warn(srcpos *pos, char const *, ...)
+     __attribute__((format(printf, 2, 3)));
+
 #endif /* _SRCPOS_H_ */
diff --git a/treesource.c b/treesource.c
index 1521ff1..5d69878 100644
--- a/treesource.c
+++ b/treesource.c
@@ -20,6 +20,7 @@
 
 #include "dtc.h"
 #include "srcpos.h"
+#include "ir.h"
 
 extern FILE *yyin;
 extern int yyparse(void);
@@ -41,6 +42,8 @@ struct boot_info *dt_from_source(const char *fname)
 	if (treesource_error)
 		die("Syntax error parsing input tree\n");
 
+	ir_process();
+
 	return the_boot_info;
 }
 
-- 
1.6.0.90.g436ed
