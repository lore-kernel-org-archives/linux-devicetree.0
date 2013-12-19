From: Sourav Poddar <sourav.poddar@ti.com>
Subject: [PATCHv2 7/9] arm: dts: am437x-gp-evm: Add pwm backlight support.
Date: Thu, 19 Dec 2013 18:03:39 +0530
Message-ID: <1387456421-21379-8-git-send-email-sourav.poddar@ti.com>
References: <1387456421-21379-1-git-send-email-sourav.poddar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1387456421-21379-1-git-send-email-sourav.poddar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: bcousson@baylibre.com
Cc: balbi@ti.com, devicetree@vger.kernel.org, tony@atomide.com, linux-omap@vger.kernel.org, mark.rutland@arm.com, afzal@ti.com, lokeshvutla@ti.com, Sourav Poddar <sourav.poddar@ti.com>
List-Id: devicetree@vger.kernel.org

Add pwm backlight support for gp evm.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
 arch/arm/boot/dts/am437x-gp-evm.dts |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
index 11d93ba..2e79bda 100644
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -12,10 +12,18 @@
 
 #include "am4372.dtsi"
 #include <dt-bindings/pinctrl/am43xx.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "TI AM437x GP EVM";
 	compatible = "ti,am437x-gp-evm","ti,am4372","ti,am43";
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&ecap0 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <0 51 53 56 62 75 101 152 255>;
+		default-brightness-level = <8>;
+	};
 };
 
 &am43xx_pinmux {
@@ -32,6 +40,12 @@
 			0x158 (PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE2)  /* spi0_d1.i2c1_sda  */
 		>;
 	};
+
+	ecap0_pins: backlight_pins {
+		pinctrl-single,pins = <
+			0x164 MUX_MODE0       /* eCAP0_in_PWM0_out.eCAP0_in_PWM0_out MODE0 */
+		>;
+	};
 };
 
 &i2c0 {
@@ -45,3 +59,13 @@
         pinctrl-names = "default";
         pinctrl-0 = <&i2c1_pins>;
 };
+
+&epwmss0 {
+	status = "okay";
+};
+
+&ecap0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecap0_pins>;
+};
-- 
1.7.9.5

