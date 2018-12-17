Return-Path: <SRS0=4vs0=O2=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Date: Mon, 17 Dec 2018 09:43:24 -0500
Message-Id: <20181217144324.99422-3-chris.brandt@renesas.com>
In-Reply-To: <20181217144324.99422-1-chris.brandt@renesas.com>
References: <20181217144324.99422-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for Renesas RZ/A2M evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v3:
 * Removed QSPI partition (because half baked at the moment)
v2:
 * Removed patch for shmobile.txt
 * Added SPDX
 * Removed earlycon from bootargs
 * Fixed address in memory node name
 * Removed un-needed "okay" from leds node
 * Added green LED node
 * Dropped this blank line in pinctrl node
---
 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 82 ++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1ef2133a18c2..9665694b6494 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -824,6 +824,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r7s72100-genmai.dtb \
 	r7s72100-gr-peach.dtb \
 	r7s72100-rskrza1.dtb \
+	r7s9210-rza2mevb.dtb \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
 	r8a7743-iwg20d-q7.dtb \
diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
new file mode 100644
index 000000000000..991e09de1219
--- /dev/null
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZA2MEVB board
+ *
+ * Copyright (C) 2018 Renesas Electronics
+ *
+ */
+
+/dts-v1/;
+#include "r7s9210.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
+
+/ {
+	model = "RZA2MEVB";
+	compatible = "renesas,rza2mevb", "renesas,r7s9210";
+
+	aliases {
+		serial0 = &scif4;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
+	};
+
+	lbsc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		red {
+			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
+		};
+		green {
+			gpios = <&pinctrl RZA2_PIN(PORTC, 1) GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* EXTAL */
+&extal_clk {
+	clock-frequency = <24000000>;	/* 24MHz */
+};
+
+/* RTC_X1 */
+&rtc_x1_clk {
+	clock-frequency = <32768>;
+};
+
+&pinctrl {
+	/* Serial Console */
+	scif4_pins: serial4 {
+		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
+			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
+	};
+};
+
+/* High resolution System tick timers */
+&ostm0 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+/* Serial Console */
+&scif4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif4_pins>;
+
+	status = "okay";
+};
-- 
2.16.1
