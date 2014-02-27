From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 02/10] Add srcpos information to expressions
Date: Thu, 27 Feb 2014 22:21:31 +1100
Message-ID: <1393500099-28544-3-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch allows information about source locations to be attached to
expression structures.  We'll need this information later on in order to
provide reasonable error messages.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 52 ++++++++++++++++++++++++++--------------------------
 dtc.h        | 14 ++++++++++----
 expression.c | 34 ++++++++++++++++++++++------------
 3 files changed, 58 insertions(+), 42 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 5e2348e..c5522e3 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -36,8 +36,8 @@ extern bool treesource_error;
 
 static uint64_t expr_int(struct expression *expr);
 
-#define UNOP(op, a)	(expression_##op((a)))
-#define BINOP(op, a, b)	(expression_##op((a), (b)))
+#define UNOP(loc, op, a)	(expression_##op(&loc, (a)))
+#define BINOP(loc, op, a, b)	(expression_##op(&loc, (a), (b)))
 %}
 
 %union {
@@ -338,8 +338,8 @@ arrayprefix:
 	;
 
 expr_prim:
-	  DT_LITERAL 		{ $$ = expression_constant($1); }
-	| DT_CHAR_LITERAL	{ $$ = expression_constant($1); }
+	  DT_LITERAL 		{ $$ = expression_constant(&yylloc, $1); }
+	| DT_CHAR_LITERAL	{ $$ = expression_constant(&yylloc, $1); }
 	| '(' expr ')'
 		{
 			$$ = $2;
@@ -354,73 +354,73 @@ expr_conditional:
 	  expr_or
 	| expr_or '?' expr ':' expr_conditional
 		{
-			$$ = expression_conditional($1, $3, $5);
+			$$ = expression_conditional(&yylloc, $1, $3, $5);
 		}
 	;
 
 expr_or:
 	  expr_and
-	| expr_or DT_OR expr_and { $$ = BINOP(logic_or, $1, $3); }
+	| expr_or DT_OR expr_and { $$ = BINOP(@$, logic_or, $1, $3); }
 	;
 
 expr_and:
 	  expr_bitor
-	| expr_and DT_AND expr_bitor { $$ = BINOP(logic_and, $1, $3); }
+	| expr_and DT_AND expr_bitor { $$ = BINOP(@$, logic_and, $1, $3); }
 	;
 
 expr_bitor:
 	  expr_bitxor
-	| expr_bitor '|' expr_bitxor { $$ = BINOP(bit_or, $1, $3); }
+	| expr_bitor '|' expr_bitxor { $$ = BINOP(@$, bit_or, $1, $3); }
 	;
 
 expr_bitxor:
 	  expr_bitand
-	| expr_bitxor '^' expr_bitand { $$ = BINOP(bit_xor, $1, $3); }
+	| expr_bitxor '^' expr_bitand { $$ = BINOP(@$, bit_xor, $1, $3); }
 	;
 
 expr_bitand:
 	  expr_eq
-	| expr_bitand '&' expr_eq { $$ = BINOP(bit_and, $1, $3); }
+	| expr_bitand '&' expr_eq { $$ = BINOP(@$, bit_and, $1, $3); }
 	;
 
 expr_eq:
 	  expr_rela
-	| expr_eq DT_EQ expr_rela { $$ = BINOP(eq, $1, $3); }
-	| expr_eq DT_NE expr_rela { $$ = BINOP(ne, $1, $3); }
+	| expr_eq DT_EQ expr_rela { $$ = BINOP(@$, eq, $1, $3); }
+	| expr_eq DT_NE expr_rela { $$ = BINOP(@$, ne, $1, $3); }
 	;
 
 expr_rela:
 	  expr_shift
-	| expr_rela '<' expr_shift { $$ = BINOP(lt, $1, $3); }
-	| expr_rela '>' expr_shift { $$ = BINOP(gt, $1, $3); }
-	| expr_rela DT_LE expr_shift { $$ = BINOP(le, $1, $3); }
-	| expr_rela DT_GE expr_shift { $$ = BINOP(ge, $1, $3); }
+	| expr_rela '<' expr_shift { $$ = BINOP(@$, lt, $1, $3); }
+	| expr_rela '>' expr_shift { $$ = BINOP(@$, gt, $1, $3); }
+	| expr_rela DT_LE expr_shift { $$ = BINOP(@$, le, $1, $3); }
+	| expr_rela DT_GE expr_shift { $$ = BINOP(@$, ge, $1, $3); }
 	;
 
 expr_shift:
-	  expr_shift DT_LSHIFT expr_add { $$ = BINOP(lshift, $1, $3); }
-	| expr_shift DT_RSHIFT expr_add { $$ = BINOP(rshift, $1, $3); }
+	  expr_shift DT_LSHIFT expr_add { $$ = BINOP(@$, lshift, $1, $3); }
+	| expr_shift DT_RSHIFT expr_add { $$ = BINOP(@$, rshift, $1, $3); }
 	| expr_add
 	;
 
 expr_add:
-	  expr_add '+' expr_mul { $$ = BINOP(add, $1, $3); }
-	| expr_add '-' expr_mul { $$ = BINOP(sub, $1, $3); }
+	  expr_add '+' expr_mul { $$ = BINOP(@$, add, $1, $3); }
+	| expr_add '-' expr_mul { $$ = BINOP(@$, sub, $1, $3); }
 	| expr_mul
 	;
 
 expr_mul:
-	  expr_mul '*' expr_unary { $$ = BINOP(mul, $1, $3); }
-	| expr_mul '/' expr_unary { $$ = BINOP(div, $1, $3); }
-	| expr_mul '%' expr_unary { $$ = BINOP(mod, $1, $3); }
+	  expr_mul '*' expr_unary { $$ = BINOP(@$, mul, $1, $3); }
+	| expr_mul '/' expr_unary { $$ = BINOP(@$, div, $1, $3); }
+	| expr_mul '%' expr_unary { $$ = BINOP(@$, mod, $1, $3); }
 	| expr_unary
 	;
 
 expr_unary:
 	  expr_prim
-	| '-' expr_unary { $$ = UNOP(negate, $2); }
-	| '~' expr_unary { $$ = UNOP(bit_not, $2); }
-	| '!' expr_unary { $$ = UNOP(logic_not, $2); }
+	| '-' expr_unary { $$ = UNOP(@$, negate, $2); }
+	| '~' expr_unary { $$ = UNOP(@$, bit_not, $2); }
+	| '!' expr_unary { $$ = UNOP(@$, logic_not, $2); }
 	;
 
 bytestring:
diff --git a/dtc.h b/dtc.h
index c40e9d7..fed9d2d 100644
--- a/dtc.h
+++ b/dtc.h
@@ -221,8 +221,10 @@ uint32_t guess_boot_cpuid(struct node *tree);
 /* Expressions */
 
 struct operator;
+struct srcpos;
 
 struct expression {
+	struct srcpos *loc;
 	struct operator *op;
 	int nargs;
 	union {
@@ -234,16 +236,19 @@ struct expression {
 void expression_free(struct expression *expr);
 uint64_t expression_evaluate(struct expression *expr);
 
-struct expression *expression_constant(uint64_t val);
+struct expression *expression_constant(struct srcpos *pos, uint64_t val);
 
 #define DEF_UNARY_OP(nm) \
-	struct expression *expression_##nm(struct expression *)
+	struct expression *expression_##nm(struct srcpos *, \
+					   struct expression *)
 DEF_UNARY_OP(negate);
 DEF_UNARY_OP(bit_not);
 DEF_UNARY_OP(logic_not);
 
 #define DEF_BINARY_OP(nm) \
-	struct expression *expression_##nm(struct expression *, struct expression *)
+	struct expression *expression_##nm(struct srcpos *, \
+					   struct expression *, \
+					   struct expression *)
 DEF_BINARY_OP(mod);
 DEF_BINARY_OP(div);
 DEF_BINARY_OP(mul);
@@ -272,7 +277,8 @@ DEF_BINARY_OP(logic_and);
 
 DEF_BINARY_OP(logic_or);
 
-struct expression *expression_conditional(struct expression *,
+struct expression *expression_conditional(struct srcpos *pos,
+					  struct expression *,
 					  struct expression *,
 					  struct expression *);
 
diff --git a/expression.c b/expression.c
index dd31a37..05d0df5 100644
--- a/expression.c
+++ b/expression.c
@@ -17,7 +17,7 @@
  *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
  *                                                                   USA
  */
-
+#include "srcpos.h"
 #include "dtc.h"
 
 struct operator {
@@ -27,7 +27,8 @@ struct operator {
 	void (*free)(struct expression *);
 };
 
-static struct expression *__expression_build(struct operator *op, ...)
+static struct expression *__expression_build(struct srcpos *loc,
+					     struct operator *op, ...)
 {
 	int nargs = 0;
 	struct expression *expr;
@@ -43,6 +44,10 @@ static struct expression *__expression_build(struct operator *op, ...)
 	expr = xmalloc(sizeof(*expr) + nargs*sizeof(struct expression *));
 	expr->op = op;
 	expr->nargs = nargs;
+	if (loc)
+		expr->loc = srcpos_copy(loc);
+	else
+		expr->loc = NULL;
 
 	va_start(ap, op);
 	for (i = 0; i < nargs; i++)
@@ -51,8 +56,8 @@ static struct expression *__expression_build(struct operator *op, ...)
 
 	return expr;
 }
-#define expression_build(...) \
-	(__expression_build(__VA_ARGS__, NULL))
+#define expression_build(loc, ...)		\
+	(__expression_build(loc, __VA_ARGS__, NULL))
 
 void expression_free(struct expression *expr)
 {
@@ -79,9 +84,9 @@ static struct operator op_constant = {
 	.name = "constant",
 	.evaluate = op_eval_constant,
 };
-struct expression *expression_constant(uint64_t val)
+struct expression *expression_constant(struct srcpos *loc, uint64_t val)
 {
-	struct expression *expr = expression_build(&op_constant);
+	struct expression *expr = expression_build(loc, &op_constant);
 
 	expr->u.constant = val;
 	return expr;
@@ -97,9 +102,10 @@ struct expression *expression_constant(uint64_t val)
 		.name = #cop, \
 		.evaluate = op_eval_##nm, \
 	}; \
-	struct expression *expression_##nm(struct expression *arg)	\
+	struct expression *expression_##nm(struct srcpos *loc, \
+					   struct expression *arg) \
 	{ \
-		return expression_build(&op_##nm, arg);	\
+		return expression_build(loc, &op_##nm, arg);	\
 	}
 
 INT_UNARY_OP(negate, -)
@@ -117,9 +123,11 @@ INT_UNARY_OP(logic_not, !)
 		.name = #cop, \
 		.evaluate = op_eval_##nm, \
 	}; \
-	struct expression *expression_##nm(struct expression *arg1, struct expression *arg2) \
+	struct expression *expression_##nm(struct srcpos *loc, \
+					   struct expression *arg1, \
+					   struct expression *arg2) \
 	{ \
-		return expression_build(&op_##nm, arg1, arg2);	\
+		return expression_build(loc, &op_##nm, arg1, arg2);	\
 	}
 
 INT_BINARY_OP(mod, %)
@@ -158,8 +166,10 @@ static struct operator op_conditional = {
 	.name = "?:",
 	.evaluate = op_eval_conditional,
 };
-struct expression *expression_conditional(struct expression *arg1, struct expression *arg2,
+struct expression *expression_conditional(struct srcpos *loc,
+					  struct expression *arg1,
+					  struct expression *arg2,
 					  struct expression *arg3)
 {
-	return expression_build(&op_conditional, arg1, arg2, arg3);
+	return expression_build(loc, &op_conditional, arg1, arg2, arg3);
 }
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
