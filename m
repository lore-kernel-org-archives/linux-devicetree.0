From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Wed,  5 Jun 2019 22:46:00 +0530
Message-ID: <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add initial device tree support for the Qualcomm IPQ6018 SoC and
CP01 evaluation board.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/Makefile            |   1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  35 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 231 +++++++++++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 21d548f..ac22dbb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
new file mode 100644
index 0000000..ac7cb22
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IPQ6018 CP01 board device tree source
+ *
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "ipq6018.dtsi"
+
+/ {
+	#address-cells = <0x2>;
+	#size-cells = <0x2>;
+	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
+	compatible = "qcom,ipq6018-cp01", "qcom,ipq6018";
+	interrupt-parent = <&intc>;
+};
+
+&tlmm {
+	uart_pins: uart_pins {
+		mux {
+			pins = "gpio44", "gpio45";
+			function = "blsp2_uart";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
+};
+
+&blsp1_uart3 {
+	pinctrl-0 = <&uart_pins>;
+	pinctrl-names = "default";
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
new file mode 100644
index 0000000..79cccdd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IPQ6018 SoC device tree source
+ *
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ6018";
+	compatible = "qcom,ipq6018";
+
+	chosen {
+		bootargs = "console=ttyMSM0,115200,n8 rw init=/init";
+		bootargs-append = " swiotlb=1 clk_ignore_unused";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tz:tz@48500000 {
+			no-map;
+			reg = <0x0 0x48500000 0x0 0x00200000>;
+		};
+	};
+
+	soc: soc {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		ranges = <0 0 0 0xffffffff>;
+		dma-ranges;
+		compatible = "simple-bus";
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <0x3>;
+			reg = <0xb000000 0x1000>, <0xb002000 0x1000>;
+		};
+
+		timer {
+			compatible = "arm,armv8-timer";
+			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		};
+
+		timer@b120000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0xb120000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@b120000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb121000 0x1000>,
+				      <0xb122000 0x1000>;
+			};
+
+			frame@b123000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb123000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb124000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb125000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb126000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb127000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb128000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		gcc: gcc@1800000 {
+			compatible = "qcom,gcc-ipq6018";
+			reg = <0x1800000 0x80000>;
+			#clock-cells = <0x1>;
+			#reset-cells = <0x1>;
+		};
+
+		blsp1_uart3: serial@78b1000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78b1000 0x200>;
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq6018-pinctrl";
+			reg = <0x1000000 0x300000>;
+			interrupts = <GIC_SPI 0xd0 IRQ_TYPE_NONE>;
+			gpio-controller;
+			#gpio-cells = <0x2>;
+			interrupt-controller;
+			#interrupt-cells = <0x2>;
+
+			uart_pins: uart_pins {
+				pins = "gpio44", "gpio45";
+				function = "blsp2_uart";
+				drive-strength = <8>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	psci: psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	cpus: cpus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x1>;
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x2>;
+			next-level-cache = <&L2_0>;
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x3>;
+			next-level-cache = <&L2_0>;
+		};
+
+		L2_0: l2-cache {
+			compatible = "cache";
+			cache-level = <0x2>;
+		};
+	};
+
+	pmuv8: pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
+					 IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	clocks {
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		xo: xo {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			#clock-cells = <0>;
+		};
+
+		bias_pll_cc_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <300000000>;
+			#clock-cells = <0>;
+		};
+
+		bias_pll_nss_noc_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <416500000>;
+			#clock-cells = <0>;
+		};
+
+		usb3phy_0_cc_pipe_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <125000000>;
+			#clock-cells = <0>;
+		};
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
