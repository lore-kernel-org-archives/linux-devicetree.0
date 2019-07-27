From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: dts: rockchip: Cleanup style around assignment operator
Date: Sat, 27 Jul 2019 16:27:35 +0200
Message-ID: <20190727142736.23188-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Use a space before and after assignment operator to have consistent
style.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/rk3036.dtsi                   |  2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi               |  2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi            | 12 ++++++------
 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 0290ea4edd32..c776321b2cc4 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -484,7 +484,7 @@
 		compatible = "rockchip,rockchip-spi";
 		reg = <0x20074000 0x1000>;
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-		clocks =<&cru PCLK_SPI>, <&cru SCLK_SPI>;
+		clocks = <&cru PCLK_SPI>, <&cru SCLK_SPI>;
 		clock-names = "apb-pclk","spi_pclk";
 		dmas = <&pdma 8>, <&pdma 9>;
 		dma-names = "tx", "rx";
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 820440715302..2afd686b2033 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -97,7 +97,7 @@
 	};
 
 	panel: panel {
-		compatible ="lg,lp079qx1-sp0v", "simple-panel";
+		compatible = "lg,lp079qx1-sp0v", "simple-panel";
 		backlight = <&backlight>;
 		enable-gpios = <&gpio7 RK_PA4 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&lcd_cs>;
diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index 293576869546..81e4e953d4a4 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -47,13 +47,13 @@
 		compatible = "gpio-leds";
 
 		act-led {
-			gpios=<&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger="mmc0";
+			gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
 		};
 
 		heartbeat-led {
-			gpios=<&gpio1 RK_PD1 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger="heartbeat";
+			gpios = <&gpio1 RK_PD1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
 		};
 
 		pwr-led {
@@ -443,7 +443,7 @@
 
 &saradc {
 	vref-supply = <&vcc18_ldo1>;
-	status ="okay";
+	status = "okay";
 };
 
 &sdmmc {
@@ -516,7 +516,7 @@
 };
 
 &usb_otg {
-	status= "okay";
+	status = "okay";
 };
 
 &vopb {
diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index 1cadb522fd0d..e0183655e92c 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -86,7 +86,7 @@
 	};
 
 	panel: panel {
-		compatible ="innolux,n116bge", "simple-panel";
+		compatible = "innolux,n116bge", "simple-panel";
 		status = "okay";
 		power-supply = <&vcc33_lcd>;
 		backlight = <&backlight>;
-- 
2.17.1
