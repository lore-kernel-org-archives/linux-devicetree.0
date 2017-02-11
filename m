From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 8/8] ARM: dts: sun4i: gemei-g9: Add LVDS display support
Date: Sat, 11 Feb 2017 19:44:05 +0200
Message-ID: <20170211174405.28395-9-plaes@plaes.org>
References: <20170211174405.28395-1-plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBB6M27XCAKGQEKYYU3VY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170211174405.28395-1-plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-gemei-g9.dts | 95 +++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts b/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
index 9616cde..c19f906 100644
--- a/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
+++ b/arch/arm/boot/dts/sun4i-a10-gemei-g9.dts
@@ -1,5 +1,5 @@
 /*
- * Copyright 2015 Priit Laes
+ * Copyright 2015-2017 Priit Laes
  *
  * Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
  *
@@ -48,28 +48,69 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Gemei G9 Tablet";
 	compatible = "gemei,g9", "allwinner,sun4i-a10";
 
+	/*
+	 * TODO:
+	 *   2x cameras via CSI
+	 *   AXP battery management
+	 *   NAND
+	 *   OTG
+	 *   Touchscreen - gt801_2plus1 @ i2c adapter 2 @ 0x48
+	 *   HDMI output
+	 */
+
 	aliases {
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_backlight_pin>;
+		/* TODO: Figure out proper parameters */
+		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
+		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
+		default-brightness-level = <8>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	panel: panel {
+		compatible = "lg,lp097x02-slq2";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_enable_pin &lcd_lvds0_pins>;
+		enable-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint {
+				remote-endpoint = <&tcon0_out_panel>;
+			};
+		};
+	};
+
+	display-engine {
+		compatible = "allwinner,sun5i-a13-display-engine";
+		allwinner,pipelines = <&fe0>;
+	};
+};
+
+&be0 {
+	status = "okay";
 };
 
-/*
- * TODO:
- *   2x cameras via CSI
- *   AXP battery management
- *   NAND
- *   OTG
- *   Touchscreen - gt801_2plus1 @ i2c adapter 2 @ 0x48
- */
 &codec {
 	/* PH15 controls power to external amplifier (ft2012q) */
 	pinctrl-names = "default";
@@ -90,6 +131,10 @@
 	status = "okay";
 };
 
+&fe0 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins_a>;
@@ -159,6 +204,27 @@
 		pins = "PH15";
 		function = "gpio_out";
 	};
+
+	lcd_backlight_pin: lcd_backlight_pin@0 {
+		pins = "PH7";
+		function = "gpio_out";
+	};
+
+	lcd_enable_pin: lcd_enable_pin@0 {
+		pins = "PH8";
+		function = "gpio_out";
+	};
+
+	lcd_lvds0_pins: lcd_lvds0_pins@0 {
+		pins =  "PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7", "PD8", "PD9";
+		function = "lvds0";
+	};
+};
+
+&pwm {
+        pinctrl-names = "default";
+        pinctrl-0 = <&pwm0_pins_a>;
+        status = "okay";
 };
 
 &reg_dcdc2 {
@@ -194,6 +260,17 @@
 	status = "okay";
 };
 
+&tcon0 {
+	mode = "lvds";
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_panel: endpoint@1 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
 
 &uart0  {
 	pinctrl-names = "default";
-- 
2.9.3
