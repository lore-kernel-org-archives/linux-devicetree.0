From: Ronen Krupnik <ronenk@amazon.com>
Subject: [PATCH 2/2] arm64: dts: amazon: add Amazon Annapurna Labs Alpine v3 support
Date: Sun, 28 Jul 2019 22:51:35 +0300
Message-ID: <20190728195135.12661-3-ronenk@amazon.com>
References: <20190728195135.12661-1-ronenk@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190728195135.12661-1-ronenk@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, barakw@amazon.com, dwmw@amazon.co.uk, benh@amazon.com, jonnyc@amazon.com, talel@amazon.com, hhhawa@amazon.com, hanochu@amazon.com, Ronen Krupnik <ronenk@amazon.com>
List-Id: devicetree@vger.kernel.org

This patch adds the initial support for the Amazon Annapurna Labs Alpine v3
Soc and Evaluation Platform (EVP).

Signed-off-by: Ronen Krupnik <ronenk@amazon.com>
---
 arch/arm64/boot/dts/Makefile                 |   1 +
 arch/arm64/boot/dts/amazon/Makefile          |   1 +
 arch/arm64/boot/dts/amazon/alpine-v3-evp.dts |  23 ++
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi    | 371 +++++++++++++++++++
 4 files changed, 396 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amazon/Makefile
 create mode 100644 arch/arm64/boot/dts/amazon/alpine-v3-evp.dts
 create mode 100644 arch/arm64/boot/dts/amazon/alpine-v3.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 4690364d584b..25b750f147d2 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -3,6 +3,7 @@ subdir-y += actions
 subdir-y += al
 subdir-y += allwinner
 subdir-y += altera
+subdir-y += amazon
 subdir-y += amd
 subdir-y += amlogic
 subdir-y += apm
diff --git a/arch/arm64/boot/dts/amazon/Makefile b/arch/arm64/boot/dts/amazon/Makefile
new file mode 100644
index 000000000000..d71ac87172eb
--- /dev/null
+++ b/arch/arm64/boot/dts/amazon/Makefile
@@ -0,0 +1 @@
+dtb-$(CONFIG_ARCH_ALPINE)	+= alpine-v3-evp.dtb
diff --git a/arch/arm64/boot/dts/amazon/alpine-v3-evp.dts b/arch/arm64/boot/dts/amazon/alpine-v3-evp.dts
new file mode 100644
index 000000000000..542e3d419904
--- /dev/null
+++ b/arch/arm64/boot/dts/amazon/alpine-v3-evp.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ */
+
+#include "alpine-v3.dtsi"
+
+/ {
+	model = "Amazon Alpine v3 Evaluation Platform (EVP)";
+	compatible = "amazon,alpine-v3-evp", "amazon,alpine-v3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
new file mode 100644
index 000000000000..dd91d86ec486
--- /dev/null
+++ b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019, Amazon.com, Inc. or its affiliates. All Rights Reserved
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "Amazon Alpine v3";
+	compatible = "amazon,alpine-v3";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster0_l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x1>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster0_l2>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x2>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster0_l2>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x3>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster0_l2>;
+		};
+
+		cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x100>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster1_l2>;
+		};
+
+		cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x101>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster1_l2>;
+		};
+
+		cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x102>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster1_l2>;
+		};
+
+		cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x103>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster1_l2>;
+		};
+
+		cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x200>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster2_l2>;
+		};
+
+		cpu@201 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x201>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster2_l2>;
+		};
+
+		cpu@202 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x202>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster2_l2>;
+		};
+
+		cpu@203 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x203>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster2_l2>;
+		};
+
+		cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x300>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster3_l2>;
+		};
+
+		cpu@301 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x301>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster3_l2>;
+		};
+
+		cpu@302 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x302>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster3_l2>;
+		};
+
+		cpu@303 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x303>;
+			enable-method = "psci";
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			next-level-cache = <&cluster3_l2>;
+		};
+
+		cluster0_l2: cache@0 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-level = <2>;
+		};
+
+		cluster1_l2: cache@100 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-level = <2>;
+		};
+
+		cluster2_l2: cache@200 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-level = <2>;
+		};
+
+		cluster3_l2: cache@300 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			cache-level = <2>;
+		};
+
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secmon@0 {
+			reg = <0x0 0x0 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		interrupt-parent = <&gic>;
+		ranges;
+
+		arch-timer {
+			compatible = "arm,armv8-timer";
+			interrupts = <GIC_PPI 0xd IRQ_TYPE_LEVEL_LOW
+				      GIC_PPI 0xe IRQ_TYPE_LEVEL_LOW
+				      GIC_PPI 0xb IRQ_TYPE_LEVEL_LOW
+				      GIC_PPI 0xa IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		gic: interrupt-controller@f0000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#size-cells = <0>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0xf0800000 0 0x10000>,
+			      <0x0 0xf0a00000 0 0x200000>,
+			      <0x0 0xf0000000 0 0x2000>,
+			      <0x0 0xf0010000 0 0x1000>,
+			      <0x0 0xf0020000 0 0x2000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		msix: msix@fbe00000 {
+			compatible = "al,alpine-msix";
+			reg = <0x0 0xfbe00000 0x0 0x100000>;
+			interrupt-controller;
+			msi-controller;
+			al,msi-base-spi = <160>;
+			al,msi-num-spis = <800>;
+			interrupt-parent = <&gic>;
+		};
+
+		pmu {
+			compatible = "arm,armv8-pmuv3";
+			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		uart0: serial@fd883000 {
+			compatible = "ns16550a";
+			device_type = "serial";
+			reg = <0x0 0xfd883000 0x0 0x1000>;
+			clock-frequency = <0>; /* filled by uboot */
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+
+		pci@fbd00000 {
+			compatible = "pci-host-ecam-generic";
+			device_type = "pci";
+			#size-cells = <2>;
+			#address-cells = <3>;
+			#interrupt-cells = <1>;
+			reg = <0x0 0xfbd00000 0x0 0x100000>;
+			interrupt-map-mask = <0xf800 0 0 7>;
+			/* 8 x legacy interrupts for SATA only */
+			interrupt-map = <0x4000 0 0 1 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+					<0x4800 0 0 1 &gic 0 58 IRQ_TYPE_LEVEL_HIGH>,
+					<0x5000 0 0 1 &gic 0 59 IRQ_TYPE_LEVEL_HIGH>,
+					<0x5800 0 0 1 &gic 0 60 IRQ_TYPE_LEVEL_HIGH>,
+					<0x6000 0 0 1 &gic 0 61 IRQ_TYPE_LEVEL_HIGH>,
+					<0x6800 0 0 1 &gic 0 62 IRQ_TYPE_LEVEL_HIGH>,
+					<0x7000 0 0 1 &gic 0 63 IRQ_TYPE_LEVEL_HIGH>,
+					<0x7800 0 0 1 &gic 0 64 IRQ_TYPE_LEVEL_HIGH>;
+			ranges = <0x02000000 0x0 0xfe000000 0x0 0xfe000000 0x0 0x1000000>;
+			bus-range = <0x00 0x00>;
+		};
+	};
+};
-- 
2.21.0
