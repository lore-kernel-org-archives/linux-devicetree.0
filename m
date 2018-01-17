From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] arm: zynq: Add support for Xilinx zc770 xm012 dc3 board
Date: Wed, 17 Jan 2018 15:41:12 +0100
Message-ID: <9843c1a43e6e5c4d96de37506fd4d99217c7150c.1516200065.git.michal.simek@xilinx.com>
References: <cover.1516200065.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1516200065.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <cover.1516200065.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <cover.1516200065.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

zc770 is based board which is extended by FMC/DC cards for SoC
validation. FMCs/DCs are supposed to cover all SoC configurations.
FMC/DC contains can, 2x i2c, nor flash, spi and uart.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/zynq-zc770-xm012.dts | 64 ++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm012.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7ed36eef2de0..6bd4b9a29511 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1043,6 +1043,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) += \
 	zynq-zc706.dtb \
 	zynq-zc770-xm010.dtb \
 	zynq-zc770-xm011.dtb \
+	zynq-zc770-xm012.dtb \
 	zynq-zed.dtb \
 	zynq-zybo.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) += \
diff --git a/arch/arm/boot/dts/zynq-zc770-xm012.dts b/arch/arm/boot/dts/zynq-zc770-xm012.dts
new file mode 100644
index 000000000000..c3169d63600d
--- /dev/null
+++ b/arch/arm/boot/dts/zynq-zc770-xm012.dts
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Xilinx ZC770 XM012 board DTS
+ *
+ * Copyright (C) 2013-2018 Xilinx, Inc.
+ */
+/dts-v1/;
+#include "zynq-7000.dtsi"
+
+/ {
+	compatible = "xlnx,zynq-zc770-xm012", "xlnx,zynq-7000";
+	model = "Xilinx Zynq";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		serial0 = &uart1;
+		spi0 = &spi1;
+	};
+
+	chosen {
+		bootargs = "";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+};
+
+&can1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	eeprom0: eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	eeprom1: eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+	num-cs = <4>;
+	is-decoded-cs = <0>;
+};
+
+&uart1 {
+	status = "okay";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
