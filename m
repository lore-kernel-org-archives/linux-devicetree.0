From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [RFC V3 PATCH 5/7] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support
Date: Wed, 12 Oct 2016 02:37:32 -0700
Message-ID: <1476265054-22511-6-git-send-email-jeremymc@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org

From: Bastian Köcher <mail@kchr.de>

Initial device tree support for Qualcomm MSM8994 SoC and
Huawei Angler / Google Nexus 6P support.

The device tree and the angler_defconfig are based on the
device tree from the Google 3.10 kernel tree.

The device can be booted into the initrd with only one CPU running.

Signed-off-by: Bastian Köcher <mail@kchr.de>
[jeremymc@redhat.com: removed Kconfig, defconfig, move from Huawei to qcom dir]
Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +-
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  41 ++++
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |  38 ++++
 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi         |  31 +++
 arch/arm64/boot/dts/qcom/msm8994.dtsi              | 237 +++++++++++++++++++++
 5 files changed, 349 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cee6bcc..84f102d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,5 @@
-dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb msm8992-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb msm8996-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb msm8994-angler-rev-101.dtb
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
new file mode 100644
index 0000000..5cff29f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -0,0 +1,41 @@
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
+#include "msm8994-v2.0.dtsi"
+
+/ {
+	model = "HUAWEI MSM8994 ANGLER rev-1.01";
+	compatible = "qcom,msm8994";
+	qcom,board-id= <8026 0>;
+};
+
+/ {
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
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
diff --git a/arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi b/arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
new file mode 100644
index 0000000..8fc4c41f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
@@ -0,0 +1,31 @@
+/* Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
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
+/*
+ * As a general rule, only version-specific property overrides should be placed
+ * inside this file. Device definitions should be placed inside the msm8994.dtsi
+ * file.
+ */
+
+#include "msm8994.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. MSM 8994v2.0";
+	compatible = "qcom,msm8994";
+	qcom,msm-id = <207 0x20000>;
+
+};
+
+/* Clock driver overrides */
+&clock_gcc {
+	compatible = "qcom,gcc-8994v2";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
new file mode 100644
index 0000000..c95cb73
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -0,0 +1,237 @@
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
+/memreserve/ 0x00000000 0x00001000;
+/memreserve/ 0xac1c0000 0x00001000;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-msm8994.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. MSM 8994";
+	compatible = "qcom,msm8994";
+	qcom,msm-id = <207 0x0>;
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
+			// The currents(uA) correspond to the frequencies in the
+			// frequency table.
+			current = < 24140 //384000 kHZ
+				    27200 //460800 kHZ
+				    32300 //600000 kHZ
+				    36940 //672000 kHz
+				    41570 //768000 kHZ
+				    49870 //864000 kHZ
+				    57840 //960000 kHZ
+				    79800 //1248000 kHZ
+				    88810 //1344000 kHZ
+				    102400 //1478400 kHZ
+				    110900>; //1555200 kHZ
+			L2_0: l2-cache {
+			      compatible = "cache";
+			      cache-level = <2>;
+			};
+		};
+	};
+
+	soc: soc { };
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_mem: smem_region@0x6a00000 {
+			reg = <0x0 0x6a00000 0x0 0x200000>;
+			no-map;
+		};
+	};
+};
+
+&soc {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0 0 0xffffffff>;
+	compatible = "simple-bus";
+
+	intc: interrupt-controller@f9000000 {
+		compatible = "qcom,msm-qgic2";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0xf9000000 0x1000>,
+			  <0xf9002000 0x1000>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 2 0xff08>,
+			     <1 3 0xff08>,
+			     <1 4 0xff08>,
+			     <1 1 0xff08>;
+		clock-frequency = <19200000>;
+	};
+
+	timer@f9020000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "arm,armv7-timer-mem";
+		reg = <0xf9020000 0x1000>;
+		clock-frequency = <19200000>;
+
+		frame@f9021000 {
+			frame-number = <0>;
+			interrupts = <0 9 0x4>,
+				     <0 8 0x4>;
+			reg = <0xf9021000 0x1000>,
+			      <0xf9022000 0x1000>;
+		};
+
+		frame@f9023000 {
+			frame-number = <1>;
+			interrupts = <0 10 0x4>;
+			reg = <0xf9023000 0x1000>;
+			status = "disabled";
+		};
+
+		frame@f9024000 {
+			frame-number = <2>;
+			interrupts = <0 11 0x4>;
+			reg = <0xf9024000 0x1000>;
+			status = "disabled";
+		};
+
+		frame@f9025000 {
+			frame-number = <3>;
+			interrupts = <0 12 0x4>;
+			reg = <0xf9025000 0x1000>;
+			status = "disabled";
+		};
+
+		frame@f9026000 {
+			frame-number = <4>;
+			interrupts = <0 13 0x4>;
+			reg = <0xf9026000 0x1000>;
+			status = "disabled";
+		};
+
+		frame@f9027000 {
+			frame-number = <5>;
+			interrupts = <0 14 0x4>;
+			reg = <0xf9027000 0x1000>;
+			status = "disabled";
+		};
+
+		frame@f9028000 {
+			frame-number = <6>;
+			interrupts = <0 15 0x4>;
+			reg = <0xf9028000 0x1000>;
+			status = "disabled";
+		};
+	};
+
+	restart@fc4ab000 {
+		compatible = "qcom,pshold";
+		reg = <0xfc4ab000 0x4>;
+	};
+
+	msmgpio: pinctrl@fd510000 {
+		compatible = "qcom,msm8994-pinctrl", "qcom,msm8974-pinctrl";
+		reg = <0xfd510000 0x4000>;
+		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	blsp1_uart2: serial@f991e000 {
+		compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+		reg = <0xf991e000 0x1000>;
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+		clock-names = "core", "iface";
+		clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
+			 <&clock_gcc GCC_BLSP1_AHB_CLK>;
+	};
+
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
+	tcsr_mutex_regs: syscon@fd484000 {
+		compatible = "syscon";
+		reg = <0xfd484000 0x2000>;
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
+
+		memory-region = <&smem_mem>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	clock_gcc: qcom,gcc@fc400000 {
+		compatible = "qcom,gcc-8994";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+		reg = <0xfc400000 0x2000>;
+	};
+
+};
+
+#include "msm8994-pins.dtsi"
-- 
2.6.1
