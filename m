From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH 10/10] Implement string concatenate and repeat operators
Date: Thu, 27 Feb 2014 22:21:39 +1100
Message-ID: <1393500099-28544-11-git-send-email-david@gibson.dropbear.id.au>
References: <1393500099-28544-1-git-send-email-david@gibson.dropbear.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393500099-28544-1-git-send-email-david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch exercises the new expression infrastructure to implement syntax
to concatenate and repeat strings.  We use syntax inspired by Python,
with '+' overloaded for string concatenation and '*' overloaded for string
repeat.  Normally we'd use C syntax to inspire dts syntax, but C has no
obvious candidates for these string operators.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 dtc.h                      |   4 ++
 expression.c               | 117 ++++++++++++++++++++++++++++++++++++++++++++-
 tests/.gitignore           |   1 +
 tests/Makefile.tests       |   2 +-
 tests/run_tests.sh         |   5 ++
 tests/string-expressions.c |  97 +++++++++++++++++++++++++++++++++++++
 6 files changed, 223 insertions(+), 3 deletions(-)
 create mode 100644 tests/string-expressions.c

diff --git a/dtc.h b/dtc.h
index d270626..d3f8ad0 100644
--- a/dtc.h
+++ b/dtc.h
@@ -302,6 +302,10 @@ DEF_BINARY_OP(logic_and);
 
 DEF_BINARY_OP(logic_or);
 
+struct expression *expression_concat(struct srcpos *pos,
+				     struct expression *arg0,
+				     struct expression *arg1);
+
 struct expression *expression_conditional(struct srcpos *pos,
 					  struct expression *,
 					  struct expression *,
diff --git a/expression.c b/expression.c
index 8d6474b..2b86fed 100644
--- a/expression.c
+++ b/expression.c
@@ -294,9 +294,7 @@ INT_UNARY_OP(logic_not, !)
 
 INT_BINARY_OP(mod, %)
 INT_BINARY_OP(div, /)
-INT_BINARY_OP(mul, *)
 
-INT_BINARY_OP(add, +)
 INT_BINARY_OP(sub, -)
 
 INT_BINARY_OP(lshift, <<)
@@ -317,6 +315,121 @@ INT_BINARY_OP(bit_or, |)
 INT_BINARY_OP(logic_and, &&)
 INT_BINARY_OP(logic_or, ||)
 
+/*
+ * We need to write out add and mul in full, since they can be used on
+ * both integer and string arguments with different meanings
+ */
+
+static struct expression_value op_eval_mul(struct expression *expr,
+					   enum expr_type context)
+{
+	struct expression_value arg0, arg1;
+	struct expression_value v;
+	uint64_t n, i;
+	struct data s;
+	struct data d = empty_data;
+
+	assert(expr->nargs == 2);
+	EVALUATE(arg0, expr->arg[0], EXPR_VOID);
+	EVALUATE(arg1, expr->arg[1], EXPR_VOID);
+
+	if ((arg0.type == EXPR_INTEGER) && (arg1.type == EXPR_INTEGER)) {
+		v.type = EXPR_INTEGER;
+		v.value.integer = arg0.value.integer * arg1.value.integer;
+		return v;
+	} else if ((arg0.type != EXPR_INTEGER) && (arg0.type != EXPR_STRING)) {
+		return type_error(expr->arg[0], "Expected integer or string"
+				  " expression (found %s)",
+				  expression_typename(arg0.type));
+	} else if (arg0.type == EXPR_INTEGER) {
+		if (arg1.type != EXPR_STRING)
+			return type_error(expr->arg[1], "Expected string"
+					  " expression (found %s)",
+					  expression_typename(arg1.type));
+		n = arg0.value.integer; 
+		s = arg1.value.d;
+	} else {
+		assert(arg0.type == EXPR_STRING);
+		if (arg1.type != EXPR_INTEGER)
+			return type_error(expr->arg[1], "Expected integer"
+					  " expression (found %s)",
+					  expression_typename(arg1.type));
+		n = arg1.value.integer;
+		s = arg0.value.d;
+	}
+
+	for (i = 0; i < n; i++)
+		d = data_append_data(d, s.val, s.len - 1);
+
+	v.type = EXPR_STRING;
+	v.value.d = data_append_byte(d, 0); /* Terminating \0 */
+
+	return v;
+}
+static struct operator op_mul = {
+	.name = "*",
+	.evaluate = op_eval_mul,
+};
+struct expression *expression_mul(struct srcpos *loc,
+				  struct expression *arg0,
+				  struct expression *arg1)
+{
+	return expression_build(loc, &op_mul, arg0, arg1);
+}
+
+static struct expression_value op_eval_add(struct expression *expr,
+					   enum expr_type context)
+{
+	struct expression_value arg0, arg1;
+	struct expression_value v;
+
+	assert(expr->nargs == 2);
+	EVALUATE(arg0, expr->arg[0], EXPR_VOID);
+	EVALUATE(arg1, expr->arg[1], EXPR_VOID);
+	if ((arg0.type != EXPR_INTEGER) && (arg0.type != EXPR_STRING))
+		return type_error(expr->arg[0], "Expected integer or string"
+				  " expression (found %s)",
+				  expression_typename(arg0.type));
+	if ((arg1.type != EXPR_INTEGER) && (arg1.type != EXPR_STRING))
+		return type_error(expr->arg[0], "Expected integer or string"
+				  " expression (found %s)",
+				  expression_typename(arg1.type));
+
+	if (arg0.type != arg1.type)
+		return type_error(expr, "Operand types to + (%s, %s) don't match",
+				  expression_typename(arg0.type),
+				  expression_typename(arg1.type));
+
+	v.type = arg0.type;
+
+	switch (v.type) {
+	case EXPR_INTEGER:
+		v.value.integer = arg0.value.integer + arg1.value.integer;
+		break;
+
+	case EXPR_STRING:
+		v.value.d = data_copy_mem(arg0.value.d.val,
+					  arg0.value.d.len - 1);
+		v.value.d = data_append_data(v.value.d, arg1.value.d.val,
+					     arg1.value.d.len);
+		break;
+
+	default:
+		assert(0);
+	}
+	return v;
+}
+static struct operator op_add = {
+	.name = "+",
+	.evaluate = op_eval_add,
+};
+struct expression *expression_add(struct srcpos *loc,
+				  struct expression *arg0,
+				  struct expression *arg1)
+{
+	return expression_build(loc, &op_add, arg0, arg1);
+}
+
 static struct expression_value op_eval_conditional(struct expression *expr,
 						   enum expr_type context)
 {
diff --git a/tests/.gitignore b/tests/.gitignore
index bb5e33a..7931067 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -48,6 +48,7 @@ tmp.*
 /setprop_inplace
 /sized_cells
 /string_escapes
+/string-expressions
 /subnode_iterate
 /subnode_offset
 /supernode_atdepth_offset
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index dafb618..fa4e2d2 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -20,7 +20,7 @@ LIB_TESTS_L = get_mem_rsv \
 	dtb_reverse dtbs_equal_unordered \
 	add_subnode_with_nops path_offset_aliases \
 	utilfdt_test \
-	integer-expressions \
+	integer-expressions string-expressions \
 	subnode_iterate
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 97e016b..44de059 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -446,6 +446,11 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o integer-expressions.test.dtb integer-expressions.test.dts
     run_test integer-expressions integer-expressions.test.dtb
 
+    # Check string expresisons
+    run_test string-expressions -g string-expressions.test.dts
+    run_dtc_test -I dts -O dtb -o string-expressions.test.dtb string-expressions.test.dts
+    run_test string-expressions string-expressions.test.dtb
+
     # Check for graceful failure in some error conditions
     run_sh_test dtc-fatal.sh -I dts -O dtb nosuchfile.dts
     run_sh_test dtc-fatal.sh -I dtb -O dtb nosuchfile.dtb
diff --git a/tests/string-expressions.c b/tests/string-expressions.c
new file mode 100644
index 0000000..da6854f
--- /dev/null
+++ b/tests/string-expressions.c
@@ -0,0 +1,97 @@
+/*
+ * Testcase for dtc string expression support
+ *
+ * Copyright (C) 2013 David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public License
+ * as published by the Free Software Foundation; either version 2.1 of
+ * the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+#include <errno.h>
+
+
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+struct test_expr {
+	const char *expr;
+	const char *result;
+} expr_table[] = {
+#define TE(expr, res)	{ #expr, (res) }
+	TE("hello", "hello"),
+	TE("hello " + "world", "hello world"),
+	TE("hello" + " " + "world", "hello world"),
+	TE("hello" * 2 + " world", "hellohello world"),
+	TE("hello " + 2 * "world", "hello worldworld"),
+	TE(("hello"), "hello"),
+	TE(0 ? "hello" : "goodbye", "goodbye"),
+	TE(1 ? "hello" : "goodbye", "hello"),
+};
+
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	const char *res;
+	int reslen;
+	int i;
+
+	test_init(argc, argv);
+
+	if ((argc == 3) && (strcmp(argv[1], "-g") == 0)) {
+		FILE *f = fopen(argv[2], "w");
+
+		if (!f)
+			FAIL("Couldn't open \"%s\" for output: %s\n",
+			     argv[2], strerror(errno));
+
+		fprintf(f, "/dts-v1/;\n");
+		fprintf(f, "/ {\n");
+		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
+			fprintf(f, "\texpression-%d = %s;\n", i,
+				expr_table[i].expr);
+		fprintf(f, "};\n");
+		fclose(f);
+	} else {
+		fdt = load_blob_arg(argc, argv);
+
+		for (i = 0; i < ARRAY_SIZE(expr_table); i++) {
+			char propname[16];
+			int len = strlen(expr_table[i].result) + 1;
+
+			sprintf(propname, "expression-%d", i);
+			res = fdt_getprop(fdt, 0, propname, &reslen);
+
+			if (reslen != len)
+				FAIL("Incorrect length for expression %s,"
+				     " %d instead of %d\n",
+				     expr_table[i].expr, reslen, len);
+
+			if (memcmp(res, expr_table[i].result, len) != 0)
+				FAIL("Incorrect result for expression %s,"
+				     " \"%s\" instead of \"%s\"\n",
+				     expr_table[i].expr, res,
+				     expr_table[i].result);
+		}
+	}
+
+	PASS();
+}
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
