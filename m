From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3 1/3] of: overlay: add overlay unittest data for node names and symbols
Date: Tue, 18 Jul 2017 20:52:18 -0700
Message-ID: <1500436340-7748-2-git-send-email-frowand.list@gmail.com>
References: <1500436340-7748-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500436340-7748-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Add nodes and properties to overlay_base and overlay dts files to
test for
   - incorrect existing node name detection when overlay node name
     has a unit-address
   - adding overlay __symbols__ properties to live tree when an
     overlay is added to the live tree

The following console messages will appear near the end of unittest
until the code errors are corrected:

   OF: Duplicate name in fairway-1, renamed to "ride@100#1"

   ### dt-test ### FAIL of_unittest_overlay_high_level():2296 Adding overlay 'overlay_bad_symbol' failed

   ### dt-test ### end of unittest - 190 passed, 1 failed

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/unittest-data/Makefile               | 19 ++++++++++++++-----
 drivers/of/unittest-data/overlay.dts            | 19 ++++++++++++++++++-
 drivers/of/unittest-data/overlay_bad_symbol.dts | 22 ++++++++++++++++++++++
 drivers/of/unittest-data/overlay_base.dts       |  7 +++++++
 drivers/of/unittest.c                           | 10 ++++++++--
 5 files changed, 69 insertions(+), 8 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_symbol.dts

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 6e00a9c69e58..2d135fba94c1 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -1,18 +1,27 @@
 obj-y += testcases.dtb.o
+
+targets += testcases.dtb testcases.dtb.S
+
+ifdef CONFIG_OF_OVERLAY
+
 obj-y += overlay.dtb.o
 obj-y += overlay_bad_phandle.dtb.o
+obj-y += overlay_bad_symbol.dtb.o
 obj-y += overlay_base.dtb.o
 
-targets += testcases.dtb testcases.dtb.S
 targets += overlay.dtb overlay.dtb.S
 targets += overlay_bad_phandle.dtb overlay_bad_phandle.dtb.S
+targets += overlay_bad_symbol.dtb overlay_bad_symbol.dtb.S
 targets += overlay_base.dtb overlay_base.dtb.S
 
-.PRECIOUS: \
-	$(obj)/%.dtb.S \
-	$(obj)/%.dtb
-
 # enable creation of __symbols__ node
 DTC_FLAGS_overlay := -@
 DTC_FLAGS_overlay_bad_phandle := -@
+DTC_FLAGS_overlay_bad_symbol := -@
 DTC_FLAGS_overlay_base := -@
+
+endif
+
+.PRECIOUS: \
+	$(obj)/%.dtb.S \
+	$(obj)/%.dtb
diff --git a/drivers/of/unittest-data/overlay.dts b/drivers/of/unittest-data/overlay.dts
index 6cd7e6a0c13e..81140adbe770 100644
--- a/drivers/of/unittest-data/overlay.dts
+++ b/drivers/of/unittest-data/overlay.dts
@@ -25,7 +25,18 @@
 			#size-cells = <1>;
 			status = "ok";
 
-			ride@200 {
+			ride@100 {
+
+				track@3 {
+					incline_up = < 48 32 16 >;
+				};
+
+				track@4 {
+					incline_up = < 47 31 15 >;
+				};
+			};
+
+			ride_200: ride@200 {
 				compatible = "ot,ferris-wheel";
 				reg = < 0x00000200 0x100 >;
 				hvac-provider = < &hvac_2 >;
@@ -36,6 +47,12 @@
 				spin-rph = < 30 >;
 				gondolas = < 16 >;
 				gondola-capacity = < 6 >;
+
+				ride_200_left: track@1 {
+				};
+
+				ride_200_right: track@2 {
+				};
 			};
 		};
 	};
diff --git a/drivers/of/unittest-data/overlay_bad_symbol.dts b/drivers/of/unittest-data/overlay_bad_symbol.dts
new file mode 100644
index 000000000000..09261cb9a67e
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_bad_symbol.dts
@@ -0,0 +1,22 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+
+	fragment@0 {
+		target = <&electric_1>;
+
+		__overlay__ {
+
+			// This label should cause an error when the overlay
+			// is applied.  There is already a symbol hvac_1
+			// in the base tree
+			hvac_1: hvac-medium-2 {
+				compatible = "ot,hvac-medium";
+				heat-range = < 50 75 >;
+				cool-range = < 60 80 >;
+			};
+
+		};
+	};
+};
diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dts
index 5566b27fb61a..997d807259e6 100644
--- a/drivers/of/unittest-data/overlay_base.dts
+++ b/drivers/of/unittest-data/overlay_base.dts
@@ -53,6 +53,13 @@
 				spin-controller = < &spin_ctrl_2 5 &spin_ctrl_2 7 >;
 				spin-controller-names = "track_1", "track_2";
 				queues = < 2 >;
+
+				track@3 {
+				};
+
+				track@4 {
+				};
+
 			};
 		};
 
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 0107fc680335..12d08419b736 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1983,6 +1983,8 @@ static void __init of_unittest_overlay(void)
 static inline void __init of_unittest_overlay(void) { }
 #endif
 
+#ifdef CONFIG_OF_OVERLAY
+
 /*
  * __dtb_ot_begin[] and __dtb_ot_end[] are created by cmd_dt_S_dtb
  * in scripts/Makefile.lib
@@ -2010,14 +2012,14 @@ struct overlay_info {
 OVERLAY_INFO_EXTERN(overlay_base);
 OVERLAY_INFO_EXTERN(overlay);
 OVERLAY_INFO_EXTERN(overlay_bad_phandle);
-
-#ifdef CONFIG_OF_OVERLAY
+OVERLAY_INFO_EXTERN(overlay_bad_symbol);
 
 /* order of entries is hard-coded into users of overlays[] */
 static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_base, -9999),
 	OVERLAY_INFO(overlay, 0),
 	OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
+	OVERLAY_INFO(overlay_bad_symbol, -EINVAL),
 	{}
 };
 
@@ -2289,6 +2291,10 @@ static __init void of_unittest_overlay_high_level(void)
 
 	unittest(overlay_data_add(2),
 		 "Adding overlay 'overlay_bad_phandle' failed\n");
+
+	unittest(overlay_data_add(3),
+		 "Adding overlay 'overlay_bad_symbol' failed\n");
+
 	return;
 
 err_unlock:
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
