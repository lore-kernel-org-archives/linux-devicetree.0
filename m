From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 03/10] Add type information to expression trees
Date: Thu, 27 Feb 2014 22:21:32 +1100
Message-ID: <1393500099-28544-4-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This implements a rudimentary dynamic typing system for dtc expressions,
laying the groundwork for expressions of multiple types (e.g. string,
bytestring).  For now, we don't actually implement any types beyond
integer, though.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y |  19 ++++++-----
 dtc.h        |  20 +++++++++--
 expression.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 123 insertions(+), 25 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index c5522e3..fbf5f3c 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -128,8 +128,7 @@ memreserves:
 memreserve:
 	  DT_MEMRESERVE expr_prim expr_prim ';'
 		{
-			$$ = build_reserve_entry(expr_int($2),
-						 expr_int($3));
+			$$ = build_reserve_entry(expr_int($2), expr_int($3));
 		}
 	| DT_LABEL memreserve
 		{
@@ -338,8 +337,8 @@ arrayprefix:
 	;
 
 expr_prim:
-	  DT_LITERAL 		{ $$ = expression_constant(&yylloc, $1); }
-	| DT_CHAR_LITERAL	{ $$ = expression_constant(&yylloc, $1); }
+	  DT_LITERAL 		{ $$ = expression_integer_constant(&yylloc, $1); }
+	| DT_CHAR_LITERAL	{ $$ = expression_integer_constant(&yylloc, $1); }
 	| '(' expr ')'
 		{
 			$$ = $2;
@@ -479,8 +478,12 @@ void yyerror(char const *s)
 
 static uint64_t expr_int(struct expression *expr)
 {
-	uint64_t val;
-	val = expression_evaluate(expr);
-	expression_free(expr);
-	return val;
+	struct expression_value v = expression_evaluate(expr, EXPR_INTEGER);
+
+	if (v.type == EXPR_VOID) {
+		treesource_error = true;
+		return -1;
+	}
+	assert(v.type == EXPR_INTEGER);
+	return v.value.integer;
 }
diff --git a/dtc.h b/dtc.h
index fed9d2d..95ed75e 100644
--- a/dtc.h
+++ b/dtc.h
@@ -223,20 +223,34 @@ uint32_t guess_boot_cpuid(struct node *tree);
 struct operator;
 struct srcpos;
 
+enum expr_type {
+	EXPR_VOID = 0, /* Missing or unspecified type */
+	EXPR_INTEGER,
+};
+
+struct expression_value {
+	enum expr_type type;
+	union {
+		uint64_t integer;
+	} value;
+};
+
 struct expression {
 	struct srcpos *loc;
 	struct operator *op;
 	int nargs;
 	union {
-		uint64_t constant;
+		struct expression_value constant;
 	} u;
 	struct expression *arg[0];
 };
 
 void expression_free(struct expression *expr);
-uint64_t expression_evaluate(struct expression *expr);
+struct expression_value expression_evaluate(struct expression *expr,
+					    enum expr_type context);
 
-struct expression *expression_constant(struct srcpos *pos, uint64_t val);
+struct expression *expression_integer_constant(struct srcpos *pos,
+					       uint64_t val);
 
 #define DEF_UNARY_OP(nm) \
 	struct expression *expression_##nm(struct srcpos *, \
diff --git a/expression.c b/expression.c
index 05d0df5..a89eea3 100644
--- a/expression.c
+++ b/expression.c
@@ -20,10 +20,25 @@
 #include "srcpos.h"
 #include "dtc.h"
 
+static const char *expression_typename(enum expr_type t)
+{
+	switch (t) {
+	case EXPR_VOID:
+		return "void";
+
+	case EXPR_INTEGER:
+		return "integer";
+
+	default:
+		assert(0);
+	}
+}
+
 struct operator {
 	const char *name;
 	unsigned nargs;
-	uint64_t (*evaluate)(struct expression *);
+	struct expression_value (*evaluate)(struct expression *,
+					    enum expr_type context);
 	void (*free)(struct expression *);
 };
 
@@ -70,12 +85,51 @@ void expression_free(struct expression *expr)
 	free(expr);
 }
 
-uint64_t expression_evaluate(struct expression *expr)
+static struct expression_value type_error(struct expression *expr,
+					  const char *fmt, ...)
+{
+	static const struct expression_value v = {
+		.type = EXPR_VOID,
+	};
+
+	va_list(ap);
+
+	va_start(ap, fmt);
+	srcpos_verror(expr->loc, "Type error", fmt, ap);
+	va_end(ap);
+
+	return v;
+}
+
+struct expression_value expression_evaluate(struct expression *expr,
+					    enum expr_type context)
 {
-	return expr->op->evaluate(expr);
+	struct expression_value v = expr->op->evaluate(expr, context);
+
+	if ((context != EXPR_VOID) && (context != v.type))
+		return type_error(expr, "Expected %s expression (found %s)",
+				  expression_typename(context),
+				  expression_typename(v.type));
+
+	return v;
 }
 
-static uint64_t op_eval_constant(struct expression *expr)
+#define EVALUATE(_v, _ex, _ctx) \
+	do { \
+		(_v) = expression_evaluate((_ex), (_ctx)); \
+		if ((_v).type == EXPR_VOID) \
+			return (_v); \
+	} while (0)
+
+#define EVALUATE_INT(_vi, _ex) \
+	do { \
+		struct expression_value _v; \
+		EVALUATE(_v, (_ex), EXPR_INTEGER); \
+		(_vi) = (_v).value.integer; \
+	} while (0)
+
+static struct expression_value op_eval_constant(struct expression *expr,
+						enum expr_type context)
 {
 	assert(expr->nargs == 0);
 	return expr->u.constant;
@@ -84,7 +138,9 @@ static struct operator op_constant = {
 	.name = "constant",
 	.evaluate = op_eval_constant,
 };
-struct expression *expression_constant(struct srcpos *loc, uint64_t val)
+
+static struct expression *__expression_constant(struct srcpos *loc,
+						struct expression_value val)
 {
 	struct expression *expr = expression_build(loc, &op_constant);
 
@@ -92,11 +148,27 @@ struct expression *expression_constant(struct srcpos *loc, uint64_t val)
 	return expr;
 }
 
+struct expression *expression_integer_constant(struct srcpos *pos,
+					       uint64_t val)
+{
+	struct expression_value v = {
+		.type = EXPR_INTEGER,
+		.value.integer = val,
+	};
+
+	return __expression_constant(pos, v);
+}
+
 #define INT_UNARY_OP(nm, cop) \
-	static uint64_t op_eval_##nm(struct expression *expr) \
+	static struct expression_value op_eval_##nm(struct expression *expr, \
+						    enum expr_type context) \
 	{ \
+		struct expression_value v = { .type = EXPR_INTEGER, }; \
+		uint64_t arg; \
 		assert(expr->nargs == 1); \
-		return cop expression_evaluate(expr->arg[0]);	\
+		EVALUATE_INT(arg, expr->arg[0]); \
+		v.value.integer = cop arg; \
+		return v; \
 	} \
 	static struct operator op_##nm = { \
 		.name = #cop, \
@@ -113,11 +185,16 @@ INT_UNARY_OP(bit_not, ~)
 INT_UNARY_OP(logic_not, !)
 
 #define INT_BINARY_OP(nm, cop) \
-	static uint64_t op_eval_##nm(struct expression *expr) \
+	static struct expression_value op_eval_##nm(struct expression *expr, \
+						    enum expr_type context) \
 	{ \
+		struct expression_value v = { .type = EXPR_INTEGER, }; \
+		uint64_t arg0, arg1; \
 		assert(expr->nargs == 2); \
-		return expression_evaluate(expr->arg[0]) \
-			cop expression_evaluate(expr->arg[1]);	\
+		EVALUATE_INT(arg0, expr->arg[0]); \
+		EVALUATE_INT(arg1, expr->arg[1]); \
+		v.value.integer = arg0 cop arg1; \
+		return v; \
 	} \
 	static struct operator op_##nm = { \
 		.name = #cop, \
@@ -155,12 +232,16 @@ INT_BINARY_OP(bit_or, |)
 INT_BINARY_OP(logic_and, &&)
 INT_BINARY_OP(logic_or, ||)
 
-static uint64_t op_eval_conditional(struct expression *expr)
+static struct expression_value op_eval_conditional(struct expression *expr,
+						   enum expr_type context)
 {
+	uint64_t cond;
+
 	assert(expr->nargs == 3);
-	return expression_evaluate(expr->arg[0])
-		? expression_evaluate(expr->arg[1])
-		: expression_evaluate(expr->arg[2]);
+	EVALUATE_INT(cond, expr->arg[0]);
+
+	return cond ? expression_evaluate(expr->arg[1], context)
+		: expression_evaluate(expr->arg[2], context);
 }
 static struct operator op_conditional = {
 	.name = "?:",
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
