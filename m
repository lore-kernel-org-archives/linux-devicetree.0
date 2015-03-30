From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH] ARM: dts: hummingboard: add sgtl5000 support for Hummingboard
 Pro
Date: Mon, 30 Mar 2015 13:06:57 +0100
Message-ID: <E1YcYT3-0006rE-3F@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the DT description for the SGTL5000 found on the Hummingboard Pro
model.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
Now that a fix for the SGTL5000 power problems has been merged, this can
be queued for the next merge window.

 arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
index c0dc5948fa3c..8f86b7092d22 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
@@ -88,6 +88,19 @@
 		};
 	};
 
+	sound-sgtl5000 {
+		audio-codec = <&sgtl5000>;
+		audio-routing =
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+		compatible = "fsl,imx-audio-sgtl5000";
+		model = "On-board Codec";
+		mux-ext-port = <5>;
+		mux-int-port = <1>;
+		ssi-controller = <&ssi1>;
+	};
+
 	sound-spdif {
 		compatible = "fsl,imx-audio-spdif";
 		model = "On-board SPDIF";
@@ -97,6 +110,10 @@
 	};
 };
 
+&audmux {
+	status = "okay";
+};
+
 &can1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard_flexcan1>;
@@ -120,6 +137,17 @@
 		compatible = "nxp,pcf8523";
 		reg = <0x68>;
 	};
+
+	/* Pro baseboard model */
+	sgtl5000: sgtl5000@0a {
+		clocks = <&clks 201>;
+		compatible = "fsl,sgtl5000";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hummingboard_sgtl5000>;
+		reg = <0x0a>;
+		VDDA-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_3p3v>;
+	};
 };
 
 &i2c2 {
@@ -168,6 +196,16 @@
 			fsl,pins = <MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b1>;
 		};
 
+		pinctrl_hummingboard_sgtl5000: hummingboard-sgtl5000 {
+			fsl,pins = <
+				MX6QDL_PAD_DISP0_DAT19__AUD5_RXD 0x130b0
+				MX6QDL_PAD_KEY_COL0__AUD5_TXC 0x130b0
+				MX6QDL_PAD_KEY_ROW0__AUD5_TXD 0x110b0
+				MX6QDL_PAD_KEY_COL1__AUD5_TXFS 0x130b0
+				MX6QDL_PAD_GPIO_5__CCM_CLKO1 0x130b0
+			>;
+		};
+
 		pinctrl_hummingboard_spdif: hummingboard-spdif {
 			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
 		};
@@ -232,6 +270,11 @@
 	status = "okay";
 };
 
+&ssi1 {
+	fsl,mode = "i2s-slave";
+	status = "okay";
+};
+
 &usbh1 {
 	disable-over-current;
 	vbus-supply = <&reg_usbh1_vbus>;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
