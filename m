Return-Path: <SRS0=MMxF=TJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33379 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfEIP6u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 May 2019 11:58:50 -0400
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 10/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC I2S interface
Date: Thu,  9 May 2019 17:58:27 +0200
Message-Id: <20190509155834.22838-11-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support according the SMARC Spec 1.1 [1] and provided schematics.
Due to the lack of hardware the interface can't be tested right now.

[1] https://sget.org/standards/smarc

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index 19f97ab26e83..864e05b14b6f 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/fsl-imx-audmux.h>
 
 / {
 	reg_1p0v_s0: regulator-1p0v-s0 {
@@ -182,6 +183,52 @@
 	};
 };
 
+/* I2S0, I2S1 */
+&audmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_audmux>;
+
+	audmux_ssi1 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT1_SSI0>;
+		fsl,port-config = <
+			(IMX_AUDMUX_V2_PTCR_TFSEL(MX51_AUDMUX_PORT3) |
+			 IMX_AUDMUX_V2_PTCR_TCSEL(MX51_AUDMUX_PORT3) |
+			 IMX_AUDMUX_V2_PTCR_SYN    |
+			 IMX_AUDMUX_V2_PTCR_TFSDIR |
+			 IMX_AUDMUX_V2_PTCR_TCLKDIR)
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT3)
+		>;
+	};
+
+	audmux_adu3 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT3>;
+		fsl,port-config = <
+			IMX_AUDMUX_V2_PTCR_SYN
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT1_SSI0)
+		>;
+	};
+
+	audmux_ssi2 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT2_SSI1>;
+		fsl,port-config = <
+			(IMX_AUDMUX_V2_PTCR_TFSEL(MX51_AUDMUX_PORT4) |
+			 IMX_AUDMUX_V2_PTCR_TCSEL(MX51_AUDMUX_PORT4) |
+			 IMX_AUDMUX_V2_PTCR_SYN    |
+			 IMX_AUDMUX_V2_PTCR_TFSDIR |
+			 IMX_AUDMUX_V2_PTCR_TCLKDIR)
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT4)
+		>;
+	};
+
+	audmux_adu4 {
+		fsl,audmux-port = <MX51_AUDMUX_PORT4>;
+		fsl,port-config = <
+			IMX_AUDMUX_V2_PTCR_SYN
+			IMX_AUDMUX_V2_PDCR_RXDSEL(MX51_AUDMUX_PORT2_SSI1)
+		>;
+	};
+};
+
 /* CAN0 */
 &can1 {
 	pinctrl-names = "default";
@@ -325,6 +372,13 @@
 	};
 };
 
+/* I2C_GP */
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+};
+
 /* HDMI_CTRL */
 &i2c2 {
 	clock-frequency = <100000>;
@@ -343,6 +397,23 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_mgmt_gpios &pinctrl_gpio>;
 
+	pinctrl_audmux: audmuxgrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT4__AUD3_TXC		0x130b0
+			MX6QDL_PAD_CSI0_DAT5__AUD3_TXD		0x130b0
+			MX6QDL_PAD_CSI0_DAT6__AUD3_TXFS		0x130b0
+			MX6QDL_PAD_CSI0_DAT7__AUD3_RXD		0x130b0
+
+			MX6QDL_PAD_DISP0_DAT20__AUD4_TXC	0x130b0
+			MX6QDL_PAD_DISP0_DAT21__AUD4_TXD	0x130b0
+			MX6QDL_PAD_DISP0_DAT22__AUD4_TXFS	0x130b0
+			MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
+
+			/* AUDIO MCLK */
+			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2		0x000b0
+		>;
+	};
+
 	pinctrl_ecspi4: ecspi4grp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D21__ECSPI4_SCLK 0x100b1
@@ -430,6 +501,13 @@
 		>;
 	};
 
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL		0x4001b8b1
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA		0x4001b8b1
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b8b1
-- 
2.20.1
