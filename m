From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: mediatek: add mt6795 support
Date: Wed, 8 Jul 2015 18:14:40 +0800
Message-ID: <1436350480-17276-3-git-send-email-mars.cheng@mediatek.com>
References: <1436350480-17276-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436350480-17276-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, MY Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds basic chip support for MT6795 SoC

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt6795-evb.dts |  34 ++++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi    | 164 ++++++++++++++++++++++++++++
 3 files changed, 199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 3ce2462..e0a4bff 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -1,3 +1,4 @@
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/mediatek/mt6795-evb.dts b/arch/arm64/boot/dts/mediatek/mt6795-evb.dts
new file mode 100644
index 0000000..3a43c860
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6795-evb.dts
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ * Author: Mars.C <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
+#include "mt6795.dtsi"
+
+/ {
+	model = "MediaTek MT6795 Evaluation Board";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x1e800000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,921600n8 earlyprintk";
+		stdout-path = &uart0;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
new file mode 100644
index 0000000..832be20
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -0,0 +1,164 @@
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ * Author: Mars.C <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt6795";
+	interrupt-parent = <&sysirq>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x000>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x001>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x002>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x003>;
+		};
+
+		cpu4: cpu@4 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+		};
+
+		cpu5: cpu@5 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+		};
+
+		cpu6: cpu@6 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+		};
+
+		cpu7: cpu@7 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+		};
+	};
+
+	clocks {
+		system_clk: dummy13m {
+			compatible = "fixed-clock";
+			clock-frequency = <13000000>;
+			#clock-cells = <0>;
+		};
+
+		rtc_clk: dummy32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		uart_clk: dummy26m {
+			compatible = "fixed-clock";
+			clock-frequency = <26000000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13
+			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	sysirq: intpol-controller@10200620 {
+		compatible = "mediatek,mt6795-sysirq",
+			     "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0 0x10200620 0 0x20>;
+	};
+
+	gic: interrupt-controller@10221000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		interrupt-controller;
+		reg = <0 0x10221000 0 0x1000>,
+		      <0 0x10222000 0 0x2000>,
+		      <0 0x10224000 0 0x2000>,
+		      <0 0x10226000 0 0x2000>;
+	};
+
+	uart0: serial@11002000 {
+		compatible = "mediatek,mt6795-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11002000 0 0x400>;
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart1: serial@11003000 {
+		compatible = "mediatek,mt6795-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11003000 0 0x400>;
+		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart2: serial@11004000 {
+		compatible = "mediatek,mt6795-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11004000 0 0x400>;
+		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart3: serial@11005000 {
+		compatible = "mediatek,mt6795-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11005000 0 0x400>;
+		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+};
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
