From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH] ARM: imx: add HDMI support for SolidRun HummingBoard and
 Cubox-i
Date: Fri, 18 Apr 2014 11:01:27 +0100
Message-ID: <E1Wb5br-0002ZE-T3@rmk-PC.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the HDMI DT configuration for the SolidRun HummingBoard and Cubox-i.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-hummingboard.dts | 28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi    | 28 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
index 5bfae54fb780..d3095f58bf7b 100644
--- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
+++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
@@ -67,6 +67,14 @@
 	status = "okay";
 };
 
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hummingboard_hdmi>;
+	ddc-i2c-bus = <&i2c2>;
+	status = "okay";
+	crtcs = <&ipu1 0>;
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard_i2c1>;
@@ -82,6 +90,13 @@
 	 */
 };
 
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hummingboard_i2c2>;
+	status = "okay";
+};
+
 &iomuxc {
 	hummingboard {
 		pinctrl_hummingboard_flexcan1: hummingboard-flexcan1 {
@@ -97,6 +112,12 @@
 			>;
 		};
 
+		pinctrl_hummingboard_hdmi: hummingboard-hdmi {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
+			>;
+		};
+
 		pinctrl_hummingboard_i2c1: hummingboard-i2c1 {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
@@ -104,6 +125,13 @@
 			>;
 		};
 
+		pinctrl_hummingboard_i2c2: hummingboard-i2c2 {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
+				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
+			>;
+		};
+
 		pinctrl_hummingboard_spdif: hummingboard-spdif {
 			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
 		};
diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index c2a24888a276..5b9e7bceedaa 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -55,6 +55,21 @@
 	};
 };
 
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cubox_i_hdmi>;
+	ddc-i2c-bus = <&i2c2>;
+	status = "okay";
+	crtcs = <&ipu1 0>;
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cubox_i_i2c2>;
+	status = "okay";
+};
+
 &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_cubox_i_i2c3>;
@@ -69,6 +84,19 @@
 
 &iomuxc {
 	cubox_i {
+		pinctrl_cubox_i_hdmi: cubox-i-hdmi {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_ROW2__HDMI_TX_CEC_LINE 0x1f8b0
+			>;
+		};
+
+		pinctrl_cubox_i_i2c2: cubox-i-i2c2 {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b8b1
+				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b8b1
+			>;
+		};
+
 		pinctrl_cubox_i_i2c3: cubox-i-i2c3 {
 			fsl,pins = <
 				MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b8b1
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
