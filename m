From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 8/9] ARM: dts: imx7d-pico-pi: Extend peripherals support
Date: Thu,  6 Dec 2018 08:09:04 -0200
Message-ID: <20181206100905.15053-9-otavio@ossystems.com.br>
References: <20181206100905.15053-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206100905.15053-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

This adds following peripherals for the imx7d-pico-pi as:

 - LED
 - Touchscreen
 - GPIO

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 arch/arm/boot/dts/imx7d-pico-pi.dts | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-pico-pi.dts b/arch/arm/boot/dts/imx7d-pico-pi.dts
index 039c17066fe0..70bea95c06d8 100644
--- a/arch/arm/boot/dts/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/imx7d-pico-pi.dts
@@ -8,6 +8,17 @@
 	model = "TechNexion PICO-IMX7D Board and PI baseboard";
 	compatible = "technexion,imx7d-pico-pi", "fsl,imx7d";
 
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
+
+		led {
+			label = "gpio-led";
+			gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx7-sgtl5000";
@@ -35,3 +46,48 @@
 		VDDIO-supply = <&reg_vref_1v8>;
 	};
 };
+
+&i2c4 {
+	polytouch: touchscreen@38 {
+		compatible = "edt,edt-ft5x06";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
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
+			MX7D_PAD_EPDC_DATA06__GPIO2_IO6		0x14
+		>;
+	};
+
+	pinctrl_touchscreen: touchscreengrp {
+		fsl,pins = <
+			MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
+			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
+		>;
+	};
+
+};
-- 
2.19.2
