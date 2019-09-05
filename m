From: jamestai.sky@gmail.com
Subject: [PATCH] ARM: dts: realtek: Add support for Realtek RTD16XX evaluation board
Date: Thu,  5 Sep 2019 16:08:35 +0800
Message-ID: <20190905080835.1376-1-james.tai@realtek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, CY_Huang <cy.huang@realtek.com>, Phinex Hung <phinex@realtek.com>, "james.tai" <james.tai@realtek.com>
List-Id: devicetree@vger.kernel.org

From: "james.tai" <james.tai@realtek.com>

This patch adds a generic devicetree board file and a dtsi for
Realtek RTD16XX platform.

Signed-off-by: james.tai <james.tai@realtek.com>
---
 arch/arm/boot/dts/Makefile            |   2 +
 arch/arm/boot/dts/rtd1619-mjolnir.dts |  34 +++++++++
 arch/arm/boot/dts/rtd16xx.dtsi        | 101 ++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/rtd1619-mjolnir.dts
 create mode 100644 arch/arm/boot/dts/rtd16xx.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9159fa2cea90..4a37d54e78d1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1286,3 +1286,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
 	aspeed-bmc-quanta-q71l.dtb
+dtb-$(CONFIG_ARCH_RTD16XX) += \
+	rtd1619-mjolnir.dtb
diff --git a/arch/arm/boot/dts/rtd1619-mjolnir.dts b/arch/arm/boot/dts/rtd1619-mjolnir.dts
new file mode 100644
index 000000000000..75cf74eb0862
--- /dev/null
+++ b/arch/arm/boot/dts/rtd1619-mjolnir.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2019 Realtek Semiconductor Corp.
+ */
+
+/dts-v1/;
+
+#include "rtd16xx.dtsi"
+
+/ {
+	model= "Realtek Mjolnir Evaluation Board";
+	model_hex= <0x00000653>;
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlycon";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	uart0: serial0@98007800 {
+		compatible = "snps,dw-apb-uart";
+		reg = <0x0 0x98007800 0x0 0x400>,
+			<0x0 0x98007000 0x0 0x100>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+		interrupts = <0 68 4>;
+		clock-frequency = <27000000>;
+		status = "okay";
+	};
+};
diff --git a/arch/arm/boot/dts/rtd16xx.dtsi b/arch/arm/boot/dts/rtd16xx.dtsi
new file mode 100644
index 000000000000..9f928bdabc42
--- /dev/null
+++ b/arch/arm/boot/dts/rtd16xx.dtsi
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2019 Realtek Semiconductor Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/{
+	compatible = "realtek,rtd1619";
+	interrupt-parent = <&gic>;
+	#address-cells = <0x2>;
+	#size-cells = <0x2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		A55_0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x000>;
+			next-level-cache = <&a55_l2>;
+		};
+
+		A55_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x100>;
+			cpu-release-addr = <0x98007f30>;
+		};
+
+		A55_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x200>;
+			cpu-release-addr = <0x98007f30>;
+		};
+
+		A55_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x300>;
+			cpu-release-addr = <0x98007f30>;
+		};
+
+		A55_4: cpu@4 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x400>;
+			cpu-release-addr = <0x98007f30>;
+		};
+
+		A55_5: cpu@5 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x500>;
+			cpu-release-addr = <0x98007f30>;
+		};
+
+		a55_l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	arm_psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@ff100000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		interrupt-controller;
+		redistributor-stride = <0x0 0x20000>;
+		#redistributor-regions = <1>;
+		reg = <0x0 0xff100000 0x0 0x10000>, /* GICD */
+			<0x0 0xff140000 0x0 0x200000>; /* GICR */
+		interrupts = <GIC_PPI 9 4>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | 8)>,
+			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | 8)>,
+			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | 8)>,
+			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | 8)>;
+		clock-frequency = <27000000>;
+	};
+
+	osc27M: osc27M {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+		clock-output-names = "osc27M";
+	};
+};
-- 
2.17.1
