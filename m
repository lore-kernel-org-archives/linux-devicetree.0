From: venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org
Subject: [PATCH 3/4] arm: dts: imx28: Rearrange nodes for better readability
Date: Fri,  1 Dec 2017 12:08:30 +0530
Message-ID: <1512110311-15788-4-git-send-email-venkataravi.e@techveda.org>
References: <1512110311-15788-1-git-send-email-venkataravi.e@techveda.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512110311-15788-1-git-send-email-venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, karthik-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org, shrikant.maurya-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org, Ravi Eluri <venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>, Suniel Mahesh <sunil.m-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ravi Eluri <venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>

Moved regulator, sound, leds, backlight nodes to the top of the
device tree, cleaned up for better readability.

Signed-off-by: Ravi Eluri <venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
Signed-off-by: Suniel Mahesh <sunil.m-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
---
Note:
- This is the third patch of the four patch series.
- Patch was compile tested and built(ARCH=arm, imx28) on linux-next
  (latest).
- No build issues reported.
- Please discard this changeset, if this is not making any better.
---
 arch/arm/boot/dts/imx28-evk.dts | 203 ++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 102 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index 28564864..9d74486 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -20,6 +20,107 @@
 		reg = <0x40000000 0x08000000>;
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_3p3v: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "3P3V";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		reg_vddio_sd0: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "vddio-sd0";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio3 28 0>;
+		};
+
+		reg_fec_3v3: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "fec-3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio2 15 0>;
+		};
+
+		reg_usb0_vbus: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "usb0_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio3 9 0>;
+			enable-active-high;
+		};
+
+		reg_usb1_vbus: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "usb1_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio3 8 0>;
+			enable-active-high;
+		};
+
+		reg_lcd_3v3: regulator@5 {
+			compatible = "regulator-fixed";
+			reg = <5>;
+			regulator-name = "lcd-3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio3 30 0>;
+			enable-active-high;
+		};
+
+		reg_can_3v3: regulator@6 {
+			compatible = "regulator-fixed";
+			reg = <6>;
+			regulator-name = "can-3v3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio2 13 0>;
+			enable-active-high;
+		};
+	};
+
+	sound {
+		compatible = "fsl,imx28-evk-sgtl5000",
+			     "fsl,mxs-audio-sgtl5000";
+		model = "imx28-evk-sgtl5000";
+		saif-controllers = <&saif0 &saif1>;
+		audio-codec = <&sgtl5000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pin_gpio3_5>;
+
+		user {
+			label = "Heartbeat";
+			gpios = <&gpio3 5 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 2 5000000>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
+};
+
 			&gpmi {
 				pinctrl-names = "default";
 				pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg
@@ -266,105 +367,3 @@
 			pinctrl-0 = <&mac1_pins_a>;
 			status = "okay";
 		};
-
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
-
-		reg_vddio_sd0: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vddio-sd0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio3 28 0>;
-		};
-
-		reg_fec_3v3: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "fec-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio2 15 0>;
-		};
-
-		reg_usb0_vbus: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "usb0_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 9 0>;
-			enable-active-high;
-		};
-
-		reg_usb1_vbus: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 8 0>;
-			enable-active-high;
-		};
-
-		reg_lcd_3v3: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "lcd-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio3 30 0>;
-			enable-active-high;
-		};
-
-		reg_can_3v3: regulator@6 {
-			compatible = "regulator-fixed";
-			reg = <6>;
-			regulator-name = "can-3v3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio2 13 0>;
-			enable-active-high;
-		};
-
-	};
-
-	sound {
-		compatible = "fsl,imx28-evk-sgtl5000",
-			     "fsl,mxs-audio-sgtl5000";
-		model = "imx28-evk-sgtl5000";
-		saif-controllers = <&saif0 &saif1>;
-		audio-codec = <&sgtl5000>;
-	};
-
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&led_pin_gpio3_5>;
-
-		user {
-			label = "Heartbeat";
-			gpios = <&gpio3 5 0>;
-			linux,default-trigger = "heartbeat";
-		};
-	};
-
-	backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pwm 2 5000000>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
-		default-brightness-level = <6>;
-	};
-};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
