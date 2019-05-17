From: Oliver Graute <oliver.graute@gmail.com>
Subject: [PATCH 4/5] arm64: dts: add basic DTS for i.MX8QM
Date: Fri, 17 May 2019 09:18:12 +0200
Message-ID: <20190517071813.26674-4-oliver.graute@gmail.com>
References: <20190517071813.26674-1-oliver.graute@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190517071813.26674-1-oliver.graute@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, oliver.graute@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, Oliver Graute <oliver.graute@kococonnector.com>, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Oliver Graute <oliver.graute@kococonnector.com>

added dtsi file for imx8 Quad Max CPU

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 153 ++++++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
new file mode 100644
index 000000000000..9e0ad3ae3745
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2018 NXP
+ * Copyright 2019 Oliver Graute <oliver.graute@kococonnector.com>
+ */
+
+#include <dt-bindings/clock/imx8-clock.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/pads-imx8qm.h>
+#include "fsl-imx8qm-device.dtsi"
+
+/ {
+	compatible = "fsl,imx8qm";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		serial0 = &lpuart0;
+	};
+
+	cpus {
+		A53_0 {
+			operating-points = <
+				1200000	   0
+				1104000	   0
+				900000	   0
+				600000	   0
+			>;
+			clocks = <&clk IMX8QM_A53_DIV>;
+			clock-latency = <61036>;
+			#cooling-cells = <2>;
+		};
+
+		A72_0 {
+			operating-points = <
+				1596000	   0
+				1296000	   0
+				1056000	   0
+				600000     0
+			>;
+			clocks = <&clk IMX8QM_A72_DIV>;
+			clock-latency = <61036>;
+			#cooling-cells = <2>;
+		};
+
+	};
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		decoder_boot: decoder_boot@0x84000000 {
+			no-map;
+			reg = <0 0x84000000 0 0x2000000>;
+		};
+		encoder_boot: encoder_boot@0x86000000 {
+			no-map;
+			reg = <0 0x86000000 0 0x400000>;
+		};
+		rpmsg_reserved: rpmsg@0x90000000 {
+			no-map;
+			reg = <0 0x90000000 0 0x400000>;
+		};
+
+		decoder_rpc: decoder_rpc@0x90400000 {
+			no-map;
+			reg = <0 0x90400000 0 0x200000>;
+		};
+		encoder_rpc: encoder_rpc@0x90600000 {
+			no-map;
+			reg = <0 0x90600000 0 0x200000>;
+		};
+		dsp_reserved: dsp@0x92400000 {
+			no-map;
+			reg = <0 0x92400000 0 0x2000000>;
+		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0 0x3c000000>;
+			alloc-ranges = <0 0x96000000 0 0x3c000000>;
+			linux,cma-default;
+		};
+
+	};
+
+	gic: interrupt-controller@51a00000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
+		      <0x0 0x51b00000 0 0xC0000>, /* GICR */
+		      <0x0 0x52000000 0 0x2000>,  /* GICC */
+		      <0x0 0x52010000 0 0x1000>,  /* GICH */
+		      <0x0 0x52020000 0 0x20000>; /* GICV */
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9
+			(GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-parent = <&gic>;
+	};
+
+	clk: clk {
+		compatible = "fsl,imx8qm-clk";
+		#clock-cells = <1>;
+	};
+
+	iomuxc: iomuxc {
+		compatible = "fsl,imx8qm-iomuxc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <8000000>;
+		interrupt-parent = <&gic>;
+	};
+
+	smmu: iommu@51400000 {
+		compatible = "arm,mmu-500";
+		interrupt-parent = <&gic>;
+		reg = <0 0x51400000 0 0x40000>;
+		#global-interrupts = <1>;
+		#iommu-cells = <2>;
+		interrupts = <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>,
+			     <0 32 4>, <0 32 4>, <0 32 4>, <0 32 4>;
+	};
+
+};
-- 
2.17.1
