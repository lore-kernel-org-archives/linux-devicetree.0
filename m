From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 4/4] tests: Add tests cases for the overlay code
Date: Fri, 30 Sep 2016 15:57:17 +0200
Message-ID: <20160930135717.16511-5-maxime.ripard@free-electrons.com>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160930135717.16511-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add some test infrastructure to test that the overlay can be merged, but
also that poorly formatted fixups would fail as expected.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 tests/.gitignore                            |   2 +
 tests/Makefile.tests                        |   3 +-
 tests/overlay.c                             | 232 ++++++++++++++++++++++++++++
 tests/overlay_bad_fixup.c                   |  70 +++++++++
 tests/overlay_bad_fixup_bad_index.dts       |  14 ++
 tests/overlay_bad_fixup_base.dtsi           |  18 +++
 tests/overlay_bad_fixup_empty.dts           |  14 ++
 tests/overlay_bad_fixup_empty_index.dts     |  14 ++
 tests/overlay_bad_fixup_index_trailing.dts  |  14 ++
 tests/overlay_bad_fixup_path_empty_prop.dts |  14 ++
 tests/overlay_bad_fixup_path_only.dts       |  14 ++
 tests/overlay_bad_fixup_path_only_sep.dts   |  14 ++
 tests/overlay_bad_fixup_path_prop.dts       |  14 ++
 tests/overlay_base.dts                      |  21 +++
 tests/overlay_overlay_dtc.dts               |  85 ++++++++++
 tests/overlay_overlay_nodtc.dts             |  82 ++++++++++
 tests/run_tests.sh                          |  32 ++++
 17 files changed, 656 insertions(+), 1 deletion(-)
 create mode 100644 tests/overlay.c
 create mode 100644 tests/overlay_bad_fixup.c
 create mode 100644 tests/overlay_bad_fixup_bad_index.dts
 create mode 100644 tests/overlay_bad_fixup_base.dtsi
 create mode 100644 tests/overlay_bad_fixup_empty.dts
 create mode 100644 tests/overlay_bad_fixup_empty_index.dts
 create mode 100644 tests/overlay_bad_fixup_index_trailing.dts
 create mode 100644 tests/overlay_bad_fixup_path_empty_prop.dts
 create mode 100644 tests/overlay_bad_fixup_path_only.dts
 create mode 100644 tests/overlay_bad_fixup_path_only_sep.dts
 create mode 100644 tests/overlay_bad_fixup_path_prop.dts
 create mode 100644 tests/overlay_base.dts
 create mode 100644 tests/overlay_overlay_dtc.dts
 create mode 100644 tests/overlay_overlay_nodtc.dts

diff --git a/tests/.gitignore b/tests/.gitignore
index fa4616ba28c2..354b565aa095 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -35,6 +35,8 @@ tmp.*
 /nopulate
 /notfound
 /open_pack
+/overlay
+/overlay_bad_fixup
 /parent_offset
 /path-references
 /path_offset
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 196518c83eda..eb039c5a40c1 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -24,7 +24,8 @@ LIB_TESTS_L = get_mem_rsv \
 	utilfdt_test \
 	integer-expressions \
 	property_iterate \
-	subnode_iterate
+	subnode_iterate \
+	overlay overlay_bad_fixup
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/overlay.c b/tests/overlay.c
new file mode 100644
index 000000000000..e467b037255f
--- /dev/null
+++ b/tests/overlay.c
@@ -0,0 +1,232 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for DT overlays()
+ * Copyright (C) 2016 Free Electrons
+ * Copyright (C) 2016 NextThing Co.
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
+#include <stdio.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+
+#define CHECK(code) \
+	{ \
+		if (code) \
+			FAIL(#code ": %s", fdt_strerror(code)); \
+	}
+
+/* 4k ought to be enough for anybody */
+#define FDT_COPY_SIZE	(4 * 1024)
+
+static int fdt_getprop_u32_by_index(void *fdt, const char *path,
+				    const char *name, int index,
+				    unsigned long *out)
+{
+	const fdt32_t *val;
+	int node_off;
+	int len;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	val = fdt_getprop(fdt, node_off, name, &len);
+	if (!val || (len < (sizeof(uint32_t) * (index + 1))))
+		return -FDT_ERR_NOTFOUND;
+
+	*out = fdt32_to_cpu(*(val + index));
+
+	return 0;
+}
+
+static int check_getprop_string_by_name(void *fdt, const char *path,
+					const char *name, const char *val)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	if (node_off < 0)
+		return node_off;
+
+	check_getprop_string(fdt, node_off, name, val);
+
+	return 0;
+}
+
+static int check_getprop_u32_by_name(void *fdt, const char *path,
+				     const char *name, uint32_t val)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	CHECK(node_off < 0);
+
+	check_getprop_cell(fdt, node_off, name, val);
+
+	return 0;
+}
+
+static int check_getprop_null_by_name(void *fdt, const char *path,
+				      const char *name)
+{
+	int node_off;
+
+	node_off = fdt_path_offset(fdt, path);
+	CHECK(node_off < 0);
+
+	check_property(fdt, node_off, name, 0, NULL);
+
+	return 0;
+}
+
+static int fdt_overlay_change_int_property(void *fdt)
+{
+	return check_getprop_u32_by_name(fdt, "/test-node", "test-int-property",
+					 43);
+}
+
+static int fdt_overlay_change_str_property(void *fdt)
+{
+	return check_getprop_string_by_name(fdt, "/test-node",
+					    "test-str-property", "foobar");
+}
+
+static int fdt_overlay_add_str_property(void *fdt)
+{
+	return check_getprop_string_by_name(fdt, "/test-node",
+					    "test-str-property-2", "foobar2");
+}
+
+static int fdt_overlay_add_node(void *fdt)
+{
+	return check_getprop_null_by_name(fdt, "/test-node/new-node",
+					  "new-property");
+}
+
+static int fdt_overlay_add_subnode_property(void *fdt)
+{
+	check_getprop_null_by_name(fdt, "/test-node/sub-test-node",
+				   "sub-test-property");
+	check_getprop_null_by_name(fdt, "/test-node/sub-test-node",
+				   "new-sub-test-property");
+
+	return 0;
+}
+
+static int fdt_overlay_local_phandle(void *fdt)
+{
+	uint32_t local_phandle;
+	unsigned long val = 0;
+	int off;
+
+	off = fdt_path_offset(fdt, "/test-node/new-local-node");
+	CHECK(off < 0);
+
+	local_phandle = fdt_get_phandle(fdt, off);
+	CHECK(!local_phandle);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/test-node",
+				       "test-several-phandle",
+				       0, &val));
+	CHECK(val != local_phandle);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/test-node",
+				       "test-several-phandle",
+				       1, &val));
+	CHECK(val != local_phandle);
+
+	return 0;
+}
+
+static int fdt_overlay_local_phandles(void *fdt)
+{
+	uint32_t local_phandle, test_phandle;
+	unsigned long val = 0;
+	int off;
+
+	off = fdt_path_offset(fdt, "/test-node/new-local-node");
+	CHECK(off < 0);
+
+	local_phandle = fdt_get_phandle(fdt, off);
+	CHECK(!local_phandle);
+
+	off = fdt_path_offset(fdt, "/test-node");
+	CHECK(off < 0);
+
+	test_phandle = fdt_get_phandle(fdt, off);
+	CHECK(!test_phandle);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/test-node",
+				       "test-phandle", 0, &val));
+	CHECK(test_phandle != val);
+
+	CHECK(fdt_getprop_u32_by_index(fdt, "/test-node",
+				       "test-phandle", 1, &val));
+	CHECK(local_phandle != val);
+
+	return 0;
+}
+
+static void *open_dt(char *path)
+{
+	void *dt, *copy;
+
+	dt = load_blob(path);
+	copy = xmalloc(FDT_COPY_SIZE);
+
+	/*
+	 * Resize our DTs to 4k so that we have room to operate on
+	 */
+	CHECK(fdt_open_into(dt, copy, FDT_COPY_SIZE));
+
+	return copy;
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt_base, *fdt_overlay;
+
+	test_init(argc, argv);
+	if (argc != 3)
+		CONFIG("Usage: %s <base dtb> <overlay dtb>", argv[0]);
+
+	fdt_base = open_dt(argv[1]);
+	fdt_overlay = open_dt(argv[2]);
+
+	/* Apply the overlay */
+	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay));
+
+	fdt_overlay_change_int_property(fdt_base);
+	fdt_overlay_change_str_property(fdt_base);
+	fdt_overlay_add_str_property(fdt_base);
+	fdt_overlay_add_node(fdt_base);
+	fdt_overlay_add_subnode_property(fdt_base);
+
+	/*
+	 * If the base tree has a __symbols__ node, do the tests that
+	 * are only successful with a proper phandle support, and thus
+	 * dtc -@
+	 */
+	if (fdt_path_offset(fdt_base, "/__symbols__") >= 0) {
+		fdt_overlay_local_phandle(fdt_base);
+		fdt_overlay_local_phandles(fdt_base);
+	}
+
+	PASS();
+}
diff --git a/tests/overlay_bad_fixup.c b/tests/overlay_bad_fixup.c
new file mode 100644
index 000000000000..5014f5ec0868
--- /dev/null
+++ b/tests/overlay_bad_fixup.c
@@ -0,0 +1,70 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for DT overlays()
+ * Copyright (C) 2016 Free Electrons
+ * Copyright (C) 2016 NextThing Co.
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
+#include <stdio.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+
+#define CHECK(code, expected)					\
+	{							\
+		err = (code);					\
+		if (err != expected)				\
+			FAIL(#code ": %s", fdt_strerror(err));	\
+	}
+
+/* 4k ought to be enough for anybody */
+#define FDT_COPY_SIZE	(4 * 1024)
+
+static void *open_dt(char *path)
+{
+	void *dt, *copy;
+	int err;
+
+	dt = load_blob(path);
+	copy = xmalloc(FDT_COPY_SIZE);
+
+	/*
+	 * Resize our DTs to 4k so that we have room to operate on
+	 */
+	CHECK(fdt_open_into(dt, copy, FDT_COPY_SIZE), 0);
+
+	return copy;
+}
+
+int main(int argc, char *argv[])
+{
+	void *fdt_base, *fdt_overlay;
+	int err;
+
+	test_init(argc, argv);
+	if (argc != 3)
+		CONFIG("Usage: %s <base dtb> <overlay dtb>", argv[0]);
+
+	fdt_base = open_dt(argv[1]);
+	fdt_overlay = open_dt(argv[2]);
+
+	/* Apply the overlay */
+	CHECK(fdt_overlay_apply(fdt_base, fdt_overlay), -FDT_ERR_BADOVERLAY);
+
+	PASS();
+}
diff --git a/tests/overlay_bad_fixup_bad_index.dts b/tests/overlay_bad_fixup_bad_index.dts
new file mode 100644
index 000000000000..b5cf13137169
--- /dev/null
+++ b/tests/overlay_bad_fixup_bad_index.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:ab";
+	};
+};
diff --git a/tests/overlay_bad_fixup_base.dtsi b/tests/overlay_bad_fixup_base.dtsi
new file mode 100644
index 000000000000..216bcab52263
--- /dev/null
+++ b/tests/overlay_bad_fixup_base.dtsi
@@ -0,0 +1,18 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	fragment@0 {
+		target = <0xffffffff>;
+
+		__overlay__ {
+			test-property;
+		};
+	};
+};
diff --git a/tests/overlay_bad_fixup_empty.dts b/tests/overlay_bad_fixup_empty.dts
new file mode 100644
index 000000000000..e111db4c8527
--- /dev/null
+++ b/tests/overlay_bad_fixup_empty.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "";
+	};
+};
diff --git a/tests/overlay_bad_fixup_empty_index.dts b/tests/overlay_bad_fixup_empty_index.dts
new file mode 100644
index 000000000000..9e12e2177ad5
--- /dev/null
+++ b/tests/overlay_bad_fixup_empty_index.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:";
+	};
+};
diff --git a/tests/overlay_bad_fixup_index_trailing.dts b/tests/overlay_bad_fixup_index_trailing.dts
new file mode 100644
index 000000000000..f586bef4d374
--- /dev/null
+++ b/tests/overlay_bad_fixup_index_trailing.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:0a";
+	};
+};
diff --git a/tests/overlay_bad_fixup_path_empty_prop.dts b/tests/overlay_bad_fixup_path_empty_prop.dts
new file mode 100644
index 000000000000..608b5f9247b5
--- /dev/null
+++ b/tests/overlay_bad_fixup_path_empty_prop.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0::";
+	};
+};
diff --git a/tests/overlay_bad_fixup_path_only.dts b/tests/overlay_bad_fixup_path_only.dts
new file mode 100644
index 000000000000..2485dd965ee5
--- /dev/null
+++ b/tests/overlay_bad_fixup_path_only.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0";
+	};
+};
diff --git a/tests/overlay_bad_fixup_path_only_sep.dts b/tests/overlay_bad_fixup_path_only_sep.dts
new file mode 100644
index 000000000000..3cbf6c40fba5
--- /dev/null
+++ b/tests/overlay_bad_fixup_path_only_sep.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:";
+	};
+};
diff --git a/tests/overlay_bad_fixup_path_prop.dts b/tests/overlay_bad_fixup_path_prop.dts
new file mode 100644
index 000000000000..ca79b52bcb22
--- /dev/null
+++ b/tests/overlay_bad_fixup_path_prop.dts
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target";
+	};
+};
diff --git a/tests/overlay_base.dts b/tests/overlay_base.dts
new file mode 100644
index 000000000000..2603adb6821e
--- /dev/null
+++ b/tests/overlay_base.dts
@@ -0,0 +1,21 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	test: test-node {
+		test-int-property = <42>;
+		test-str-property = "foo";
+
+		subtest: sub-test-node {
+			sub-test-property;
+		};
+	};
+};
+
+
diff --git a/tests/overlay_overlay_dtc.dts b/tests/overlay_overlay_dtc.dts
new file mode 100644
index 000000000000..30d2362f746b
--- /dev/null
+++ b/tests/overlay_overlay_dtc.dts
@@ -0,0 +1,85 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	/* Test that we can change an int by another */
+	fragment@0 {
+		target = <&test>;
+
+		__overlay__ {
+			test-int-property = <43>;
+		};
+	};
+
+	/* Test that we can replace a string by a longer one */
+	fragment@1 {
+		target = <&test>;
+
+		__overlay__ {
+			test-str-property = "foobar";
+		};
+	};
+
+	/* Test that we add a new property */
+	fragment@2 {
+		target = <&test>;
+
+		__overlay__ {
+			test-str-property-2 = "foobar2";
+		};
+	};
+
+	/* Test that we add a new node (by phandle) */
+	fragment@3 {
+		target = <&test>;
+
+		__overlay__ {
+			new-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@5 {
+		target = <&test>;
+
+		__overlay__ {
+			local: new-local-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@6 {
+		target = <&test>;
+
+		__overlay__ {
+			test-phandle = <&test>, <&local>;
+		};
+	};
+
+	fragment@7 {
+		target = <&test>;
+
+		__overlay__ {
+			test-several-phandle = <&local>, <&local>;
+		};
+	};
+
+	fragment@8 {
+		target = <&test>;
+
+		__overlay__ {
+			sub-test-node {
+				new-sub-test-property;
+			};
+		};
+	};
+};
diff --git a/tests/overlay_overlay_nodtc.dts b/tests/overlay_overlay_nodtc.dts
new file mode 100644
index 000000000000..e8d0f96d889c
--- /dev/null
+++ b/tests/overlay_overlay_nodtc.dts
@@ -0,0 +1,82 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+
+/ {
+	fragment@0 {
+		target-path = "/test-node";
+
+		__overlay__ {
+			test-int-property = <43>;
+		};
+	};
+
+	/* Test that we can replace a string by a longer one */
+	fragment@1 {
+		target-path = "/test-node";
+
+		__overlay__ {
+			test-str-property = "foobar";
+		};
+	};
+
+	/* Test that we add a new property */
+	fragment@2 {
+		target-path = "/test-node";
+
+		__overlay__ {
+			test-str-property-2 = "foobar2";
+		};
+	};
+
+	fragment@3 {
+		target-path = "/test-node";
+
+		__overlay__ {
+			new-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@4 {
+		target-path = "/";
+
+		__overlay__ {
+			local: new-local-node {
+				new-property;
+			};
+		};
+	};
+
+	fragment@5 {
+		target-path = "/";
+
+		__overlay__ {
+			test-several-phandle = <&local>, <&local>;
+		};
+	};
+
+	fragment@6 {
+		target-path = "/test-node";
+
+		__overlay__ {
+			sub-test-node {
+				new-sub-test-property;
+			};
+		};
+	};
+
+	__local_fixups__ {
+		fragment@5 {
+			__overlay__ {
+				test-several-phandle = <0 4>;
+			};
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f4b32e4296d0..dc19f80b2fb6 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -160,6 +160,37 @@ run_fdtdump_test() {
     base_run_test sh fdtdump-runtest.sh "$file"
 }
 
+BAD_FIXUP_TREES="bad_index \
+		empty \
+		empty_index \
+		index_trailing \
+		path_empty_prop \
+		path_only \
+		path_only_sep \
+		path_prop"
+
+overlay_tests () {
+    # Overlay tests that don't require overlay support in dtc
+    run_dtc_test -I dts -O dtb -o overlay_base.dtb overlay_base.dts
+    run_dtc_test -I dts -O dtb -o overlay_overlay.dtb overlay_overlay_nodtc.dts
+    run_test overlay overlay_base.dtb overlay_overlay.dtb
+
+    # Overlay tests that requires overlay support in dtc
+    echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
+    if [ $? -eq 0 ]; then
+        run_dtc_test -@ -I dts -O dtb -o overlay_base.dtb overlay_base.dts
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay.dtb overlay_overlay_dtc.dts
+        run_test overlay overlay_base.dtb overlay_overlay.dtb
+    fi
+
+    # Bad fixup tests
+    for test in $BAD_FIXUP_TREES; do
+	tree="overlay_bad_fixup_$test"
+	run_dtc_test -I dts -O dtb -o $tree.dtb $tree.dts
+	run_test overlay_bad_fixup overlay_base.dtb $tree.dtb
+    done
+}
+
 tree1_tests () {
     TREE=$1
 
@@ -273,6 +304,7 @@ libfdt_tests () {
     run_test appendprop2 appendprop1.test.dtb
     run_dtc_test -I dts -O dtb -o appendprop.test.dtb appendprop.dts
     run_test dtbs_equal_ordered appendprop2.test.dtb appendprop.test.dtb
+    overlay_tests
 
     for basetree in test_tree1.dtb sw_tree1.test.dtb rw_tree1.test.dtb; do
 	run_test nopulate $basetree
-- 
2.9.3
