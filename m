From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 2/6] libfdt: Add iterator over properties
Date: Mon, 11 Jul 2016 21:56:19 +0200
Message-ID: <20160711195623.12840-3-maxime.ripard@free-electrons.com>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160711195623.12840-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implement a macro based on fdt_first_property_offset and
fdt_next_property_offset that provides a convenience to iterate over all
the properties of a given node.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 libfdt/libfdt.h            | 24 ++++++++++++
 tests/.gitignore           |  1 +
 tests/Makefile.tests       |  1 +
 tests/property_iterate.c   | 97 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/property_iterate.dts | 24 ++++++++++++
 tests/run_tests.sh         |  3 ++
 6 files changed, 150 insertions(+)
 create mode 100644 tests/property_iterate.c
 create mode 100644 tests/property_iterate.dts

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 0cf46872b54e..9d3c9b234274 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -455,6 +455,30 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
  */
 int fdt_next_property_offset(const void *fdt, int offset);
 
+/**
+ * fdt_for_each_property - iterate over all properties of a node
+ * @property_offset:	property offset (int)
+ * @fdt:		FDT blob (const void *)
+ * @node:		node offset (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_property(fdt, node, property) {
+ *		...
+ *		use property
+ *		...
+ *	}
+ *
+ * Note that this is implemented as a macro and property is used as
+ * iterator in the loop. It should therefore be a locally allocated
+ * variable. The node variable on the other hand is never modified, so
+ * it can be constant or even a literal.
+ */
+#define fdt_for_each_property_offset(property, fdt, node)	\
+	for (property = fdt_first_property_offset(fdt, node);	\
+	     property >= 0;					\
+	     property = fdt_next_property_offset(fdt, property))
+
 /**
  * fdt_get_property_by_offset - retrieve the property at a given offset
  * @fdt: pointer to the device tree blob
diff --git a/tests/.gitignore b/tests/.gitignore
index e4532da30bf5..fa4616ba28c2 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -40,6 +40,7 @@ tmp.*
 /path_offset
 /path_offset_aliases
 /phandle_format
+/property_iterate
 /propname_escapes
 /references
 /root_node
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index f7c3a4b00ead..196518c83eda 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -23,6 +23,7 @@ LIB_TESTS_L = get_mem_rsv \
 	add_subnode_with_nops path_offset_aliases \
 	utilfdt_test \
 	integer-expressions \
+	property_iterate \
 	subnode_iterate
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
diff --git a/tests/property_iterate.c b/tests/property_iterate.c
new file mode 100644
index 000000000000..0f3959cb8c22
--- /dev/null
+++ b/tests/property_iterate.c
@@ -0,0 +1,97 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Tests that fdt_next_subnode() works as expected
+ *
+ * Copyright (C) 2013 Google, Inc
+ *
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
+
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+static void test_node(void *fdt, int parent_offset)
+{
+	fdt32_t properties;
+	const fdt32_t *prop;
+	int offset, property;
+	int count;
+	int len;
+
+	/*
+	 * This property indicates the number of properties in our
+	 * test node to expect
+	 */
+	prop = fdt_getprop(fdt, parent_offset, "test-properties", &len);
+	if (!prop || len != sizeof(fdt32_t)) {
+		FAIL("Missing/invalid test-properties property at '%s'",
+		     fdt_get_name(fdt, parent_offset, NULL));
+	}
+	properties = cpu_to_fdt32(*prop);
+
+	count = 0;
+	offset = fdt_first_subnode(fdt, parent_offset);
+	if (offset < 0)
+		FAIL("Missing test node\n");
+
+	fdt_for_each_property_offset(property, fdt, offset)
+		count++;
+
+	if (count != properties) {
+		FAIL("Node '%s': Expected %d properties, got %d\n",
+		     fdt_get_name(fdt, parent_offset, NULL), properties,
+		     count);
+	}
+}
+
+static void check_fdt_next_subnode(void *fdt)
+{
+	int offset;
+	int count = 0;
+
+	fdt_for_each_subnode(offset, fdt, 0) {
+		test_node(fdt, offset);
+		count++;
+	}
+
+	if (count != 2)
+		FAIL("Expected %d tests, got %d\n", 2, count);
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+
+	test_init(argc, argv);
+	if (argc != 2)
+		CONFIG("Usage: %s <dtb file>", argv[0]);
+
+	fdt = load_blob(argv[1]);
+	if (!fdt)
+		FAIL("No device tree available");
+
+	check_fdt_next_subnode(fdt);
+
+	PASS();
+}
diff --git a/tests/property_iterate.dts b/tests/property_iterate.dts
new file mode 100644
index 000000000000..2ed677e7e6ea
--- /dev/null
+++ b/tests/property_iterate.dts
@@ -0,0 +1,24 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	test1 {
+		test-properties = <3>;
+
+		test {
+			linux,phandle = <0x1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	test2 {
+		test-properties = <0>;
+
+		test {
+		};
+	};
+};
+
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 7eb9b3d33108..6a2662b2abaf 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -269,6 +269,9 @@ libfdt_tests () {
     run_dtc_test -I dts -O dtb -o subnode_iterate.dtb subnode_iterate.dts
     run_test subnode_iterate subnode_iterate.dtb
 
+    run_dtc_test -I dts -O dtb -o property_iterate.dtb property_iterate.dts
+    run_test property_iterate property_iterate.dtb
+
     # Tests for behaviour on various sorts of corrupted trees
     run_test truncated_property
 
-- 
2.9.0
