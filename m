From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 6/6] [DO NOT MERGE] ARM: dts: sun7i:
 bananapi-m1-plus: Enable Bananapi 7" 800x480 RGB LCD panel
Date: Fri,  7 Sep 2018 12:19:48 +0800
Message-ID: <20180907041948.19913-7-wens@csie.org>
References: <20180907041948.19913-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB27YY7OAKGQEWEJG75Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180907041948.19913-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BPI-M1+ has an FPC connector for connecting an RGB (parallel) or
LVDS LCD panel. One of the compatible panels is a 7" 800x480 RGB panel
from Bananapi. The backlight can be controlled by driving a PWM signal
from the SoC at different duty cycles. The LCD enable pin does not seem
to do anything, but it is nevertheless included for completeness. There
is also a FT5306 capacitive touchscreen controller.

This should not be confused with the other 7" LCD that is LVDS based
and has a resolution of 1024x600.

This patch enables all of the above for the BPI-M1+.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 .../boot/dts/sun7i-a20-bananapi-m1-plus.dts   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
index 763cb03033c4..9fa58adade56 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
@@ -47,6 +47,7 @@
 #include "sunxi-common-regulators.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Banana Pi BPI-M1-Plus";
@@ -71,6 +72,29 @@
 		};
 	};
 
+	lcd_backlight: lcd-backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 20000 PWM_POLARITY_INVERTED>; /* 50 kHz */
+		enable-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
+		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
+		default-brightness-level = <8>;
+	};
+
+	lcd_panel: lcd-panel {
+		compatible = "bananapi,s070wv20-ct16", "simple-panel";
+		power-supply = <&reg_vcc5v0>; /* Actually driven from IPSOUT */
+		/* This doesn't do anything for this particular connector */
+		enable-gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+
+		port {
+			backlight = <&lcd_backlight>;
+
+			lcd_panel_input: endpoint {
+				remote-endpoint = <&tcon0_out_lcd>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -173,6 +197,20 @@
 	status = "okay";
 };
 
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins_a>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306", "edt,edt-ft5x06";
+		reg = <0x38>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 7 IRQ_TYPE_EDGE_FALLING>; /* PH7 */
+		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
+	};
+};
+
 &ir0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ir0_rx_pins_a>;
@@ -249,6 +287,12 @@
 	};
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins_a>;
+	status = "okay";
+};
+
 &reg_dcdc2 {
 	regulator-always-on;
 	regulator-min-microvolt = <1000000>;
@@ -278,6 +322,18 @@
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd0_rgb888_pins>;
+};
+
+&tcon0_out {
+	tcon0_out_lcd: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&lcd_panel_input>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
-- 
2.19.0.rc1
