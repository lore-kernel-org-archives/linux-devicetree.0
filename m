From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 2/2] ARM: dts: imx53-smd: Add OV5642 video capture support
Date: Sat, 19 Jan 2019 13:18:15 -0800
Message-ID: <20190119211815.25101-3-slongerbeam@gmail.com>
References: <20190119211815.25101-1-slongerbeam@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119211815.25101-1-slongerbeam@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add video capture support from the OV5642 to IPU CSI0 on
the i.MX53 SMD.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 arch/arm/boot/dts/imx53-smd.dts | 75 +++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-smd.dts b/arch/arm/boot/dts/imx53-smd.dts
index 09071ca11c6c..2d6fc07629e6 100644
--- a/arch/arm/boot/dts/imx53-smd.dts
+++ b/arch/arm/boot/dts/imx53-smd.dts
@@ -185,6 +185,31 @@
 			>;
 		};
 
+		pinctrl_ipu_csi0: ipucsi0grp {
+			fsl,pins = <
+				MX53_PAD_CSI0_DAT12__IPU_CSI0_D_12    0x1c4
+				MX53_PAD_CSI0_DAT13__IPU_CSI0_D_13    0x1c4
+				MX53_PAD_CSI0_DAT14__IPU_CSI0_D_14    0x1c4
+				MX53_PAD_CSI0_DAT15__IPU_CSI0_D_15    0x1c4
+				MX53_PAD_CSI0_DAT16__IPU_CSI0_D_16    0x1c4
+				MX53_PAD_CSI0_DAT17__IPU_CSI0_D_17    0x1c4
+				MX53_PAD_CSI0_DAT18__IPU_CSI0_D_18    0x1c4
+				MX53_PAD_CSI0_DAT19__IPU_CSI0_D_19    0x1c4
+				MX53_PAD_CSI0_PIXCLK__IPU_CSI0_PIXCLK 0x1e4
+				MX53_PAD_CSI0_VSYNC__IPU_CSI0_VSYNC   0x1e4
+				MX53_PAD_CSI0_MCLK__IPU_CSI0_HSYNC    0x1e4
+				MX53_PAD_CSI0_DATA_EN__IPU_CSI0_DATA_EN 0x1e4
+			>;
+		};
+
+		pinctrl_ov5642: ov5642grp {
+			fsl,pins = <
+				MX53_PAD_NANDF_WP_B__GPIO6_9   0x1e4
+				MX53_PAD_NANDF_RB0__GPIO6_10   0x1e4
+				MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK 0x1c4
+			>;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins = <
 				MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
@@ -256,11 +281,49 @@
 	camera: ov5642@3c {
 		compatible = "ovti,ov5642";
 		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5642>;
+		assigned-clocks = <&clks IMX5_CLK_SSI_EXT1_SEL>,
+				  <&clks IMX5_CLK_SSI_EXT1_COM_SEL>;
+		assigned-clock-parents = <&clks IMX5_CLK_PLL2_SW>,
+					 <&clks IMX5_CLK_SSI_EXT1_PODF>;
+		assigned-clock-rates = <0>, <24000000>;
+		clocks = <&clks IMX5_CLK_SSI_EXT1_GATE>;
+		clock-names = "xclk";
+		DVDD-supply = <&ldo9_reg>;
+		AVDD-supply = <&ldo7_reg>;
+		reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&gpio6 10 GPIO_ACTIVE_HIGH>;
+
+		port {
+			ov5642_to_ipu_csi0: endpoint {
+				remote-endpoint = <&ipu_csi0_from_parallel_sensor>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+			};
+		};
 	};
 
 	pmic: dialog@48 {
 		compatible = "dlg,da9053", "dlg,da9052";
 		reg = <0x48>;
+		interrupt-parent = <&gpio7>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPIO7_11 */
+
+		regulators {
+			ldo7_reg: ldo7 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-always-on;
+			};
+
+			ldo9_reg: ldo9 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3650000>;
+				regulator-always-on;
+			};
+		};
 	};
 };
 
@@ -271,3 +334,15 @@
 	phy-reset-gpios = <&gpio7 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
+
+&ipu_csi0_from_parallel_sensor {
+	remote-endpoint = <&ov5642_to_ipu_csi0>;
+	data-shift = <12>; /* Lines 19:12 used */
+	hsync-active = <1>;
+	vsync-active = <1>;
+};
+
+&ipu_csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ipu_csi0>;
+};
-- 
2.17.1
