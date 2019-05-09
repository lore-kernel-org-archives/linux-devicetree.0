Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 03/17] ARCH: arm: dts: imx6qdl-kontron-samx6i: add SMARC SPI0 interface
Date: Thu,  9 May 2019 17:58:20 +0200
Message-Id: <20190509155834.22838-4-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org, Michael Grzeschik <m.grzeschik@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

From: Michael Grzeschik <m.grzeschik@pengutronix.de>

Add support according the SMARC Spec 1.1 [1] and provided schematics.
Due to the lack of hardware the interface can't be tested right now.

[1] https://sget.org/standards/smarc

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
index e546d46365f5..a92f6e31fd71 100644
--- a/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-kontron-samx6i.dtsi
@@ -113,6 +113,14 @@
 	pinctrl-0 = <&pinctrl_flexcan2>;
 };
 
+/* SPI0 */
+&ecspi4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi4>;
+	cs-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>,
+		   <&gpio3 29 GPIO_ACTIVE_HIGH>;
+};
+
 /* GBE */
 &fec {
 	pinctrl-names = "default";
@@ -244,6 +252,19 @@
 };
 
 &iomuxc {
+	pinctrl_ecspi4: ecspi4grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__ECSPI4_SCLK 0x100b1
+			MX6QDL_PAD_EIM_D28__ECSPI4_MOSI 0x100b1
+			MX6QDL_PAD_EIM_D22__ECSPI4_MISO 0x100b1
+
+			/* SPI_IMX_CS2# - connected to internal flash */
+			MX6QDL_PAD_EIM_D24__GPIO3_IO24 0x1b0b0
+			/* SPI_IMX_CS0# - connected to SMARC SPI0_CS0# */
+			MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x1b0b0
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX 0x1b0b0
-- 
2.20.1
