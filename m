From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] ARM: dts: imx6ul-pico: Add support for the nymph baseboard
Date: Tue,  9 Apr 2019 22:00:13 -0300
Message-ID: <20190410010013.17259-2-otavio@ossystems.com.br>
References: <20190410010013.17259-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410010013.17259-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Add support for the imx6ul pico board with nymph baseboard combination.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/Makefile              |  1 +
 arch/arm/boot/dts/imx6ul-pico-nymph.dts | 77 +++++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-pico-nymph.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e4a2349e130e..7b9b3d384902 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -568,6 +568,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-opos6uldev.dtb \
 	imx6ul-pico-dwarf.dtb \
 	imx6ul-pico-hobbit.dtb \
+	imx6ul-pico-nymph.dtb \
 	imx6ul-pico-pi.dtb \
 	imx6ul-phytec-phyboard-segin-full.dtb \
 	imx6ul-tx6ul-0010.dtb \
diff --git a/arch/arm/boot/dts/imx6ul-pico-nymph.dts b/arch/arm/boot/dts/imx6ul-pico-nymph.dts
new file mode 100644
index 000000000000..cb5ec45341bc
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ul-pico-nymph.dts
@@ -0,0 +1,77 @@
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
+	model = "TechNexion PICO-IMX6UL and NYMPH baseboard";
+	compatible = "technexion,imx6ul-pico-nymph", "fsl,imx6ul";
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
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
+
+	adc081c: adc@52 {
+		compatible = "ti,adc081c";
+		reg = <0x52>;
+		vref-supply = <&reg_2p5v>;
+	};
+
+	ds1337: rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_UART4_RX_DATA__GPIO1_IO29	0x10b0
+		>;
+	};
+};
-- 
2.21.0
