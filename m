From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v4 2/2] ARM: dts: mediatek: add mt6580 basic support
Date: Tue, 14 Jul 2015 14:07:09 +0800
Message-ID: <1436854029-16599-3-git-send-email-mars.cheng@mediatek.com>
References: <1436854029-16599-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436854029-16599-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Mars Cheng <mars.cheng@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds basic chip support for Mediatek 6580.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 arch/arm/boot/dts/Makefile         |   1 +
 arch/arm/boot/dts/mt6580-evbp1.dts |  39 +++++++++++++
 arch/arm/boot/dts/mt6580.dtsi      | 116 +++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
 create mode 100644 arch/arm/boot/dts/mt6580.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 246473a..919e7c6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -705,6 +705,7 @@ dtb-$(CONFIG_MACH_DOVE) += \
 	dove-dove-db.dtb \
 	dove-sbc-a510.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += \
+	mt6580-evbp1.dtb \
 	mt6589-aquaris5.dtb \
 	mt6592-evb.dtb \
 	mt8127-moose.dtb \
diff --git a/arch/arm/boot/dts/mt6580-evbp1.dts b/arch/arm/boot/dts/mt6580-evbp1.dts
new file mode 100644
index 0000000..4e3f49b
--- /dev/null
+++ b/arch/arm/boot/dts/mt6580-evbp1.dts
@@ -0,0 +1,39 @@
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ * Author: Mars.C <mars.cheng@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "mt6580.dtsi"
+
+/ {
+	model = "MediaTek MT6580 evaluation board";
+	compatible = "mediatek,mt6580-evbp1", "mediatek,mt6580";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory {
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
diff --git a/arch/arm/boot/dts/mt6580.dtsi b/arch/arm/boot/dts/mt6580.dtsi
new file mode 100644
index 0000000..06fdf6c
--- /dev/null
+++ b/arch/arm/boot/dts/mt6580.dtsi
@@ -0,0 +1,116 @@
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ * Author: Mars.C <mars.cheng@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "skeleton.dtsi"
+
+/ {
+	compatible = "mediatek,mt6580";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&sysirq>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x2>;
+		};
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x3>;
+		};
+
+	};
+
+	system_clk: dummy13m {
+		compatible = "fixed-clock";
+		clock-frequency = <13000000>;
+		#clock-cells = <0>;
+	};
+
+	rtc_clk: dummy32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32000>;
+		#clock-cells = <0>;
+	};
+
+	uart_clk: dummy26m {
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	timer: timer@10008000 {
+		compatible = "mediatek,mt6580-timer",
+			     "mediatek,mt6577-timer";
+		reg = <0x10008000 0x80>;
+		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&system_clk>, <&rtc_clk>;
+		clock-names = "system-clk", "rtc-clk";
+	};
+
+	sysirq: interrupt-controller@10200100 {
+		compatible = "mediatek,mt6580-sysirq",
+			     "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10200100 0x1c>;
+	};
+
+	gic: interrupt-controller@10211000 {
+		compatible = "arm,cortex-a7-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10211000 0x1000>,
+		      <0x10212000 0x1000>,
+		      <0x10214000 0x2000>,
+		      <0x10216000 0x2000>;
+	};
+
+	uart0: serial@11005000 {
+		compatible = "mediatek,mt6580-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11005000 0x400>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart1: serial@11006000 {
+		compatible = "mediatek,mt6580-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11006000 0x400>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+};
-- 
1.8.1.1.dirty
