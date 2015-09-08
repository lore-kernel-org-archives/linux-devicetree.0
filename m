From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 2/9] ARM: dts: imx6qdl-nitrogen6x: add wifi wl1271 support
Date: Tue,  8 Sep 2015 16:34:39 +0200
Message-ID: <1441722886-22798-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441722886-22798-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441722886-22798-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 55 +++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index 24b667d..7a455f7 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -65,6 +65,19 @@
 			pinctrl-0 = <&pinctrl_can_xcvr>;
 			gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
 		};
+
+		reg_wlan_vmmc: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_wlan_vmmc>;
+			regulator-name = "reg_wlan_vmmc";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio6 15 GPIO_ACTIVE_HIGH>;
+			startup-delay-us = <70000>;
+			enable-active-high;
+		};
 	};
 
 	gpio-keys {
@@ -481,6 +494,18 @@
 			>;
 		};
 
+		pinctrl_usdhc2: usdhc2grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD2_CMD__SD2_CMD		0x17071
+				MX6QDL_PAD_SD2_CLK__SD2_CLK		0x10071
+				MX6QDL_PAD_SD2_DAT0__SD2_DATA0		0x17071
+				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17071
+				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17071
+				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17071
+				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x000b0
+			>;
+		};
+
 		pinctrl_usdhc3: usdhc3grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD3_CMD__SD3_CMD		0x17059
@@ -504,6 +529,15 @@
 				MX6QDL_PAD_NANDF_D6__GPIO2_IO06 0x1b0b0	/* CD */
 			>;
 		};
+
+		pinctrl_wlan_vmmc: wlan_vmmcgrp {
+			fsl,pins = <
+				MX6QDL_PAD_NANDF_CS0__GPIO6_IO11	0x100b0
+				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x000b0
+				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x000b0
+				MX6QDL_PAD_SD1_CLK__OSC32K_32K_OUT	0x000b0
+			>;
+		};
 	};
 };
 
@@ -579,6 +613,27 @@
 	status = "okay";
 };
 
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <4>;
+	non-removable;
+	vmmc-supply = <&reg_wlan_vmmc>;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1271";
+		reg = <2>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
+		ref-clock-frequency = <38400000>;
+	};
+};
+
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
