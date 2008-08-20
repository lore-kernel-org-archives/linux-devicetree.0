From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc expression support revisited
Date: Wed, 20 Aug 2008 16:59:04 +1000
Message-ID: <20080820065904.GB18996@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
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

Now that dtc 1.2 is out, we've talked about implementing the
long-suggested expression support.  So, I've taken my old prototype
integer expression support patch and updated it to apply to the
current tree.

This wants some more work before merging; implementing the remaining C
integer operators, at least.  But it's got enough to play with, and
the expressions are a lot less confusing in dts-v1, without the
implicitly hex literals.

Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2008-08-04 15:32:39.000000000 +1000
+++ dtc/dtc-parser.y	2008-08-20 16:55:42.000000000 +1000
@@ -53,6 +53,8 @@ static unsigned long long eval_literal(c
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_LSHIFT
+%token DT_RSHIFT
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <literal> DT_LEGACYLITERAL
@@ -72,7 +74,6 @@ static unsigned long long eval_literal(c
 %type <addr> addr
 %type <data> celllist
 %type <cbase> cellbase
-%type <cell> cellval
 %type <data> bytestring
 %type <prop> propdef
 %type <proplist> proplist
@@ -83,6 +84,13 @@ static unsigned long long eval_literal(c
 %type <nodelist> subnodes
 %type <labelref> label
 
+%type <cell> cell_prim
+%type <cell> cell_unary
+%type <cell> cell_mul
+%type <cell> cell_add
+%type <cell> cell_shift
+%type <cell> cell_expr
+
 %%
 
 sourcefile:
@@ -254,7 +262,7 @@ celllist:
 		{
 			$$ = empty_data;
 		}
-	| celllist cellval
+	| celllist cell_prim
 		{
 			$$ = data_append_cell($1, $2);
 		}
@@ -277,7 +285,7 @@ cellbase:
 	| DT_BASE
 	;
 
-cellval:
+cell_prim:
 	  DT_LITERAL
 		{
 			$$ = eval_literal($1, 0, 32);
@@ -286,6 +294,33 @@ cellval:
 		{
 			$$ = eval_literal($2, $1, 32);
 		}
+	| '(' cell_expr ')'
+		{
+			$$ = $2;
+		}
+	;
+
+cell_expr:	cell_shift	{ $$ = $1; }
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
+cell_unary:	'-' cell_prim { $$ = - $2; }
+	|	cell_prim
 	;
 
 bytestring:
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2008-08-20 15:59:58.000000000 +1000
+++ dtc/tests/run_tests.sh	2008-08-20 16:19:32.000000000 +1000
@@ -228,6 +228,10 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o incbin.test.dtb incbin.dts
     run_test incbin incbin.test.dtb
 
+    # Check integer expresisons
+    run_dtc_test -I dts -O dtb -o dtc_tree1_expr.test.dtb test_tree1_expr.dts
+    tree1_tests dtc_tree1_expr.test.dtb
+
     # Check boot_cpuid_phys handling
     run_dtc_test -I dts -O dtb -b 17 -o boot_cpuid.test.dtb empty.dts
     run_test boot-cpuid boot_cpuid.test.dtb 17
Index: dtc/tests/test_tree1_expr.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_expr.dts	2008-08-20 16:47:35.000000000 +1000
@@ -0,0 +1,31 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = < (0xdeadbeef) >;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = < (-0x21524111) >;
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <(11 * 257 * 1321517)>;
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = < (1 << 13) >;
+		prop-int = <((0x75b<<16) + 0xcd14 + 1%2)>;
+
+		subsubnode@0 {
+			linux,phandle = < ((1<<13) + 1) >;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <(123456790 - 4/2 + 17%4)>;
+		};
+	};
+};
Index: dtc/dtc-lexer.l
===================================================================
--- dtc.orig/dtc-lexer.l	2008-08-20 13:54:53.000000000 +1000
+++ dtc/dtc-lexer.l	2008-08-20 16:24:54.000000000 +1000
@@ -202,6 +202,9 @@ static int pop_input_file(void);
 <*>{COMMENT}+	/* eat C-style comments */
 <*>{LINECOMMENT}+ /* eat C++-style comments */
 
+<*>"<<"		{ return DT_LSHIFT; };
+<*>">>"		{ return DT_RSHIFT; };
+
 <*>.		{
 			yylloc.file = srcpos_file;
 			yylloc.first_line = yylineno;


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
