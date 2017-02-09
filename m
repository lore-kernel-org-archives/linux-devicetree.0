From: Michael Heimpold <michael.heimpold@i2se.com>
Subject: [PATCH v4 4/9] ARM: dts: imx28-duckbill: update to match vendor
 distributed DT
Date: Thu,  9 Feb 2017 08:42:44 +0100
Message-ID: <1486626169-20022-5-git-send-email-michael.heimpold@i2se.com>
References: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fabio.estevam@nxp.com, frowand.list@gmail.com, Michael Heimpold <mhei@heimpold.de>
List-Id: devicetree@vger.kernel.org

From: Michael Heimpold <mhei@heimpold.de>

This patch updates the Duckbill device tree and synchronize it with
the vendor distributed file. The changes in mostly pin-muxing stuff,
but also some minor fixes. In detail:
- enable SPI pins
- enable I2C pins
- enable UART pins
- enable LRADC pin
- adjust USB DR mode
- add default triggers for LEDs
- get rid of regulators simple-bus container
- adjust phy reset duration
  According to phy datasheet, 25ms are sufficient. This also reduces
  the time to boot the system.

Signed-off-by: Michael Heimpold <mhei@heimpold.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/imx28-duckbill.dts | 81 +++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-duckbill.dts b/arch/arm/boot/dts/imx28-duckbill.dts
index ce1a7ef..3e4385d 100644
--- a/arch/arm/boot/dts/imx28-duckbill.dts
+++ b/arch/arm/boot/dts/imx28-duckbill.dts
@@ -1,5 +1,6 @@
 /*
- * Copyright (C) 2013 Michael Heimpold <mhei@heimpold.de>
+ * Copyright (C) 2013-2014,2016 Michael Heimpold <mhei@heimpold.de>
+ * Copyright (C) 2015-2017 I2SE GmbH <info@i2se.com>
  *
  * The code contained herein is licensed under the GNU General Public
  * License. You may obtain a copy of the GNU General Public License
@@ -10,6 +11,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "imx28.dtsi"
 
 / {
@@ -32,6 +34,13 @@
 				status = "okay";
 			};
 
+			ssp2: ssp@80014000 {
+				compatible = "fsl,imx28-spi";
+				pinctrl-names = "default";
+				pinctrl-0 = <&spi2_pins_a>;
+				status = "okay";
+			};
+
 			pinctrl@80018000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&hog_pins_a>;
@@ -39,14 +48,24 @@
 				hog_pins_a: hog@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-						MX28_PAD_SSP0_DATA7__GPIO_2_7 /* PHY Reset */
+						MX28_PAD_LCD_D17__GPIO_1_17    /* Revision detection */
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
+				mac0_phy_reset_pin: mac0-phy-reset@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SSP0_DATA7__GPIO_2_7    /* PHY Reset */
 					>;
 					fsl,drive-strength = <MXS_DRIVE_4mA>;
 					fsl,voltage = <MXS_VOLTAGE_HIGH>;
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
-				led_pins_a: led_gpio@0 {
+				led_pins: leds@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
 						MX28_PAD_AUART1_RX__GPIO_3_4
@@ -60,6 +79,22 @@
 		};
 
 		apbx@80040000 {
+			lradc@80050000 {
+				status = "okay";
+			};
+
+			i2c0: i2c@80058000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&i2c0_pins_a>;
+				status = "okay";
+			};
+
+			auart0: serial@8006a000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&auart0_2pins_a>;
+				status = "okay";
+			};
+
 			duart: serial@80074000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&duart_pins_a>;
@@ -75,47 +110,43 @@
 	ahb@80080000 {
 		usb0: usb@80080000 {
 			status = "okay";
+			dr_mode = "peripheral";
 		};
 
 		mac0: ethernet@800f0000 {
 			phy-mode = "rmii";
 			pinctrl-names = "default";
-			pinctrl-0 = <&mac0_pins_a>;
+			pinctrl-0 = <&mac0_pins_a>, <&mac0_phy_reset_pin>;
 			phy-supply = <&reg_3p3v>;
 			phy-reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
-			phy-reset-duration = <100>;
+			phy-reset-duration = <25>;
 			status = "okay";
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_3p3v: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-		pinctrl-0 = <&led_pins_a>;
+		pinctrl-0 = <&led_pins>;
 
-		status {
-			label = "duckbill:green:status";
-			gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
-		};
-
-		failure {
+		status-red {
 			label = "duckbill:red:status";
 			gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		status-green {
+			label = "duckbill:green:status";
+			gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
 		};
 	};
 };
-- 
2.6.1
