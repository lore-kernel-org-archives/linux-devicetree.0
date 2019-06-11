Return-Path: <SRS0=Zn+R=UK=googlemail.com=yegorslists@kernel.org>
From: yegorslists@googlemail.com
Subject: [PATCH] ARM: dts: am335x-baltos: add support for MMC1 CD pin
Date: Tue, 11 Jun 2019 16:13:38 +0200
Message-Id: <20190611141338.14787-1-yegorslists@googlemail.com>
To: linux-omap@vger.kernel.org
Cc: tony@atomide.com, bcousson@baylibre.com, robh+dt@kernel.org, devicetree@vger.kernel.org, Yegor Yefremov <yegorslists@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Baltos 5221/3220 devices provide CD signal on GPIO2_18.
Baltos 2110 device provides CD signal on GPIO1_15.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos-ir2110.dts | 12 ++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 12 ++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir5221.dts | 11 +++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index 2f650a736b44..984a5cb16c2c 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -33,6 +33,12 @@
 			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)      /* lcd_ac_bias_en.gpio2[25] RI */
 		>;
 	};
+
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT, MUX_MODE7)     /* MMC1 CD */
+		>;
+	};
 };
 
 &uart1 {
@@ -72,3 +78,9 @@
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 1ba66d5e21e8..37e61bfaaf44 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -54,6 +54,12 @@
 			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR, PIN_INPUT_PULLUP, MUX_MODE7)      /* mcasp0_aclkr.gpio3[18], INPUT_PULLDOWN | MODE7 */
 		>;
 	};
+
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT, MUX_MODE7)     /* MMC1 CD */
+		>;
+	};
 };
 
 &uart1 {
@@ -114,3 +120,9 @@
 	dual_emac_res_vlan = <2>;
 	phy-handle = <&phy1>;
 };
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index eed65fc0e8e6..59580e683e79 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -63,6 +63,11 @@
 		>;
 	};
 
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT, MUX_MODE7)     /* MMC1 CD */
+		>;
+	};
 };
 
 &uart1 {
@@ -139,3 +144,9 @@
 
 	status = "okay";
 };
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
+};
-- 
2.17.0
