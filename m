From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 19/19] ARM: dts: armada-370-xp: Fixup regulator DT warning
Date: Sun,  6 Nov 2016 23:27:12 +0100
Message-ID: <20161106222712.27366-20-gregory.clement@free-electrons.com>
References: <20161106222712.27366-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161106222712.27366-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

regulator has a reg property so the unit name should contain an address.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-synology-ds213j.dts | 4 ++--
 arch/arm/boot/dts/armada-xp-synology-ds414.dts   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-synology-ds213j.dts b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
index 2cf02f286391..adba7b674d95 100644
--- a/arch/arm/boot/dts/armada-370-synology-ds213j.dts
+++ b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
@@ -186,7 +186,7 @@
 		pinctrl-0 = <&sata1_pwr_pin &sata2_pwr_pin>;
 		pinctrl-names = "default";
 
-		sata1_regulator: sata1-regulator {
+		sata1_regulator: sata1-regulator@1 {
 			compatible = "regulator-fixed";
 			reg = <1>;
 			regulator-name = "SATA1 Power";
@@ -199,7 +199,7 @@
 			gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		};
 
-		sata2_regulator: sata2-regulator {
+		sata2_regulator: sata2-regulator@2 {
 			compatible = "regulator-fixed";
 			reg = <2>;
 			regulator-name = "SATA2 Power";
diff --git a/arch/arm/boot/dts/armada-xp-synology-ds414.dts b/arch/arm/boot/dts/armada-xp-synology-ds414.dts
index 91cd30946d91..af998d9ade65 100644
--- a/arch/arm/boot/dts/armada-xp-synology-ds414.dts
+++ b/arch/arm/boot/dts/armada-xp-synology-ds414.dts
@@ -154,7 +154,7 @@
 			     &sata3_pwr_pin &sata4_pwr_pin>;
 		pinctrl-names = "default";
 
-		sata1_regulator: sata1-regulator {
+		sata1_regulator: sata1-regulator@1 {
 			compatible = "regulator-fixed";
 			reg = <1>;
 			regulator-name = "SATA1 Power";
@@ -167,7 +167,7 @@
 			gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 		};
 
-		sata2_regulator: sata2-regulator {
+		sata2_regulator: sata2-regulator@2 {
 			compatible = "regulator-fixed";
 			reg = <2>;
 			regulator-name = "SATA2 Power";
@@ -180,7 +180,7 @@
 			gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 		};
 
-		sata3_regulator: sata3-regulator {
+		sata3_regulator: sata3-regulator@3 {
 			compatible = "regulator-fixed";
 			reg = <3>;
 			regulator-name = "SATA3 Power";
@@ -193,7 +193,7 @@
 			gpio = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		};
 
-		sata4_regulator: sata4-regulator {
+		sata4_regulator: sata4-regulator@4 {
 			compatible = "regulator-fixed";
 			reg = <4>;
 			regulator-name = "SATA4 Power";
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
