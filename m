From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] of: unittest: let dtc generate __local_fixups__
Date: Thu, 16 Nov 2017 12:05:44 -0600
Message-ID: <20171116180545.12322-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Remove the manually added __local_fixups__ because dtc can now generate
them. This also fixes a new warning in the process:

drivers/of/unittest-data/testcases.dtb: Warning (interrupts_extended_property): Could not get phandle node for /__local_fixups__/testcase-data/interrupts/interrupts-extended0:interrupts-extended(cell 3)

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/unittest-data/testcases.dts | 56 ++--------------------------------
 1 file changed, 2 insertions(+), 54 deletions(-)

diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
index 12f7c3d649c8..ac616ad18ea6 100644
--- a/drivers/of/unittest-data/testcases.dts
+++ b/drivers/of/unittest-data/testcases.dts
@@ -1,4 +1,6 @@
 /dts-v1/;
+/plugin/;
+
 / {
 	testcase-data {
 		changeset {
@@ -23,57 +25,3 @@
  * The format of this data may be subject to change. For the time being consider
  * this a kernel-internal data format.
  */
-/ { __local_fixups__ {
-	testcase-data {
-		phandle-tests {
-			consumer-a {
-				phandle-list = <0x00000000 0x00000008
-						0x00000018 0x00000028
-						0x00000034 0x00000038>;
-				phandle-list-bad-args = <0x00000000 0x0000000c>;
-			};
-		};
-		interrupts {
-			intmap0 {
-				interrupt-map = <0x00000004 0x00000010
-						 0x00000024 0x00000034>;
-			};
-			intmap1 {
-				interrupt-map = <0x0000000c>;
-			};
-			interrupts0 {
-				interrupt-parent = <0x00000000>;
-			};
-			interrupts1 {
-				interrupt-parent = <0x00000000>;
-			};
-			interrupts-extended0 {
-				interrupts-extended = <0x00000000 0x00000008
-						       0x00000018 0x00000024
-						       0x0000002c 0x00000034
-						       0x0000003c>;
-			};
-		};
-		testcase-device1 {
-			interrupt-parent = <0x00000000>;
-		};
-		testcase-device2 {
-			interrupt-parent = <0x00000000>;
-		};
-		overlay2 {
-			fragment@0 {
-				target = <0x00000000>;
-			};
-		};
-		overlay3 {
-			fragment@0 {
-				target = <0x00000000>;
-			};
-		};
-		overlay4 {
-			fragment@0 {
-				target = <0x00000000>;
-			};
-		};
-	};
-}; };
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
