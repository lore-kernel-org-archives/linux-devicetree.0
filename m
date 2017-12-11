From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 08/20] ARM: dts: imx6*-hummingboard2: convert to more
 conventional vmmc-supply
Date: Mon, 11 Dec 2017 16:57:58 +0000
Message-ID: <E1eOROw-0000HX-Bc@rmk-PC.armlinux.org.uk>
References: <20171211165631.GW10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211165631.GW10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
index 4723bb279e57..7e94548c0de7 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
@@ -52,11 +52,6 @@
 		linux,rc-map-name = "rc-rc6-mce";
 	};
 
-	usdhc2_pwrseq: usdhc2-pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
-	};
-
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "3P3V";
@@ -73,6 +68,18 @@
 		regulator-always-on;
 	};
 
+	v_sd: regulator-v-sd {
+		compatible = "regulator-fixed";
+		gpio = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hummingboard2_vmmc>;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "v_sd";
+		startup-delay-us = <1000>;
+	};
+
 	reg_usbh1_vbus: regulator-usb-h1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -391,7 +398,6 @@
 			fsl,pins = <
 				MX6QDL_PAD_GPIO_4__GPIO1_IO04    0x1f071
 				MX6QDL_PAD_KEY_ROW1__SD2_VSELECT 0x1b071
-				MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
 			>;
 		};
 
@@ -428,6 +434,12 @@
 			>;
 		};
 
+		pinctrl_hummingboard2_vmmc: hummingboard2-vmmc {
+			fsl,pins = <
+				MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
+			>;
+		};
+
 		pinctrl_hummingboard2_usdhc3: hummingboard2-usdhc3 {
 			fsl,pins = <
 				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
@@ -515,7 +527,7 @@
 		&pinctrl_hummingboard2_usdhc2_aux
 		&pinctrl_hummingboard2_usdhc2_200mhz
 	>;
-	mmc-pwrseq = <&usdhc2_pwrseq>;
+	vmmc-supply = <&v_sd>;
 	cd-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
