From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] arm64: dts: bitmain: Add BM1880 SoC support
Date: Sat, 26 Jan 2019 09:40:39 +0530
Message-ID: <20190126041041.13173-4-manivannan.sadhasivam@linaro.org>
References: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree support for Bitmain BM1880 SoC, consisting of a Dual
core ARM Cortex A53 subsystem, a Single core RISC-V subsystem and a Tensor
Processor subsystem. Only ARM Cortex A53 Application processor subsystem
support is enabled for now.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/Makefile            |   1 +
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 119 ++++++++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/bitmain/bm1880.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 4690364d584b..5bc7533a12c7 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -7,6 +7,7 @@ subdir-y += amd
 subdir-y += amlogic
 subdir-y += apm
 subdir-y += arm
+subdir-y += bitmain
 subdir-y += broadcom
 subdir-y += cavium
 subdir-y += exynos
diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
new file mode 100644
index 000000000000..55a4769e0de2
--- /dev/null
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "bitmain,bm1880";
+	interrupt-parent = <&gic>;
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
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secmon@100000000 {
+			reg = <0x1 0x00000000 0x0 0x20000>;
+			no-map;
+		};
+
+		jpu@130000000 {
+			reg = <0x1 0x30000000 0x0 0x08000000>; // 128M
+			no-map;
+		};
+
+		vpu@138000000 {
+			reg = <0x1 0x38000000 0x0 0x08000000>; // 128M
+			no-map;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@50001000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0x50001000 0x0 0x1000>,
+			      <0x0 0x50002000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		uart0: serial@58018000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x58018000 0x0 0x2000>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@5801A000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x5801a000 0x0 0x2000>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@5801C000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x5801c000 0x0 0x2000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@5801E000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x5801e000 0x0 0x2000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.17.1
