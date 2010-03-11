From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Extend and better test dtbs_equal utility programs
Date: Thu, 11 Mar 2010 11:25:32 +1100
Message-ID: <20100311002532.GD11655@yookeroo>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The dtbs_equal_ordered test program is used to implement a number of
testcases.  However, the test program itself has never been
particularly well tested.  In addition there are testcases coming in
future for which it would be useful to have a corresponding
"dtbs_equal_unordered" which checks for equality of device trees, not
considering the internal ordering of elements.  Finally, for some
tests we may want it would be useful to check trees for equality with
the PASS case being when they are *not* equal.

This patch addresses all of the above.  A dtbs_equal_unordered is
added, and both it and the existing dtbs_equal_ordered program now
take a -n option to make the PASS case be where the trees are not
equal.  A number of example trees with slight modifications from
test_tree1 are used to verify that both these programs correctly
identify when the tree is altered, and a dtb_reverse program is used
to verify that the unordered version does not depend on internal
ordering.  These new testcases for the equality testing programs are
split out into a new test group in run_tests.sh.

dtbs_equal_unordered uses the new property iteration functions, and so
this also acts as further testing for those functions.
dtbs_equal_unordered will be useful for further testing the recently
added tree-merging code and its upcoming extensions.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/dtb_reverse.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/dtb_reverse.c	2010-03-11 11:15:05.676751345 +1100
@@ -0,0 +1,164 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Tests if two given dtbs are structurally equal (including order)
+ * Copyright (C) 2010 David Gibson, IBM Corporation.
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
+#include <limits.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
+static void reverse_reservemap(void *in, void *out, int n)
+{
+	int err;
+	uint64_t addr, size;
+
+	verbose_printf("reverse_reservemap(): %d/%d\n",
+		       n, fdt_num_mem_rsv(in));
+
+	if (n < (fdt_num_mem_rsv(in)-1))
+		reverse_reservemap(in, out, n+1);
+
+	CHECK(fdt_get_mem_rsv(in, n, &addr, &size));
+	CHECK(fdt_add_reservemap_entry(out, addr, size));
+	verbose_printf("Added entry 0x%llx 0x%llx\n",
+		       (unsigned long long)addr, (unsigned long long)size);
+}
+
+static void reverse_properties(void *in, void *out, int offset)
+{
+	int err;
+	int len;
+	const char *name;
+	const void *data;
+
+	data = fdt_getprop_by_offset(in, offset, &name, &len);
+	if (!data)
+		FAIL("fdt_getprop_by_offset(): %s\n", fdt_strerror(len));
+
+	verbose_printf("reverse_properties(): offset=%d  name=%s\n",
+		       offset, name);
+
+	offset = fdt_next_property_offset(in, offset);
+	if (offset >= 0)
+		reverse_properties(in, out, offset);
+	else if (offset != -FDT_ERR_NOTFOUND)
+		FAIL("fdt_next_property_offset(): %s\n", fdt_strerror(offset));
+
+	CHECK(fdt_property(out, name, data, len));
+	verbose_printf("  -> output property %s\n", name);
+}
+
+static void reverse_node(void *in, void *out, int nodeoffset);
+
+static void reverse_children(void *in, void *out, int offset)
+{
+	int err;
+	int nextoffset = offset;
+	int depth = 1;
+
+	do {
+		char path[PATH_MAX];
+
+		CHECK(fdt_get_path(in, nextoffset, path, sizeof(path)));
+		verbose_printf("reverse_children() offset=%d nextoffset=%d [%s]"
+			       " depth=%d\n", offset, nextoffset, path, depth);
+
+		nextoffset = fdt_next_node(in, nextoffset, &depth);
+	} while ((depth >= 0) && (depth != 1));
+
+	if (depth == 1)
+		reverse_children(in, out, nextoffset);
+
+	reverse_node(in, out, offset);
+}
+
+static void reverse_node(void *in, void *out, int nodeoffset)
+{
+	const char *name = fdt_get_name(in, nodeoffset, NULL);
+	char path[PATH_MAX];
+	int err;
+	int offset;
+	int depth = 0;
+
+	CHECK(fdt_get_path(in, nodeoffset, path, sizeof(path)));
+	verbose_printf("reverse_node(): nodeoffset=%d [%s]\n",
+		       nodeoffset, path);
+
+	CHECK(fdt_begin_node(out, name));
+
+	offset = fdt_first_property_offset(in, nodeoffset);
+	if (offset >= 0)
+		reverse_properties(in, out, offset);
+	else if (offset != -FDT_ERR_NOTFOUND)
+		FAIL("fdt_first_property(): %s\n", fdt_strerror(offset));
+
+	offset = fdt_next_node(in, nodeoffset, &depth);
+
+	if (depth == 1)
+		reverse_children(in, out, offset);
+
+	CHECK(fdt_end_node(out));
+}
+
+int main(int argc, char *argv[])
+{
+	void *in, *out;
+	char outname[PATH_MAX];
+	int bufsize;
+	int err;
+
+	test_init(argc, argv);
+	if (argc != 2)
+		CONFIG("Usage: %s <dtb file>", argv[0]);
+
+	in = load_blob(argv[1]);
+	sprintf(outname, "%s.reversed.test.dtb", argv[1]);
+
+	bufsize = fdt_totalsize(in);
+	out = xmalloc(bufsize);
+
+	CHECK(fdt_create(out, bufsize));
+
+	fdt_set_boot_cpuid_phys(out, fdt_boot_cpuid_phys(in));
+
+	reverse_reservemap(in, out, 0);
+	CHECK(fdt_finish_reservemap(out));
+
+	reverse_node(in, out, 0);
+
+	CHECK(fdt_finish(out));
+
+	save_blob(outname, out);
+
+	PASS();
+}
Index: dtc/tests/dtbs_equal_unordered.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/dtbs_equal_unordered.c	2010-03-11 11:15:05.676751345 +1100
@@ -0,0 +1,224 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Tests if two given dtbs are structurally equal (including order)
+ * Copyright (C) 2007 David Gibson, IBM Corporation.
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
+#include <limits.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+int notequal; /* = 0 */
+
+#define MISMATCH(fmt, ...)			\
+	do { \
+		if (notequal) \
+			PASS(); \
+		else \
+			FAIL(fmt, ##__VA_ARGS__);	\
+	} while (0)
+
+#define MATCH()			\
+	do { \
+		if (!notequal) \
+			PASS(); \
+		else \
+			FAIL("Trees match which shouldn't");	\
+	} while (0)
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
+static int mem_rsv_cmp(const void *p1, const void *p2)
+{
+	const struct fdt_reserve_entry *re1 = p1;
+	const struct fdt_reserve_entry *re2 = p2;
+
+	if (re1->address < re2->address)
+		return -1;
+	else if (re1->address > re2->address)
+		return 1;
+
+	if (re1->size < re2->size)
+		return -1;
+	else if (re1->size > re2->size)
+		return 1;
+
+	return 0;
+}
+
+static void compare_mem_rsv(void *fdt1, void *fdt2)
+{
+	int i;
+	uint64_t addr1, size1, addr2, size2;
+	int err;
+
+	if (fdt_num_mem_rsv(fdt1) != fdt_num_mem_rsv(fdt2))
+		MISMATCH("Trees have different number of reserve entries");
+
+	qsort((char *)fdt1 + fdt_off_mem_rsvmap(fdt1), fdt_num_mem_rsv(fdt1),
+	      sizeof(struct fdt_reserve_entry), mem_rsv_cmp);
+	qsort((char *)fdt2 + fdt_off_mem_rsvmap(fdt2), fdt_num_mem_rsv(fdt2),
+	      sizeof(struct fdt_reserve_entry), mem_rsv_cmp);
+
+	for (i = 0; i < fdt_num_mem_rsv(fdt1); i++) {
+		CHECK(fdt_get_mem_rsv(fdt1, i, &addr1, &size1));
+		CHECK(fdt_get_mem_rsv(fdt2, i, &addr2, &size2));
+
+		if ((addr1 != addr2) || (size1 != size2))
+			MISMATCH("Mismatch in reserve entry %d: "
+			     "(0x%llx, 0x%llx) != (0x%llx, 0x%llx)", i,
+			     (unsigned long long)addr1,
+			     (unsigned long long)size1,
+			     (unsigned long long)addr2,
+			     (unsigned long long)size2);
+	}
+}
+
+static void compare_properties(const void *fdt1, int offset1,
+			       const void *fdt2, int offset2)
+{
+	int offset = offset1;
+
+	/* Check the properties */
+	for (offset = fdt_first_property_offset(fdt1, offset1);
+	     offset >= 0;
+	     offset = fdt_next_property_offset(fdt1, offset)) {
+		const char *name;
+		int len1, len2;
+		const void *data1, *data2;
+		int i;
+
+		data1 = fdt_getprop_by_offset(fdt1, offset, &name, &len1);
+		if (!data1)
+			FAIL("fdt_getprop_by_offset(): %s\n",
+			     fdt_strerror(len1));
+
+		verbose_printf("Property '%s'\n", name);
+
+		data2 = fdt_getprop(fdt2, offset2, name, &len2);
+		if (!data2) {
+			if (len2 == -FDT_ERR_NOTFOUND)
+				MISMATCH("Property '%s' missing\n", name);
+			else
+				FAIL("fdt_get_property(): %s\n",
+				     fdt_strerror(len2));
+		}
+
+		verbose_printf("len1=%d data1=", len1);
+		for (i = 0; i < len1; i++)
+			verbose_printf(" %02x", ((const char *)data1)[i]);
+		verbose_printf("\nlen2=%d data2=", len2);
+		for (i = 0; i < len1; i++)
+			verbose_printf(" %02x", ((const char *)data2)[i]);
+		verbose_printf("\n");
+
+		if (len1 != len2)
+			MISMATCH("Property '%s' mismatched length %d vs. %d\n",
+			     name, len1, len2);
+		else if (memcmp(data1, data2, len1) != 0)
+			MISMATCH("Property '%s' mismatched value\n", name);
+	}
+}
+
+static void compare_node(const void *fdt1, int offset1,
+			 const void *fdt2, int offset2);
+
+static void compare_subnodes(const void *fdt1, int offset1,
+			     const void *fdt2, int offset2,
+			     int recurse)
+{
+	int coffset1, coffset2, depth;
+
+	for (depth = 0, coffset1 = offset1;
+	     (coffset1 >= 0) && (depth >= 0);
+	      coffset1 = fdt_next_node(fdt1, coffset1, &depth))
+		if (depth == 1) {
+			const char *name = fdt_get_name(fdt1, coffset1, NULL);
+
+			verbose_printf("Subnode %s\n", name);
+			coffset2 = fdt_subnode_offset(fdt2, offset2, name);
+			if (coffset2 == -FDT_ERR_NOTFOUND)
+				MISMATCH("Subnode %s missing\n", name);
+			else if (coffset2 < 0)
+				FAIL("fdt_subnode_offset(): %s\n",
+				     fdt_strerror(coffset2));
+
+			if (recurse)
+				compare_node(fdt1, coffset1, fdt2, coffset2);
+		}
+}
+
+static void compare_node(const void *fdt1, int offset1,
+			 const void *fdt2, int offset2)
+{
+	int err;
+	char path1[PATH_MAX], path2[PATH_MAX];
+
+	CHECK(fdt_get_path(fdt1, offset1, path1, sizeof(path1)));
+	CHECK(fdt_get_path(fdt2, offset2, path2, sizeof(path2)));
+
+	if (!streq(path1, path2))
+		TEST_BUG("Path mismatch %s vs. %s\n", path1, path2);
+
+	verbose_printf("Checking %s\n", path1);
+
+	compare_properties(fdt1, offset1, fdt2, offset2);
+	compare_properties(fdt2, offset2, fdt1, offset1);
+
+	compare_subnodes(fdt1, offset1, fdt2, offset2, 1);
+	compare_subnodes(fdt2, offset2, fdt1, offset1, 0);
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt1, *fdt2;
+	uint32_t cpuid1, cpuid2;
+
+	test_init(argc, argv);
+	if ((argc != 3)
+	    && ((argc != 4) || !streq(argv[1], "-n")))
+		CONFIG("Usage: %s [-n] <dtb file> <dtb file>", argv[0]);
+	if (argc == 4)
+		notequal = 1;
+
+	fdt1 = load_blob(argv[argc-2]);
+	fdt2 = load_blob(argv[argc-1]);
+
+	compare_mem_rsv(fdt1, fdt2);
+	compare_node(fdt1, 0, fdt2, 0);
+
+	cpuid1 = fdt_boot_cpuid_phys(fdt1);
+	cpuid2 = fdt_boot_cpuid_phys(fdt2);
+	if (cpuid1 != cpuid2)
+		MISMATCH("boot_cpuid_phys mismatch 0x%x != 0x%x",
+		     cpuid1, cpuid2);
+
+	MATCH();
+}
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2010-03-11 11:12:43.544724579 +1100
+++ dtc/tests/Makefile.tests	2010-03-11 11:15:05.680747104 +1100
@@ -14,6 +14,7 @@ LIB_TESTS_L = get_mem_rsv \
 	boot-cpuid incbin \
 	extra-terminating-null \
 	dtbs_equal_ordered \
+	dtb_reverse dtbs_equal_unordered \
 	add_subnode_with_nops path_offset_aliases
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-03-11 11:12:43.784725278 +1100
+++ dtc/tests/run_tests.sh	2010-03-11 11:15:05.680747104 +1100
@@ -344,6 +344,38 @@ dtc_tests () {
     run_sh_test dtc-fatal.sh -I fs -O dtb nosuchfile
 }
 
+cmp_tests () {
+    basetree="$1"
+    shift
+    wrongtrees="$@"
+
+    run_test dtb_reverse $basetree
+
+    # First dtbs_equal_ordered
+    run_test dtbs_equal_ordered $basetree $basetree
+    run_test dtbs_equal_ordered -n $basetree $basetree.reversed.test.dtb
+    for tree in $wrongtrees; do
+	run_test dtbs_equal_ordered -n $basetree $tree
+    done
+
+    # now unordered
+    run_test dtbs_equal_unordered $basetree $basetree
+    run_test dtbs_equal_unordered $basetree $basetree.reversed.test.dtb
+    run_test dtbs_equal_unordered $basetree.reversed.test.dtb $basetree
+    for tree in $wrongtrees; do
+	run_test dtbs_equal_unordered -n $basetree $tree
+    done
+}
+
+dtbs_equal_tests () {
+    WRONG_TREE1=""
+    for x in 1 2 3 4 5 6 7 8 9; do
+	run_dtc_test -I dts -O dtb -o test_tree1_wrong$x.test.dtb test_tree1_wrong$x.dts
+	WRONG_TREE1="$WRONG_TREE1 test_tree1_wrong$x.test.dtb"
+    done
+    cmp_tests test_tree1.dtb $WRONG_TREE1
+}
+
 while getopts "vt:m" ARG ; do
     case $ARG in
 	"v")
@@ -359,7 +391,7 @@ while getopts "vt:m" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt dtc"
+    TESTSETS="libfdt dtc dtbs_equal"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -373,6 +405,9 @@ for set in $TESTSETS; do
 	"dtc")
 	    dtc_tests
 	    ;;
+	"dtbs_equal")
+	    dtbs_equal_tests
+	    ;;
     esac
 done
 
Index: dtc/tests/dtbs_equal_ordered.c
===================================================================
--- dtc.orig/tests/dtbs_equal_ordered.c	2010-03-11 11:12:43.440724563 +1100
+++ dtc/tests/dtbs_equal_ordered.c	2010-03-11 11:15:05.680747104 +1100
@@ -29,6 +29,31 @@
 #include "tests.h"
 #include "testdata.h"
 
+int notequal; /* = 0 */
+
+#define MISMATCH(fmt, ...)			\
+	do { \
+		if (notequal) \
+			PASS(); \
+		else \
+			FAIL(fmt, ##__VA_ARGS__);	\
+	} while (0)
+
+#define MATCH()			\
+	do { \
+		if (!notequal) \
+			PASS(); \
+		else \
+			FAIL("Trees match which shouldn't");	\
+	} while (0)
+
+#define CHECK(code) \
+	{ \
+		err = (code); \
+		if (err) \
+			FAIL(#code ": %s", fdt_strerror(err)); \
+	}
+
 static void compare_mem_rsv(const void *fdt1, const void *fdt2)
 {
 	int i;
@@ -36,23 +61,18 @@ static void compare_mem_rsv(const void *
 	int err;
 
 	if (fdt_num_mem_rsv(fdt1) != fdt_num_mem_rsv(fdt2))
-		FAIL("Trees have different number of reserve entries");
+		MISMATCH("Trees have different number of reserve entries");
 	for (i = 0; i < fdt_num_mem_rsv(fdt1); i++) {
-		err = fdt_get_mem_rsv(fdt1, i, &addr1, &size1);
-		if (err)
-			FAIL("fdt_get_mem_rsv(fdt1, %d, ...): %s", i,
-			     fdt_strerror(err));
-		err = fdt_get_mem_rsv(fdt2, i, &addr2, &size2);
-		if (err)
-			FAIL("fdt_get_mem_rsv(fdt2, %d, ...): %s", i,
-			     fdt_strerror(err));
+		CHECK(fdt_get_mem_rsv(fdt1, i, &addr1, &size1));
+		CHECK(fdt_get_mem_rsv(fdt2, i, &addr2, &size2));
+
 		if ((addr1 != addr2) || (size1 != size2))
-			FAIL("Mismatch in reserve entry %d: "
-			     "(0x%llx, 0x%llx) != (0x%llx, 0x%llx)", i,
-			     (unsigned long long)addr1,
-			     (unsigned long long)size1,
-			     (unsigned long long)addr2,
-			     (unsigned long long)size2);
+			MISMATCH("Mismatch in reserve entry %d: "
+				 "(0x%llx, 0x%llx) != (0x%llx, 0x%llx)", i,
+				 (unsigned long long)addr1,
+				 (unsigned long long)size1,
+				 (unsigned long long)addr2,
+				 (unsigned long long)size2);
 	}
 }
 
@@ -77,7 +97,7 @@ static void compare_structure(const void
 		} while (tag2 == FDT_NOP);
 
 		if (tag1 != tag2)
-			FAIL("Tag mismatch (%d != %d) at (%d, %d)",
+			MISMATCH("Tag mismatch (%d != %d) at (%d, %d)",
 			     tag1, tag2, offset1, offset2);
 
 		switch (tag1) {
@@ -90,9 +110,10 @@ static void compare_structure(const void
 			if (!name2)
 				FAIL("fdt_get_name(fdt2, %d, ..): %s",
 				     offset2, fdt_strerror(err));
+
 			if (!streq(name1, name2))
-			    FAIL("Name mismatch (\"%s\" != \"%s\") at (%d, %d)",
-				 name1, name2, offset1, offset2);
+			    MISMATCH("Name mismatch (\"%s\" != \"%s\") at (%d, %d)",
+				     name1, name2, offset1, offset2);
 			break;
 
 		case FDT_PROP:
@@ -106,17 +127,17 @@ static void compare_structure(const void
 			name1 = fdt_string(fdt1, fdt32_to_cpu(prop1->nameoff));
 			name2 = fdt_string(fdt2, fdt32_to_cpu(prop2->nameoff));
 			if (!streq(name1, name2))
-				FAIL("Property name mismatch \"%s\" != \"%s\" "
-				     "at (%d, %d)", name1, name2, offset1, offset2);
+				MISMATCH("Property name mismatch \"%s\" != \"%s\" "
+					 "at (%d, %d)", name1, name2, offset1, offset2);
 			len1 = fdt32_to_cpu(prop1->len);
 			len2 = fdt32_to_cpu(prop2->len);
 			if (len1 != len2)
-				FAIL("Property length mismatch %u != %u "
-				     "at (%d, %d)", len1, len2, offset1, offset2);
+				MISMATCH("Property length mismatch %u != %u "
+					 "at (%d, %d)", len1, len2, offset1, offset2);
 
 			if (memcmp(prop1->data, prop2->data, len1) != 0)
-				FAIL("Property value mismatch at (%d, %d)",
-				     offset1, offset2);
+				MISMATCH("Property value mismatch at (%d, %d)",
+					 offset1, offset2);
 			break;
 
 		case FDT_END:
@@ -131,10 +152,14 @@ int main(int argc, char *argv[])
 	uint32_t cpuid1, cpuid2;
 
 	test_init(argc, argv);
-	if (argc != 3)
-		CONFIG("Usage: %s <dtb file> <dtb file>", argv[0]);
-	fdt1 = load_blob(argv[1]);
-	fdt2 = load_blob(argv[2]);
+	if ((argc != 3)
+	    && ((argc != 4) || !streq(argv[1], "-n")))
+		CONFIG("Usage: %s [-n] <dtb file> <dtb file>", argv[0]);
+	if (argc == 4)
+		notequal = 1;
+
+	fdt1 = load_blob(argv[argc-2]);
+	fdt2 = load_blob(argv[argc-1]);
 
 	compare_mem_rsv(fdt1, fdt2);
 	compare_structure(fdt1, fdt2);
@@ -142,8 +167,8 @@ int main(int argc, char *argv[])
 	cpuid1 = fdt_boot_cpuid_phys(fdt1);
 	cpuid2 = fdt_boot_cpuid_phys(fdt2);
 	if (cpuid1 != cpuid2)
-		FAIL("boot_cpuid_phys mismatch 0x%x != 0x%x",
-		     cpuid1, cpuid2);
+		MISMATCH("boot_cpuid_phys mismatch 0x%x != 0x%x",
+			 cpuid1, cpuid2);
 
-	PASS();
+	MATCH();
 }
Index: dtc/tests/test_tree1_wrong1.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong1.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,36 @@
+/dts-v1/;
+
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong2.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong2.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,36 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong3.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong3.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,36 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong4.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong4.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,34 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong5.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong5.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,37 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbefe>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong6.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong6.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+			extra-prop;
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong7.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong7.dts	2010-03-11 11:15:05.684772616 +1100
@@ -0,0 +1,39 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+			extranode {
+			};
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong8.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong8.dts	2010-03-11 11:15:05.688746236 +1100
@@ -0,0 +1,37 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010001;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
Index: dtc/tests/test_tree1_wrong9.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/test_tree1_wrong9.dts	2010-03-11 11:15:05.688746236 +1100
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+/memreserve/ 0 1;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
