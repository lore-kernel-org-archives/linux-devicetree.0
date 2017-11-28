From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH v2 01/16] ARM: dts: imx6qdl: SolidRun: remove redundant
 regulators node
Date: Tue, 28 Nov 2017 15:01:59 +0000
Message-ID: <E1eJhOZ-0006N3-WC@rmk-PC.armlinux.org.uk>
References: <20171128150045.GV31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128150045.GV31757-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The regulators node is redundant, and serves no useful function.
Remove it from i.MX6 SolidRun platforms.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi      | 56 ++++++++++++++---------------
 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 56 ++++++++++++++---------------
 arch/arm/boot/dts/imx6qdl-microsom.dtsi     | 24 ++++++-------
 3 files changed, 62 insertions(+), 74 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index 14fff4ee6516..b20508237046 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -64,38 +64,34 @@
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-
-		reg_3p3v: 3p3v {
-			compatible = "regulator-fixed";
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_3p3v: 3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		reg_usbh1_vbus: usb-h1-vbus {
-			compatible = "regulator-fixed";
-			enable-active-high;
-			gpio = <&gpio1 0 0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_cubox_i_usbh1_vbus>;
-			regulator-name = "usb_h1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	reg_usbh1_vbus: usb-h1-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 0 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cubox_i_usbh1_vbus>;
+		regulator-name = "usb_h1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 
-		reg_usbotg_vbus: usb-otg-vbus {
-			compatible = "regulator-fixed";
-			enable-active-high;
-			gpio = <&gpio3 22 0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_cubox_i_usbotg_vbus>;
-			regulator-name = "usb_otg_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	reg_usbotg_vbus: usb-otg-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 22 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cubox_i_usbotg_vbus>;
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 	};
 
 	sound-spdif {
diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
index 37c07c0748aa..0a0a7e4b956b 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
@@ -53,38 +53,34 @@
 		pinctrl-0 = <&pinctrl_hummingboard_gpio3_5>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-
-		reg_3p3v: 3p3v {
-			compatible = "regulator-fixed";
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	reg_3p3v: 3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		reg_usbh1_vbus: usb-h1-vbus {
-			compatible = "regulator-fixed";
-			enable-active-high;
-			gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_hummingboard_usbh1_vbus>;
-			regulator-name = "usb_h1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	reg_usbh1_vbus: usb-h1-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hummingboard_usbh1_vbus>;
+		regulator-name = "usb_h1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 
-		reg_usbotg_vbus: usb-otg-vbus {
-			compatible = "regulator-fixed";
-			enable-active-high;
-			gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_hummingboard_usbotg_vbus>;
-			regulator-name = "usb_otg_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-		};
+	reg_usbotg_vbus: usb-otg-vbus {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hummingboard_usbotg_vbus>;
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 	};
 
 	sound-sgtl5000 {
diff --git a/arch/arm/boot/dts/imx6qdl-microsom.dtsi b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
index 6a410160c9ee..f7266ae2534c 100644
--- a/arch/arm/boot/dts/imx6qdl-microsom.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
@@ -48,20 +48,16 @@
 		enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-
-		reg_brcm: brcm-reg {
-			compatible = "regulator-fixed";
-			enable-active-high;
-			gpio = <&gpio3 19 0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_microsom_brcm_reg>;
-			regulator-name = "brcm_reg";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			startup-delay-us = <200000>;
-		};
+	reg_brcm: brcm-reg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 19 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_microsom_brcm_reg>;
+		regulator-name = "brcm_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <200000>;
 	};
 
 	usdhc1_pwrseq: usdhc1_pwrseq {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
