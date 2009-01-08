From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [2/2] dtc: Add testcases for labels within values
Date: Thu, 8 Jan 2009 11:48:48 +1100
Message-ID: <20090108004848.GD25270@yookeroo.seuss>
References: <20090108004645.GB25270@yookeroo.seuss>
	<20090108004755.GC25270@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090108004755.GC25270-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a testcase using asm output mode to check that labels
within property values are correctly processed.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2008-11-07 13:59:40.000000000 +1100
+++ dtc/tests/run_tests.sh	2008-11-07 13:59:43.000000000 +1100
@@ -239,7 +239,8 @@ dtc_tests () {
 
     # Check -Oasm mode
     for tree in test_tree1.dts escapes.dts references.dts path-references.dts \
-	comments.dts aliases.dts include0.dts incbin.dts ; do
+	comments.dts aliases.dts include0.dts incbin.dts \
+	value-labels.dts ; do
 	run_dtc_test -I dts -O asm -o oasm_$tree.test.s $tree
 	asm_to_so_test oasm_$tree
 	run_dtc_test -I dts -O dtb -o $tree.test.dtb $tree
@@ -247,6 +248,8 @@ dtc_tests () {
 	run_wrap_test cmp oasm_$tree.test.dtb $tree.test.dtb
     done
 
+    run_test value-labels ./oasm_value-labels.dts.test.so
+
     # Check -Odts mode preserve all dtb information
     for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb \
 	dtc_references.test.dtb; do
Index: dtc/tests/value-labels.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/value-labels.dts	2008-11-07 13:59:43.000000000 +1100
@@ -0,0 +1,8 @@
+/dts-v1/;
+
+/ {
+	prop1: prop1 = start1: "a", mid1: "b" end1:;
+	prop2: prop2 = start2: < innerstart2: 0xdeadbeef innermid2: 0xabcd1234 innerend2: > end2:;
+	prop3: prop3 = start3: [ innerstart3: ab innermid3: cd innerend3: ] end3:;
+};
+
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2008-11-07 13:59:40.000000000 +1100
+++ dtc/tests/Makefile.tests	2008-11-07 13:59:43.000000000 +1100
@@ -18,7 +18,7 @@ LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREF
 LIBTREE_TESTS_L = truncated_property
 LIBTREE_TESTS = $(LIBTREE_TESTS_L:%=$(TESTS_PREFIX)%)
 
-DL_LIB_TESTS_L = asm_tree_dump
+DL_LIB_TESTS_L = asm_tree_dump value-labels
 DL_LIB_TESTS = $(DL_LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 TESTS = $(LIB_TESTS) $(LIBTREE_TESTS) $(DL_LIB_TESTS)
Index: dtc/tests/value-labels.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/value-labels.c	2008-11-07 13:59:43.000000000 +1100
@@ -0,0 +1,128 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Test labels within values
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
+#include <dlfcn.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+struct val_label {
+	const char *labelname;
+	int propoff;
+};
+
+struct val_label labels1[] = {
+	{ "start1", 0 },
+	{ "mid1", 2 },
+	{ "end1", -1 },
+};
+
+struct val_label labels2[] = {
+	{ "start2", 0 },
+	{ "innerstart2", 0 },
+	{ "innermid2", 4 },
+	{ "innerend2", -1 },
+	{ "end2", -1 },
+};
+
+struct val_label labels3[] = {
+	{ "start3", 0 },
+	{ "innerstart3", 0 },
+	{ "innermid3", 1 },
+	{ "innerend3", -1 },
+	{ "end3", -1 },
+};
+
+void check_prop_labels(void *sohandle, void *fdt, const char *name,
+		       const struct val_label* labels, int n)
+{
+	const struct fdt_property *prop;
+	const char *p;
+	int len;
+	int i;
+
+	prop = fdt_get_property(fdt, 0, name, &len);
+	if (!prop)
+		FAIL("Couldn't locate property \"%s\"", name);
+
+	p = dlsym(sohandle, name);
+	if (!p)
+		FAIL("Couldn't locate label symbol \"%s\"", name);
+
+	if (p != (const char *)prop)
+		FAIL("Label \"%s\" does not point to correct property", name);
+
+	for (i = 0; i < n; i++) {
+		int off = labels[i].propoff;
+
+		if (off == -1)
+			off = len;
+
+		p = dlsym(sohandle, labels[i].labelname);
+		if (!p)
+			FAIL("Couldn't locate label symbol \"%s\"", name);
+
+		if ((p - prop->data) != off)
+			FAIL("Label \"%s\" points to offset %d instead of %d"
+			     "in property \"%s\"", labels[i].labelname,
+			     p - prop->data, off, name);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	void *sohandle;
+	void *fdt;
+	int err;
+
+	test_init(argc, argv);
+	if (argc != 2)
+		CONFIG("Usage: %s <so file>", argv[0]);
+
+	sohandle = dlopen(argv[1], RTLD_NOW);
+	if (!sohandle)
+		FAIL("Couldn't dlopen() %s", argv[1]);
+
+	fdt = dlsym(sohandle, "dt_blob_start");
+	if (!fdt)
+		FAIL("Couldn't locate \"dt_blob_start\" symbol in %s",
+		     argv[1]);
+
+	err = fdt_check_header(fdt);
+	if (err != 0)
+		FAIL("%s contains invalid tree: %s", argv[1],
+		     fdt_strerror(err));
+
+
+	check_prop_labels(sohandle, fdt, "prop1", labels1, ARRAY_SIZE(labels1));
+	check_prop_labels(sohandle, fdt, "prop2", labels2, ARRAY_SIZE(labels2));
+	check_prop_labels(sohandle, fdt, "prop3", labels3, ARRAY_SIZE(labels3));
+
+	PASS();
+}
Index: dtc/tests/tests.h
===================================================================
--- dtc.orig/tests/tests.h	2008-11-07 13:59:38.000000000 +1100
+++ dtc/tests/tests.h	2008-11-07 13:59:43.000000000 +1100
@@ -34,6 +34,7 @@ void test_init(int argc, char *argv[]);
 
 #define ALIGN(x, a)	(((x) + (a) - 1) & ~((a) - 1))
 #define PALIGN(p, a)	((void *)ALIGN((unsigned long)(p), (a)))
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
 #define streq(s1, s2)	(strcmp((s1),(s2)) == 0)
 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
