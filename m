From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/11] ARM: dts: imx6-sabreauto: add the ADV7180 video decoder
Date: Mon, 12 Jun 2017 11:24:04 -0700
Message-ID: <1497291844-14632-12-git-send-email-steve_longerbeam@mentor.com>
References: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497291844-14632-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enables the ADV7180 decoder sensor. The ADV7180 connects to the
parallel-bus mux input on ipu1_csi0_mux.

The ADV7180 power pin is via max7310_b port expander.

Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

- Use IRQ_TYPE_LEVEL_LOW instead of 0x8 for interrupt type for clarity.
- For 8-bit parallel IPU1-CSI0 bus connection only data[12-19] are used.

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index 1212f82..6a7594e 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -124,6 +124,21 @@
 			#size-cells = <0>;
 			reg = <1>;
 
+			adv7180: camera@21 {
+				compatible = "adi,adv7180";
+				reg = <0x21>;
+				powerdown-gpios = <&max7310_b 2 GPIO_ACTIVE_LOW>;
+				interrupt-parent = <&gpio1>;
+				interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+				port {
+					adv7180_to_ipu1_csi0_mux: endpoint {
+						remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+						bus-width = <8>;
+					};
+				};
+			};
+
 			max7310_a: gpio@30 {
 				compatible = "maxim,max7310";
 				reg = <0x30>;
@@ -151,6 +166,20 @@
 	};
 };
 
+&ipu1_csi0_from_ipu1_csi0_mux {
+	bus-width = <8>;
+};
+
+&ipu1_csi0_mux_from_parallel_sensor {
+	remote-endpoint = <&adv7180_to_ipu1_csi0_mux>;
+	bus-width = <8>;
+};
+
+&ipu1_csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu1_csi0>;
+};
+
 &clks {
 	assigned-clocks = <&clks IMX6QDL_PLL4_BYPASS_SRC>,
 			  <&clks IMX6QDL_PLL4_BYPASS>,
@@ -444,6 +473,22 @@
 			>;
 		};
 
+		pinctrl_ipu1_csi0: ipu1csi0grp {
+			fsl,pins = <
+				MX6QDL_PAD_CSI0_DAT12__IPU1_CSI0_DATA12  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT13__IPU1_CSI0_DATA13  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT14__IPU1_CSI0_DATA14  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT15__IPU1_CSI0_DATA15  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT16__IPU1_CSI0_DATA16  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT17__IPU1_CSI0_DATA17  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT18__IPU1_CSI0_DATA18  0x1b0b0
+				MX6QDL_PAD_CSI0_DAT19__IPU1_CSI0_DATA19  0x1b0b0
+				MX6QDL_PAD_CSI0_PIXCLK__IPU1_CSI0_PIXCLK 0x1b0b0
+				MX6QDL_PAD_CSI0_MCLK__IPU1_CSI0_HSYNC    0x1b0b0
+				MX6QDL_PAD_CSI0_VSYNC__IPU1_CSI0_VSYNC   0x1b0b0
+			>;
+		};
+
 		pinctrl_max7310: max7310grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD2_DAT0__GPIO1_IO15 0x1b0b0
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
