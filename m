From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Support ePAPR compliant phandle properties
Date: Thu, 26 Nov 2009 15:37:13 +1100
Message-ID: <20091126043713.GA27334@yookeroo>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, the Linux kernel, libfdt and dtc, when using flattened
device trees encode a node's phandle into a property named
"linux,phandle".  The ePAPR specification, however - aiming as it is
to not be a Linux specific spec - requires that phandles be encoded in
a property named simply "phandle".

This patch adds support for this newer approach to dtc and libfdt.
Specifically:

	- fdt_get_phandle() will now return the correct phandle if it
          is supplied in either of these properties

	- fdt_node_offset_by_phandle() will correctly find a node with
          the given phandle encoded in either property.

	- By default, when auto-generating phandles, dtc will encode
          it into both properties for maximum compatibility.  A new -H
          option allows either only old-style or only new-style
          properties to be generated.

	- If phandle properties are explicitly supplied in the dts
	  file, dtc will not auto-generate ones in the alternate format.

	- If both properties are supplied, dtc will check that they
          have the same value.

	- Some existing testcases are updated to use a mix of old and
          new-style phandles, partially testing the changes.

	- A new phandle_format test further tests the libfdt support,
          and the -H option.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/libfdt/fdt_ro.c
===================================================================
--- dtc.orig/libfdt/fdt_ro.c	2009-11-26 15:15:55.027849347 +1100
+++ dtc/libfdt/fdt_ro.c	2009-11-26 15:25:59.130814590 +1100
@@ -274,9 +274,14 @@ uint32_t fdt_get_phandle(const void *fdt
 	const uint32_t *php;
 	int len;
 
-	php = fdt_getprop(fdt, nodeoffset, "linux,phandle", &len);
-	if (!php || (len != sizeof(*php)))
-		return 0;
+	/* FIXME: This is a bit sub-optimal, since we potentially scan
+	 * over all the properties twice. */
+	php = fdt_getprop(fdt, nodeoffset, "phandle", &len);
+	if (!php || (len != sizeof(*php))) {
+		php = fdt_getprop(fdt, nodeoffset, "linux,phandle", &len);
+		if (!php || (len != sizeof(*php)))
+			return 0;
+	}
 
 	return fdt32_to_cpu(*php);
 }
@@ -436,11 +441,27 @@ int fdt_node_offset_by_prop_value(const 
 
 int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 {
+	int offset;
+
 	if ((phandle == 0) || (phandle == -1))
 		return -FDT_ERR_BADPHANDLE;
-	phandle = cpu_to_fdt32(phandle);
-	return fdt_node_offset_by_prop_value(fdt, -1, "linux,phandle",
-					     &phandle, sizeof(phandle));
+
+	FDT_CHECK_HEADER(fdt);
+
+	/* FIXME: The algorithm here is pretty horrible: we
+	 * potentially scan each property of a node in
+	 * fdt_get_phandle(), then if that didn't find what
+	 * we want, we scan over them again making our way to the next
+	 * node.  Still it's the easiest to implement approach;
+	 * performance can come later. */
+	for (offset = fdt_next_node(fdt, -1, NULL);
+	     offset >= 0;
+	     offset = fdt_next_node(fdt, offset, NULL)) {
+		if (fdt_get_phandle(fdt, offset) == phandle)
+			return offset;
+	}
+
+	return offset; /* error from fdt_next_node() */
 }
 
 static int _fdt_stringlist_contains(const char *strlist, int listlen,
Index: dtc/checks.c
===================================================================
--- dtc.orig/checks.c	2009-11-26 15:15:55.123815523 +1100
+++ dtc/checks.c	2009-11-26 15:16:16.391814527 +1100
@@ -279,20 +279,19 @@ static void check_property_name_chars(st
 PROP_CHECK(property_name_chars, PROPNODECHARS, ERROR);
 
 static void check_explicit_phandles(struct check *c, struct node *root,
-					  struct node *node)
+				    struct node *node, struct property *prop)
 {
-	struct property *prop;
 	struct marker *m;
 	struct node *other;
 	cell_t phandle;
 
-	prop = get_property(node, "linux,phandle");
-	if (! prop)
-		return; /* No phandle, that's fine */
+	if (!streq(prop->name, "phandle")
+	    && !streq(prop->name, "linux,phandle"))
+		return;
 
 	if (prop->val.len != sizeof(cell_t)) {
-		FAIL(c, "%s has bad length (%d) linux,phandle property",
-		     node->fullpath, prop->val.len);
+		FAIL(c, "%s has bad length (%d) %s property",
+		     node->fullpath, prop->val.len, prop->name);
 		return;
 	}
 
@@ -302,9 +301,11 @@ static void check_explicit_phandles(stru
 		if (node != get_node_by_ref(root, m->ref))
 			/* "Set this node's phandle equal to some
 			 * other node's phandle".  That's nonsensical
-			 * by construction. */
-			FAIL(c, "linux,phandle in %s is a reference to another node",
-			     node->fullpath);
+			 * by construction. */ {
+			FAIL(c, "%s in %s is a reference to another node",
+			     prop->name, node->fullpath);
+			return;
+		}
 		/* But setting this node's phandle equal to its own
 		 * phandle is allowed - that means allocate a unique
 		 * phandle for this node, even if it's not otherwise
@@ -314,14 +315,19 @@ static void check_explicit_phandles(stru
 	}
 
 	phandle = propval_cell(prop);
+
 	if ((phandle == 0) || (phandle == -1)) {
-		FAIL(c, "%s has invalid linux,phandle value 0x%x",
-		     node->fullpath, phandle);
+		FAIL(c, "%s has bad value (0x%x) in %s property",
+		     node->fullpath, phandle, prop->name);
 		return;
 	}
 
+	if (node->phandle && (node->phandle != phandle))
+		FAIL(c, "%s has %s property which replaces existing phandle information",
+		     node->fullpath, prop->name);
+
 	other = get_node_by_phandle(root, phandle);
-	if (other) {
+	if (other && (other != node)) {
 		FAIL(c, "%s has duplicated phandle 0x%x (seen before at %s)",
 		     node->fullpath, phandle, other->fullpath);
 		return;
@@ -329,7 +335,7 @@ static void check_explicit_phandles(stru
 
 	node->phandle = phandle;
 }
-NODE_CHECK(explicit_phandles, NULL, ERROR);
+PROP_CHECK(explicit_phandles, NULL, ERROR);
 
 static void check_name_properties(struct check *c, struct node *root,
 				  struct node *node)
Index: dtc/tests/references.dts
===================================================================
--- dtc.orig/tests/references.dts	2009-11-26 15:15:55.163855038 +1100
+++ dtc/tests/references.dts	2009-11-26 15:16:16.391814527 +1100
@@ -8,7 +8,7 @@
 		lref = <&n2>;
 	};
 	n2: node2 {
-		linux,phandle = <0x1>;
+		phandle = <0x1>;
 		ref = <&{/node1}>; /* reference after target */
 		lref = <&n1>;
 	};
@@ -29,5 +29,6 @@
 	 * so check it actually works */
 	n5: node5 {
 		linux,phandle = <&n5>;
+		phandle = <&n5>;
 	};
 };
Index: dtc/tests/test_tree1.dts
===================================================================
--- dtc.orig/tests/test_tree1.dts	2009-11-26 15:15:55.175815428 +1100
+++ dtc/tests/test_tree1.dts	2009-11-26 15:16:16.395816572 +1100
@@ -26,7 +26,7 @@
 		prop-int = <123456789>;
 
 		subsubnode@0 {
-			linux,phandle = <0x2001>;
+			phandle = <0x2001>;
 			compatible = "subsubnode2", "subsubnode";
 			prop-int = <0726746425>;
 		};
Index: dtc/tests/trees.S
===================================================================
--- dtc.orig/tests/trees.S	2009-11-26 15:15:55.295815042 +1100
+++ dtc/tests/trees.S	2009-11-26 15:16:16.395816572 +1100
@@ -103,7 +103,7 @@ test_tree1_struct:
 	END_NODE
 
 	BEGIN_NODE("subnode@2")
-	PROP_INT(test_tree1, phandle, PHANDLE_1)
+	PROP_INT(test_tree1, linux_phandle, PHANDLE_1)
 	PROP_INT(test_tree1, prop_int, TEST_VALUE_2)
 
 	BEGIN_NODE("subsubnode@0")
@@ -125,7 +125,8 @@ test_tree1_strings:
 	STRING(test_tree1, compatible, "compatible")
 	STRING(test_tree1, prop_int, "prop-int")
 	STRING(test_tree1, prop_str, "prop-str")
-	STRING(test_tree1, phandle, "linux,phandle")
+	STRING(test_tree1, linux_phandle, "linux,phandle")
+	STRING(test_tree1, phandle, "phandle")
 test_tree1_strings_end:
 test_tree1_end:
 
Index: dtc/tests/include1.dts
===================================================================
--- dtc.orig/tests/include1.dts	2009-11-26 15:15:55.275848258 +1100
+++ dtc/tests/include1.dts	2009-11-26 15:16:16.395816572 +1100
@@ -15,7 +15,7 @@
 		prop-int = <123456789>;
 
 		/include/ "include8.dts"
-			linux,phandle = <0x2001>;
+			phandle = <0x2001>;
 			compatible = "subsubnode2", "subsubnode";
 			prop-int = <0726746425>;
 		};
Index: dtc/tests/sw_tree1.c
===================================================================
--- dtc.orig/tests/sw_tree1.c	2009-11-26 15:15:55.147815499 +1100
+++ dtc/tests/sw_tree1.c	2009-11-26 15:16:16.395816572 +1100
@@ -74,7 +74,7 @@ int main(int argc, char *argv[])
 	CHECK(fdt_property_cell(fdt, "linux,phandle", PHANDLE_1));
 	CHECK(fdt_property_cell(fdt, "prop-int", TEST_VALUE_2));
 	CHECK(fdt_begin_node(fdt, "subsubnode@0"));
-	CHECK(fdt_property_cell(fdt, "linux,phandle", PHANDLE_2));
+	CHECK(fdt_property_cell(fdt, "phandle", PHANDLE_2));
 	CHECK(fdt_property(fdt, "compatible", "subsubnode2\0subsubnode",
 			   23));
 	CHECK(fdt_property_cell(fdt, "prop-int", TEST_VALUE_2));
Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2009-11-26 15:15:55.107848201 +1100
+++ dtc/dtc.c	2009-11-26 15:16:16.395816572 +1100
@@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
 int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
+int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
 
 char *join_path(const char *path, const char *name)
 {
@@ -106,6 +107,11 @@ static void  __attribute__ ((noreturn)) 
 	fprintf(stderr, "\t\tForce - try to produce output even if the input tree has errors\n");
 	fprintf(stderr, "\t-v\n");
 	fprintf(stderr, "\t\tPrint DTC version and exit\n");
+	fprintf(stderr, "\t-H <phandle format>\n");
+	fprintf(stderr, "\t\tphandle formats are:\n");
+	fprintf(stderr, "\t\t\tlegacy - \"linux,phandle\" properties only\n");
+	fprintf(stderr, "\t\t\tepapr - \"phandle\" properties only\n");
+	fprintf(stderr, "\t\t\tboth - Both \"linux,phandle\" and \"phandle\" properties\n");
 	exit(3);
 }
 
@@ -127,7 +133,7 @@ int main(int argc, char *argv[])
 	minsize    = 0;
 	padsize    = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fcqb:v")) != EOF) {
+	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fcqb:vH:")) != EOF) {
 		switch (opt) {
 		case 'I':
 			inform = optarg;
@@ -165,6 +171,18 @@ int main(int argc, char *argv[])
 		case 'v':
 			printf("Version: %s\n", DTC_VERSION);
 			exit(0);
+		case 'H':
+			if (streq(optarg, "legacy"))
+				phandle_format = PHANDLE_LEGACY;
+			else if (streq(optarg, "epapr"))
+				phandle_format = PHANDLE_EPAPR;
+			else if (streq(optarg, "both"))
+				phandle_format = PHANDLE_BOTH;
+			else
+				die("Invalid argument \"%s\" to -H option\n",
+				    optarg);
+			break;
+
 		case 'h':
 		default:
 			usage();
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2009-11-26 15:15:55.067814971 +1100
+++ dtc/dtc.h	2009-11-26 15:16:16.395816572 +1100
@@ -52,6 +52,11 @@ extern int quiet;		/* Level of quietness
 extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
+extern int phandle_format;	/* Use linux,phandle or phandle properties */
+
+#define PHANDLE_LEGACY	0x1
+#define PHANDLE_EPAPR	0x2
+#define PHANDLE_BOTH	0x3
 
 typedef uint32_t cell_t;
 
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2009-11-26 15:15:55.211848011 +1100
+++ dtc/tests/Makefile.tests	2009-11-26 15:16:16.395816572 +1100
@@ -10,7 +10,8 @@ LIB_TESTS_L = get_mem_rsv \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
-	string_escapes references path-references boot-cpuid incbin \
+	string_escapes references path-references phandle_format \
+	boot-cpuid incbin \
 	extra-terminating-null \
 	dtbs_equal_ordered \
 	add_subnode_with_nops path_offset_aliases
Index: dtc/tests/phandle_format.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/phandle_format.c	2009-11-26 15:16:16.395816572 +1100
@@ -0,0 +1,78 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for phandle format options
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
+#define PHANDLE_LEGACY	0x1
+#define PHANDLE_EPAPR	0x2
+#define PHANDLE_BOTH	0x3
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	int phandle_format;
+	int n4;
+	uint32_t h4;
+
+	if (argc != 3)
+		CONFIG("Usage: %s <dtb file> <legacy|epapr|both>\n", argv[0]);
+
+	test_init(argc, argv);
+	fdt = load_blob(argv[1]);
+
+	if (streq(argv[2], "legacy"))
+		phandle_format = PHANDLE_LEGACY;
+	else if (streq(argv[2], "epapr"))
+		phandle_format = PHANDLE_EPAPR;
+	else if (streq(argv[2], "both"))
+		phandle_format = PHANDLE_BOTH;
+	else
+		CONFIG("Usage: %s <dtb file> <legacy|epapr|both>\n", argv[0]);
+
+	n4 = fdt_path_offset(fdt, "/node4");
+	if (n4 < 0)
+		FAIL("fdt_path_offset(/node4): %s", fdt_strerror(n4));
+
+	h4 = fdt_get_phandle(fdt, n4);
+	if ((h4 == 0) || (h4 == -1))
+		FAIL("/node4 has bad phandle 0x%x\n", h4);
+
+	if (phandle_format & PHANDLE_LEGACY)
+		check_getprop_cell(fdt, n4, "linux,phandle", h4);
+	else
+		if (fdt_getprop(fdt, n4, "linux,phandle", NULL))
+			FAIL("linux,phandle property present in non-legacy mode");
+
+	if (phandle_format & PHANDLE_EPAPR)
+		check_getprop_cell(fdt, n4, "phandle", h4);
+	else
+		if (fdt_getprop(fdt, n4, "phandle", NULL))
+			FAIL("phandle property present in legacy-only mode");
+
+	PASS();
+}
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2009-11-26 15:15:55.191814458 +1100
+++ dtc/tests/run_tests.sh	2009-11-26 15:19:32.986814978 +1100
@@ -219,6 +219,12 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_path-references.test.dtb path-references.dts
     run_test path-references dtc_path-references.test.dtb
 
+    run_test phandle_format dtc_references.test.dtb both
+    for f in legacy epapr both; do
+	run_dtc_test -I dts -O dtb -H $f -o dtc_references.test.$f.dtb references.dts
+	run_test phandle_format dtc_references.test.$f.dtb $f
+    done
+
     run_dtc_test -I dts -O dtb -o dtc_comments.test.dtb comments.dts
     run_dtc_test -I dts -O dtb -o dtc_comments-cmp.test.dtb comments-cmp.dts
     run_test dtbs_equal_ordered dtc_comments.test.dtb dtc_comments-cmp.test.dtb
Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2009-11-26 15:17:20.275849571 +1100
+++ dtc/livetree.c	2009-11-26 15:18:35.722814886 +1100
@@ -297,12 +297,22 @@ cell_t get_node_phandle(struct node *roo
 		phandle++;
 
 	node->phandle = phandle;
-	if (!get_property(node, "linux,phandle"))
+
+	if (!get_property(node, "linux,phandle")
+	    && (phandle_format & PHANDLE_LEGACY))
 		add_property(node,
 			     build_property("linux,phandle",
 					    data_append_cell(empty_data, phandle),
 					    NULL));
-	/* If the node *does* have a linux,phandle property, we must
+
+	if (!get_property(node, "phandle")
+	    && (phandle_format & PHANDLE_EPAPR))
+		add_property(node,
+			     build_property("phandle",
+					    data_append_cell(empty_data, phandle),
+					    NULL));
+
+	/* If the node *does* have a phandle property, we must
 	 * be dealing with a self-referencing phandle, which will be
 	 * fixed up momentarily in the caller */
 



-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
