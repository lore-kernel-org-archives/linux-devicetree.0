From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] dtc: Add support for named integer constants
Date: Tue, 30 Aug 2011 15:30:18 -0600
Message-ID: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

You may define constants as follows:

/define/ TWO 2;
/define/ FOUR 4;
/define/ OTHER FOUR;

And properties may use these values as follows:

foo = <1 TWO 3 FOUR 5>;

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Now against upstream dtc, now doesn't use $ as a prefix to variable,
names, added a test for the new functionality.

I tested this using the dtc test-suite, and against the kernel's Tegra
device-tree files, after addition of the pinmux initialization table,
and conversion of that to using identifiers.

 dtc-lexer.l           |   13 +++++++++
 dtc-parser.y          |   73 +++++++++++++++++++++++++++++++++++++++++++++++++
 tests/Makefile.tests  |    3 +-
 tests/identifiers.c   |   44 +++++++++++++++++++++++++++++
 tests/identifiers.dts |   12 ++++++++
 tests/run_tests.sh    |    4 +++
 6 files changed, 148 insertions(+), 1 deletions(-)
 create mode 100644 tests/identifiers.c
 create mode 100644 tests/identifiers.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index e866ea5..77492d0 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -28,6 +28,7 @@
 PROPNODECHAR	[a-zA-Z0-9,._+*#?@-]
 PATHCHAR	({PROPNODECHAR}|[/])
 LABEL		[a-zA-Z_][a-zA-Z0-9_]*
+IDENTIFIER	[a-zA-Z_][a-zA-Z0-9_]*
 STRING		\"([^\\"]|\\.)*\"
 WS		[[:space:]]
 COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"
@@ -96,6 +97,12 @@ static int pop_input_file(void);
 			return DT_MEMRESERVE;
 		}
 
+<*>"/define/"	{
+			DPRINT("Keyword: /define/\n");
+			BEGIN_DEFAULT();
+			return DT_DEFINE;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
@@ -103,6 +110,12 @@ static int pop_input_file(void);
 			return DT_LABEL;
 		}
 
+<V1>{IDENTIFIER} {
+			DPRINT("identifier: %s\n", yytext);
+			yylval.identifier = xstrdup(yytext + 1);
+			return DT_IDENTIFIER;
+		}
+
 <V1>[0-9]+|0[xX][0-9a-fA-F]+      {
 			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
diff --git a/dtc-parser.y b/dtc-parser.y
index 5e84a67..0558c38 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -33,6 +33,9 @@ extern void yyerror(char const *s);
 extern struct boot_info *the_boot_info;
 extern int treesource_error;
 
+static struct identifier *get_identifier(const char *s);
+static void set_identifier(const char *name, unsigned long long value);
+static unsigned long long eval_identifier(const char *name);
 static unsigned long long eval_literal(const char *s, int base, int bits);
 %}
 
@@ -40,6 +43,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 	char *propnodename;
 	char *literal;
 	char *labelref;
+	char *identifier;
 	unsigned int cbase;
 	uint8_t byte;
 	struct data data;
@@ -55,7 +59,9 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_DEFINE
 %token <propnodename> DT_PROPNODENAME
+%token <identifier> DT_IDENTIFIER
 %token <literal> DT_LITERAL
 %token <cbase> DT_BASE
 %token <byte> DT_BYTE
@@ -113,6 +119,13 @@ memreserve:
 		}
 	;
 
+define:
+	  DT_DEFINE DT_IDENTIFIER cellval ';'
+		{
+			set_identifier($2, $3);
+		}
+	;
+
 addr:
 	  DT_LITERAL
 		{
@@ -125,6 +138,10 @@ devicetree:
 		{
 			$$ = name_node($2, "");
 		}
+	| define
+		{
+			$$ = name_node(build_node(NULL, NULL), "");
+		}
 	| devicetree '/' nodedef
 		{
 			$$ = merge_nodes($1, $3);
@@ -139,6 +156,10 @@ devicetree:
 				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
+	| devicetree define
+		{
+			$$ = $1;
+		}
 	;
 
 nodedef:
@@ -265,6 +286,10 @@ cellval:
 		{
 			$$ = eval_literal($1, 0, 32);
 		}
+	| DT_IDENTIFIER
+		{
+			$$ = eval_identifier($1);
+		}
 	;
 
 bytestring:
@@ -327,6 +352,54 @@ void yyerror(char const *s) {
 	print_error("%s", s);
 }
 
+struct identifier {
+	const char *name;
+	unsigned long long value;
+	struct identifier *next;
+};
+static struct identifier *identifiers;
+
+static struct identifier *get_identifier(const char *name)
+{
+	struct identifier *identifier = identifiers;
+
+	while (identifier != NULL) {
+		if (streq(name, identifier->name))
+			return identifier;
+		identifier = identifier->next;
+	}
+
+	return NULL;
+}
+
+static void set_identifier(const char *name, unsigned long long value)
+{
+	struct identifier *identifier;
+
+	if (get_identifier(name) != NULL) {
+		print_error("redefining %s", name);
+		return;
+	}
+
+	identifier = xmalloc(sizeof(*identifier));
+	identifier->name = name;
+	identifier->value = value;
+	identifier->next = identifiers;
+	identifiers = identifier;
+}
+
+unsigned long long eval_identifier(const char *name)
+{
+	struct identifier *identifier = get_identifier(name);
+
+	if (identifier == NULL) {
+		print_error("identifier %s does not exist", name);
+		return 0;
+	}
+
+	return identifier->value;
+}
+
 static unsigned long long eval_literal(const char *s, int base, int bits)
 {
 	unsigned long long val;
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index c564e72..25d2e3c 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -15,7 +15,8 @@ LIB_TESTS_L = get_mem_rsv \
 	extra-terminating-null \
 	dtbs_equal_ordered \
 	dtb_reverse dtbs_equal_unordered \
-	add_subnode_with_nops path_offset_aliases
+	add_subnode_with_nops path_offset_aliases \
+	identifiers
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/identifiers.c b/tests/identifiers.c
new file mode 100644
index 0000000..a013d00
--- /dev/null
+++ b/tests/identifiers.c
@@ -0,0 +1,44 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for /define/
+ * Copyright (C) 2011 NVIDIA, Inc.
+ * Derived from code:
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
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
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	check_property_cell(fdt, 0, "var1", TEST_VALUE_1);
+	check_property_cell(fdt, 0, "var2", TEST_VALUE_1);
+
+	PASS();
+}
diff --git a/tests/identifiers.dts b/tests/identifiers.dts
new file mode 100644
index 0000000..e8d8e23
--- /dev/null
+++ b/tests/identifiers.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/define/ VAR1 0xdeadbeef;
+/define/ VAR2 VAR1;
+
+/ {
+	var1 = <VAR1>;
+	var2 = <VAR2>;
+};
+
+/define/ OTHER 0xdeadbeef;
+
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 72dda32..e0da087 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -343,6 +343,10 @@ dtc_tests () {
     run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - < test_tree1.dtb
     run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1.dtb.test.dts
 
+    # Test identifiers
+    run_dtc_test -I dts -O dtb -o identifiers.dtb identifiers.dts
+    run_test identifiers identifiers.dtb
+
     # Check for graceful failure in some error conditions
     run_sh_test dtc-fatal.sh -I dts -O dtb nosuchfile.dts
     run_sh_test dtc-fatal.sh -I dtb -O dtb nosuchfile.dtb
-- 
1.7.0.4
