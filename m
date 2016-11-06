From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 01/19] ARM: dts: armada-xp-matrix: Fix the location of the pcie-controller node
Date: Sun,  6 Nov 2016 23:26:54 +0100
Message-ID: <20161106222712.27366-2-gregory.clement@free-electrons.com>
References: <20161106222712.27366-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161106222712.27366-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In the dts for the Marvell Armada XP Matrix board the pcie-controller was
located under the internal-regs node whereas it belongs to the soc node.

It means that, until this fix, the pcie could not work for this board
because it didn't match the definition of the pcie-controller node in the
dtsi file. If we had a look on the decompiled dtb file we saw two
different instances of the pcie-controller node: one with the all the
resource set but disabled and the other without any resource but enabled.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-matrix.dts | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-matrix.dts b/arch/arm/boot/dts/armada-xp-matrix.dts
index 6522b04f4a8e..e1509f4c5114 100644
--- a/arch/arm/boot/dts/armada-xp-matrix.dts
+++ b/arch/arm/boot/dts/armada-xp-matrix.dts
@@ -71,6 +71,15 @@
 			  MBUS_ID(0x09, 0x09) 0 0 0xf1100000 0x10000
 			  MBUS_ID(0x09, 0x05) 0 0 0xf1110000 0x10000>;
 
+		pcie-controller {
+			status = "okay";
+
+			pcie@1,0 {
+				/* Port 0, Lane 0 */
+				status = "okay";
+			};
+		};
+
 		internal-regs {
 			serial@12000 {
 				status = "okay";
@@ -99,15 +108,6 @@
 				};
 			};
 
-			pcie-controller {
-				status = "okay";
-
-				pcie@1,0 {
-					/* Port 0, Lane 0 */
-					status = "okay";
-				};
-			};
-
 			usb@50000 {
 				status = "okay";
 			};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
