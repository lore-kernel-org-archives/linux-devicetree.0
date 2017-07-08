From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 1/3] of: overlay: add overlay unittest data for node names and symbols
Date: Fri,  7 Jul 2017 17:28:43 -0700
Message-ID: <1499473725-13361-2-git-send-email-frowand.list@gmail.com>
References: <1499473725-13361-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499473725-13361-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Expected result from patch 2/3 is overlay will update the nodes and
properties for /testcase-data-2/fairway-1/ride@100/

Before patch 2/3 is applied:

   Console error message near end of unittest:
      OF: Duplicate name in fairway-1, renamed to "ride@100#1"

   $ cd /proc/device-tree/testcase-data-2/fairway-1/
   $ # extra node: ride@100#1
   $ ls
   #address-cells  linux,phandle   phandle         ride@200
   #size-cells     name            ride@100        status
   compatible      orientation     ride@100#1
   $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
   $ ls track@3/incline_up
   ls: track@3/incline_up: No such file or directory
   $ ls track@4/incline_up
   ls: track@4/incline_up: No such file or directory

After patch 2/3 is applied:

   Console error message no longer occurs

   $ cd /proc/device-tree/testcase-data-2/fairway-1/
   $ # no extra node: ride@100#1
   $ ls
   #address-cells  compatible      name            phandle         ride@200
   #size-cells     linux,phandle   orientation     ride@100        status
   $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
   $ ls track@3/incline_up
   track@3/incline_up
   $ ls track@4/incline_up
   track@4/incline_up

Expected result from patch 3/3 is new __symbols__ entries for labels
from the overlay _after_ the add overlay symbols patch is also applied.

Before patch 3/3 is applied:

   Console error message near end of unittest:
      ### dt-test ### FAIL of_unittest_overlay_high_level():2296 Adding overlay 'overlay_bad_symbol' failed
      ### dt-test ### end of unittest - 190 passed, 1 failed

   The new unittest "fails" because the expected result of loading the
   new overlay is an error instead of success.

   $ # node hvac-medium-2 exists because the overlay loaded
   $ # since the duplicate symbol was not detected
   $ cd /proc/device-tree/testcase-data-2/substation@100/
   $ ls
   compatible     hvac-medium-2  motor-8        reg
   hvac-large-1   linux,phandle  name           status
   hvac-medium-1  motor-1        phandle

   $ cd /proc/device-tree/__symbols__/
   $ ls
   electric_1   lights_1     name         rides_1      spin_ctrl_2
   hvac_1       lights_2     retail_1     spin_ctrl_1

After patch 3/3 is applied:

   Previous console error message no longer occurs, but expected error
   occurs:
      OF: overlay: Failed to apply prop @/__symbols__/hvac_1
      OF: overlay: apply failed '/__symbols__'
      ### dt-test ### end of unittest - 191 passed, 0 failed

   $ # node hvac-medium-2 does not exist because the overlay
   $ # properly failed to load due to the duplicate symbol
   $ cd /proc/device-tree/testcase-data-2/substation@100/
   $ ls
   compatible     hvac-medium-1  motor-1        name           reg
   hvac-large-1   linux,phandle  motor-8        phandle        status

   $ cd /proc/device-tree/__symbols__/
   $ ls
   electric_1      lights_1        retail_1        ride_200_right  spin_ctrl_2
   hvac_1          lights_2        ride_200        rides_1
   hvac_2          name            ride_200_left   spin_ctrl_1
   $ cat ride_200; echo
   /testcase-data-2/fairway-1/ride@200
   $ cat ride_200_left ; echo
   /testcase-data-2/fairway-1/ride@200/track@1
   $ cat ride_200_right ; echo
   /testcase-data-2/fairway-1/ride@200/track@2

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/unittest-data/Makefile               |  3 +++
 drivers/of/unittest-data/overlay.dts            | 19 ++++++++++++++++++-
 drivers/of/unittest-data/overlay_bad_symbol.dts | 22 ++++++++++++++++++++++
 drivers/of/unittest-data/overlay_base.dts       |  7 +++++++
 drivers/of/unittest.c                           |  6 ++++++
 5 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_symbol.dts

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 6e00a9c69e58..dae2fe23cd2e 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -1,11 +1,13 @@
 obj-y += testcases.dtb.o
 obj-y += overlay.dtb.o
 obj-y += overlay_bad_phandle.dtb.o
+obj-y += overlay_bad_symbol.dtb.o
 obj-y += overlay_base.dtb.o
 
 targets += testcases.dtb testcases.dtb.S
 targets += overlay.dtb overlay.dtb.S
 targets += overlay_bad_phandle.dtb overlay_bad_phandle.dtb.S
+targets += overlay_bad_symbol.dtb overlay_bad_symbol.dtb.S
 targets += overlay_base.dtb overlay_base.dtb.S
 
 .PRECIOUS: \
@@ -15,4 +17,5 @@ targets += overlay_base.dtb overlay_base.dtb.S
 # enable creation of __symbols__ node
 DTC_FLAGS_overlay := -@
 DTC_FLAGS_overlay_bad_phandle := -@
+DTC_FLAGS_overlay_bad_symbol := -@
 DTC_FLAGS_overlay_base := -@
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
index 0107fc680335..e56b8eb220d9 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2010,6 +2010,7 @@ struct overlay_info {
 OVERLAY_INFO_EXTERN(overlay_base);
 OVERLAY_INFO_EXTERN(overlay);
 OVERLAY_INFO_EXTERN(overlay_bad_phandle);
+OVERLAY_INFO_EXTERN(overlay_bad_symbol);
 
 #ifdef CONFIG_OF_OVERLAY
 
@@ -2018,6 +2019,7 @@ struct overlay_info {
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
