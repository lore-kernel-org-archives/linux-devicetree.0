From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 05/10] Integrate /incbin/ with expanded expressions
Date: Thu, 27 Feb 2014 22:21:34 +1100
Message-ID: <1393500099-28544-6-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implement /incbin/ as a new type of bytestring expression operator.  This
delays the evaluation of the /incbin/'s parameters until the evaluation
of the /incbin/ itself.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc-parser.y | 56 +++++++++++++++-----------------------------------------
 dtc.h        |  4 ++++
 expression.c | 41 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index e4df947..07cb067 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -35,7 +35,6 @@ extern struct boot_info *the_boot_info;
 extern bool treesource_error;
 
 static uint64_t expr_int(struct expression *expr);
-static const char *expr_str(struct expression *expr);
 static struct data expr_bytestring(struct expression *expr);
 
 #define UNOP(loc, op, a)	(expression_##op(&loc, (a)))
@@ -91,6 +90,7 @@ static struct data expr_bytestring(struct expression *expr);
 %type <node> subnode
 %type <nodelist> subnodes
 
+%type <expr> expr_incbin
 %type <expr> expr_prim
 %type <expr> expr_unary
 %type <expr> expr_mul
@@ -224,34 +224,6 @@ propdata:
 		{
 			$$ = data_add_marker($1, REF_PATH, $2);
 		}
-	| propdataprefix DT_INCBIN '(' expr_prim ',' expr_prim ',' expr_prim ')'
-		{
-			const char *filename = expr_str($4);
-			FILE *f = srcfile_relative_open(filename, NULL);
-			off_t offset = expr_int($6);
-			struct data d;
-
-			if (offset != 0)
-				if (fseek(f, offset, SEEK_SET) != 0)
-					die("Couldn't seek to offset %llu in \"%s\": %s",
-					    (unsigned long long)offset, filename,
-					    strerror(errno));
-
-			d = data_copy_file(f, expr_int($8));
-
-			$$ = data_merge($1, d);
-			fclose(f);
-		}
-	| propdataprefix DT_INCBIN '(' DT_STRING ')'
-		{
-			FILE *f = srcfile_relative_open($4.val, NULL);
-			struct data d = empty_data;
-
-			d = data_copy_file(f, -1);
-
-			$$ = data_merge($1, d);
-			fclose(f);
-		}
 	| propdata DT_LABEL
 		{
 			$$ = data_add_marker($1, LABEL, $2);
@@ -336,6 +308,19 @@ arrayprefix:
 		}
 	;
 
+expr_incbin:
+	  DT_INCBIN '(' expr_conditional ',' expr_conditional ',' expr_conditional ')'
+		{
+			$$ = expression_incbin(&@$, $3, $5, $7);
+		}
+	| DT_INCBIN '(' expr_conditional ')'
+		{
+			$$ = expression_incbin(&@$, $3,
+					       expression_integer_constant(NULL, 0),
+					       expression_integer_constant(NULL, -1));
+		}
+	;
+
 expr_prim:
 	  DT_LITERAL 		{ $$ = expression_integer_constant(&yylloc, $1); }
 	| DT_CHAR_LITERAL	{ $$ = expression_integer_constant(&yylloc, $1); }
@@ -347,6 +332,7 @@ expr_prim:
 		{
 			$$ = expression_bytestring_constant(&@2, $2);
 		}
+	| expr_incbin
 	| '(' expr ')'
 		{
 			$$ = $2;
@@ -496,18 +482,6 @@ static uint64_t expr_int(struct expression *expr)
 	return v.value.integer;
 }
 
-static const char *expr_str(struct expression *expr)
-{
-	struct expression_value v = expression_evaluate(expr, EXPR_STRING);
-
-	if (v.type == EXPR_VOID) {
-		treesource_error = true;
-		return "";
-	}
-	assert(v.type == EXPR_STRING);
-	return v.value.d.val;
-}
-
 static struct data expr_bytestring(struct expression *expr)
 {
 	struct expression_value v = expression_evaluate(expr, EXPR_BYTESTRING);
diff --git a/dtc.h b/dtc.h
index 0b644d2..2ab4ba4 100644
--- a/dtc.h
+++ b/dtc.h
@@ -305,6 +305,10 @@ struct expression *expression_conditional(struct srcpos *pos,
 					  struct expression *,
 					  struct expression *,
 					  struct expression *);
+struct expression *expression_incbin(struct srcpos *loc,
+				     struct expression *file,
+				     struct expression *off,
+				     struct expression *len);
 
 /* Boot info (tree plus memreserve information */
 
diff --git a/expression.c b/expression.c
index 4ecd84a..49bc8b0 100644
--- a/expression.c
+++ b/expression.c
@@ -339,3 +339,44 @@ struct expression *expression_conditional(struct srcpos *loc,
 {
 	return expression_build(loc, &op_conditional, arg1, arg2, arg3);
 }
+
+
+static struct expression_value op_eval_incbin(struct expression *expr,
+					      enum expr_type context)
+{
+	struct data filename;
+	uint64_t offset, len;
+	FILE *f;
+	struct expression_value v = {
+		.type = EXPR_BYTESTRING,
+	};
+
+	EVALUATE_STR(filename, expr->arg[0]);
+	EVALUATE_INT(offset, expr->arg[1]);
+	EVALUATE_INT(len, expr->arg[2]);
+
+	f = srcfile_relative_open(filename.val, NULL);
+
+	if (offset != 0)
+		if (fseek(f, offset, SEEK_SET) != 0)
+			die("Couldn't seek to offset %llu in \"%s\": %s",
+			    (unsigned long long)offset, filename.val,
+			    strerror(errno));
+
+	v.value.d = data_copy_file(f, len);
+
+	fclose(f);
+	return v;
+}
+static struct operator op_incbin = {
+	.name = "/incbin/",
+	.nargs = 3,
+	.evaluate = op_eval_incbin,
+};
+struct expression *expression_incbin(struct srcpos *loc,
+				     struct expression *file,
+				     struct expression *off,
+				     struct expression *len)
+{
+	return expression_build(loc, &op_incbin, file, off, len);
+}
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
