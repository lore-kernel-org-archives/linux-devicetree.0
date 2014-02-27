From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 06/10] Implement arrays as expressions
Date: Thu, 27 Feb 2014 22:21:35 +1100
Message-ID: <1393500099-28544-7-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This implements dtc's < ... > array syntax in terms of the new expression
infrastructure.  Internally this uses two operator types, one to convert
an integer expression to a bytestring expression and another to append
multiple bytestring expressions together.

phandle references require some fiddling.  These are implemented by using a
constant bytestring expression containing a placeholder plus the marker
to substitute in the correct phandle later.  Logically it would be neater
for an integer expression itself to expand to the right phandle value, but
we can't do that just yet since the tree's phandle values aren't all
resolved at the time we evaluate expressions.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 60 +++++++++++++++++++++++++++++-------------------------------
 dtc.h        |  6 ++++++
 expression.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 31 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index 07cb067..fcc3b4d 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -48,8 +48,8 @@ static struct data expr_bytestring(struct expression *expr);
 	struct data data;
 
 	struct {
-		struct data	data;
-		int		bits;
+		int bits;
+		struct expression *expr;
 	} array;
 
 	struct property *prop;
@@ -80,6 +80,7 @@ static struct data expr_bytestring(struct expression *expr);
 %type <data> propdataprefix
 %type <re> memreserve
 %type <re> memreserves
+%type <array> array
 %type <array> arrayprefix
 %type <data> bytestring_literal
 %type <prop> propdef
@@ -216,10 +217,6 @@ propdata:
 			struct data d = expr_bytestring($2);
 			$$ = data_merge($1, d);
 		}
-	| propdataprefix arrayprefix '>'
-		{
-			$$ = data_merge($1, $2.data);
-		}
 	| propdataprefix DT_REF
 		{
 			$$ = data_add_marker($1, REF_PATH, $2);
@@ -245,6 +242,10 @@ propdataprefix:
 		}
 	;
 
+array:
+	  arrayprefix '>'	{ $$ = $1; }
+	;
+
 arrayprefix:
 	DT_BITS DT_LITERAL '<'
 		{
@@ -259,52 +260,48 @@ arrayprefix:
 				bits = 32;
 			}
 
-			$$.data = empty_data;
 			$$.bits = bits;
+			$$.expr = expression_bytestring_constant(&@$, empty_data);
 		}
 	| '<'
 		{
-			$$.data = empty_data;
 			$$.bits = 32;
+			$$.expr = expression_bytestring_constant(&@$, empty_data);
 		}
 	| arrayprefix expr_prim
 		{
-			uint64_t val = expr_int($2);
-
-			if ($1.bits < 64) {
-				uint64_t mask = (1ULL << $1.bits) - 1;
-				/*
-				 * Bits above mask must either be all zero
-				 * (positive within range of mask) or all one
-				 * (negative and sign-extended). The second
-				 * condition is true if when we set all bits
-				 * within the mask to one (i.e. | in the
-				 * mask), all bits are one.
-				 */
-				if ((val > mask) && ((val | mask) != -1ULL))
-					ERROR(&@2, "Value out of range for"
-					      " %d-bit array element", $1.bits);
-			}
-
-			$$.data = data_append_integer($1.data, val, $1.bits);
+			struct expression *cell = expression_arraycell(&@2,
+								       $1.bits,
+								       $2);
+			$$.bits = $1.bits;
+			$$.expr = expression_join(&@$, $1.expr, cell);
 		}
 	| arrayprefix DT_REF
 		{
 			uint64_t val = ~0ULL >> (64 - $1.bits);
+			struct data d = empty_data;
+			struct expression *cell;
 
 			if ($1.bits == 32)
-				$1.data = data_add_marker($1.data,
-							  REF_PHANDLE,
-							  $2);
+				d = data_add_marker(d, REF_PHANDLE, $2);
 			else
 				ERROR(&@2, "References are only allowed in "
 					    "arrays with 32-bit elements.");
 
-			$$.data = data_append_integer($1.data, val, $1.bits);
+			d = data_append_integer(d, val, $1.bits);
+			cell = expression_bytestring_constant(&@2, d);
+
+			$$.bits = $1.bits;
+			$$.expr = expression_join(&@$, $1.expr, cell);
 		}
 	| arrayprefix DT_LABEL
 		{
-			$$.data = data_add_marker($1.data, LABEL, $2);
+			struct data d = data_add_marker(empty_data, LABEL, $2);
+			struct expression *label;
+
+			label = expression_bytestring_constant(&@2, d);
+			$$.bits = $1.bits;
+			$$.expr = expression_join(&@$, $1.expr, label);
 		}
 	;
 
@@ -333,6 +330,7 @@ expr_prim:
 			$$ = expression_bytestring_constant(&@2, $2);
 		}
 	| expr_incbin
+	| array			{ $$ = $1.expr; }
 	| '(' expr ')'
 		{
 			$$ = $2;
diff --git a/dtc.h b/dtc.h
index 2ab4ba4..d270626 100644
--- a/dtc.h
+++ b/dtc.h
@@ -246,6 +246,7 @@ struct expression {
 	int nargs;
 	union {
 		struct expression_value constant;
+		int bits;
 	} u;
 	struct expression *arg[0];
 };
@@ -309,6 +310,11 @@ struct expression *expression_incbin(struct srcpos *loc,
 				     struct expression *file,
 				     struct expression *off,
 				     struct expression *len);
+struct expression *expression_arraycell(struct srcpos *loc, int bits,
+					struct expression *cell);
+struct expression *expression_join(struct srcpos *loc,
+				   struct expression *arg0,
+				   struct expression *arg1);
 
 /* Boot info (tree plus memreserve information */
 
diff --git a/expression.c b/expression.c
index 49bc8b0..8d6474b 100644
--- a/expression.c
+++ b/expression.c
@@ -380,3 +380,57 @@ struct expression *expression_incbin(struct srcpos *loc,
 {
 	return expression_build(loc, &op_incbin, file, off, len);
 }
+
+static struct expression_value op_eval_arraycell(struct expression *expr,
+						 enum expr_type context)
+{
+	uint64_t cellval;
+	struct expression_value v = {
+		.type = EXPR_BYTESTRING,
+	};
+	int bits = expr->u.bits;
+
+	assert(expr->nargs == 1);
+	EVALUATE_INT(cellval, expr->arg[0]);
+
+	v.value.d = data_append_integer(empty_data, cellval, bits);
+	return v;
+}
+static struct operator op_arraycell = {
+	.name = "< >",
+	.evaluate = op_eval_arraycell,
+};
+struct expression *expression_arraycell(struct srcpos *loc, int bits,
+					struct expression *cell)
+{
+	struct expression *expr = expression_build(loc, &op_arraycell, cell);
+
+	expr->u.bits = bits;
+	return expr;
+}
+
+static struct expression_value op_eval_join(struct expression *expr,
+					    enum expr_type context)
+{
+	struct data arg0, arg1;
+	struct expression_value v = {
+		.type = EXPR_BYTESTRING,
+	};
+
+	assert(expr->nargs == 2);
+	EVALUATE_BS(arg0, expr->arg[0]);
+	EVALUATE_BS(arg1, expr->arg[1]);
+
+	v.value.d = data_merge(arg0, arg1);
+	return v;
+}
+static struct operator op_join = {
+	.name = ",",
+	.evaluate = op_eval_join,
+};
+struct expression *expression_join(struct srcpos *loc,
+				   struct expression *arg0,
+				   struct expression *arg1)
+{
+	return expression_build(loc, &op_join, arg0, arg1);
+}
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
