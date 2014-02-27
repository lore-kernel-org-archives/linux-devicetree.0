From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 04/10] Add string and bytestring expression types
Date: Thu, 27 Feb 2014 22:21:33 +1100
Message-ID: <1393500099-28544-5-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Both string and bytestring expression values are represented by a
bytestring internally to handle things like "\0abc".  So, the only real
distinction is that string expressions must evaluate to a bytestring which
has a \0 in the last bye.  For now the only actual "expressions" of these
types are literals, but we'll expand on that later.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 data.c       | 26 ++++++++++++++++--
 dtc-parser.y | 58 +++++++++++++++++++++++++++++++---------
 dtc.h        | 10 +++++++
 expression.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 165 insertions(+), 16 deletions(-)

diff --git a/data.c b/data.c
index 4c50b12..4db1f2f 100644
--- a/data.c
+++ b/data.c
@@ -237,12 +237,17 @@ struct data data_append_align(struct data d, int align)
 	return data_append_zeroes(d, newlen - d.len);
 }
 
-struct data data_add_marker(struct data d, enum markertype type, char *ref)
+static struct data data_add_marker_at(struct data d, enum markertype type,
+				      int offset, char *ref)
 {
 	struct marker *m;
 
+	m = d.markers;
+	for_each_marker(m)
+		assert(m->offset <= offset);
+
 	m = xmalloc(sizeof(*m));
-	m->offset = d.len;
+	m->offset = offset;
 	m->type = type;
 	m->ref = ref;
 	m->next = NULL;
@@ -250,6 +255,11 @@ struct data data_add_marker(struct data d, enum markertype type, char *ref)
 	return data_append_markers(d, m);
 }
 
+struct data data_add_marker(struct data d, enum markertype type, char *ref)
+{
+	return data_add_marker_at(d, type, d.len, ref);
+}
+
 bool data_is_one_string(struct data d)
 {
 	int i;
@@ -267,3 +277,15 @@ bool data_is_one_string(struct data d)
 
 	return true;
 }
+
+struct data data_clone(struct data d)
+{
+	struct data clone = data_copy_mem(d.val, d.len);
+	struct marker *m = d.markers;
+
+	for_each_marker(m)
+		clone = data_add_marker_at(clone, m->type,
+					   m->offset, strdup(m->ref));
+
+	return clone;
+}
diff --git a/dtc-parser.y b/dtc-parser.y
index fbf5f3c..e4df947 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -35,6 +35,8 @@ extern struct boot_info *the_boot_info;
 extern bool treesource_error;
 
 static uint64_t expr_int(struct expression *expr);
+static const char *expr_str(struct expression *expr);
+static struct data expr_bytestring(struct expression *expr);
 
 #define UNOP(loc, op, a)	(expression_##op(&loc, (a)))
 #define BINOP(loc, op, a, b)	(expression_##op(&loc, (a), (b)))
@@ -80,7 +82,7 @@ static uint64_t expr_int(struct expression *expr);
 %type <re> memreserve
 %type <re> memreserves
 %type <array> arrayprefix
-%type <data> bytestring
+%type <data> bytestring_literal
 %type <prop> propdef
 %type <proplist> proplist
 
@@ -209,32 +211,30 @@ propdef:
 	;
 
 propdata:
-	  propdataprefix DT_STRING
+	  propdataprefix expr
 		{
-			$$ = data_merge($1, $2);
+			struct data d = expr_bytestring($2);
+			$$ = data_merge($1, d);
 		}
 	| propdataprefix arrayprefix '>'
 		{
 			$$ = data_merge($1, $2.data);
 		}
-	| propdataprefix '[' bytestring ']'
-		{
-			$$ = data_merge($1, $3);
-		}
 	| propdataprefix DT_REF
 		{
 			$$ = data_add_marker($1, REF_PATH, $2);
 		}
-	| propdataprefix DT_INCBIN '(' DT_STRING ',' expr_prim ',' expr_prim ')'
+	| propdataprefix DT_INCBIN '(' expr_prim ',' expr_prim ',' expr_prim ')'
 		{
-			FILE *f = srcfile_relative_open($4.val, NULL);
+			const char *filename = expr_str($4);
+			FILE *f = srcfile_relative_open(filename, NULL);
 			off_t offset = expr_int($6);
 			struct data d;
 
 			if (offset != 0)
 				if (fseek(f, offset, SEEK_SET) != 0)
 					die("Couldn't seek to offset %llu in \"%s\": %s",
-					    (unsigned long long)offset, $4.val,
+					    (unsigned long long)offset, filename,
 					    strerror(errno));
 
 			d = data_copy_file(f, expr_int($8));
@@ -339,6 +339,14 @@ arrayprefix:
 expr_prim:
 	  DT_LITERAL 		{ $$ = expression_integer_constant(&yylloc, $1); }
 	| DT_CHAR_LITERAL	{ $$ = expression_integer_constant(&yylloc, $1); }
+	| DT_STRING
+		{
+			$$ = expression_string_constant(&yylloc, $1);
+		}
+	| '[' bytestring_literal ']'
+		{
+			$$ = expression_bytestring_constant(&@2, $2);
+		}
 	| '(' expr ')'
 		{
 			$$ = $2;
@@ -422,16 +430,16 @@ expr_unary:
 	| '!' expr_unary { $$ = UNOP(@$, logic_not, $2); }
 	;
 
-bytestring:
+bytestring_literal:
 	  /* empty */
 		{
 			$$ = empty_data;
 		}
-	| bytestring DT_BYTE
+	| bytestring_literal DT_BYTE
 		{
 			$$ = data_append_byte($1, $2);
 		}
-	| bytestring DT_LABEL
+	| bytestring_literal DT_LABEL
 		{
 			$$ = data_add_marker($1, LABEL, $2);
 		}
@@ -487,3 +495,27 @@ static uint64_t expr_int(struct expression *expr)
 	assert(v.type == EXPR_INTEGER);
 	return v.value.integer;
 }
+
+static const char *expr_str(struct expression *expr)
+{
+	struct expression_value v = expression_evaluate(expr, EXPR_STRING);
+
+	if (v.type == EXPR_VOID) {
+		treesource_error = true;
+		return "";
+	}
+	assert(v.type == EXPR_STRING);
+	return v.value.d.val;
+}
+
+static struct data expr_bytestring(struct expression *expr)
+{
+	struct expression_value v = expression_evaluate(expr, EXPR_BYTESTRING);
+
+	if (v.type == EXPR_VOID) {
+		treesource_error = true;
+		return empty_data;
+	}
+	assert(v.type == EXPR_BYTESTRING);
+	return v.value.d;
+}
diff --git a/dtc.h b/dtc.h
index 95ed75e..0b644d2 100644
--- a/dtc.h
+++ b/dtc.h
@@ -120,6 +120,8 @@ struct data data_add_marker(struct data d, enum markertype type, char *ref);
 
 bool data_is_one_string(struct data d);
 
+struct data data_clone(struct data d);
+
 /* DT constraints */
 
 #define MAX_PROPNAME_LEN	31
@@ -226,12 +228,15 @@ struct srcpos;
 enum expr_type {
 	EXPR_VOID = 0, /* Missing or unspecified type */
 	EXPR_INTEGER,
+	EXPR_STRING,
+	EXPR_BYTESTRING,
 };
 
 struct expression_value {
 	enum expr_type type;
 	union {
 		uint64_t integer;
+		struct data d;
 	} value;
 };
 
@@ -252,6 +257,11 @@ struct expression_value expression_evaluate(struct expression *expr,
 struct expression *expression_integer_constant(struct srcpos *pos,
 					       uint64_t val);
 
+struct expression *expression_string_constant(struct srcpos *pos,
+					      struct data d);
+struct expression *expression_bytestring_constant(struct srcpos *pos,
+						  struct data val);
+
 #define DEF_UNARY_OP(nm) \
 	struct expression *expression_##nm(struct srcpos *, \
 					   struct expression *)
diff --git a/expression.c b/expression.c
index a89eea3..4ecd84a 100644
--- a/expression.c
+++ b/expression.c
@@ -29,11 +29,49 @@ static const char *expression_typename(enum expr_type t)
 	case EXPR_INTEGER:
 		return "integer";
 
+	case EXPR_STRING:
+		return "string";
+
+	case EXPR_BYTESTRING:
+		return "bytestring";
+
 	default:
 		assert(0);
 	}
 }
 
+static struct expression_value value_clone(struct expression_value val)
+{
+	struct expression_value clone = val;
+
+	switch (val.type) {
+	case EXPR_STRING:
+	case EXPR_BYTESTRING:
+		clone.value.d = data_clone(val.value.d);
+		break;
+
+	default:
+		/* nothing more to do */
+		;
+	}
+
+	return clone;
+}
+
+static void value_free(struct expression_value val)
+{
+	switch (val.type) {
+	case EXPR_STRING:
+	case EXPR_BYTESTRING:
+		data_free(val.value.d);
+		break;
+
+	default:
+		/* nothing to do */
+		;
+	}
+}
+
 struct operator {
 	const char *name;
 	unsigned nargs;
@@ -106,6 +144,11 @@ struct expression_value expression_evaluate(struct expression *expr,
 {
 	struct expression_value v = expr->op->evaluate(expr, context);
 
+	/* Strings can be promoted to bytestrings */
+	if ((v.type == EXPR_STRING)
+	    && (context == EXPR_BYTESTRING))
+		v.type = EXPR_BYTESTRING;
+
 	if ((context != EXPR_VOID) && (context != v.type))
 		return type_error(expr, "Expected %s expression (found %s)",
 				  expression_typename(context),
@@ -128,15 +171,35 @@ struct expression_value expression_evaluate(struct expression *expr,
 		(_vi) = (_v).value.integer; \
 	} while (0)
 
+#define EVALUATE_STR(_vs, _ex) \
+	do { \
+		struct expression_value _v; \
+		EVALUATE(_v, (_ex), EXPR_STRING); \
+		(_vs) = (_v).value.d; \
+	} while (0)
+
+#define EVALUATE_BS(_vd, _ex) \
+	do { \
+		struct expression_value _v; \
+		EVALUATE(_v, (_ex), EXPR_BYTESTRING); \
+		(_vd) = (_v).value.d; \
+	} while (0)
+
 static struct expression_value op_eval_constant(struct expression *expr,
 						enum expr_type context)
 {
 	assert(expr->nargs == 0);
-	return expr->u.constant;
+	return value_clone(expr->u.constant);
+}
+static void op_free_constant(struct expression *expr)
+{
+	value_free(expr->u.constant);
 }
+
 static struct operator op_constant = {
 	.name = "constant",
 	.evaluate = op_eval_constant,
+	.free = op_free_constant,
 };
 
 static struct expression *__expression_constant(struct srcpos *loc,
@@ -159,6 +222,28 @@ struct expression *expression_integer_constant(struct srcpos *pos,
 	return __expression_constant(pos, v);
 }
 
+struct expression *expression_string_constant(struct srcpos *pos,
+					      struct data val)
+{
+	struct expression_value v = {
+		.type = EXPR_STRING,
+		.value.d = val,
+	};
+
+	return __expression_constant(pos, v);
+}
+
+struct expression *expression_bytestring_constant(struct srcpos *pos,
+						  struct data val)
+{
+	struct expression_value v = {
+		.type = EXPR_BYTESTRING,
+		.value.d = val,
+	};
+
+	return __expression_constant(pos, v);
+}
+
 #define INT_UNARY_OP(nm, cop) \
 	static struct expression_value op_eval_##nm(struct expression *expr, \
 						    enum expr_type context) \
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
