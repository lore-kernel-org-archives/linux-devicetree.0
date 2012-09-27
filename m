From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 1/2] dtc: cpp co-existence: allow names starting with # to
 be escaped
Date: Thu, 27 Sep 2012 17:11:04 -0600
Message-ID: <1348787465-9745-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The device tree language as currently defined conflicts with the C pre-
processor in one aspect - when a property or node name begins with a #
character, a pre-processor would attempt to interpret it as a directive,
fail, and most likely error out.

This change allows a property/node name to be prefixed with \. This
prevents a pre-processor from seeing # as the first non-whitespace
character on the line, and hence prevents the conflict. \ was previously
an illegal character in property/node names, so this change is
backwards compatible. The \ is stripped from the name during parsing
by dtc.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3: No change.
---
 dtc-lexer.l                |    5 +++--
 tests/.gitignore           |    1 +
 tests/Makefile.tests       |    2 +-
 tests/propname_escapes.c   |   43 +++++++++++++++++++++++++++++++++++++++++++
 tests/propname_escapes.dts |    6 ++++++
 tests/run_tests.sh         |    3 +++
 6 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 tests/propname_escapes.c
 create mode 100644 tests/propname_escapes.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 91c4930..edbeb86 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -162,9 +162,10 @@ static int pop_input_file(void);
 			return ']';
 		}
 
-<PROPNODENAME>{PROPNODECHAR}+ {
+<PROPNODENAME>\\?{PROPNODECHAR}+ {
 			DPRINT("PropNodeName: %s\n", yytext);
-			yylval.propnodename = xstrdup(yytext);
+			yylval.propnodename = xstrdup((yytext[0] == '\\') ?
+							yytext + 1 : yytext);
 			BEGIN_DEFAULT();
 			return DT_PROPNODENAME;
 		}
diff --git a/tests/.gitignore b/tests/.gitignore
index f8e1af0..e2aa24a 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -39,6 +39,7 @@ tmp.*
 /path_offset
 /path_offset_aliases
 /phandle_format
+/propname_escapes
 /references
 /root_node
 /rw_tree1
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 1795466..d59bff8 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -12,7 +12,7 @@ LIB_TESTS_L = get_mem_rsv \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
-	appendprop1 appendprop2 \
+	appendprop1 appendprop2 propname_escapes \
 	string_escapes references path-references phandle_format \
 	boot-cpuid incbin \
 	extra-terminating-null \
diff --git a/tests/propname_escapes.c b/tests/propname_escapes.c
new file mode 100644
index 0000000..3aec28f
--- /dev/null
+++ b/tests/propname_escapes.c
@@ -0,0 +1,43 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_getprop()
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ * Copyright (C) 2012 NVIDIA CORPORATION. All rights reserved.
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
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	check_getprop_cell(fdt, 0, "#address-cells", 1);
+	check_getprop_cell(fdt, 0, "#gpio-cells", 2);
+
+	PASS();
+}
diff --git a/tests/propname_escapes.dts b/tests/propname_escapes.dts
new file mode 100644
index 0000000..9f70618
--- /dev/null
+++ b/tests/propname_escapes.dts
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	\#gpio-cells = <2>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e2158f7..7d7a5f7 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -254,6 +254,9 @@ dtc_tests () {
     tree1_tests_rw dtc_tree1.test.dtb
     run_test dtbs_equal_ordered dtc_tree1.test.dtb test_tree1.dtb
 
+    run_dtc_test -I dts -O dtb -o dtc_escapes.test.dtb propname_escapes.dts
+    run_test propname_escapes dtc_escapes.test.dtb
+
     run_dtc_test -I dts -O dtb -o dtc_escapes.test.dtb escapes.dts
     run_test string_escapes dtc_escapes.test.dtb
 
-- 
1.7.0.4
