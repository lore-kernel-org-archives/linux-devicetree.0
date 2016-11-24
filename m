From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 4/4] tests: Add overlay tests
Date: Thu, 24 Nov 2016 14:31:33 +0200
Message-ID: <1479990693-14260-5-git-send-email-pantelis.antoniou@konsulko.com>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479990693-14260-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a number of tests for dynamic objects/overlays.

Re-use the original test by moving the contents to a .dtsi include

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 tests/overlay_overlay_dtc.dts     | 76 +----------------------------------
 tests/overlay_overlay_dtc.dtsi    | 83 +++++++++++++++++++++++++++++++++++++++
 tests/overlay_overlay_new_dtc.dts | 11 ++++++
 tests/overlay_overlay_simple.dts  | 12 ++++++
 tests/run_tests.sh                | 20 ++++++++++
 5 files changed, 127 insertions(+), 75 deletions(-)
 create mode 100644 tests/overlay_overlay_dtc.dtsi
 create mode 100644 tests/overlay_overlay_new_dtc.dts
 create mode 100644 tests/overlay_overlay_simple.dts

diff --git a/tests/overlay_overlay_dtc.dts b/tests/overlay_overlay_dtc.dts
index 30d2362..ca943ea 100644
--- a/tests/overlay_overlay_dtc.dts
+++ b/tests/overlay_overlay_dtc.dts
@@ -8,78 +8,4 @@
 /dts-v1/;
 /plugin/;
 
-/ {
-	/* Test that we can change an int by another */
-	fragment@0 {
-		target = <&test>;
-
-		__overlay__ {
-			test-int-property = <43>;
-		};
-	};
-
-	/* Test that we can replace a string by a longer one */
-	fragment@1 {
-		target = <&test>;
-
-		__overlay__ {
-			test-str-property = "foobar";
-		};
-	};
-
-	/* Test that we add a new property */
-	fragment@2 {
-		target = <&test>;
-
-		__overlay__ {
-			test-str-property-2 = "foobar2";
-		};
-	};
-
-	/* Test that we add a new node (by phandle) */
-	fragment@3 {
-		target = <&test>;
-
-		__overlay__ {
-			new-node {
-				new-property;
-			};
-		};
-	};
-
-	fragment@5 {
-		target = <&test>;
-
-		__overlay__ {
-			local: new-local-node {
-				new-property;
-			};
-		};
-	};
-
-	fragment@6 {
-		target = <&test>;
-
-		__overlay__ {
-			test-phandle = <&test>, <&local>;
-		};
-	};
-
-	fragment@7 {
-		target = <&test>;
-
-		__overlay__ {
-			test-several-phandle = <&local>, <&local>;
-		};
-	};
-
-	fragment@8 {
-		target = <&test>;
-
-		__overlay__ {
-			sub-test-node {
-				new-sub-test-property;
-			};
-		};
-	};
-};
+/include/ "overlay_overlay_dtc.dtsi"
diff --git a/tests/overlay_overlay_dtc.dtsi b/tests/overlay_overlay_dtc.dtsi
new file mode 100644
index 0000000..8ea8d5d
--- /dev/null
+++ b/tests/overlay_overlay_dtc.dtsi
@@ -0,0 +1,83 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ * Copyright (c) 2016 Konsulko Inc.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
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
diff --git a/tests/overlay_overlay_new_dtc.dts b/tests/overlay_overlay_new_dtc.dts
new file mode 100644
index 0000000..14d3f54
--- /dev/null
+++ b/tests/overlay_overlay_new_dtc.dts
@@ -0,0 +1,11 @@
+/*
+ * Copyright (c) 2016 NextThing Co
+ * Copyright (c) 2016 Free Electrons
+ * Copyright (c) 2016 Konsulko Inc.
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+/dts-v1/ /plugin/;
+
+/include/ "overlay_overlay_dtc.dtsi"
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
index e4139dd..99c09bc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -181,6 +181,26 @@ overlay_tests () {
         run_dtc_test -@ -I dts -O dtb -o overlay_base_with_symbols.test.dtb overlay_base.dts
         run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.test.dtb overlay_overlay_dtc.dts
         run_test overlay overlay_base_with_symbols.test.dtb overlay_overlay_with_symbols.test.dtb
+
+        # new /plugin/ format
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_new_with_symbols.test.dtb overlay_overlay_new_dtc.dts
+
+        # test new magic option
+        run_dtc_test -M@ -I dts -O dtb -o overlay_overlay_with_symbols_new_magic.test.dtb overlay_overlay_dtc.dts
+
+        # test plugin source to dtb and back
+        run_dtc_test -@ -I dtb -O dts -o overlay_overlay_dtc.test.dts overlay_overlay_with_symbols.test.dtb
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.test.test.dtb overlay_overlay_dtc.test.dts
+        run_test dtbs_equal_ordered overlay_overlay_with_symbols.test.dtb overlay_overlay_with_symbols.test.test.dtb
+
+	# test simplified plugin syntax
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_simple.dtb overlay_overlay_simple.dts
+
+	# test plugin source to dtb and back (with new magic)
+        run_dtc_test -@ -I dtb -O dts -o overlay_overlay_dtc_new_magic.test.dts overlay_overlay_with_symbols_new_magic.test.dtb
+        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols_new_magic.test.test.dtb overlay_overlay_dtc_new_magic.test.dts
+        run_test dtbs_equal_ordered overlay_overlay_with_symbols_new_magic.test.dtb overlay_overlay_with_symbols_new_magic.test.test.dtb
+
     fi
 
     # Bad fixup tests
-- 
2.1.4
