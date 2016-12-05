From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v12 4/7] tests: Add overlay tests
Date: Mon,  5 Dec 2016 19:05:25 +0200
Message-ID: <1480957528-8367-5-git-send-email-pantelis.antoniou@konsulko.com>
References: <1480957528-8367-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480957528-8367-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a number of tests for dynamic objects/overlays.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 tests/overlay_base_fixups.dts    | 22 +++++++++++++++++++
 tests/overlay_overlay_dtc.dts    |  4 ++--
 tests/overlay_overlay_simple.dts | 12 +++++++++++
 tests/run_tests.sh               | 46 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 tests/overlay_base_fixups.dts
 create mode 100644 tests/overlay_overlay_simple.dts

diff --git a/tests/overlay_base_fixups.dts b/tests/overlay_base_fixups.dts
new file mode 100644
index 0000000..815a054
--- /dev/null
+++ b/tests/overlay_base_fixups.dts
@@ -0,0 +1,22 @@
+/*
+ * Copyright (c) 2016 Konsulko Inc.
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
+
+	ref {
+		local-ref = <&test &subtest>;
+	};
+};
diff --git a/tests/overlay_overlay_dtc.dts b/tests/overlay_overlay_dtc.dts
index 30d2362..b760b5a 100644
--- a/tests/overlay_overlay_dtc.dts
+++ b/tests/overlay_overlay_dtc.dts
@@ -1,12 +1,12 @@
 /*
  * Copyright (c) 2016 NextThing Co
  * Copyright (c) 2016 Free Electrons
+ * Copyright (c) 2016 Konsulko Inc.
  *
  * SPDX-License-Identifier:	GPL-2.0+
  */
 
-/dts-v1/;
-/plugin/;
+/dts-v1/ /plugin/;
 
 / {
 	/* Test that we can change an int by another */
diff --git a/tests/overlay_overlay_simple.dts b/tests/overlay_overlay_simple.dts
new file mode 100644
index 0000000..8657e1e
--- /dev/null
+++ b/tests/overlay_overlay_simple.dts
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2016 Konsulko Inc.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/;
+/plugin/;
+
+&test {
+	test-int-property = <43>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index d64cb2a..ee30383 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -181,6 +181,52 @@ overlay_tests () {
         run_dtc_test -@ -I dts -O dtb -o overlay_base_with_symbols.test.dtb overlay_base.dts
         run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.test.dtb overlay_overlay_dtc.dts
         run_test overlay overlay_base_with_symbols.test.dtb overlay_overlay_with_symbols.test.dtb
+
+        # Test symbols/fixups existence
+        run_test check_path overlay_overlay_with_symbols.test.dtb exists "/__symbols__"
+        run_test check_path overlay_overlay_with_symbols.test.dtb exists "/__fixups__"
+        run_test check_path overlay_overlay_with_symbols.test.dtb exists "/__local_fixups__"
+
+        # test new magic option
+        run_dtc_test -M@ -I dts -O dtb -o overlay_overlay_with_symbols_new_magic.test.dtb overlay_overlay_dtc.dts
+        run_test check_path overlay_overlay_with_symbols_new_magic.test.dtb exists "/__symbols__"
+        run_test check_path overlay_overlay_with_symbols_new_magic.test.dtb exists "/__fixups__"
+        run_test check_path overlay_overlay_with_symbols_new_magic.test.dtb exists "/__local_fixups__"
+
+        # test plugin source to dtb and back
+        run_dtc_test -@ -I dtb -O dts -o overlay_overlay_dtc.test.dts overlay_overlay_with_symbols.test.dtb
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.test.test.dtb overlay_overlay_dtc.test.dts
+        run_test dtbs_equal_ordered overlay_overlay_with_symbols.test.dtb overlay_overlay_with_symbols.test.test.dtb
+
+        # test plugin source to dtb and back (with new magic)
+        run_dtc_test -@ -I dtb -O dts -o overlay_overlay_dtc_new_magic.test.dts overlay_overlay_with_symbols_new_magic.test.dtb
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols_new_magic.test.test.dtb overlay_overlay_dtc_new_magic.test.dts
+        run_test dtbs_equal_ordered overlay_overlay_with_symbols_new_magic.test.dtb overlay_overlay_with_symbols_new_magic.test.test.dtb
+
+        # test plugin auto-generation without using -@
+        run_dtc_test -I dts -O dtb -o overlay_overlay_with_symbols_auto.test.dtb overlay_overlay_dtc.dts
+        run_test check_path overlay_overlay_with_symbols_auto.test.dtb exists "/__symbols__"
+        run_test check_path overlay_overlay_with_symbols_auto.test.dtb exists "/__fixups__"
+        run_test check_path overlay_overlay_with_symbols_auto.test.dtb exists "/__local_fixups__"
+
+        # Test suppression of fixups
+        run_dtc_test -@ -I dts -O dtb -o overlay_base_with_symbols_no_fixups.test.dtb overlay_base_fixups.dts
+        run_test check_path overlay_base_with_symbols_no_fixups.test.dtb exists "/__symbols__"
+        run_test check_path overlay_base_with_symbols_no_fixups.test.dtb not-exists "/__fixups__"
+        run_test check_path overlay_base_with_symbols_no_fixups.test.dtb not-exists "/__local_fixups__"
+
+        # Test generation of fixups
+        run_dtc_test -F -@ -I dts -O dtb -o overlay_base_with_symbols_fixups.test.dtb overlay_base_fixups.dts
+        run_test check_path overlay_base_with_symbols_fixups.test.dtb exists "/__symbols__"
+        run_test check_path overlay_base_with_symbols_fixups.test.dtb not-exists "/__fixups__"
+        run_test check_path overlay_base_with_symbols_fixups.test.dtb exists "/__local_fixups__"
+
+        # Test generation of aliases insted of symbols
+        run_dtc_test -A -I dts -O dtb -o overlay_overlay_with_aliases.dtb overlay_overlay_dtc.dts
+        run_test check_path overlay_overlay_with_aliases.dtb exists "/aliases"
+        run_test check_path overlay_overlay_with_aliases.dtb exists "/__symbols__"
+        run_test check_path overlay_overlay_with_aliases.dtb exists "/__fixups__"
+        run_test check_path overlay_overlay_with_aliases.dtb exists "/__local_fixups__"
     fi
 
     # Bad fixup tests
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
