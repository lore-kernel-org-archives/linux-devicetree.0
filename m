Return-Path: <SRS0=tEXb=OI=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Date: Thu, 29 Nov 2018 08:05:59 -0500
Message-Id: <20181129130559.66732-3-chris.brandt@renesas.com>
In-Reply-To: <20181129130559.66732-1-chris.brandt@renesas.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for Renesas RZ/A2M evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt |   2 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 133 +++++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index a94db59d8e2d..67a6810c4345 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -125,6 +125,8 @@ Boards:
     compatible = "renesas,porter", "renesas,r8a7791"
   - RSKRZA1 (YR0K77210C000BE)
     compatible = "renesas,rskrza1", "renesas,r7s72100"
+  - RZ/A2M Eval Board (RTK7921053S00000BE)
+    compatible = "renesas,rza2mevb", "renesas,r7s9210"
   - RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
     compatible = "renesas,rzn1d400-db", "renesas,r9a06g032"
   - Salvator-X (RTP0RC7795SIPB0010S)
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b0e966d625b9..fbdd068fd8af 100644
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
index 000000000000..9570aeb8f1ce
--- /dev/null
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -0,0 +1,133 @@
+/*
+ * Device Tree Source for the RZA2MEVB board
+ *
+ * Copyright (C) 2018 Renesas Electronics
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
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
+		bootargs = "ignore_loglevel earlycon rootfstype=cramfs root=mtd:rootfs";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
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
+		status = "okay";
+		compatible = "gpio-leds";
+
+		led0 {
+			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Cramfs XIP File System in QSPI */
+	qspi@20000000 {
+		compatible = "mtd-rom";
+		probe-type = "direct-mapped";	/* XIP from QSPI */
+		reg = <0x20000000 0x4000000>;	/* 64 MB*/
+		bank-width = <4>;
+		device-width = <1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		partition@800000 {
+			label ="rootfs";
+			reg = <0x0800000 0x1000000>; /* 16MB @ 0x20800000 */
+			read-only;
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
+
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
