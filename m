From: <christopher.spinrath@rwth-aachen.de>
Subject: [PATCH v2] ARM: dts: imx6q-cm-fx6: add analog audio support
Date: Wed, 8 Feb 2017 21:44:04 +0100
Message-ID: <c53afd927fae4a1dbd84ab8122e6c794@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christopher.spinrath@rwth-aachen.de, linux@armlinux.org.uk, robh+dt@kernel.org, grinberg@compulab.co.il, Valentin Raevsky <valentin@compulab.co.il>, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Valentin Raevsky <valentin@compulab.co.il>

The cm-fx6 module has an onboard Wolfson wm8731 codec which is muxed
to the ssi2 controller. Unlike most (all?) supported i.MX6 board/codec
combinations the wm8731 is operated in slave mode and the clock setup
is static.

Add support for it.

Signed-off-by: Valentin Raevsky <valentin@compulab.co.il>
[christopher.spinrath@rwth-aachen.de: enhanced commit message, ported
  to upstream and some cleanup]
Signed-off-by: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
---

Notes:
    Changes since v1:
     - rename audmux child node pins5 --> audmux4
       (the new node name corresponds to the port configured by the node)

 arch/arm/boot/dts/imx6q-cm-fx6.dts | 83 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index d8a5789..66cac53 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -43,6 +43,7 @@
 
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/fsl-imx-audmux.h>
 #include "imx6q.dtsi"
 
 / {
@@ -90,6 +91,34 @@
 		enable-active-high;
 	};
 
+	sound-analog {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "On-board analog audio";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Out",
+			"Microphone", "Mic Jack",
+			"Line", "Line In";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,bitclock-inversion;
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&ssi2>;
+			system-clock-frequency = <2822400>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8731>;
+		};
+	};
+
 	sound-spdif {
 		compatible = "fsl,imx-audio-spdif";
 		model = "imx-spdif";
@@ -99,6 +128,36 @@
 	};
 };
 
+&audmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_audmux>;
+	status = "okay";
+
+	ssi2 {
+		fsl,audmux-port = <1>;
+		fsl,port-config = <
+			(IMX_AUDMUX_V2_PTCR_RCLKDIR |
+			IMX_AUDMUX_V2_PTCR_RCSEL(3 | 0x8) |
+			IMX_AUDMUX_V2_PTCR_TCLKDIR |
+			IMX_AUDMUX_V2_PTCR_TCSEL(3))
+			IMX_AUDMUX_V2_PDCR_RXDSEL(3)
+		>;
+	};
+
+	audmux4 {
+		fsl,audmux-port = <3>;
+		fsl,port-config = <
+			(IMX_AUDMUX_V2_PTCR_TFSDIR |
+			IMX_AUDMUX_V2_PTCR_TFSEL(1) |
+			IMX_AUDMUX_V2_PTCR_RCLKDIR |
+			IMX_AUDMUX_V2_PTCR_RCSEL(1 | 0x8) |
+			IMX_AUDMUX_V2_PTCR_TCLKDIR |
+			IMX_AUDMUX_V2_PTCR_TCSEL(1))
+			IMX_AUDMUX_V2_PDCR_RXDSEL(1)
+		>;
+	};
+};
+
 &cpu0 {
 	/*
 	 * Although the imx6q fuse indicates that 1.2GHz operation is possible,
@@ -160,9 +219,25 @@
 		reg = <0x50>;
 		pagesize = <16>;
 	};
+
+	wm8731: codec@1a {
+		#sound-dai-cells = <0>;
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+	};
 };
 
 &iomuxc {
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_SD2_CMD__AUD4_RXC   0x17059
+			MX6QDL_PAD_SD2_DAT0__AUD4_RXD  0x17059
+			MX6QDL_PAD_SD2_DAT3__AUD4_TXC  0x17059
+			MX6QDL_PAD_SD2_DAT2__AUD4_TXD  0x17059
+			MX6QDL_PAD_SD2_DAT1__AUD4_TXFS 0x17059
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK	0x100b1
@@ -279,6 +354,14 @@
 	status = "okay";
 };
 
+&ssi2 {
+	assigned-clocks = <&clks IMX6QDL_CLK_SSI2_SEL>,
+			<&clks IMX6QDL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <786432000>;
+	status = "okay";
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
-- 
2.10.2
