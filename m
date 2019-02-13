From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 5/5] arm64: dts: sprd: Remove wildcard compatible string
Date: Wed, 13 Feb 2019 20:32:49 +0800
Message-ID: <f34970a034946bacda19202e2ce9973ca732c925.1550060544.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
In-Reply-To: <cover.1550060543.git.baolin.wang@linaro.org>
References: <cover.1550060543.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Cc: olof@lixom.net, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Remove wildcard compatible string.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 arch/arm64/boot/dts/sprd/sc2731.dtsi |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index 4a79ddf..e15409f 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -24,7 +24,7 @@
 		};
 
 		led-controller@200 {
-			compatible = "sprd,sc27xx-bltc", "sprd,sc2731-bltc";
+			compatible = "sprd,sc2731-bltc";
 			reg = <0x200>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -46,14 +46,14 @@
 		};
 
 		rtc@280 {
-			compatible = "sprd,sc27xx-rtc", "sprd,sc2731-rtc";
+			compatible = "sprd,sc2731-rtc";
 			reg = <0x280>;
 			interrupt-parent = <&sc2731_pmic>;
 			interrupts = <2>;
 		};
 
 		pmic_eic: gpio@300 {
-			compatible = "sprd,sc27xx-eic";
+			compatible = "sprd,sc2731-eic";
 			reg = <0x300>;
 			interrupt-parent = <&sc2731_pmic>;
 			interrupts = <5>;
@@ -64,7 +64,7 @@
 		};
 
 		efuse@380 {
-			compatible = "sprd,sc27xx-efuse", "sprd,sc2731-efuse";
+			compatible = "sprd,sc2731-efuse";
 			reg = <0x380>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -85,7 +85,7 @@
 		};
 
 		pmic_adc: adc@480 {
-			compatible = "sprd,sc27xx-adc", "sprd,sc2731-adc";
+			compatible = "sprd,sc2731-adc";
 			reg = <0x480>;
 			interrupt-parent = <&sc2731_pmic>;
 			interrupts = <0>;
@@ -109,12 +109,12 @@
 		};
 
 		vibrator@ec8 {
-			compatible = "sprd,sc27xx-vibrator", "sprd,sc2731-vibrator";
+			compatible = "sprd,sc2731-vibrator";
 			reg = <0xec8>;
 		};
 
 		regulators {
-			compatible = "sprd,sc27xx-regulator";
+			compatible = "sprd,sc2731-regulator";
 
 			vddarm0: BUCK_CPU0 {
 				regulator-name = "vddarm0";
-- 
1.7.9.5
