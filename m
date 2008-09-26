From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH 9/9 V3] Test constant expressions in cell contexts.
Date: Fri, 26 Sep 2008 15:25:48 -0500
Message-ID: <1222460748-20127-10-git-send-email-jdl@jdl.com>
References: <1222460748-20127-1-git-send-email-jdl@jdl.com>
	<1222460748-20127-2-git-send-email-jdl@jdl.com>
	<1222460748-20127-3-git-send-email-jdl@jdl.com>
	<1222460748-20127-4-git-send-email-jdl@jdl.com>
	<1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222460748-20127-9-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This code is derived from code posted by David Gibson.

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 tests/Makefile.tests     |    1 +
 tests/cell-expressions.c |  116 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh       |    5 ++
 3 files changed, 122 insertions(+), 0 deletions(-)
 create mode 100644 tests/cell-expressions.c

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 44021b0..55aa1de 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -10,6 +10,7 @@ LIB_TESTS_L = get_mem_rsv \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
 	string_escapes references path-references boot-cpuid incbin \
+	cell-expressions \
 	dtbs_equal_ordered \
 	add_subnode_with_nops path_offset_aliases
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
diff --git a/tests/cell-expressions.c b/tests/cell-expressions.c
new file mode 100644
index 0000000..453cd81
--- /dev/null
+++ b/tests/cell-expressions.c
@@ -0,0 +1,116 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for dtc expression support
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
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+struct test_expr {
+	const char *expr;
+	uint32_t result;
+} expr_table[] = {
+#define TE(expr)	{ #expr, (expr) }
+	TE(0xdeadb00f),
+	TE(-0x21524111),
+	TE(1+1),
+	TE(2*3),
+	TE(4/2),
+	TE(10/3),
+	TE(19%4),
+	TE(1 << 13),
+	TE(3*2+1), TE(3*(2+1)),
+	TE(1+2*3), TE((1+2)*3),
+	TE(1 < 2), TE(2 < 1), TE(1 < 1),
+	TE(1 <= 2), TE(2 <= 1), TE(1 <= 1),
+	TE(1 > 2), TE(2 > 1), TE(1 > 1),
+	TE(1 >= 2), TE(2 >= 1), TE(1 >= 1),
+	TE(1 == 1), TE(1 == 2),
+	TE(1 != 1), TE(1 != 2),
+	TE(0xabcdabcd & 0xffff0000),
+	TE(0xdead4110 ^ 0xf0f0f0f0),
+	TE(0xabcd0000 | 0x0000abcd),
+	TE(~0x21524110), TE(~~0xdeadbeef),
+	TE(0 && 0), TE(17 && 0), TE(0 && 17), TE(17 && 17),
+	TE(0 || 0), TE(17 || 0), TE(0 || 17), TE(17 || 17),
+	TE(!0), TE(!1), TE(!17), TE(!!0), TE(!!17),
+	TE(0 ? 17 : 39), TE(1 ? 17 : 39), TE(17 ? 0xdeadbeef : 0xabcd1234),
+	//	TE(11 * 257 * 1321517),
+	TE(123456790 - 4/2 + 17%4),
+};
+
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+
+int main(int argc, char *argv[])
+{
+	void *fdt;
+	const uint32_t *res;
+	int reslen;
+	int i;
+
+	test_init(argc, argv);
+
+	if ((argc == 3) && (strcmp(argv[1], "-g") == 0)) {
+		FILE *f = fopen(argv[2], "w");
+
+		if (!f)
+			FAIL("Couldn't open \"%s\" for output: %s\n",
+			     argv[2], strerror(errno));
+
+		fprintf(f, "/dts-v1/;\n");
+		fprintf(f, "/ {\n");
+		fprintf(f, "\texpressions = <\n");
+		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
+			fprintf(f, "\t\t(%s)\n", expr_table[i].expr);
+		fprintf(f, "\t>;\n");
+		fprintf(f, "};\n");
+		fclose(f);
+	} else {
+		fdt = load_blob_arg(argc, argv);
+
+		res = fdt_getprop(fdt, 0, "expressions", &reslen);
+
+		if (!res)
+			FAIL("Error retreiving expression results: %s\n",
+		     fdt_strerror(reslen));
+
+		if (reslen != (ARRAY_SIZE(expr_table) * sizeof(uint32_t)))
+			FAIL("Unexpected length of results %d instead of %d\n",
+			     reslen,
+			     (int)(ARRAY_SIZE(expr_table) * sizeof(uint32_t)));
+
+		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
+			if (fdt32_to_cpu(res[i]) != expr_table[i].result)
+				FAIL("Incorrect result for expression \"%s\","
+				     " 0x%x instead of 0x%x\n",
+				     expr_table[i].expr, res[i],
+				     expr_table[i].result);
+	}
+
+	PASS();
+}
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 30cd9a1..fc7162a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -274,6 +274,11 @@ dtc_tests () {
     run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - < test_tree1.dtb
     run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1.dtb.test.dts
 
+    # Check integer expresisons
+    run_test cell-expressions -g cell-expressions.test.dts
+    run_dtc_test -I dts -O dtb -o cell-expressions.test.dtb cell-expressions.test.dts
+    run_test cell-expressions cell-expressions.test.dtb
+
     # Check for graceful failure in some error conditions
     run_sh_test dtc-fatal.sh -I dts -O dtb nosuchfile.dts
     run_sh_test dtc-fatal.sh -I dtb -O dtb nosuchfile.dtb
-- 
1.6.0.90.g436ed
