From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc expressions
Date: Fri, 16 Mar 2012 11:29:39 +1100
Message-ID: <20120316002939.GH24916@truffala.fritz.box>
References: <20120314144611.GZ24916@truffala.fritz.box>
 <4F60BBDD.2000807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F60BBDD.2000807-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 14, 2012 at 09:40:13AM -0600, Stephen Warren wrote:
> On 03/14/2012 08:46 AM, David Gibson wrote:
> > So, in order to actually make progress on the dtc expressions / macros
> > / whatnot stuff, I really think I should dust off my integer (constant)
> > expressions patch, and we can apply that.
> > 
> > While we still have disagreements on a bunch of stuff here, I think
> > we're at least agreed on what integer expressions should look like.
> > And even if we change approaches later (e.g. to your ifs and fors in
> > dtc approach) the integer expression syntax won't change, only the
> > implementation.
> 
> I'd love to see something like that. I've don't think I've actually
> looked through your patches for that yet; I briefly looked at Jon's
> since they're in a branch in the dtc repo, but I don't think I managed
> to track down the patches you sent for this.

It was quite a while back that I posted.  I've got a version below,
but it's *very* bitrotted and won't even go close to applying at
present.  I'm meaning to update it, but it will take a little time.

Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2008-10-08 15:18:26.000000000 +1100
+++ dtc/dtc-parser.y	2008-10-09 19:19:33.000000000 +1100
@@ -54,6 +54,7 @@ static unsigned long long eval_literal(c
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <cbase> DT_BASE
@@ -69,7 +70,6 @@ static unsigned long long eval_literal(c
 %type <re> memreserves
 %type <addr> addr
 %type <data> celllist
-%type <cell> cellval
 %type <data> bytestring
 %type <prop> propdef
 %type <proplist> proplist
@@ -80,6 +80,21 @@ static unsigned long long eval_literal(c
 %type <nodelist> subnodes
 %type <labelref> label
 
+%type <cell> cell_prim
+%type <cell> cell_unary
+%type <cell> cell_mul
+%type <cell> cell_add
+%type <cell> cell_shift
+%type <cell> cell_rela
+%type <cell> cell_eq
+%type <cell> cell_bitand
+%type <cell> cell_bitxor
+%type <cell> cell_bitor
+%type <cell> cell_and
+%type <cell> cell_or
+%type <cell> cell_trinary
+%type <cell> cell_expr
+
 %%
 
 sourcefile:
@@ -221,7 +236,7 @@ celllist:
 		{
 			$$ = empty_data;
 		}
-	| celllist cellval
+	| celllist cell_prim
 		{
 			$$ = data_append_cell($1, $2);
 		}
@@ -236,11 +251,76 @@ celllist:
 		}
 	;
 
-cellval:
+cell_prim:
 	  DT_LITERAL
 		{
 			$$ = eval_literal($1, 0, 32);
 		}
+	| '(' cell_expr ')'
+		{
+			$$ = $2;
+		}
+	;
+
+cell_expr:	cell_trinary
+	;
+
+cell_trinary:	cell_or
+	| cell_or '?' cell_expr ':' cell_trinary { $$ = $1 ? $3 : $5 }
+	;
+
+cell_or:	cell_and
+	|	cell_or DT_OR cell_and { $$ = $1 || $3 };
+
+cell_and:	cell_bitor
+	|	cell_and DT_AND cell_bitor { $$ = $1 && $3 };
+	;
+
+cell_bitor:	cell_bitxor
+	|	cell_bitor '|' cell_bitxor { $$ = $1 | $3 };
+	;
+
+cell_bitxor:	cell_bitand
+	|	cell_bitxor '^' cell_bitand { $$ = $1 ^ $3 };
+	;
+
+cell_bitand:	cell_eq
+	|	cell_bitand '&' cell_eq { $$ = $1 & $3 };
+	;
+
+cell_eq:	cell_rela
+	|	cell_eq DT_EQ cell_rela { $$ = $1 == $3; }
+	|	cell_eq DT_NE cell_rela { $$ = $1 != $3; }
+	;
+
+
+cell_rela:	cell_shift
+	|	cell_rela '<' cell_shift { $$ = $1 < $3; }
+	|	cell_rela '>' cell_shift { $$ = $1 > $3; }
+	|	cell_rela DT_LE cell_shift { $$ = $1 <= $3; }
+	|	cell_rela DT_GE cell_shift { $$ = $1 >= $3; }
+	;
+
+cell_shift:	cell_shift DT_LSHIFT cell_add { $$ = $1 << $3; }
+	|	cell_shift DT_RSHIFT cell_add { $$ = $1 >> $3; }
+	|	cell_add
+	;
+
+cell_add:	cell_add '+' cell_mul { $$ = $1 + $3; }
+	|	cell_add '-' cell_mul { $$ = $1 - $3; }
+	|	cell_mul
+	;
+
+cell_mul:	cell_mul '*' cell_unary { $$ = $1 * $3; }
+	|	cell_mul '/' cell_unary { $$ = $1 / $3; }
+	|	cell_mul '%' cell_unary { $$ = $1 % $3; }
+	|	cell_unary
+	;
+
+cell_unary:	cell_prim
+	|	'-' cell_unary { $$ = -$2; }
+	|	'~' cell_unary { $$ = ~$2; }
+	|	'!' cell_unary { $$ = !$2; }
 	;
 
 bytestring:
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2008-10-08 15:18:26.000000000 +1100
+++ dtc/tests/run_tests.sh	2008-10-09 19:19:33.000000000 +1100
@@ -298,6 +298,11 @@ dtc_tests () {
     run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - < test_tree1.dtb
     run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1.dtb.test.dts
 
+    # Check integer expresisons
+    run_test cell-expressions -g cell-expressions.test.dts
+    run_dtc_test -I dts -O dtb -o cell-expressions.test.dtb cell-expressions.test.dts
+    run_test cell-expressions cell-expressions.test.dtb
+
     # Check for graceful failure in some error conditions
     run_sh_test dtc-fatal.sh -I dts -O dtb nosuchfile.dts
     run_sh_test dtc-fatal.sh -I dtb -O dtb nosuchfile.dtb
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2008-10-08 15:18:26.000000000 +1100
+++ dtc/dtc-lexer.l	2008-10-09 19:19:33.000000000 +1100
@@ -149,6 +149,15 @@ static int pop_input_file(void);
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
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2008-10-08 15:18:26.000000000 +1100
+++ dtc/tests/Makefile.tests	2008-10-09 19:19:33.000000000 +1100
@@ -11,6 +11,7 @@ LIB_TESTS_L = get_mem_rsv \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
 	string_escapes references path-references boot-cpuid incbin \
+	cell-expressions \
 	dtbs_equal_ordered \
 	add_subnode_with_nops path_offset_aliases
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
Index: dtc/tests/cell-expressions.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/cell-expressions.c	2008-10-09 19:19:33.000000000 +1100
@@ -0,0 +1,115 @@
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
+	TE(~0x21524110), TE(~~0xdeadbeef),
+	TE(0 && 0), TE(17 && 0), TE(0 && 17), TE(17 && 17),
+	TE(0 || 0), TE(17 || 0), TE(0 || 17), TE(17 || 17),
+	TE(!0), TE(!1), TE(!17), TE(!!0), TE(!!17),
+	TE(0 ? 17 : 39), TE(1 ? 17 : 39), TE(17 ? 0xdeadbeef : 0xabcd1234),
+	//	TE(11 * 257 * 1321517),
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
+			FAIL("Unexpected length of results %d instead of %d\n",
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


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
