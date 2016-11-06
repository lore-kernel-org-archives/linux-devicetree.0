From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 13/19] ARM: dts: armada-370-xp: Fixup l2-cache DT warning
Date: Sun,  6 Nov 2016 23:27:06 +0100
Message-ID: <20161106222712.27366-14-gregory.clement@free-electrons.com>
References: <20161106222712.27366-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161106222712.27366-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

l2-cache which is either an aurora-outer-cache or an aurora-system-cache
has a reg property so the unit name should contain an address.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370.dtsi | 2 +-
 arch/arm/boot/dts/armada-xp.dtsi  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index cb0db6d673ef..6f0d1164d0e7 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -127,7 +127,7 @@
 		};
 
 		internal-regs {
-			L2: l2-cache {
+			L2: l2-cache@8000 {
 				compatible = "marvell,aurora-outer-cache";
 				reg = <0x08000 0x1000>;
 				cache-id-part = <0x100>;
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 642561e38ac2..9c0c0b516783 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -78,7 +78,7 @@
 				reg = <0x1400 0x500>;
 			};
 
-			L2: l2-cache {
+			L2: l2-cache@8000 {
 				compatible = "marvell,aurora-system-cache";
 				reg = <0x08000 0x1000>;
 				cache-id-part = <0x100>;
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
