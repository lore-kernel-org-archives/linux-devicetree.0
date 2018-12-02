From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 9/9] ARM: dts: imx7d-pico: Add the imx7d-pico-hobbit variant
Date: Sun,  2 Dec 2018 19:25:20 -0200
Message-ID: <20181202212520.16650-10-otavio@ossystems.com.br>
References: <20181202212520.16650-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202212520.16650-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

The imx7d-pico-hobbit contains a imx7d-pico SoM and a hobbit baseboard.

Add support for it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/Makefile              |   1 +
 arch/arm/boot/dts/imx7d-pico-hobbit.dts | 105 ++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-pico-hobbit.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b0e966d625b9..12a3cfb7d280 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -569,6 +569,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-nitrogen7.dtb \
+	imx7d-pico-hobbit.dtb \
 	imx7d-pico-pi.dtb \
 	imx7d-sbc-imx7.dtb \
 	imx7d-sdb.dtb \
diff --git a/arch/arm/boot/dts/imx7d-pico-hobbit.dts b/arch/arm/boot/dts/imx7d-pico-hobbit.dts
new file mode 100644
index 000000000000..7b2198a9372c
--- /dev/null
+++ b/arch/arm/boot/dts/imx7d-pico-hobbit.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+//
+// Copyright 2017 NXP
+
+#include "imx7d-pico.dtsi"
+
+/ {
+	model = "TechNexion PICO-IMX7D Board using Hobbit baseboard";
+	compatible = "technexion,imx7d-pico-hobbit", "fsl,imx7d";
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx7-sgtl5000";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&sgtl5000>;
+			clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_CLK>;
+		};
+	};
+};
+
+&i2c1 {
+	sgtl5000: codec@a {
+		#sound-dai-cells = <0>;
+		reg = <0x0a>;
+		compatible = "fsl,sgtl5000";
+		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_CLK>;
+		VDDA-supply = <&reg_2p5v>;
+		VDDIO-supply = <&reg_vref_1v8>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	adc081c: adc@50 {
+		compatible = "ti,adc081c";
+		reg = <0x50>;
+		vref-supply = <&reg_3p3v>;
+	};
+};
+
+&ecspi3 {
+	ads7846@0 {
+		reg = <0>;
+		compatible = "ti,ads7846";
+		interrupt-parent = <&gpio2>;
+		interrupts = <7 0>;
+		spi-max-frequency = <1000000>;
+		pendown-gpio = <&gpio2 7 0>;
+		vcc-supply = <&reg_3p3v>;
+		ti,x-min = /bits/ 16 <0>;
+		ti,x-max = /bits/ 16 <4095>;
+		ti,y-min = /bits/ 16 <0>;
+		ti,y-max = /bits/ 16 <4095>;
+		ti,pressure-max = /bits/ 16 <1024>;
+		ti,x-plate-ohms = /bits/ 16 <90>;
+		ti,y-plate-ohms = /bits/ 16 <90>;
+		ti,debounce-max = /bits/ 16 <70>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <2>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		wakeup-source;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA00__GPIO2_IO0		0x14
+			MX7D_PAD_EPDC_DATA01__GPIO2_IO1		0x14
+			MX7D_PAD_EPDC_DATA02__GPIO2_IO2		0x14
+			MX7D_PAD_EPDC_DATA03__GPIO2_IO3		0x14
+			MX7D_PAD_EPDC_DATA05__GPIO2_IO5		0x14
+			MX7D_PAD_EPDC_DATA12__GPIO2_IO12	0x14
+			MX7D_PAD_EPDC_DATA07__GPIO2_IO7		0x14
+		>;
+	};
+
+	pinctrl_gpio_leds: gpioledsgrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
+		>;
+	};
+};
-- 
2.19.2
