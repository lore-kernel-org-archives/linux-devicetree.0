From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 09/13] ARM: dts: armada-375: Fixup soc DT warning
Date: Fri, 18 Nov 2016 00:08:26 +0100
Message-ID: <20161117230830.31047-10-gregory.clement@free-electrons.com>
References: <20161117230830.31047-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117230830.31047-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

soc has a ranges property so the unit name should contain an address.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-375-db.dts | 6 +++++-
 arch/arm/boot/dts/armada-375.dtsi   | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375-db.dts b/arch/arm/boot/dts/armada-375-db.dts
index b33a674088ed..5ed226236398 100644
--- a/arch/arm/boot/dts/armada-375-db.dts
+++ b/arch/arm/boot/dts/armada-375-db.dts
@@ -63,7 +63,11 @@
 		reg = <0x00000000 0x40000000>; /* 1 GB */
 	};
 
-	soc {
+	/* The following unit address is composed of the target
+	 * value (bit [40-47]), attributes value (bits [32-39],
+	 * and the address value in the window memory: [0-31].
+	 */
+	soc@f00100000000 {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
 			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
 			  MBUS_ID(0x09, 0x09) 0 0xf1100000 0x10000
diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index f213b6786e10..120dd7ac40cb 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -101,7 +101,11 @@
 		interrupts-extended = <&mpic 3>;
 	};
 
-	soc {
+	/* The following unit address is composed of the target
+	 * value (bit [40-47]), attributes value (bits [32-39],
+	 * and the address value in the window memory: [0-31].
+	 */
+	soc@f00100000000 {
 		compatible = "marvell,armada375-mbus", "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <1>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
