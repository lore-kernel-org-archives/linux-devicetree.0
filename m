From: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/4] arm64: Broadcom Vulcan support
Date: Sun, 14 Feb 2016 00:16:32 +0530
Message-ID: <1455389195-31870-2-git-send-email-jchandra@broadcom.com>
References: <1455389195-31870-1-git-send-email-jchandra@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455389195-31870-1-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Add a configuration option and a device tree for Broadcom's Vulcan
ARM64 processor. brcm-vulcan.dtsi has the on-chip blocks like the
PCIe controller, GICv3 with ITS, PMU, system timer and pl011 UART.
brcm-vulcan-eval.dts has definitions for a basic evaluation board.
The firmware supports PSCI 0.2 for cpu wakeup.

Signed-off-by: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
[ updated and split dts - jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org ]
Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/Kconfig.platforms                      |   5 +
 arch/arm64/boot/dts/broadcom/Makefile             |   1 +
 arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts |  33 +++++
 arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi     | 146 ++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 21074f6..8718f18 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -131,6 +131,11 @@ config ARCH_VEXPRESS
 	  This enables support for the ARMv8 software model (Versatile
 	  Express).
 
+config ARCH_VULCAN
+	bool "Broadcom Vulcan SOC Family"
+	help
+	  This enables support for Broadcom Vulcan SoC Family
+
 config ARCH_XGENE
 	bool "AppliedMicro X-Gene SOC Family"
 	help
diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index e21fe66..31219e5 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_BCM_IPROC) += ns2-svk.dtb
+dtb-$(CONFIG_ARCH_VULCAN) += brcm-vulcan-eval.dtb
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts b/arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts
new file mode 100644
index 0000000..2ca5562
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/brcm-vulcan-eval.dts
@@ -0,0 +1,33 @@
+/*
+ * dts file for Broadcom (BRCM) Vulcan Eval Platform
+ *
+ * Copyright (C) 2013-2016, Broadcom Corporation.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+/dts-v1/;
+
+#include "brcm-vulcan.dtsi"
+
+/ {
+	model = "Broadcom Vulcan Eval Platform";
+	compatible = "brcm,vulcan-eval", "brcm,vulcan";
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
+		      <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi b/arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi
new file mode 100644
index 0000000..0f9f618
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/brcm-vulcan.dtsi
@@ -0,0 +1,146 @@
+/*
+ * dtsi file for Broadcom (BRCM) Vulcan processor
+ *
+ * Copyright (C) 2013-2016, Broadcom Corporation.
+ * Author: Zi Shen Lim <zlim-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/memreserve/ 0x80000000 0x00010000;
+
+/ {
+	model = "Broadcom Vulcan";
+	compatible = "brcm,vulcan";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/* just 4 cpus now, 128 needed in full config */
+	cpus {
+		#address-cells = <0x2>;
+		#size-cells = <0x0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "brcm,vulcan", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "brcm,vulcan", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "brcm,vulcan", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "brcm,vulcan", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@400080000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		reg = <0x04 0x00080000 0x0 0x20000>,	/* GICD */
+		      <0x04 0x01000000 0x0 0x1000000>;	/* GICR */
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+		gicits: gic-its@40010000 {
+			compatible = "arm,gic-v3-its";
+			msi-controller;
+			reg = <0x04 0x00100000 0x0 0x20000>;	/* GIC ITS */
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>; /* PMU overflow */
+	};
+
+	clk125mhz: uart_clk125mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+		clock-output-names = "clk125mhz";
+	};
+
+	pci {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		#interrupt-cells = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		/* ECAM at 0x3000_0000 - 0x4000_0000 */
+		reg = <0x0 0x30000000  0x0 0x10000000>;
+		reg-names = "PCI ECAM";
+
+			  /* IO 0x4000_0000 - 0x4001_0000 */
+		ranges = <0x01000000 0 0x40000000 0 0x40000000 0 0x00010000
+			  /* MEM 0x4800_0000 - 0x5000_0000 */
+			  0x02000000 0 0x48000000 0 0x48000000 0 0x08000000
+			  /* MEM64 pref 0x6_0000_0000 - 0x7_0000_0000 */
+			  0x43000000 6 0x00000000 6 0x00000000 1 0x00000000>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map =
+		      /* addr  pin  ic   icaddr  icintr */
+			<0 0 0  1  &gic   0 0    GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
+			 0 0 0  2  &gic   0 0    GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
+			 0 0 0  3  &gic   0 0    GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
+			 0 0 0  4  &gic   0 0    GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		msi-parent = <&gicits>;
+		dma-coherent;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		uart0: serial@402020000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x04 0x02020000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk125mhz>;
+			clock-names = "apb_pclk";
+		};
+	};
+
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
