From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 3/3] dtc: Add support for variable sized cells
Date: Fri, 23 Sep 2011 11:02:54 -0700
Message-ID: <1316800974-30129-4-git-send-email-robotboy@chromium.org>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316800974-30129-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cells of size 8, 16, 32, and 64 bits are supported.  The new
/bits/ syntax was selected so as to not pollute the reserved
keyword space with uint8/uint16/... type names.

With this patch the following property assignment:

    property = /bits/ 16 <0x1234 0x5678 0x0 0xffff>;

is equivalent to:

    property = <0x12345678 0x0000ffff>;

It is now also possible to directly specify a 64 bit literal in a
cell list using:

    property = /bits/ 64 <0xdeadbeef00000000>;

It is an error to attempt to store a literal into a cell that is too
small to hold the literal, and the compiler will generate an error
when it detects this.  For instance:

    property = /bits/ 8 <256>;

Will fail to compile.  It is also an error to attempt to place a
reference in a non 32-bit cell.

The sized_cells test tests the creation and access of 8, 16, 32,
and 64-bit sized cells.  It also tests that the creation of two
properties, one with 16 bit cells and one with 32 bit cells result
in the same property contents.

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 Documentation/dts-format.txt |   18 +++++++-
 dtc-lexer.l                  |    6 +++
 dtc-parser.y                 |   67 ++++++++++++++++++++++-----------
 tests/.gitignore             |    1 +
 tests/Makefile.tests         |    1 +
 tests/run_tests.sh           |    3 +
 tests/sized_cells.c          |   84 ++++++++++++++++++++++++++++++++++++++++++
 tests/sized_cells.dts        |   11 +++++
 8 files changed, 166 insertions(+), 25 deletions(-)
 create mode 100644 tests/sized_cells.c
 create mode 100644 tests/sized_cells.dts

diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
index 555bd89..64a862e 100644
--- a/Documentation/dts-format.txt
+++ b/Documentation/dts-format.txt
@@ -29,18 +29,27 @@ except for properties with empty (zero length) value which have the
 form:
 	[label:] property-name;
 
-Property values may be defined as an array of 32-bit integer cells, as
-NUL-terminated strings, as bytestrings or a combination of these.
+Property values may be defined as an array of 8, 16, 32, or 64-bit integer
+cells, as NUL-terminated strings, as bytestrings or a combination of these.
 
 * Arrays of cells are represented by angle brackets surrounding a
   space separated list of C-style integers or character literals.
+  Cells default to 32-bits in size.
 
 	e.g. interrupts = <17 0xc>;
 
-* A 64-bit value is represented with two 32-bit cells.
+* A 64-bit value can be represented with two 32-bit cells.
 
 	e.g. clock-frequency = <0x00000001 0x00000000>;
 
+* The storage size of a cell can be changed using the /bits/ prefix.  The
+  /bits/ prefix allows for the creation of 8, 16, 32, and 64-bit cells.
+  The resulting cell array will not be padded to a multiple of the default
+  32-bit cell size.
+
+	e.g. interrupts = /bits/ 8 <17 0xc>;
+	e.g. clock-frequency = /bits/ 64 <0x0000000100000000>;
+
 * A NUL-terminated string value is represented using double quotes
   (the property value is considered to include the terminating NUL
   character).
@@ -65,6 +74,8 @@ NUL-terminated strings, as bytestrings or a combination of these.
 	e.g. interrupt-parent = < &mpic >;
   or they may be '&' followed by a node's full path in braces:
 	e.g. interrupt-parent = < &{/soc/interrupt-controller@40000} >;
+  References are only permitted in cell arrays that have a cell size of
+  32-bits.
 
 * Outside a cell array, a reference to another node will be expanded
   to that node's full path.
@@ -109,3 +120,4 @@ Version 1 DTS files have the overall layout:
 
 	-- David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
 	-- Yoder Stuart <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
+	-- Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 494e342..73d190c 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -97,6 +97,12 @@ static int pop_input_file(void);
 			return DT_MEMRESERVE;
 		}
 
+<*>"/bits/"	{
+			DPRINT("Keyword: /bits/\n");
+			BEGIN_DEFAULT();
+			return DT_BITS;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index bc05a24..cd48c86 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -45,8 +45,12 @@ static unsigned char eval_char_literal(const char *s);
 	uint8_t byte;
 	struct data data;
 
+	struct {
+		struct data	data;
+		int		bits;
+	} celllist;
+
 	uint64_t addr;
-	cell_t cell;
 	struct property *prop;
 	struct property *proplist;
 	struct node *node;
@@ -56,6 +60,7 @@ static unsigned char eval_char_literal(const char *s);
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_BITS
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <literal> DT_CHAR_LITERAL
@@ -71,8 +76,7 @@ static unsigned char eval_char_literal(const char *s);
 %type <re> memreserve
 %type <re> memreserves
 %type <addr> addr
-%type <data> celllist
-%type <cell> cellval
+%type <celllist> celllistprefix
 %type <data> bytestring
 %type <prop> propdef
 %type <proplist> proplist
@@ -182,9 +186,9 @@ propdata:
 		{
 			$$ = data_merge($1, $2);
 		}
-	| propdataprefix '<' celllist '>'
+	| propdataprefix celllistprefix '>'
 		{
-			$$ = data_merge($1, $3);
+			$$ = data_merge($1, $2.data);
 		}
 	| propdataprefix '[' bytestring ']'
 		{
@@ -242,34 +246,53 @@ propdataprefix:
 		}
 	;
 
-celllist:
-	  /* empty */
+celllistprefix:
+	DT_BITS DT_LITERAL '<'
 		{
-			$$ = empty_data;
+			$$.data = empty_data;
+			$$.bits = eval_literal($2, 0, 7);
+
+			if (($$.bits !=  8) &&
+			    ($$.bits != 16) &&
+			    ($$.bits != 32) &&
+			    ($$.bits != 64))
+			{
+				print_error("Only 8, 16, 32 and 64-bit cell"
+					    " sizes are currently supported");
+				$$.bits = 32;
+			}
 		}
-	| celllist cellval
+	| '<'
 		{
-			$$ = data_append_cell($1, $2);
+			$$.data = empty_data;
+			$$.bits = 32;
 		}
-	| celllist DT_REF
+	| celllistprefix DT_LITERAL
 		{
-			$$ = data_append_cell(data_add_marker($1, REF_PHANDLE,
-							      $2), -1);
+			uint64_t val = eval_literal($2, 0, $1.bits);
+
+			$$.data = data_append_integer($1.data, val, $1.bits);
 		}
-	| celllist DT_LABEL
+	| celllistprefix DT_CHAR_LITERAL
 		{
-			$$ = data_add_marker($1, LABEL, $2);
-		}
-	;
+			uint64_t val = eval_char_literal($2);
 
-cellval:
-	  DT_LITERAL
+			$$.data = data_append_integer($1.data, val, $1.bits);
+		}
+	| celllistprefix DT_REF
 		{
-			$$ = eval_literal($1, 0, 32);
+			uint64_t val = ~0ULL >> (64 - $1.bits);
+
+			if ($1.bits != 32)
+				print_error("References only allowed in 32-bit"
+					    " cell lists");
+
+			$$.data = data_add_marker($1.data, REF_PHANDLE, $2);
+			$$.data = data_append_integer($$.data, val, $1.bits);
 		}
-	| DT_CHAR_LITERAL
+	| celllistprefix DT_LABEL
 		{
-			$$ = eval_char_literal($1);
+			$$.data = data_add_marker($1.data, LABEL, $2);
 		}
 	;
 
diff --git a/tests/.gitignore b/tests/.gitignore
index a3e9bd1..9e062c3 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -40,6 +40,7 @@
 /set_name
 /setprop
 /setprop_inplace
+/sized_cells
 /string_escapes
 /subnode_offset
 /supernode_atdepth_offset
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index cae8390..215a8c5 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -6,6 +6,7 @@ LIB_TESTS_L = get_mem_rsv \
 	node_check_compatible node_offset_by_compatible \
 	get_alias \
 	char_literal \
+	sized_cells \
 	notfound \
 	setprop_inplace nop_property nop_node \
 	sw_tree1 \
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e2c3046..da6f970 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -209,6 +209,9 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_char_literal.test.dtb char_literal.dts
     run_test char_literal dtc_char_literal.test.dtb
 
+    run_dtc_test -I dts -O dtb -o dtc_sized_cells.test.dtb sized_cells.dts
+    run_test sized_cells dtc_sized_cells.test.dtb
+
     run_dtc_test -I dts -O dtb -o dtc_extra-terminating-null.test.dtb extra-terminating-null.dts
     run_test extra-terminating-null dtc_extra-terminating-null.test.dtb
 
diff --git a/tests/sized_cells.c b/tests/sized_cells.c
new file mode 100644
index 0000000..847ec96
--- /dev/null
+++ b/tests/sized_cells.c
@@ -0,0 +1,84 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for variable sized cells in dtc
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ * Copyright (C) 2011 The Chromium Authors. All rights reserved.
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
+static void check_compare_properties(void *fdt,
+				     char const *name_one,
+				     char const *name_two)
+{
+	const void *propval;
+	int proplen;
+
+	propval = fdt_getprop(fdt, 0, name_one, &proplen);
+
+	if (!propval)
+		FAIL("fdt_getprop(\"%s\"): %s",
+		     name_one,
+		     fdt_strerror(proplen));
+
+	check_getprop(fdt, 0, name_two, proplen, propval);
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	uint8_t expected_8[6] = {TEST_CHAR1,
+				 TEST_CHAR2,
+				 TEST_CHAR3,
+				 TEST_CHAR4,
+				 TEST_CHAR5,
+				 TEST_VALUE_1 >> 24};
+	uint16_t expected_16[6];
+	uint32_t expected_32[6];
+	uint64_t expected_64[6];
+	int i;
+
+	for (i = 0; i < 5; ++i) {
+		expected_16[i] = cpu_to_fdt16(expected_8[i]);
+		expected_32[i] = cpu_to_fdt32(expected_8[i]);
+		expected_64[i] = cpu_to_fdt64(expected_8[i]);
+	}
+
+	expected_16[5] = cpu_to_fdt16(TEST_VALUE_1 >> 16);
+	expected_32[5] = cpu_to_fdt32(TEST_VALUE_1);
+	expected_64[5] = cpu_to_fdt64(TEST_ADDR_1);
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	check_getprop(fdt, 0, "cells-8b", sizeof(expected_8), expected_8);
+	check_getprop(fdt, 0, "cells-16b", sizeof(expected_16), expected_16);
+	check_getprop(fdt, 0, "cells-32b", sizeof(expected_32), expected_32);
+	check_getprop(fdt, 0, "cells-64b", sizeof(expected_64), expected_64);
+
+	check_compare_properties(fdt, "cells-one-16b", "cells-one-32b");
+
+	PASS();
+}
diff --git a/tests/sized_cells.dts b/tests/sized_cells.dts
new file mode 100644
index 0000000..efea9f5
--- /dev/null
+++ b/tests/sized_cells.dts
@@ -0,0 +1,11 @@
+/dts-v1/;
+
+/ {
+	cells-8b = /bits/ 8 <'\r' 'b' '\0' '\'' '\xff' 0xde>;
+	cells-16b = /bits/ 16 <'\r' 'b' '\0' '\'' '\xff' 0xdead>;
+	cells-32b = /bits/ 32 <'\r' 'b' '\0' '\'' '\xff' 0xdeadbeef>;
+	cells-64b = /bits/ 64 <'\r' 'b' '\0' '\'' '\xff' 0xdeadbeef00000000>;
+
+	cells-one-16b = /bits/ 16 <0x1234 0x5678 0x0 0xffff>;
+	cells-one-32b = <0x12345678 0x0000ffff>;
+};
-- 
1.7.3.1
