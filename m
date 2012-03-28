From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2] dtc: Basic integer expressions
Date: Tue, 27 Mar 2012 20:24:43 -0600
Message-ID: <1332901483-3751-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Written by David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>. Additions by me:
* Ported to ToT dtc.
* Renamed cell to integer throughout.
* Implemented value range checks.
* Allow L/UL/LL/ULL suffix on literals.
* Enabled the commented test.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
v2:
* s/cell/integer/ throughout.
* Allow signed-extended values to pass the overall cell range check.
* Allow L/UL/LL/ULL suffix on literals. This is purely for compatibility
  with C, and has no effect on dtc's processing.
* Enabled the 3 disabled tests.

I'm not sure if the literal suffix handling is hacky or not...

 dtc-lexer.l                 |   11 +++-
 dtc-parser.y                |  131 ++++++++++++++++++++++++++++++++++++++++---
 tests/Makefile.tests        |    3 +-
 tests/integer-expressions.c |  117 ++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh          |    5 ++
 5 files changed, 256 insertions(+), 11 deletions(-)
 create mode 100644 tests/integer-expressions.c

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 73d190c..0dbbbd5 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -110,7 +110,7 @@ static int pop_input_file(void);
 			return DT_LABEL;
 		}
 
-<V1>[0-9]+|0[xX][0-9a-fA-F]+      {
+<V1>([0-9]+|0[xX][0-9a-fA-F]+)(L|UL|LL|ULL)? {
 			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
 			return DT_LITERAL;
@@ -164,6 +164,15 @@ static int pop_input_file(void);
 <*>{COMMENT}+	/* eat C-style comments */
 <*>{LINECOMMENT}+ /* eat C++-style comments */
 
+<*>"<<"		{ return DT_LSHIFT; };
+<*>">>"		{ return DT_RSHIFT; };
+<*>"<="		{ return DT_LE; };
+<*>">="		{ return DT_GE; };
+<*>"=="		{ return DT_EQ; };
+<*>"!="		{ return DT_NE; };
+<*>"&&"		{ return DT_AND; };
+<*>"||"		{ return DT_OR; };
+
 <*>.		{
 			DPRINT("Char: %c (\\x%02x)\n", yytext[0],
 				(unsigned)yytext[0]);
diff --git a/dtc-parser.y b/dtc-parser.y
index 348616b..19db90e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -56,10 +56,12 @@ static unsigned char eval_char_literal(const char *s);
 	struct node *node;
 	struct node *nodelist;
 	struct reserve_info *re;
+	uint64_t integer;
 }
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
@@ -86,6 +88,21 @@ static unsigned char eval_char_literal(const char *s);
 %type <node> subnode
 %type <nodelist> subnodes
 
+%type <integer> integer_prim
+%type <integer> integer_unary
+%type <integer> integer_mul
+%type <integer> integer_add
+%type <integer> integer_shift
+%type <integer> integer_rela
+%type <integer> integer_eq
+%type <integer> integer_bitand
+%type <integer> integer_bitxor
+%type <integer> integer_bitor
+%type <integer> integer_and
+%type <integer> integer_or
+%type <integer> integer_trinary
+%type <integer> integer_expr
+
 %%
 
 sourcefile:
@@ -267,17 +284,17 @@ arrayprefix:
 			$$.data = empty_data;
 			$$.bits = 32;
 		}
-	| arrayprefix DT_LITERAL
-		{
-			uint64_t val = eval_literal($2, 0, $1.bits);
-
-			$$.data = data_append_integer($1.data, val, $1.bits);
-		}
-	| arrayprefix DT_CHAR_LITERAL
+	| arrayprefix integer_prim
 		{
-			uint64_t val = eval_char_literal($2);
+			if ($1.bits < 64) {
+				uint64_t mask = (1ULL << $1.bits) - 1;
+				if (($2 > mask) && (($2 | mask) != -1ULL))
+					print_error(
+						"integer value out of range "
+						"%016lx (%d bits)", $1.bits);
+			}
 
-			$$.data = data_append_integer($1.data, val, $1.bits);
+			$$.data = data_append_integer($1.data, $2, $1.bits);
 		}
 	| arrayprefix DT_REF
 		{
@@ -299,6 +316,95 @@ arrayprefix:
 		}
 	;
 
+integer_prim:
+	  DT_LITERAL
+		{
+			$$ = eval_literal($1, 0, 64);
+		}
+	| DT_CHAR_LITERAL
+		{
+			$$ = eval_char_literal($1);
+		}
+	| '(' integer_expr ')'
+		{
+			$$ = $2;
+		}
+	;
+
+integer_expr:
+	integer_trinary
+	;
+
+integer_trinary:
+	  integer_or
+	| integer_or '?' integer_expr ':' integer_trinary { $$ = $1 ? $3 : $5 }
+	;
+
+integer_or:
+	  integer_and
+	| integer_or DT_OR integer_and { $$ = $1 || $3 };
+	;
+
+integer_and:
+	  integer_bitor
+	| integer_and DT_AND integer_bitor { $$ = $1 && $3 };
+	;
+
+integer_bitor:
+	  integer_bitxor
+	| integer_bitor '|' integer_bitxor { $$ = $1 | $3 };
+	;
+
+integer_bitxor:
+	  integer_bitand
+	| integer_bitxor '^' integer_bitand { $$ = $1 ^ $3 };
+	;
+
+integer_bitand:
+	  integer_eq
+	| integer_bitand '&' integer_eq { $$ = $1 & $3 };
+	;
+
+integer_eq:
+	  integer_rela
+	| integer_eq DT_EQ integer_rela { $$ = $1 == $3; }
+	| integer_eq DT_NE integer_rela { $$ = $1 != $3; }
+	;
+
+integer_rela:
+	  integer_shift
+	| integer_rela '<' integer_shift { $$ = $1 < $3; }
+	| integer_rela '>' integer_shift { $$ = $1 > $3; }
+	| integer_rela DT_LE integer_shift { $$ = $1 <= $3; }
+	| integer_rela DT_GE integer_shift { $$ = $1 >= $3; }
+	;
+
+integer_shift:
+	  integer_shift DT_LSHIFT integer_add { $$ = $1 << $3; }
+	| integer_shift DT_RSHIFT integer_add { $$ = $1 >> $3; }
+	| integer_add
+	;
+
+integer_add:
+	  integer_add '+' integer_mul { $$ = $1 + $3; }
+	| integer_add '-' integer_mul { $$ = $1 - $3; }
+	| integer_mul
+	;
+
+integer_mul:
+	  integer_mul '*' integer_unary { $$ = $1 * $3; }
+	| integer_mul '/' integer_unary { $$ = $1 / $3; }
+	| integer_mul '%' integer_unary { $$ = $1 % $3; }
+	| integer_unary
+	;
+
+integer_unary:
+	  integer_prim
+	| '-' integer_unary { $$ = -$2; }
+	| '~' integer_unary { $$ = ~$2; }
+	| '!' integer_unary { $$ = !$2; }
+	;
+
 bytestring:
 	  /* empty */
 		{
@@ -364,6 +470,13 @@ static unsigned long long eval_literal(const char *s, int base, int bits)
 	unsigned long long val;
 	char *e;
 
+	e = strchr(s, 'U');
+	if (e)
+		*e = '\0';
+	e = strchr(s, 'L');
+	if (e)
+		*e = '\0';
+
 	errno = 0;
 	val = strtoull(s, &e, base);
 	if (*e)
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 2eee708..1795466 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -19,7 +19,8 @@ LIB_TESTS_L = get_mem_rsv \
 	dtbs_equal_ordered \
 	dtb_reverse dtbs_equal_unordered \
 	add_subnode_with_nops path_offset_aliases \
-	utilfdt_test
+	utilfdt_test \
+	integer-expressions
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/integer-expressions.c b/tests/integer-expressions.c
new file mode 100644
index 0000000..d778f02
--- /dev/null
+++ b/tests/integer-expressions.c
@@ -0,0 +1,117 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for dtc expression support
+ * Copyright (C) 2008 David Gibson, IBM Corporation.
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
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+struct test_expr {
+	const char *expr;
+	uint32_t result;
+} expr_table[] = {
+#define TE(expr)	{ #expr, (expr) }
+	TE(0xdeadbeef),
+	TE(-0x21524111),
+	TE(1+1),
+	TE(2*3),
+	TE(4/2),
+	TE(10/3),
+	TE(19%4),
+	TE(1 << 13),
+	TE(0x1000 >> 4),
+	TE(3*2+1), TE(3*(2+1)),
+	TE(1+2*3), TE((1+2)*3),
+	TE(1 < 2), TE(2 < 1), TE(1 < 1),
+	TE(1 <= 2), TE(2 <= 1), TE(1 <= 1),
+	TE(1 > 2), TE(2 > 1), TE(1 > 1),
+	TE(1 >= 2), TE(2 >= 1), TE(1 >= 1),
+	TE(1 == 1), TE(1 == 2),
+	TE(1 != 1), TE(1 != 2),
+	TE(0xabcdabcd & 0xffff0000),
+	TE(0xdead4110 ^ 0xf0f0f0f0),
+	TE(0xabcd0000 | 0x0000abcd),
+	TE(~0x21524110),
+	TE(~~0xdeadbeef),
+	TE(0 && 0), TE(17 && 0), TE(0 && 17), TE(17 && 17),
+	TE(0 || 0), TE(17 || 0), TE(0 || 17), TE(17 || 17),
+	TE(!0), TE(!1), TE(!17), TE(!!0), TE(!!17),
+	TE(0 ? 17 : 39), TE(1 ? 17 : 39), TE(17 ? 0xdeadbeef : 0xabcd1234),
+	TE(11 * 257 * 1321517ULL),
+	TE(123456790 - 4/2 + 17%4),
+};
+
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	const uint32_t *res;
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
+		fprintf(f, "\texpressions = <\n");
+		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
+			fprintf(f, "\t\t(%s)\n", expr_table[i].expr);
+		fprintf(f, "\t>;\n");
+		fprintf(f, "};\n");
+		fclose(f);
+	} else {
+		fdt = load_blob_arg(argc, argv);
+
+		res = fdt_getprop(fdt, 0, "expressions", &reslen);
+
+		if (!res)
+			FAIL("Error retreiving expression results: %s\n",
+		     fdt_strerror(reslen));
+
+		if (reslen != (ARRAY_SIZE(expr_table) * sizeof(uint32_t)))
+			FAIL("Unexpected length of results %d instead of %ld\n",
+			     reslen, ARRAY_SIZE(expr_table) * sizeof(uint32_t));
+
+		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
+			if (fdt32_to_cpu(res[i]) != expr_table[i].result)
+				FAIL("Incorrect result for expression \"%s\","
+				     " 0x%x instead of 0x%x\n",
+				     expr_table[i].expr, fdt32_to_cpu(res[i]),
+				     expr_table[i].result);
+	}
+
+	PASS();
+}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e470b82..ab8133c 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -404,6 +404,11 @@ dtc_tests () {
     run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - < test_tree1.dtb
     run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1.dtb.test.dts
 
+    # Check integer expresisons
+    run_test integer-expressions -g integer-expressions.test.dts
+    run_dtc_test -I dts -O dtb -o integer-expressions.test.dtb integer-expressions.test.dts
+    run_test integer-expressions integer-expressions.test.dtb
+
     # Check for graceful failure in some error conditions
     run_sh_test dtc-fatal.sh -I dts -O dtb nosuchfile.dts
     run_sh_test dtc-fatal.sh -I dtb -O dtb nosuchfile.dtb
-- 
1.7.5.4
