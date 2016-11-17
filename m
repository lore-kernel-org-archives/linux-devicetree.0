From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 05/13] ARM: dts: armada-375: Fixup devbus DT warning
Date: Fri, 18 Nov 2016 00:08:22 +0100
Message-ID: <20161117230830.31047-6-gregory.clement@free-electrons.com>
References: <20161117230830.31047-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117230830.31047-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

devbus has a reg property so the unit name should contain an address.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-375.dtsi | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index 1c83ae504b64..9791a61f076b 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -119,7 +119,12 @@
 			reg = <MBUS_ID(0x01, 0x1d) 0 0x100000>;
 		};
 
-		devbus_bootcs: devbus-bootcs {
+		/* The following unit addresses (for devbus) are composed of
+		 * the target value (bit [40-47]), attributes value (bits
+		 * [32-39], and the address value in the window memory: [0-31].
+		 */
+
+		devbus_bootcs: devbus-bootcs@f00100010400 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10400 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0xffffffff>;
@@ -129,7 +134,7 @@
 			status = "disabled";
 		};
 
-		devbus_cs0: devbus-cs0 {
+		devbus_cs0: devbus-cs@f00100010408 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10408 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3e) 0 0xffffffff>;
@@ -139,7 +144,7 @@
 			status = "disabled";
 		};
 
-		devbus_cs1: devbus-cs1 {
+		devbus_cs1: devbus-cs@f00100010410 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10410 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3d) 0 0xffffffff>;
@@ -149,7 +154,7 @@
 			status = "disabled";
 		};
 
-		devbus_cs2: devbus-cs2 {
+		devbus_cs2: devbus-cs@f00100010418 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10418 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x3b) 0 0xffffffff>;
@@ -159,7 +164,7 @@
 			status = "disabled";
 		};
 
-		devbus_cs3: devbus-cs3 {
+		devbus_cs3: devbus-cs@f00100010420 {
 			compatible = "marvell,mvebu-devbus";
 			reg = <MBUS_ID(0xf0, 0x01) 0x10420 0x8>;
 			ranges = <0 MBUS_ID(0x01, 0x37) 0 0xffffffff>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
