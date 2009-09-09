From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Fix bug in -Odts with properties containing multiple terminating nulls
Date: Wed, 9 Sep 2009 14:34:58 +1000
Message-ID: <20090909043458.GA7909@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jdl-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

When in -Odts mode, dtc will not produce correct output for
string-like properties which have more than one \0 character at the
end of the property's bytestring.  In fact, it generates output which
is not syntactically correct.  This patch fixes the bug, and adds a
testcase for future regressions here.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2009-09-09 13:47:38.000000000 +1000
+++ dtc/tests/Makefile.tests	2009-09-09 13:48:00.000000000 +1000
@@ -11,6 +11,7 @@ LIB_TESTS_L = get_mem_rsv \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
 	string_escapes references path-references boot-cpuid incbin \
+	extra-terminating-null \
 	dtbs_equal_ordered \
 	add_subnode_with_nops path_offset_aliases
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
Index: dtc/tests/extra-terminating-null.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/extra-terminating-null.c	2009-09-09 13:48:08.000000000 +1000
@@ -0,0 +1,59 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for properties with more than one terminating null
+ * Copyright (C) 2009 David Gibson, IBM Corporation.
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
+void check_extranull(void *fdt, const char *prop, const char *str, int numnulls)
+{
+	int len = strlen(str);
+	char checkbuf[len+numnulls];
+
+	memset(checkbuf, 0, sizeof(checkbuf));
+	memcpy(checkbuf, TEST_STRING_1, len);
+
+	check_getprop(fdt, 0, prop, len+numnulls, checkbuf);
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+
+	test_init(argc, argv);
+
+	fdt = load_blob_arg(argc, argv);
+
+	check_extranull(fdt, "extranull0", TEST_STRING_1, 1);
+	check_extranull(fdt, "extranull1,1", TEST_STRING_1, 2);
+	check_extranull(fdt, "extranull1,2", TEST_STRING_1, 2);
+	check_extranull(fdt, "extranull2,1", TEST_STRING_1, 3);
+	check_extranull(fdt, "extranull2,2", TEST_STRING_1, 3);
+	check_extranull(fdt, "extranull2,3", TEST_STRING_1, 3);
+	check_extranull(fdt, "extranull2,4", TEST_STRING_1, 3);
+
+	PASS();
+}
Index: dtc/tests/extra-terminating-null.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/extra-terminating-null.dts	2009-09-09 13:48:00.000000000 +1000
@@ -0,0 +1,11 @@
+/dts-v1/;
+
+/ {
+	extranull0 = "hello world";
+	extranull1,1 = "hello world\0";
+	extranull1,2 = "hello world", "";
+	extranull2,1 = "hello world\0\0";
+	extranull2,2 = "hello world", "", "";
+	extranull2,3 = "hello world\0", "";
+	extranull2,4 = "hello world", "\0";
+};
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2009-09-09 13:47:38.000000000 +1000
+++ dtc/tests/run_tests.sh	2009-09-09 13:48:45.000000000 +1000
@@ -204,6 +204,9 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_escapes.test.dtb escapes.dts
     run_test string_escapes dtc_escapes.test.dtb
 
+    run_dtc_test -I dts -O dtb -o dtc_extra-terminating-null.test.dtb extra-terminating-null.dts
+    run_test extra-terminating-null dtc_extra-terminating-null.test.dtb
+
     run_dtc_test -I dts -O dtb -o dtc_references.test.dtb references.dts
     run_test references dtc_references.test.dtb
 
@@ -253,7 +256,7 @@ dtc_tests () {
 
     # Check -Odts mode preserve all dtb information
     for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb \
-	dtc_references.test.dtb; do
+	dtc_extra-terminating-null.test.dtb dtc_references.test.dtb; do
 	run_dtc_test -I dtb -O dts -o odts_$tree.test.dts $tree
 	run_dtc_test -I dts -O dtb -o odts_$tree.test.dtb odts_$tree.test.dts
 	run_test dtbs_equal_ordered $tree odts_$tree.test.dtb
Index: dtc/treesource.c
===================================================================
--- dtc.orig/treesource.c	2009-09-09 14:10:49.000000000 +1000
+++ dtc/treesource.c	2009-09-09 14:27:34.000000000 +1000
@@ -63,26 +63,20 @@ static void write_propval_string(FILE *f
 {
 	const char *str = val.val;
 	int i;
-	int newchunk = 1;
 	struct marker *m = val.markers;
 
 	assert(str[val.len-1] == '\0');
 
+	while (m && (m->offset == 0)) {
+		if (m->type == LABEL)
+			fprintf(f, "%s: ", m->ref);
+		m = m->next;
+	}
+	fprintf(f, "\"");
+
 	for (i = 0; i < (val.len-1); i++) {
 		char c = str[i];
 
-		if (newchunk) {
-			while (m && (m->offset <= i)) {
-				if (m->type == LABEL) {
-					assert(m->offset == i);
-					fprintf(f, "%s: ", m->ref);
-				}
-				m = m->next;
-			}
-			fprintf(f, "\"");
-			newchunk = 0;
-		}
-
 		switch (c) {
 		case '\a':
 			fprintf(f, "\\a");
@@ -113,7 +107,14 @@ static void write_propval_string(FILE *f
 			break;
 		case '\0':
 			fprintf(f, "\", ");
-			newchunk = 1;
+			while (m && (m->offset < i)) {
+				if (m->type == LABEL) {
+					assert(m->offset == (i+1));
+					fprintf(f, "%s: ", m->ref);
+				}
+				m = m->next;
+			}
+			fprintf(f, "\"");
 			break;
 		default:
 			if (isprint(c))

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
