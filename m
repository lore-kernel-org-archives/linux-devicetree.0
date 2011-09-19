From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [RESEND PATCH v3 3/7] Add utilfdt tests
Date: Mon, 19 Sep 2011 13:21:04 -0700
Message-ID: <1316463668-976-4-git-send-email-sjg@chromium.org>
References: <1316463668-976-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316463668-976-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a few tests for the simple type argument supported by
utilfdt_decode_type.

I assume this will be squashed in with utilfdt, but I have left it out
for easier review here.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Add tests for utilfdt

 tests/Makefile.tests |    3 +-
 tests/run_tests.sh   |    9 +++-
 tests/utilfdt_test.c |  128 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 2 deletions(-)
 create mode 100644 tests/utilfdt_test.c

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index c564e72..2bc57d6 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -15,7 +15,8 @@ LIB_TESTS_L = get_mem_rsv \
 	extra-terminating-null \
 	dtbs_equal_ordered \
 	dtb_reverse dtbs_equal_unordered \
-	add_subnode_with_nops path_offset_aliases
+	add_subnode_with_nops path_offset_aliases \
+	utilfdt_test
 LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
 
 LIBTREE_TESTS_L = truncated_property
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 72dda32..486ceae 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -388,6 +388,10 @@ dtbs_equal_tests () {
 cmp_tests test_tree1.dtb $WRONG_TREE1
 }
 
+utilfdt_tests () {
+    run_test utilfdt_test
+}
+
 while getopts "vt:m" ARG ; do
 case $ARG in
 	"v")
@@ -403,7 +407,7 @@ while getopts "vt:m" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt dtc dtbs_equal"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -414,6 +418,9 @@ for set in $TESTSETS; do
 	"libfdt")
 	    libfdt_tests
 	    ;;
+	"utilfdt")
+	    utilfdt_tests
+	    ;;
 	"dtc")
 	    dtc_tests
 	    ;;
diff --git a/tests/utilfdt_test.c b/tests/utilfdt_test.c
new file mode 100644
index 0000000..5c09e6f
--- /dev/null
+++ b/tests/utilfdt_test.c
@@ -0,0 +1,128 @@
+/*
+ * Copyright 2011 The Chromium Authors, All Rights Reserved.
+ *
+ * utilfdt_test - Tests for utilfdt library
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
+#include <assert.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+#include <stdarg.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+#include <utilfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+static void check(const char *fmt, int expect_type, int expect_size)
+{
+	int type;
+	int size;
+
+	if (utilfdt_decode_type(fmt, &type, &size))
+		FAIL("format '%s': valid format string returned failure", fmt);
+	if (expect_type != type)
+		FAIL("format '%s': expected type='%c', got type='%c'", fmt,
+		     expect_type, type);
+	if (expect_size != size)
+		FAIL("format '%s': expected size=%d, got size=%d", fmt,
+		     expect_size, size);
+}
+
+static void checkfail(const char *fmt)
+{
+	int type;
+	int size;
+
+	if (!utilfdt_decode_type(fmt, &type, &size))
+		FAIL("format '%s': invalid format string returned success",
+		     fmt);
+}
+
+/**
+ * Add the given modifier to each of the valid sizes, and check that we get
+ * correct values.
+ *
+ * \param modifier	Modifer string to use as a prefix
+ * \param expected_size	The size (in bytes) that we expect (ignored for
+ *			strings)
+ */
+static void check_sizes(char *modifier, int expected_size)
+{
+	char fmt[10], *ptr;
+
+	/* set up a string with a hole in it for the format character */
+	if (strlen(modifier) + 2 >= sizeof(fmt))
+		FAIL("modifier string '%s' too long", modifier);
+	strcpy(fmt, modifier);
+	ptr = fmt + strlen(fmt);
+	ptr[1] = '\0';
+
+	/* now try each format character in turn */
+	*ptr = 'i';
+	check(fmt, 'i', expected_size);
+
+	*ptr = 'u';
+	check(fmt, 'u', expected_size);
+
+	*ptr = 'x';
+	check(fmt, 'x', expected_size);
+
+	*ptr = 's';
+	check(fmt, 's', -1);
+}
+
+static void test_utilfdt_decode_type(void)
+{
+	char fmt[10];
+	int ch;
+
+	/* check all the valid modifiers and sizes */
+	check_sizes("", -1);
+	check_sizes("b", 1);
+	check_sizes("hh", 1);
+	check_sizes("h", 2);
+	check_sizes("l", 4);
+
+	/* try every other character */
+	checkfail("");
+	for (ch = ' '; ch < 127; ch++) {
+		if (!strchr("iuxs", ch)) {
+			*fmt = ch;
+			fmt[1] = '\0';
+			checkfail(fmt);
+		}
+	}
+
+	/* try a few modifiers at the end */
+	checkfail("sx");
+	checkfail("ihh");
+	checkfail("xb");
+
+	/* and one for the doomsday archives */
+	checkfail("He has all the virtues I dislike and none of the vices "
+			"I admire.");
+}
+
+int main(int argc, char *argv[])
+{
+	test_utilfdt_decode_type();
+	PASS();
+}
-- 
1.7.3.1
