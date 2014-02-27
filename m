From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 01/10] First cut at expression trees
Date: Thu, 27 Feb 2014 22:21:30 +1100
Message-ID: <1393500099-28544-2-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

At the moment, the integer expressions supported by dtc are always constant
expressions, and are evaluated as we parse.  That's nice and simple but
limits us in a number of ways.  It makes named constants awkward to
implement and user defined functions more or less impossible.

As a first step to allowing more possibilities, create the structures we
need to represent expressions at runtime.  For now we just construct them
in the parser, then immediately evaluate, but one thing at a time.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 Makefile.dtc |   1 +
 dtc-parser.y | 173 +++++++++++++++++++++++++++++++++--------------------------
 dtc.h        |  58 ++++++++++++++++++++
 expression.c | 165 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 321 insertions(+), 76 deletions(-)
 create mode 100644 expression.c

diff --git a/Makefile.dtc b/Makefile.dtc
index bece49b..d41d9c5 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -7,6 +7,7 @@ DTC_SRCS = \
 	checks.c \
 	data.c \
 	dtc.c \
+	expression.o \
 	flattree.c \
 	fstree.c \
 	livetree.c \
diff --git a/dtc-parser.y b/dtc-parser.y
index ea57e0a..5e2348e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -33,6 +33,11 @@ extern void yyerror(char const *s);
 
 extern struct boot_info *the_boot_info;
 extern bool treesource_error;
+
+static uint64_t expr_int(struct expression *expr);
+
+#define UNOP(op, a)	(expression_##op((a)))
+#define BINOP(op, a, b)	(expression_##op((a), (b)))
 %}
 
 %union {
@@ -52,6 +57,7 @@ extern bool treesource_error;
 	struct node *nodelist;
 	struct reserve_info *re;
 	uint64_t integer;
+	struct expression *expr;
 }
 
 %token DT_V1
@@ -83,20 +89,20 @@ extern bool treesource_error;
 %type <node> subnode
 %type <nodelist> subnodes
 
-%type <integer> integer_prim
-%type <integer> integer_unary
-%type <integer> integer_mul
-%type <integer> integer_add
-%type <integer> integer_shift
-%type <integer> integer_rela
-%type <integer> integer_eq
-%type <integer> integer_bitand
-%type <integer> integer_bitxor
-%type <integer> integer_bitor
-%type <integer> integer_and
-%type <integer> integer_or
-%type <integer> integer_trinary
-%type <integer> integer_expr
+%type <expr> expr_prim
+%type <expr> expr_unary
+%type <expr> expr_mul
+%type <expr> expr_add
+%type <expr> expr_shift
+%type <expr> expr_rela
+%type <expr> expr_eq
+%type <expr> expr_bitand
+%type <expr> expr_bitxor
+%type <expr> expr_bitor
+%type <expr> expr_and
+%type <expr> expr_or
+%type <expr> expr_conditional
+%type <expr> expr
 
 %%
 
@@ -120,9 +126,10 @@ memreserves:
 	;
 
 memreserve:
-	  DT_MEMRESERVE integer_prim integer_prim ';'
+	  DT_MEMRESERVE expr_prim expr_prim ';'
 		{
-			$$ = build_reserve_entry($2, $3);
+			$$ = build_reserve_entry(expr_int($2),
+						 expr_int($3));
 		}
 	| DT_LABEL memreserve
 		{
@@ -219,18 +226,19 @@ propdata:
 		{
 			$$ = data_add_marker($1, REF_PATH, $2);
 		}
-	| propdataprefix DT_INCBIN '(' DT_STRING ',' integer_prim ',' integer_prim ')'
+	| propdataprefix DT_INCBIN '(' DT_STRING ',' expr_prim ',' expr_prim ')'
 		{
 			FILE *f = srcfile_relative_open($4.val, NULL);
+			off_t offset = expr_int($6);
 			struct data d;
 
-			if ($6 != 0)
-				if (fseek(f, $6, SEEK_SET) != 0)
+			if (offset != 0)
+				if (fseek(f, offset, SEEK_SET) != 0)
 					die("Couldn't seek to offset %llu in \"%s\": %s",
-					    (unsigned long long)$6, $4.val,
+					    (unsigned long long)offset, $4.val,
 					    strerror(errno));
 
-			d = data_copy_file(f, $8);
+			d = data_copy_file(f, expr_int($8));
 
 			$$ = data_merge($1, d);
 			fclose(f);
@@ -288,8 +296,10 @@ arrayprefix:
 			$$.data = empty_data;
 			$$.bits = 32;
 		}
-	| arrayprefix integer_prim
+	| arrayprefix expr_prim
 		{
+			uint64_t val = expr_int($2);
+
 			if ($1.bits < 64) {
 				uint64_t mask = (1ULL << $1.bits) - 1;
 				/*
@@ -300,12 +310,12 @@ arrayprefix:
 				 * within the mask to one (i.e. | in the
 				 * mask), all bits are one.
 				 */
-				if (($2 > mask) && (($2 | mask) != -1ULL))
+				if ((val > mask) && ((val | mask) != -1ULL))
 					ERROR(&@2, "Value out of range for"
 					      " %d-bit array element", $1.bits);
 			}
 
-			$$.data = data_append_integer($1.data, $2, $1.bits);
+			$$.data = data_append_integer($1.data, val, $1.bits);
 		}
 	| arrayprefix DT_REF
 		{
@@ -327,87 +337,90 @@ arrayprefix:
 		}
 	;
 
-integer_prim:
-	  DT_LITERAL
-	| DT_CHAR_LITERAL
-	| '(' integer_expr ')'
+expr_prim:
+	  DT_LITERAL 		{ $$ = expression_constant($1); }
+	| DT_CHAR_LITERAL	{ $$ = expression_constant($1); }
+	| '(' expr ')'
 		{
 			$$ = $2;
 		}
 	;
 
-integer_expr:
-	integer_trinary
+expr:
+	expr_conditional
 	;
 
-integer_trinary:
-	  integer_or
-	| integer_or '?' integer_expr ':' integer_trinary { $$ = $1 ? $3 : $5; }
+expr_conditional:
+	  expr_or
+	| expr_or '?' expr ':' expr_conditional
+		{
+			$$ = expression_conditional($1, $3, $5);
+		}
 	;
 
-integer_or:
-	  integer_and
-	| integer_or DT_OR integer_and { $$ = $1 || $3; }
+expr_or:
+	  expr_and
+	| expr_or DT_OR expr_and { $$ = BINOP(logic_or, $1, $3); }
 	;
 
-integer_and:
-	  integer_bitor
-	| integer_and DT_AND integer_bitor { $$ = $1 && $3; }
+expr_and:
+	  expr_bitor
+	| expr_and DT_AND expr_bitor { $$ = BINOP(logic_and, $1, $3); }
 	;
 
-integer_bitor:
-	  integer_bitxor
-	| integer_bitor '|' integer_bitxor { $$ = $1 | $3; }
+expr_bitor:
+	  expr_bitxor
+	| expr_bitor '|' expr_bitxor { $$ = BINOP(bit_or, $1, $3); }
 	;
 
-integer_bitxor:
-	  integer_bitand
-	| integer_bitxor '^' integer_bitand { $$ = $1 ^ $3; }
+expr_bitxor:
+	  expr_bitand
+	| expr_bitxor '^' expr_bitand { $$ = BINOP(bit_xor, $1, $3); }
 	;
 
-integer_bitand:
-	  integer_eq
-	| integer_bitand '&' integer_eq { $$ = $1 & $3; }
+expr_bitand:
+	  expr_eq
+	| expr_bitand '&' expr_eq { $$ = BINOP(bit_and, $1, $3); }
 	;
 
-integer_eq:
-	  integer_rela
-	| integer_eq DT_EQ integer_rela { $$ = $1 == $3; }
-	| integer_eq DT_NE integer_rela { $$ = $1 != $3; }
+expr_eq:
+	  expr_rela
+	| expr_eq DT_EQ expr_rela { $$ = BINOP(eq, $1, $3); }
+	| expr_eq DT_NE expr_rela { $$ = BINOP(ne, $1, $3); }
 	;
 
-integer_rela:
-	  integer_shift
-	| integer_rela '<' integer_shift { $$ = $1 < $3; }
-	| integer_rela '>' integer_shift { $$ = $1 > $3; }
-	| integer_rela DT_LE integer_shift { $$ = $1 <= $3; }
-	| integer_rela DT_GE integer_shift { $$ = $1 >= $3; }
+expr_rela:
+	  expr_shift
+	| expr_rela '<' expr_shift { $$ = BINOP(lt, $1, $3); }
+	| expr_rela '>' expr_shift { $$ = BINOP(gt, $1, $3); }
+	| expr_rela DT_LE expr_shift { $$ = BINOP(le, $1, $3); }
+	| expr_rela DT_GE expr_shift { $$ = BINOP(ge, $1, $3); }
 	;
 
-integer_shift:
-	  integer_shift DT_LSHIFT integer_add { $$ = $1 << $3; }
-	| integer_shift DT_RSHIFT integer_add { $$ = $1 >> $3; }
-	| integer_add
+expr_shift:
+	  expr_shift DT_LSHIFT expr_add { $$ = BINOP(lshift, $1, $3); }
+	| expr_shift DT_RSHIFT expr_add { $$ = BINOP(rshift, $1, $3); }
+	| expr_add
 	;
 
-integer_add:
-	  integer_add '+' integer_mul { $$ = $1 + $3; }
-	| integer_add '-' integer_mul { $$ = $1 - $3; }
-	| integer_mul
+expr_add:
+	  expr_add '+' expr_mul { $$ = BINOP(add, $1, $3); }
+	| expr_add '-' expr_mul { $$ = BINOP(sub, $1, $3); }
+	| expr_mul
 	;
 
-integer_mul:
-	  integer_mul '*' integer_unary { $$ = $1 * $3; }
-	| integer_mul '/' integer_unary { $$ = $1 / $3; }
-	| integer_mul '%' integer_unary { $$ = $1 % $3; }
-	| integer_unary
+expr_mul:
+	  expr_mul '*' expr_unary { $$ = BINOP(mul, $1, $3); }
+	| expr_mul '/' expr_unary { $$ = BINOP(div, $1, $3); }
+	| expr_mul '%' expr_unary { $$ = BINOP(mod, $1, $3); }
+	| expr_unary
 	;
 
-integer_unary:
-	  integer_prim
-	| '-' integer_unary { $$ = -$2; }
-	| '~' integer_unary { $$ = ~$2; }
-	| '!' integer_unary { $$ = !$2; }
+expr_unary:
+	  expr_prim
+	| '-' expr_unary { $$ = UNOP(negate, $2); }
+	| '~' expr_unary { $$ = UNOP(bit_not, $2); }
+	| '!' expr_unary { $$ = UNOP(logic_not, $2); }
 	;
 
 bytestring:
@@ -463,3 +476,11 @@ void yyerror(char const *s)
 {
 	ERROR(&yylloc, "%s", s);
 }
+
+static uint64_t expr_int(struct expression *expr)
+{
+	uint64_t val;
+	val = expression_evaluate(expr);
+	expression_free(expr);
+	return val;
+}
diff --git a/dtc.h b/dtc.h
index 20de073..c40e9d7 100644
--- a/dtc.h
+++ b/dtc.h
@@ -218,6 +218,64 @@ cell_t get_node_phandle(struct node *root, struct node *node);
 
 uint32_t guess_boot_cpuid(struct node *tree);
 
+/* Expressions */
+
+struct operator;
+
+struct expression {
+	struct operator *op;
+	int nargs;
+	union {
+		uint64_t constant;
+	} u;
+	struct expression *arg[0];
+};
+
+void expression_free(struct expression *expr);
+uint64_t expression_evaluate(struct expression *expr);
+
+struct expression *expression_constant(uint64_t val);
+
+#define DEF_UNARY_OP(nm) \
+	struct expression *expression_##nm(struct expression *)
+DEF_UNARY_OP(negate);
+DEF_UNARY_OP(bit_not);
+DEF_UNARY_OP(logic_not);
+
+#define DEF_BINARY_OP(nm) \
+	struct expression *expression_##nm(struct expression *, struct expression *)
+DEF_BINARY_OP(mod);
+DEF_BINARY_OP(div);
+DEF_BINARY_OP(mul);
+
+DEF_BINARY_OP(add);
+DEF_BINARY_OP(sub);
+
+DEF_BINARY_OP(lshift);
+DEF_BINARY_OP(rshift);
+
+DEF_BINARY_OP(lt);
+DEF_BINARY_OP(gt);
+DEF_BINARY_OP(le);
+DEF_BINARY_OP(ge);
+
+DEF_BINARY_OP(eq);
+DEF_BINARY_OP(ne);
+
+DEF_BINARY_OP(bit_and);
+
+DEF_BINARY_OP(bit_xor);
+
+DEF_BINARY_OP(bit_or);
+
+DEF_BINARY_OP(logic_and);
+
+DEF_BINARY_OP(logic_or);
+
+struct expression *expression_conditional(struct expression *,
+					  struct expression *,
+					  struct expression *);
+
 /* Boot info (tree plus memreserve information */
 
 struct reserve_info {
diff --git a/expression.c b/expression.c
new file mode 100644
index 0000000..dd31a37
--- /dev/null
+++ b/expression.c
@@ -0,0 +1,165 @@
+/*
+ * (C) Copyright David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Red Hat 2013.
+ *
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
+
+struct operator {
+	const char *name;
+	unsigned nargs;
+	uint64_t (*evaluate)(struct expression *);
+	void (*free)(struct expression *);
+};
+
+static struct expression *__expression_build(struct operator *op, ...)
+{
+	int nargs = 0;
+	struct expression *expr;
+	va_list ap;
+	int i;
+
+	/* Sanity check number of arguments */
+	va_start(ap, op);
+	while (va_arg(ap, struct expression *) != NULL)
+		nargs++;
+	va_end(ap);
+
+	expr = xmalloc(sizeof(*expr) + nargs*sizeof(struct expression *));
+	expr->op = op;
+	expr->nargs = nargs;
+
+	va_start(ap, op);
+	for (i = 0; i < nargs; i++)
+		expr->arg[i] = va_arg(ap, struct expression *);
+	va_end(ap);
+
+	return expr;
+}
+#define expression_build(...) \
+	(__expression_build(__VA_ARGS__, NULL))
+
+void expression_free(struct expression *expr)
+{
+	int i;
+
+	for (i = 0; i < expr->nargs; i++)
+		expression_free(expr->arg[i]);
+	if (expr->op->free)
+		expr->op->free(expr);
+	free(expr);
+}
+
+uint64_t expression_evaluate(struct expression *expr)
+{
+	return expr->op->evaluate(expr);
+}
+
+static uint64_t op_eval_constant(struct expression *expr)
+{
+	assert(expr->nargs == 0);
+	return expr->u.constant;
+}
+static struct operator op_constant = {
+	.name = "constant",
+	.evaluate = op_eval_constant,
+};
+struct expression *expression_constant(uint64_t val)
+{
+	struct expression *expr = expression_build(&op_constant);
+
+	expr->u.constant = val;
+	return expr;
+}
+
+#define INT_UNARY_OP(nm, cop) \
+	static uint64_t op_eval_##nm(struct expression *expr) \
+	{ \
+		assert(expr->nargs == 1); \
+		return cop expression_evaluate(expr->arg[0]);	\
+	} \
+	static struct operator op_##nm = { \
+		.name = #cop, \
+		.evaluate = op_eval_##nm, \
+	}; \
+	struct expression *expression_##nm(struct expression *arg)	\
+	{ \
+		return expression_build(&op_##nm, arg);	\
+	}
+
+INT_UNARY_OP(negate, -)
+INT_UNARY_OP(bit_not, ~)
+INT_UNARY_OP(logic_not, !)
+
+#define INT_BINARY_OP(nm, cop) \
+	static uint64_t op_eval_##nm(struct expression *expr) \
+	{ \
+		assert(expr->nargs == 2); \
+		return expression_evaluate(expr->arg[0]) \
+			cop expression_evaluate(expr->arg[1]);	\
+	} \
+	static struct operator op_##nm = { \
+		.name = #cop, \
+		.evaluate = op_eval_##nm, \
+	}; \
+	struct expression *expression_##nm(struct expression *arg1, struct expression *arg2) \
+	{ \
+		return expression_build(&op_##nm, arg1, arg2);	\
+	}
+
+INT_BINARY_OP(mod, %)
+INT_BINARY_OP(div, /)
+INT_BINARY_OP(mul, *)
+
+INT_BINARY_OP(add, +)
+INT_BINARY_OP(sub, -)
+
+INT_BINARY_OP(lshift, <<)
+INT_BINARY_OP(rshift, >>)
+
+INT_BINARY_OP(lt, <)
+INT_BINARY_OP(gt, >)
+INT_BINARY_OP(le, <=)
+INT_BINARY_OP(ge, >=)
+
+INT_BINARY_OP(eq, ==)
+INT_BINARY_OP(ne, !=)
+
+INT_BINARY_OP(bit_and, &)
+INT_BINARY_OP(bit_xor, ^)
+INT_BINARY_OP(bit_or, |)
+
+INT_BINARY_OP(logic_and, &&)
+INT_BINARY_OP(logic_or, ||)
+
+static uint64_t op_eval_conditional(struct expression *expr)
+{
+	assert(expr->nargs == 3);
+	return expression_evaluate(expr->arg[0])
+		? expression_evaluate(expr->arg[1])
+		: expression_evaluate(expr->arg[2]);
+}
+static struct operator op_conditional = {
+	.name = "?:",
+	.evaluate = op_eval_conditional,
+};
+struct expression *expression_conditional(struct expression *arg1, struct expression *arg2,
+					  struct expression *arg3)
+{
+	return expression_build(&op_conditional, arg1, arg2, arg3);
+}
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
