From: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V6 6/6] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support
Date: Fri,  4 Nov 2016 13:56:36 -0700
Message-ID: <1478292996-29559-7-git-send-email-jeremymc@redhat.com>
References: <1478292996-29559-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478292996-29559-1-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mail-LJ92rlH3Dns@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bastian Köcher <git-LJ92rlH3Dns@public.gmane.org>

Initial device tree support for Qualcomm MSM8994 SoC and
Huawei Angler / Google Nexus 6P support.

The device tree is based on the Google 3.10 kernel tree.

The device can be booted into the initrd with only one CPU running.

Signed-off-by: Bastian Köcher <mail-LJ92rlH3Dns@public.gmane.org>
[jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: removed Kconfig, defconfig, move from Huawei to qcom dir]
Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Tested-by: Michael Scott <michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  40 ++++
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |  38 ++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi              | 216 +++++++++++++++++++++
 4 files changed, 295 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 439e40e..cc0f02d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
new file mode 100644
index 0000000..dfa08f5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -0,0 +1,40 @@
+/* Copyright (c) 2015, Huawei Inc. All rights reserved.
+ * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+
+#include "msm8994.dtsi"
+
+/ {
+	model = "Huawei Nexus 6P";
+	compatible = "huawei,angler", "qcom,msm8994";
+	/* required for bootloader to select correct board */
+	qcom,board-id = <8026 0>;
+
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	soc {
+		serial@f991e000 {
+			status = "okay";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
new file mode 100644
index 0000000..0e4eea0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
@@ -0,0 +1,38 @@
+/*
+ * Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+&msmgpio {
+	blsp1_uart2_default: blsp1_uart2_default {
+		pinmux {
+			function = "blsp_uart2";
+			pins = "gpio4", "gpio5";
+		};
+		pinconf {
+			pins = "gpio4", "gpio5";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_sleep: blsp1_uart2_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio4", "gpio5";
+		};
+		pinconf {
+			pins = "gpio4", "gpio5";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
new file mode 100644
index 0000000..f33c41d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -0,0 +1,216 @@
+/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-msm8994.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. MSM 8994";
+	compatible = "qcom,msm8994";
+	// msm-id and pmic-id are required by bootloader for
+	// proper selection of dt blob
+	qcom,msm-id = <207 0x20000>;
+	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+			};
+		};
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0>;
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 2 0xff08>,
+			     <1 3 0xff08>,
+			     <1 4 0xff08>,
+			     <1 1 0xff08>;
+	};
+
+	soc: soc {
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+		compatible = "simple-bus";
+
+		intc: interrupt-controller@f9000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0xf9000000 0x1000>,
+				  <0xf9002000 0x1000>;
+		};
+
+		timer@f9020000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0xf9020000 0x1000>;
+
+			frame@f9021000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9021000 0x1000>,
+				      <0xf9022000 0x1000>;
+			};
+
+			frame@f9023000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9023000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9024000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9024000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9025000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9025000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9026000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9026000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9027000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9027000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9028000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9028000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		restart@fc4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0xfc4ab000 0x4>;
+		};
+
+		msmgpio: pinctrl@fd510000 {
+			compatible = "qcom,msm8994-pinctrl";
+			reg = <0xfd510000 0x4000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		blsp1_uart2: serial@f991e000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf991e000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-names = "core", "iface";
+			clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&clock_gcc GCC_BLSP1_AHB_CLK>;
+		};
+
+		tcsr_mutex_regs: syscon@fd484000 {
+			compatible = "syscon";
+			reg = <0xfd484000 0x2000>;
+		};
+
+		clock_gcc: clock-controller@fc400000 {
+			compatible = "qcom,gcc-msm8994";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0xfc400000 0x2000>;
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		// We expect the bootloader to fill in the reg
+		reg = <0 0 0 0>;
+	};
+
+	xo_board: xo_board {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <19200000>;
+	};
+
+	sleep_clk: sleep_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_mem: smem_region@6a00000 {
+			reg = <0x0 0x6a00000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x80>;
+		#hwlock-cells = <1>;
+	};
+
+	qcom,smem@6a00000 {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+};
+
+
+#include "msm8994-pins.dtsi"
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
