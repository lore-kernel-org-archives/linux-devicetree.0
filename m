Return-Path: <SRS0=goDf=FR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:35034 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751818AbeBWIfX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 23 Feb 2018 03:35:23 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC dtc 2/2] Use "fragment-N" instead of "fragment@N"
Date: Fri, 23 Feb 2018 09:35:17 +0100
Message-Id: <1519374917-30171-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
References: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>, Jon Loeliger <jdl@jdl.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

<stdout>: Warning (unit_address_vs_reg): Node /fragment@0 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/dt-object-internal.txt        | 20 +++++++--------
 tests/overlay_bad_fixup_bad_index.dts       |  2 +-
 tests/overlay_bad_fixup_base.dtsi           |  2 +-
 tests/overlay_bad_fixup_empty_index.dts     |  2 +-
 tests/overlay_bad_fixup_index_trailing.dts  |  2 +-
 tests/overlay_bad_fixup_path_empty_prop.dts |  2 +-
 tests/overlay_bad_fixup_path_only.dts       |  2 +-
 tests/overlay_bad_fixup_path_only_sep.dts   |  2 +-
 tests/overlay_bad_fixup_path_prop.dts       |  2 +-
 tests/overlay_overlay.dts                   | 16 ++++++------
 tests/overlay_overlay_manual_fixups.dts     | 38 ++++++++++++++---------------
 tests/overlay_overlay_no_fixups.dts         | 16 ++++++------
 tests/stacked_overlay_bar.dts               |  2 +-
 tests/stacked_overlay_baz.dts               |  2 +-
 14 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
index 51d68ab93ac91581..b7c064fadda0f3ca 100644
--- a/Documentation/dt-object-internal.txt
+++ b/Documentation/dt-object-internal.txt
@@ -178,7 +178,7 @@ So the bar peripheral's DTS format would be of the form:
 /plugin/;	/* allow undefined references and record them */
 / {
 	....	/* various properties for loader use; i.e. part id etc. */
-	fragment@0 {
+	fragment-0 {
 		target = <&ocp>;
 		__overlay__ {
 			/* bar peripheral */
@@ -199,7 +199,7 @@ $ fdtdump bar.dtbo
 ...
 / {
 	... /* properties */
-	fragment@0 {
+	fragment-0 {
 		target = <0xffffffff>;
 		__overlay__ {
 			bar {
@@ -209,7 +209,7 @@ $ fdtdump bar.dtbo
 		};
 	};
 	__fixups__ {
-	    ocp = "/fragment@0:target:0";
+	    ocp = "/fragment-0:target:0";
 	};
 };
 
@@ -239,14 +239,14 @@ local fixups.
 /plugin/;	/* allow undefined label references and record them */
 / {
 	....	/* various properties for loader use; i.e. part id etc. */
-	fragment@0 {
+	fragment-0 {
 		target = <&res>;
 		__overlay__ {
 			/* baz resources */
 			baz_res: res_baz { ... };
 		};
 	};
-	fragment@1 {
+	fragment-1 {
 		target = <&ocp>;
 		__overlay__ {
 			/* baz peripheral */
@@ -267,7 +267,7 @@ $ fdtdump baz.dtbo
 ...
 / {
 	... /* properties */
-	fragment@0 {
+	fragment-0 {
 		target = <0xffffffff>;
 		__overlay__ {
 			res_baz {
@@ -276,7 +276,7 @@ $ fdtdump baz.dtbo
 			};
 		};
 	};
-	fragment@1 {
+	fragment-1 {
 		target = <0xffffffff>;
 		__overlay__ {
 			baz {
@@ -287,11 +287,11 @@ $ fdtdump baz.dtbo
 		};
 	};
 	__fixups__ {
-		res = "/fragment@0:target:0";
-		ocp = "/fragment@1:target:0";
+		res = "/fragment-0:target:0";
+		ocp = "/fragment-1:target:0";
 	};
 	__local_fixups__ {
-		fragment@1 {
+		fragment-1 {
 			__overlay__ {
 				baz {
 					ref-to-res = <0>;
diff --git a/tests/overlay_bad_fixup_bad_index.dts b/tests/overlay_bad_fixup_bad_index.dts
index b5cf13137169d090..73b4df595f937d9c 100644
--- a/tests/overlay_bad_fixup_bad_index.dts
+++ b/tests/overlay_bad_fixup_bad_index.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0:target:ab";
+		test = "/fragment-0:target:ab";
 	};
 };
diff --git a/tests/overlay_bad_fixup_base.dtsi b/tests/overlay_bad_fixup_base.dtsi
index 216bcab52263ba52..edc7e615fc1972a7 100644
--- a/tests/overlay_bad_fixup_base.dtsi
+++ b/tests/overlay_bad_fixup_base.dtsi
@@ -8,7 +8,7 @@
 /dts-v1/;
 
 / {
-	fragment@0 {
+	fragment-0 {
 		target = <0xffffffff>;
 
 		__overlay__ {
diff --git a/tests/overlay_bad_fixup_empty_index.dts b/tests/overlay_bad_fixup_empty_index.dts
index 9e12e2177ad5cb58..195b60bc169a4b11 100644
--- a/tests/overlay_bad_fixup_empty_index.dts
+++ b/tests/overlay_bad_fixup_empty_index.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0:target:";
+		test = "/fragment-0:target:";
 	};
 };
diff --git a/tests/overlay_bad_fixup_index_trailing.dts b/tests/overlay_bad_fixup_index_trailing.dts
index f586bef4d374ab23..a4ff5fe456c1a262 100644
--- a/tests/overlay_bad_fixup_index_trailing.dts
+++ b/tests/overlay_bad_fixup_index_trailing.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0:target:0a";
+		test = "/fragment-0:target:0a";
 	};
 };
diff --git a/tests/overlay_bad_fixup_path_empty_prop.dts b/tests/overlay_bad_fixup_path_empty_prop.dts
index 608b5f9247b5338f..a8508c5c77547f56 100644
--- a/tests/overlay_bad_fixup_path_empty_prop.dts
+++ b/tests/overlay_bad_fixup_path_empty_prop.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0::";
+		test = "/fragment-0::";
 	};
 };
diff --git a/tests/overlay_bad_fixup_path_only.dts b/tests/overlay_bad_fixup_path_only.dts
index 2485dd965ee5ef70..942c7893e656b9cd 100644
--- a/tests/overlay_bad_fixup_path_only.dts
+++ b/tests/overlay_bad_fixup_path_only.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0";
+		test = "/fragment-0";
 	};
 };
diff --git a/tests/overlay_bad_fixup_path_only_sep.dts b/tests/overlay_bad_fixup_path_only_sep.dts
index 3cbf6c40fba5b0cb..5c9ad07e0def272f 100644
--- a/tests/overlay_bad_fixup_path_only_sep.dts
+++ b/tests/overlay_bad_fixup_path_only_sep.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0:";
+		test = "/fragment-0:";
 	};
 };
diff --git a/tests/overlay_bad_fixup_path_prop.dts b/tests/overlay_bad_fixup_path_prop.dts
index ca79b52bcb22e629..e69a1505ab584d27 100644
--- a/tests/overlay_bad_fixup_path_prop.dts
+++ b/tests/overlay_bad_fixup_path_prop.dts
@@ -9,6 +9,6 @@
 
 / {
 	__fixups__ {
-		test = "/fragment@0:target";
+		test = "/fragment-0:target";
 	};
 };
diff --git a/tests/overlay_overlay.dts b/tests/overlay_overlay.dts
index b6d841b1f01183bb..1ea4fe0b7c06e71f 100644
--- a/tests/overlay_overlay.dts
+++ b/tests/overlay_overlay.dts
@@ -11,7 +11,7 @@
 
 / {
 	/* Test that we can change an int by another */
-	fragment@0 {
+	fragment-0 {
 		target = <&test>;
 
 		__overlay__ {
@@ -20,7 +20,7 @@
 	};
 
 	/* Test that we can replace a string by a longer one */
-	fragment@1 {
+	fragment-1 {
 		target = <&test>;
 
 		__overlay__ {
@@ -29,7 +29,7 @@
 	};
 
 	/* Test that we add a new property */
-	fragment@2 {
+	fragment-2 {
 		target = <&test>;
 
 		__overlay__ {
@@ -38,7 +38,7 @@
 	};
 
 	/* Test that we add a new node (by phandle) */
-	fragment@3 {
+	fragment-3 {
 		target = <&test>;
 
 		__overlay__ {
@@ -48,7 +48,7 @@
 		};
 	};
 
-	fragment@5 {
+	fragment-5 {
 		target = <&test>;
 
 		__overlay__ {
@@ -58,7 +58,7 @@
 		};
 	};
 
-	fragment@6 {
+	fragment-6 {
 		target = <&test>;
 
 		__overlay__ {
@@ -66,7 +66,7 @@
 		};
 	};
 
-	fragment@7 {
+	fragment-7 {
 		target = <&test>;
 
 		__overlay__ {
@@ -74,7 +74,7 @@
 		};
 	};
 
-	fragment@8 {
+	fragment-8 {
 		target = <&test>;
 
 		__overlay__ {
diff --git a/tests/overlay_overlay_manual_fixups.dts b/tests/overlay_overlay_manual_fixups.dts
index e34c4fc630854054..34748acb950194dd 100644
--- a/tests/overlay_overlay_manual_fixups.dts
+++ b/tests/overlay_overlay_manual_fixups.dts
@@ -13,7 +13,7 @@
 
 / {
 	/* Test that we can change an int by another */
-	fragment@0 {
+	fragment-0 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -22,7 +22,7 @@
 	};
 
 	/* Test that we can replace a string by a longer one */
-	fragment@1 {
+	fragment-1 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -31,7 +31,7 @@
 	};
 
 	/* Test that we add a new property */
-	fragment@2 {
+	fragment-2 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -40,7 +40,7 @@
 	};
 
 	/* Test that we add a new node (by phandle) */
-	fragment@3 {
+	fragment-3 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -50,7 +50,7 @@
 		};
 	};
 
-	fragment@5 {
+	fragment-5 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -60,7 +60,7 @@
 		};
 	};
 
-	fragment@6 {
+	fragment-6 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -68,7 +68,7 @@
 		};
 	};
 
-	fragment@7 {
+	fragment-7 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -76,7 +76,7 @@
 		};
 	};
 
-	fragment@8 {
+	fragment-8 {
 		target = <0xffffffff /*&test*/>;
 
 		__overlay__ {
@@ -87,26 +87,26 @@
 	};
 
 	__local_fixups__ {
-		fragment@6 {
+		fragment-6 {
 			__overlay__ {
 				test-phandle = <4>;
 			};
 		};
-		fragment@7 {
+		fragment-7 {
 			__overlay__ {
 				test-several-phandle = <0 4>;
 			};
 		};
 	};
 	__fixups__ {
-		test = "/fragment@0:target:0",
-		       "/fragment@1:target:0",
-		       "/fragment@2:target:0",
-		       "/fragment@3:target:0",
-		       "/fragment@5:target:0",
-		       "/fragment@6:target:0",
-		       "/fragment@6/__overlay__:test-phandle:0",
-		       "/fragment@7:target:0",
-		       "/fragment@8:target:0";
+		test = "/fragment-0:target:0",
+		       "/fragment-1:target:0",
+		       "/fragment-2:target:0",
+		       "/fragment-3:target:0",
+		       "/fragment-5:target:0",
+		       "/fragment-6:target:0",
+		       "/fragment-6/__overlay__:test-phandle:0",
+		       "/fragment-7:target:0",
+		       "/fragment-8:target:0";
 	};
 };
diff --git a/tests/overlay_overlay_no_fixups.dts b/tests/overlay_overlay_no_fixups.dts
index e8d0f96d889cc4e4..3ebf27d400d596f5 100644
--- a/tests/overlay_overlay_no_fixups.dts
+++ b/tests/overlay_overlay_no_fixups.dts
@@ -8,7 +8,7 @@
 /dts-v1/;
 
 / {
-	fragment@0 {
+	fragment-0 {
 		target-path = "/test-node";
 
 		__overlay__ {
@@ -17,7 +17,7 @@
 	};
 
 	/* Test that we can replace a string by a longer one */
-	fragment@1 {
+	fragment-1 {
 		target-path = "/test-node";
 
 		__overlay__ {
@@ -26,7 +26,7 @@
 	};
 
 	/* Test that we add a new property */
-	fragment@2 {
+	fragment-2 {
 		target-path = "/test-node";
 
 		__overlay__ {
@@ -34,7 +34,7 @@
 		};
 	};
 
-	fragment@3 {
+	fragment-3 {
 		target-path = "/test-node";
 
 		__overlay__ {
@@ -44,7 +44,7 @@
 		};
 	};
 
-	fragment@4 {
+	fragment-4 {
 		target-path = "/";
 
 		__overlay__ {
@@ -54,7 +54,7 @@
 		};
 	};
 
-	fragment@5 {
+	fragment-5 {
 		target-path = "/";
 
 		__overlay__ {
@@ -62,7 +62,7 @@
 		};
 	};
 
-	fragment@6 {
+	fragment-6 {
 		target-path = "/test-node";
 
 		__overlay__ {
@@ -73,7 +73,7 @@
 	};
 
 	__local_fixups__ {
-		fragment@5 {
+		fragment-5 {
 			__overlay__ {
 				test-several-phandle = <0 4>;
 			};
diff --git a/tests/stacked_overlay_bar.dts b/tests/stacked_overlay_bar.dts
index c64639952f4ca72d..03f8e8bf716dc035 100644
--- a/tests/stacked_overlay_bar.dts
+++ b/tests/stacked_overlay_bar.dts
@@ -1,7 +1,7 @@
 /dts-v1/;
 /plugin/;
 / {
-	fragment@1 {
+	fragment-1 {
 		target = <&foo>;
 		__overlay__ {
 			overlay-1-property;
diff --git a/tests/stacked_overlay_baz.dts b/tests/stacked_overlay_baz.dts
index a52f0cc600e3e9a3..74fea26fe5b084cd 100644
--- a/tests/stacked_overlay_baz.dts
+++ b/tests/stacked_overlay_baz.dts
@@ -1,7 +1,7 @@
 /dts-v1/;
 /plugin/;
 / {
-	fragment@1 {
+	fragment-1 {
 		target = <&bar>;
 		__overlay__ {
 			overlay-2-property;
-- 
2.7.4

