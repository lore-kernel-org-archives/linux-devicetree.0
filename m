From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/5] ARM: dts: imx6ul-pico: Add the imx6ul-pico-pi variant
Date: Sun,  2 Dec 2018 19:18:09 -0200
Message-ID: <20181202211809.11621-6-otavio@ossystems.com.br>
References: <20181202211809.11621-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202211809.11621-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

The imx6ul-pico-pi contains a imx6ul-pico SoM and a pi baseboard:
https://www.technexion.com/products/pico-baseboards/detail/PICO-PI

Add support for it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/Makefile           |  1 +
 arch/arm/boot/dts/imx6ul-pico-pi.dts | 97 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6ul-pico.dtsi   | 32 ---------
 3 files changed, 98 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ul-pico-pi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 12a3cfb7d280..f26591295497 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -557,6 +557,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-liteboard.dtb \
 	imx6ul-opos6uldev.dtb \
 	imx6ul-pico-hobbit.dtb \
+	imx6ul-pico-pi.dtb \
 	imx6ul-tx6ul-0010.dtb \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-pico-pi.dts b/arch/arm/boot/dts/imx6ul-pico-pi.dts
new file mode 100644
index 000000000000..de07357b27fc
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-pico-pi.dts
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright 2015 Technexion Ltd.
+//
+// Author: Wig Cheng  <wig.cheng@technexion.com>
+//	   Richard Hu <richard.hu@technexion.com>
+//	   Tapani Utriainen <tapani@technexion.com>
+/dts-v1/;
+
+#include "imx6ul-pico.dtsi"
+/ {
+	model = "TechNexion PICO-IMX6UL and PI baseboard";
+	compatible = "technexion,imx6ul-pico-pi", "fsl,imx6ul";
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "fsl,imx-audio-sgtl5000";
+		model = "imx6ul-sgtl5000";
+		audio-cpu = <&sai1>;
+		audio-codec = <&sgtl5000>;
+		audio-routing =
+			"LINE_IN", "Line In Jack",
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+	};
+
+	sys_mclk: clock-sys-mclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+};
+
+&i2c2 {
+	clock_frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	sgtl5000: codec@a {
+		reg = <0x0a>;
+		compatible = "fsl,sgtl5000";
+		clocks = <&sys_mclk>;
+		VDDA-supply = <&reg_2p5v>;
+		VDDIO-supply = <&reg_3p3v>;
+	};
+};
+
+&i2c3 {
+	clock_frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	polytouch: touchscreen@38 {
+		compatible = "edt,edt-ft5x06";
+		reg = <0x38>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_VSYNC__GPIO4_IO19		0x10b0
+			MX6UL_PAD_CSI_DATA00__GPIO4_IO21	0x10b0
+			MX6UL_PAD_CSI_DATA01__GPIO4_IO22	0x10b0
+			MX6UL_PAD_CSI_DATA02__GPIO4_IO23	0x10b0
+			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x10b0
+			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x10b0
+		>;
+	};
+
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_CSI_HSYNC__GPIO4_IO20		0x10b0
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6ul-pico.dtsi b/arch/arm/boot/dts/imx6ul-pico.dtsi
index 89269955440b..de9f83189ba8 100644
--- a/arch/arm/boot/dts/imx6ul-pico.dtsi
+++ b/arch/arm/boot/dts/imx6ul-pico.dtsi
@@ -72,24 +72,6 @@
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <200000>;
 	};
-
-	sound {
-		compatible = "fsl,imx-audio-sgtl5000";
-		model = "imx6ul-sgtl5000";
-		audio-cpu = <&sai1>;
-		audio-codec = <&codec>;
-		audio-routing =
-			"LINE_IN", "Line In Jack",
-			"MIC_IN", "Mic Jack",
-			"Mic Jack", "Mic Bias",
-			"Headphone Jack", "HP_OUT";
-	};
-
-	sys_mclk: clock-sys-mclk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24576000>;
-	};
 };
 
 &can1 {
@@ -169,20 +151,6 @@
 	};
 };
 
-&i2c2 {
-	clock_frequency = <100000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c2>;
-	status = "okay";
-};
-
-&i2c3 {
-	clock_frequency = <100000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c3>;
-	status = "okay";
-};
-
 &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif_dat &pinctrl_lcdif_ctrl>;
-- 
2.19.2
