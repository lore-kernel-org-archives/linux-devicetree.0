Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 09/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC CSI Camera interface
Date: Thu,  9 May 2019 17:58:26 +0200
Message-Id: <20190509155834.22838-10-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support according the SMARC Spec 1.1 [1] and provided schematics.

As specified in [1] the data lanes are shared to cover the csi and the
parallel case. The case depends on the baseboard so we hide muxing the
data lanes. The csi data lanes are not muxable at all.

[1] https://sget.org/standards/smarc

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index e0372687d8f4..19f97ab26e83 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -168,6 +168,18 @@
 		#size-cells = <0>;
 		status = "disabld";
 	};
+
+	i2c_cam: i2c-gpio-cam {
+		compatible = "i2c-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c_gpio_cam>;
+		sda-gpios = <&gpio4 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio1 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>; /* ~100 kHz */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabld";
+	};
 };
 
 /* CAN0 */
@@ -397,6 +409,13 @@
 		>;
 	};
 
+	pinctrl_i2c_gpio_cam: i2c-gpiocamgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_6__GPIO1_IO06	0x1b0b0 /* SCL */
+			MX6QDL_PAD_KEY_COL2__GPIO4_IO10	0x1b0b0 /* SDA */
+		>;
+	};
+
 	pinctrl_i2c_gpio_intern: i2c-gpiointerngrp {
 		fsl,pins = <
 			MX6QDL_PAD_ENET_TXD0__GPIO1_IO30  0x1b0b0 /* SCL */
@@ -471,6 +490,12 @@
 		>;
 	};
 
+	pinctrl_mipi_csi: mipi-csigrp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_MCLK__CCM_CLKO1	0x000b0	/* CSI0/1 MCLK */
+		>;
+	};
+
 	pinctrl_mgmt_gpios: mgmt-gpiosgrp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_WAIT__GPIO5_IO00		0x1b0b0	/* LID#           */
@@ -571,6 +596,11 @@
 	};
 };
 
+&mipi_csi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mipi_csi>;
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-- 
2.20.1
