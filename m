Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 07/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC GPIO interface
Date: Thu,  9 May 2019 17:58:24 +0200
Message-Id: <20190509155834.22838-8-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support according the SMARC Spec 1.1 [1] and provided schematics.
Due to the lack of hardware the interface can't be tested right now.

[1] https://sget.org/standards/smarc

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index 7a32767c35f1..9b8a1d99d967 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -322,7 +322,7 @@
 
 &iomuxc {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_mgmt_gpios>;
+	pinctrl-0 = <&pinctrl_mgmt_gpios &pinctrl_gpio>;
 
 	pinctrl_ecspi4: ecspi4grp {
 		fsl,pins = <
@@ -351,6 +351,23 @@
 		>;
 	};
 
+	pinctrl_gpio: gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA0__GPIO3_IO00	0x1b0b0	/* GPIO0 / CAM0_PWR# */
+			MX6QDL_PAD_EIM_DA1__GPIO3_IO01	0x1b0b0 /* GPIO1 / CAM1_PWR# */
+			MX6QDL_PAD_EIM_DA2__GPIO3_IO02	0x1b0b0 /* GPIO2 / CAM0_RST# */
+			MX6QDL_PAD_EIM_DA3__GPIO3_IO03	0x1b0b0 /* GPIO3 / CAM1_RST# */
+			MX6QDL_PAD_EIM_DA4__GPIO3_IO04	0x1b0b0 /* GPIO4 / HDA_RST#  */
+			MX6QDL_PAD_EIM_DA5__GPIO3_IO05	0x1b0b0 /* GPIO5 / PWM_OUT   */
+			MX6QDL_PAD_EIM_DA6__GPIO3_IO06	0x1b0b0 /* GPIO6 / TACHIN    */
+			MX6QDL_PAD_EIM_DA7__GPIO3_IO07	0x1b0b0 /* GPIO7 / PCAM_FLD  */
+			MX6QDL_PAD_EIM_DA8__GPIO3_IO08	0x1b0b0 /* GPIO8 / CAN0_ERR# */
+			MX6QDL_PAD_EIM_DA9__GPIO3_IO09	0x1b0b0 /* GPIO9 / CAN1_ERR# */
+			MX6QDL_PAD_EIM_DA10__GPIO3_IO10	0x1b0b0 /* GPIO10            */
+			MX6QDL_PAD_EIM_DA11__GPIO3_IO11	0x1b0b0 /* GPIO11            */
+		>;
+	};
+
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
 			MX6QDL_PAD_RGMII_TXC__RGMII_TXC       0x1b0b0
-- 
2.20.1
