Return-Path: <SRS0=9L7l=MD=ti.com=j-keerthy@kernel.org>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH] arm: dts: am57xx-idk-common: Hook smps12 regulator as cpu vdd-supply
Date: Fri, 21 Sep 2018 16:52:58 +0530
Message-ID: <1537528978-31780-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, j-keerthy@ti.com, robh+dt@kernel.org, nm@ti.com
List-ID: <devicetree@vger.kernel.org>

am574x-idk has no cpu vdd-supply at the moment. Hence hook smps12
regulator as cpu vdd-supply in am57xx-idk-common as the same regulator
feeds on to cpu on am571/2/4-idks. So remove all the individual
instances and place that in common place.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/am571x-idk.dts         | 4 ----
 arch/arm/boot/dts/am572x-idk.dts         | 4 ----
 arch/arm/boot/dts/am57xx-idk-common.dtsi | 4 ++++
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/am571x-idk.dts b/arch/arm/boot/dts/am571x-idk.dts
index afe188c..6432309 100644
--- a/arch/arm/boot/dts/am571x-idk.dts
+++ b/arch/arm/boot/dts/am571x-idk.dts
@@ -194,7 +194,3 @@
 	pinctrl-1 = <&mmc2_pins_hs>;
 	pinctrl-2 = <&mmc2_pins_ddr_rev20 &mmc2_iodelay_ddr_conf>;
 };
-
-&cpu0 {
-	vdd-supply = <&smps12_reg>;
-};
diff --git a/arch/arm/boot/dts/am572x-idk.dts b/arch/arm/boot/dts/am572x-idk.dts
index 3ef9111..b2fb6e0 100644
--- a/arch/arm/boot/dts/am572x-idk.dts
+++ b/arch/arm/boot/dts/am572x-idk.dts
@@ -36,7 +36,3 @@
 	pinctrl-1 = <&mmc2_pins_hs>;
 	pinctrl-2 = <&mmc2_pins_ddr_rev20>;
 };
-
-&cpu0 {
-	vdd-supply = <&smps12_reg>;
-};
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index 6682e52..f7bd264 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -488,3 +488,7 @@
 		};
 	};
 };
+
+&cpu0 {
+	vdd-supply = <&smps12_reg>;
+};
-- 
1.9.1
