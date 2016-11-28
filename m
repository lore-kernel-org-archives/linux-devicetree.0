From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v11 3/7] tests: Add check_path test
Date: Mon, 28 Nov 2016 18:05:37 +0200
Message-ID: <1480349141-14145-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480349141-14145-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a test that checks for existence or not of a node.
It is useful for testing the various cases when generating
symbols and fixups for dynamic device tree objects.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 tests/.gitignore     |  1 +
 tests/Makefile.tests |  3 +-
 tests/check_path.c   | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 tests/check_path.c

diff --git a/tests/.gitignore b/tests/.gitignore
index 354b565..9e209d5 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -8,6 +8,7 @@ tmp.*
 /asm_tree_dump
 /boot-cpuid
 /char_literal
+/check_path
 /del_node
 /del_property
 /dtbs_equal_ordered
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index eb039c5..3d7a4f8 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -25,7 +25,8 @@ LIB_TESTS_L = get_mem_rsv \
 	integer-expressions \
 	property_iterate \
 	subnode_iterate \
-	overlay overlay_bad_fixup
+	overlay overlay_bad_fixup \
+	check_path
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/check_path.c b/tests/check_path.c
new file mode 100644
index 0000000..0d6a73b
--- /dev/null
+++ b/tests/check_path.c
@@ -0,0 +1,82 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for node existence
+ * Copyright (C) 2016 Konsulko Inc.
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
+	void *fdt_base;
+	int fail_config, exists, check_exists;
+
+	test_init(argc, argv);
+	fail_config = 0;
+
+	if (argc != 4)
+		fail_config = 1;
+
+	if (!fail_config) {
+		if (!strcmp(argv[2], "exists"))
+			check_exists = 1;
+		else if (!strcmp(argv[2], "not-exists"))
+			check_exists = 0;
+		else
+			fail_config = 1;
+	}
+
+	if (fail_config)
+		CONFIG("Usage: %s <base dtb> <[exists|not-exists]> <node-path>", argv[0]);
+
+	fdt_base = open_dt(argv[1]);
+
+	exists = fdt_path_offset(fdt_base, argv[3]) >= 0;
+
+	if (exists == check_exists)
+		PASS();
+	else
+		FAIL();
+}
-- 
2.1.4
