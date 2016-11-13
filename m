From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 06/13] ARM: dts: armada-375: Fixup sa-ram DT warning
Date: Sun, 13 Nov 2016 22:32:27 +0100
Message-ID: <20161113213234.3368-7-gregory.clement@free-electrons.com>
References: <20161113213234.3368-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161113213234.3368-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

sa-sram which is a mmio-sram has a reg property so the unit name should
contain an address.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-375.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index e83eaa39e7ea..ba9d7d64221c 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -635,7 +635,7 @@
 
 		};
 
-		crypto_sram0: sa-sram0 {
+		crypto_sram0: sa-sram@09_09_0 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x09, 0x09) 0 0x800>;
 			clocks = <&gateclk 30>;
@@ -644,7 +644,7 @@
 			ranges = <0 MBUS_ID(0x09, 0x09) 0 0x800>;
 		};
 
-		crypto_sram1: sa-sram1 {
+		crypto_sram1: sa-sram@09_05_0 {
 			compatible = "mmio-sram";
 			reg = <MBUS_ID(0x09, 0x05) 0 0x800>;
 			clocks = <&gateclk 31>;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
