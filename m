From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add support for 96Boards Chameleon96 board
Date: Sat, 15 Dec 2018 08:31:52 +0530
Message-ID: <20181215030152.4386-3-manivannan.sadhasivam@linaro.org>
References: <20181215030152.4386-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181215030152.4386-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, amit.kucheria@linaro.org, yossi@novtech.com, nazik@novtech.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree support for 96Boards Chameleon96 board from Novtech, Inc.
based on Altera CycloneV SoC FPGA. This board is one of the Consumer
Edition boards of the 96Boards family and has the following key features:

* SoC - Intel Cyclone V SoC FPGA
* GPU - Graphics based on Intel Video Suite for FPGA
* RAM - 512MB DDR3L
* USB - 2x USB2.0 Host, 1x USB2.0 OTG
* Wireless - Wifi, BT

More information about this board can be found in 96Boards product
page: https://www.96boards.org/product/chameleon96/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/socfpga_cyclone5_chameleon96.dts | 130 ++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b0e966d625b9..d6cf081ec325 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -897,6 +897,7 @@ dtb-$(CONFIG_ARCH_SOCFPGA) += \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
+	socfpga_cyclone5_chameleon96.dtb \
 	socfpga_cyclone5_mcvevk.dtb \
 	socfpga_cyclone5_socdk.dtb \
 	socfpga_cyclone5_de0_nano_soc.dtb \
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts b/arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts
new file mode 100644
index 000000000000..f6561766d83f
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Device Tree file for the Chameleon96
+ *
+ * Copyright (c) 2018 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Novetech Chameleon96";
+	compatible = "novtech,chameleon96", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x20000000>; /* 512MB */
+	};
+
+	regulator_3_3v: 3-3-v-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		user_led1 {
+			label = "green:user1";
+			gpios = <&porta 14 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		user_led2 {
+			label = "green:user2";
+			gpios = <&porta 22 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "mmc0";
+		};
+
+		user_led3 {
+			label = "green:user3";
+			gpios = <&porta 25 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		user_led4 {
+			label = "green:user4";
+			gpios = <&portb 3 GPIO_ACTIVE_LOW>;
+			panic-indicator;
+			linux,default-trigger = "none";
+		};
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&i2c0 {
+	/* On Low speed expansion */
+	label = "LS-I2C0";
+	status = "okay";
+};
+
+&i2c1 {
+	/* On Low speed expansion */
+	label = "LS-I2C1";
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	/* On High speed expansion */
+	label = "HS-I2C2";
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&regulator_3_3v>;
+	vqmmc-supply = <&regulator_3_3v>;
+	status = "okay";
+};
+
+&spi0 {
+	/* On High speed expansion */
+	label = "HS-SPI1";
+	status = "okay";
+};
+
+&spi1 {
+	/* On Low speed expansion */
+	label = "LS-SPI0";
+	status = "okay";
+};
+
+&uart0 {
+	/* On Low speed expansion */
+	label = "LS-UART1";
+	status = "okay";
+};
+
+&uart1 {
+	/* On Low speed expansion */
+	label = "LS-UART0";
+	status = "okay";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.17.1
