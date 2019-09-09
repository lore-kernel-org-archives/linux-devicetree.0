Return-Path: <SRS0=zDWJ=XE=cyberdimension.org=GNUtoo@kernel.org>
From: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Subject: [PATCH 2/2] ARM: dts: imx6sll: Add the Kobo Aura H2O Edition 2
Date: Mon,  9 Sep 2019 19:59:27 +0200
Message-Id: <20190909175927.4980-1-GNUtoo@cyberdimension.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
List-ID: <devicetree@vger.kernel.org>

This work is based on the devicetree that can be found
in the source code published by the device vendor[1],
and on testing on the hardware as not all the parts
described in the vendor's imx6sll-e60qm2.dts are populated
on the PCB.

[1]: https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-aurah2o2-aura/kernel.tar.bz2

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
---
 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/imx6sll-aura-h2o-2.dts | 258 +++++++++++++++++++++++
 2 files changed, 259 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6sll-aura-h2o-2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9159fa2cea90..67a568a66e49 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -551,6 +551,7 @@ dtb-$(CONFIG_SOC_IMX6SL) += \
 	imx6sl-evk.dtb \
 	imx6sl-warp.dtb
 dtb-$(CONFIG_SOC_IMX6SLL) += \
+	imx6sll-aura-h2o-2 \
 	imx6sll-evk.dtb
 dtb-$(CONFIG_SOC_IMX6SX) += \
 	imx6sx-nitrogen6sx.dtb \
diff --git a/arch/arm/boot/dts/imx6sll-aura-h2o-2.dts b/arch/arm/boot/dts/imx6sll-aura-h2o-2.dts
new file mode 100644
index 000000000000..5989866bb043
--- /dev/null
+++ b/arch/arm/boot/dts/imx6sll-aura-h2o-2.dts
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright (C) 2019 Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "imx6sll.dtsi"
+
+/ {
+	model = "Kobo Aura H2O Edition 2";
+	compatible = "kobo,aura-h2o-2", "fsl,imx6sll";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_led>;
+
+		user {
+			label = "GLED";
+			gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+	};
+};
+
+&cpu0 {
+	arm-supply = <&reg_dcdc3>;
+	soc-supply = <&reg_dcdc1>;
+};
+
+&gpc {
+	fsl,ldo-bypass = <1>;
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	ricoh_rc5t619@32 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ricoh_rc5t619>;
+		compatible = "ricoh,rc5t619";
+		reg = <0x32>;
+		system-power-controller;
+
+		regulators {
+			reg_dcdc1: DCDC1 {
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			DCDC2 {
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			reg_dcdc3: DCDC3 {
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1875000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1140000>;
+				};
+			};
+
+			DCDC4 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1140000>;
+				};
+			};
+
+			DCDC5 {
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1700000>;
+				};
+			};
+
+			LDO1 {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO2 {
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			LDO3 {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				regulator-boot-on;
+			};
+
+			LDO5 {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO6 {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO7 {
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO8 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO9 {
+				regulator-boot-on;
+			};
+
+			LDO10 {
+				regulator-boot-on;
+			};
+
+			LDORTC1 {
+				regulator-boot-on;
+			};
+
+			LDORTC2 {
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6SLL_PAD_REF_CLK_24M__I2C3_SCL	0x4001f8b1
+			MX6SLL_PAD_REF_CLK_32K__I2C3_SDA	0x4001f8b1
+		>;
+	};
+
+	pinctrl_led: ledgrp {
+		fsl,pins = <
+			MX6SLL_PAD_GPIO4_IO22__GPIO4_IO22	0x17059
+		>;
+	};
+
+	pinctrl_ricoh_rc5t619: ricoh_rc5t619_grp {
+		fsl,pins = <
+			 /* chg */
+			MX6SLL_PAD_GPIO4_IO20__GPIO4_IO20	0x1b8b1
+			/* irq */
+			MX6SLL_PAD_GPIO4_IO19__GPIO4_IO19	0x1b8b1
+			/* bat_low_int */
+			MX6SLL_PAD_KEY_COL2__GPIO3_IO28	0x1b8b1
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6SLL_PAD_UART1_TXD__UART1_DCE_TX	0x1b0b1
+			MX6SLL_PAD_UART1_RXD__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6SLL_PAD_SD1_CMD__SD1_CMD		0x17059
+			MX6SLL_PAD_SD1_CLK__SD1_CLK		0x17059
+			MX6SLL_PAD_SD1_DATA0__SD1_DATA0	0x17059
+			MX6SLL_PAD_SD1_DATA1__SD1_DATA1	0x17059
+			MX6SLL_PAD_SD1_DATA2__SD1_DATA2	0x17059
+			MX6SLL_PAD_SD1_DATA3__SD1_DATA3	0x17059
+			MX6SLL_PAD_SD1_DATA4__SD1_DATA4	0x17059
+			MX6SLL_PAD_SD1_DATA5__SD1_DATA5	0x17059
+			MX6SLL_PAD_SD1_DATA6__SD1_DATA6	0x17059
+			MX6SLL_PAD_SD1_DATA7__SD1_DATA7	0x17059
+		>;
+	};
+
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <
+			MX6SLL_PAD_EPDC_PWR_COM__USB_OTG1_ID	0x17059
+		>;
+	};
+};
+
+&snvs_poweroff {
+	status = "disabled";
+};
+
+&snvs_pwrkey {
+	status = "disabled";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	status = "okay";
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg1>;
+	disable-over-current;
+	status = "okay";
+};
-- 
2.23.0
