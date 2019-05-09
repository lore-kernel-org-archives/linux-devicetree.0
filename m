Return-Path: <SRS0=z2TU=TJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 17/17] ARCH: arm: dts: imx6dl-kontron-samx6i: add Kontron SMARC Dual-Lite/Solo SoM
Date: Thu,  9 May 2019 17:58:34 +0200
Message-Id: <20190509155834.22838-18-m.felsch@pengutronix.de>
In-Reply-To: <20190509155834.22838-1-m.felsch@pengutronix.de>
References: <20190509155834.22838-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: Stefan.Nickl@kontron.com, Gilles.Buloz@kontron.com, Michael.Brunner@kontron.com, thomas.schaefer@kontron.com, frieder.schrempf@kontron.de, kernel@pengutronix.de, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add dtsi for iMX6 Dual-Lite/Solo based SMARC SoM's from Kontron.

The differences between the quad/dual and the dual-lite/solo are:
* dual-lite/solo has no 2nd IPU and maps those signals as GPIOs
* dual-lite/solo has only two chip select signals for the SMARC SPI0
  interface
* dual-lite/solo has no pcie_wake# signal

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi

diff --git a/arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi
new file mode 100644
index 000000000000..a864fdbd5f16
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-kontron-samx6i.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-kontron-samx6i.dtsi"
+
+/ {
+	model = "Kontron SMARC sAMX6i Dual-Lite/Solo";
+	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
+};
-- 
2.20.1
