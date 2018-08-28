From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 4/5] ARM: dts: at91: nattis: move pinctrls for the lvds chip to the lvds node
Date: Tue, 28 Aug 2018 11:48:43 +0200
Message-ID: <20180828094844.10018-5-peda@axentia.se>
References: <20180828094844.10018-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828094844.10018-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The atmel hlcdc controller has nothing to do with these pins, so move
them to where they belong.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index fbc796125c56..2eb0f947ab86 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -34,7 +34,7 @@
 							 AT91_PINCTRL_PULL_UP_DEGLITCH>;
 					};
 
-					pinctrl_lcd_prlud0: lcd_prlud0 {
+					pinctrl_lvds_prlud0: lvds_prlud0 {
 						atmel,pins =
 							<AT91_PIOA 21
 							 AT91_PERIPH_GPIO
@@ -42,7 +42,7 @@
 							  AT91_PINCTRL_OUTPUT_VAL(0))>;
 					};
 
-					pinctrl_lcd_hipow0: lcd_hipow0 {
+					pinctrl_lvds_hipow0: lvds_hipow0 {
 						atmel,pins =
 							<AT91_PIOA 23
 							 AT91_PERIPH_GPIO
@@ -119,6 +119,9 @@
 	lvds-encoder {
 		compatible = "ti,ds90c185", "lvds-encoder";
 
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_prlud0 &pinctrl_lvds_hipow0>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -197,10 +200,7 @@
 
 	hlcdc-display-controller {
 		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_lcd_base
-			     &pinctrl_lcd_rgb565
-			     &pinctrl_lcd_prlud0
-			     &pinctrl_lcd_hipow0>;
+		pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;
 
 		port@0 {
 			hlcdc_output: endpoint {
-- 
2.11.0
