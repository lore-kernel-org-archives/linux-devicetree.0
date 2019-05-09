Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 16/17] ARCH: arm: dts: imx6q-kontron-samx6i: add Kontron SMARC Quad/Dual SoM
Date: Thu,  9 May 2019 17:58:33 +0200
Message-Id: <20190509155834.22838-17-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add dtsi for iMX6 Quad/Dual based SMARC SoM's from Kontron.

The differences between the quad/dual and the dual-lite/solo are:
 * quad/dual has a 2nd IPU
 * quad/dual has three chip selects for SMARC SPI0 interface
 * quad/dual has a pcie_wake# signal

Only the 3th spi-cs signal is added by this commit.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi

diff --git a/arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi
new file mode 100644
index 000000000000..2618eccfe50d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-kontron-samx6i.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include "imx6q.dtsi"
+#include "imx6qdl-kontron-samx6i.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Kontron SMARC sAMX6i Quad/Dual";
+	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
+};
+
+/* Quad/Dual SoMs have 3 chip-select signals */
+&ecspi4 {
+	fsl,spi-num-chipselects = <3>;
+	cs-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>,
+		   <&gpio3 29 GPIO_ACTIVE_HIGH>,
+		   <&gpio3 25 GPIO_ACTIVE_HIGH>;
+};
+
+&pinctrl_ecspi4 {
+	fsl,pins = <
+		MX6QDL_PAD_EIM_D21__ECSPI4_SCLK 0x100b1
+		MX6QDL_PAD_EIM_D28__ECSPI4_MOSI 0x100b1
+		MX6QDL_PAD_EIM_D22__ECSPI4_MISO 0x100b1
+
+		/* SPI4_IMX_CS2# - connected to internal flash */
+		MX6QDL_PAD_EIM_D24__GPIO3_IO24 0x1b0b0
+		/* SPI4_IMX_CS0# - connected to SMARC SPI0_CS0# */
+		MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x1b0b0
+		/* SPI4_CS3# - connected to  SMARC SPI0_CS1# */
+		MX6QDL_PAD_EIM_D25__GPIO3_IO25 0x1b0b0
+	>;
+};
-- 
2.20.1
