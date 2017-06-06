From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 14/28] ARM64: dts: Add Actions Semi S900 and Bubblegum-96
Date: Tue,  6 Jun 2017 02:54:12 +0200
Message-ID: <20170606005426.26446-15-afaerber@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mp-cs@actions-semi.com, Thomas Liau <thomas.liau@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

UART0/1/4/6 interrupts are guesses.

Cc: 96boards@ucrobotics.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v3 -> v4:
 * Adopted lower-case timer interrupt-names (Mark)
 
 v2 -> v3:
 * Added remaining UART nodes -- some interrupts are guesses
 * Added timer node -- only TIMER1 interrupt known
 
 v1 -> v2:
 * Reworded subject
 * Added memory@0 node for Bubblegum-96 (Mark)
 * Filled in reserved-memory sub-node for Bubblegum-96 (Mark)
 * Added arm-pmu interrupt-affinity property (Mark)
 * Changed second GIC reg size 0x1000 -> 0x2000 for Bubblegum-96 (Mark)
 * Updated ARCH_OWL to ARCH_ACTIONS (Arnd)
 * Renamed s900-bubblegum96.dts to s900-bubblegum-96.dts
 * Adopted "actions" vendor prefix
 * Dropped irq.h include
 * Adopted SPDX-License-Identifier (Rob)
 
 arch/arm64/boot/dts/Makefile                      |   1 +
 arch/arm64/boot/dts/actions/Makefile              |   5 +
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts |  35 +++++
 arch/arm64/boot/dts/actions/s900.dtsi             | 164 ++++++++++++++++++++++
 4 files changed, 205 insertions(+)
 create mode 100644 arch/arm64/boot/dts/actions/Makefile
 create mode 100644 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
 create mode 100644 arch/arm64/boot/dts/actions/s900.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 78f7991a5906..8e1951273fd7 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,3 +1,4 @@
+dts-dirs += actions
 dts-dirs += al
 dts-dirs += allwinner
 dts-dirs += altera
diff --git a/arch/arm64/boot/dts/actions/Makefile b/arch/arm64/boot/dts/actions/Makefile
new file mode 100644
index 000000000000..62922d688ce3
--- /dev/null
+++ b/arch/arm64/boot/dts/actions/Makefile
@@ -0,0 +1,5 @@
+dtb-$(CONFIG_ARCH_ACTIONS) += s900-bubblegum-96.dtb
+
+always		:= $(dtb-y)
+subdir-y	:= $(dts-dirs)
+clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
new file mode 100644
index 000000000000..a0c3484dbd12
--- /dev/null
+++ b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
@@ -0,0 +1,35 @@
+/*
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include "s900.dtsi"
+
+/ {
+	compatible = "ucrobotics,bubblegum-96", "actions,s900";
+	model = "Bubblegum-96";
+
+	aliases {
+		serial5 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial5:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+};
+
+&timer {
+	clocks = <&hosc>;
+};
+
+&uart5 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
new file mode 100644
index 000000000000..11406f6d3a6d
--- /dev/null
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -0,0 +1,164 @@
+/*
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "actions,s900";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secmon@1f000000 {
+			reg = <0x0 0x1f000000 0x0 0x1000000>;
+			no-map;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	hosc: hosc {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@e00f1000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xe00f1000 0x0 0x1000>,
+			      <0x0 0xe00f2000 0x0 0x2000>,
+			      <0x0 0xe00f4000 0x0 0x2000>,
+			      <0x0 0xe00f6000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		uart0: serial@e0120000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe0120000 0x0 0x2000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart1: serial@e0122000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe0122000 0x0 0x2000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart2: serial@e0124000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe0124000 0x0 0x2000>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart3: serial@e0126000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe0126000 0x0 0x2000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart4: serial@e0128000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe0128000 0x0 0x2000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart5: serial@e012a000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe012a000 0x0 0x2000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart6: serial@e012c000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe012c000 0x0 0x2000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer: timer@e0228000 {
+			compatible = "actions,s900-timer";
+			reg = <0x0 0xe0228000 0x0 0x8000>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "timer1";
+		};
+	};
+};
-- 
2.12.3
