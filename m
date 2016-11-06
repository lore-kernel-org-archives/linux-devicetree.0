From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 09/19] ARM: dts: armada-370-xp: Fixup sa-ram DT warning
Date: Sun,  6 Nov 2016 23:27:02 +0100
Message-ID: <20161106222712.27366-10-gregory.clement@free-electrons.com>
References: <20161106222712.27366-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161106222712.27366-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

sa-ram which is a mmio-sram has a reg property so the unit name should
contain an address.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370.dtsi | 2 +-
 arch/arm/boot/dts/armada-xp.dtsi  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index c376c2399d5c..19a9a8a67739 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -262,7 +262,7 @@
 			};
 		};
 
-		crypto_sram: sa-sram {
+		crypto_sram: sa-sram@0 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x09, 0x01) 0 0x800>;
 			reg-names = "sram";
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index fff1b81b8f5f..4cfec3ceb523 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -230,7 +230,7 @@
 			};
 		};
 
-		crypto_sram0: sa-sram0 {
+		crypto_sram0: sa-sram0@0 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x09, 0x09) 0 0x800>;
 			clocks = <&gateclk 23>;
@@ -239,7 +239,7 @@
 			ranges = <0 MBUS_ID(0x09, 0x09) 0 0x800>;
 		};
 
-		crypto_sram1: sa-sram1 {
+		crypto_sram1: sa-sram1@0 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x09, 0x05) 0 0x800>;
 			clocks = <&gateclk 23>;
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
