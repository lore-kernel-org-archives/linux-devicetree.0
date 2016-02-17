From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: dts: vf-colibri: add basic supply regulators
Date: Tue, 16 Feb 2016 16:18:36 -0800
Message-ID: <1455668317-15728-2-git-send-email-stefan@agner.ch>
References: <1455668317-15728-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455668317-15728-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Colibri modules need to be powered using the power pins 3V3 and
AVDD_AUDIO. Add fixed regulators which represent this power rails.
Potentially, those power rails could be switched on a carrier
board. A carrier board device tree could add a own regulator with
a GPIO, and reference that regulator in a vin-supply property of
those new module level system regulators.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
Changes since v1:
- Add module prefix to avoid namespace issue with Carrier Board regulators
- Name the regulators according to schematics

 arch/arm/boot/dts/vf-colibri.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index ff6f58e..dcc73b7 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -48,14 +48,32 @@
 		enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
+
+	reg_module_3v3: regulator-module-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_module_3v3_avdd: regulator-module-3v3-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_AVDD_AUDIO";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &adc0 {
 	status = "okay";
+	vref-supply = <&reg_module_3v3_avdd>;
 };
 
 &adc1 {
 	status = "okay";
+	vref-supply = <&reg_module_3v3_avdd>;
 };
 
 &can0 {
@@ -96,6 +114,7 @@
 
 &fec1 {
 	phy-mode = "rmii";
+	phy-supply = <&reg_module_3v3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec1>;
 };
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
