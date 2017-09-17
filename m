From: "Marty E. Plummer" <hanetzer@startmail.com>
Subject: [RFC RESEND 3/3] arm: dts: add Hi3521A dts
Date: Sun, 17 Sep 2017 03:23:27 -0500
Message-ID: <20170917082327.10058-4-hanetzer@startmail.com>
References: <20170917082327.10058-1-hanetzer@startmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170917082327.10058-1-hanetzer@startmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, xuejiancheng@hisilicon.com, leo.yan@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, wenpan@hisilicon.com, robh+dt@kernel.org, linux@armlinux.org.uk, sboyd@codeaurora.org, xuwei5@hisilicon.com, zhangfei.gao@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, "Marty E. Plummer" <hanetzer@startmail.com>
List-Id: devicetree@vger.kernel.org

Add hi3521a.dtsi and hi3521a-rs-dm290e.dts for RaySharp CCTV systems,
marketed under the name Samsung SDR-B74301N

Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
---
 arch/arm/boot/dts/Makefile              |   2 +
 arch/arm/boot/dts/hi3521a-rs-dm290e.dts |  52 ++++++
 arch/arm/boot/dts/hi3521a.dtsi          | 310 ++++++++++++++++++++++++++++++++
 3 files changed, 364 insertions(+)
 create mode 100644 arch/arm/boot/dts/hi3521a-rs-dm290e.dts
 create mode 100644 arch/arm/boot/dts/hi3521a.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index faf46abaa4a2..e7b9b5dde20f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-sq201.dtb \
 	gemini-wbd111.dtb \
 	gemini-wbd222.dtb
+dtb-$(CONFIG_ARCH_HI3521A) += \
+	hi3521a-rs-dm290e.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += \
 	hi3620-hi4511.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += \
diff --git a/arch/arm/boot/dts/hi3521a-rs-dm290e.dts b/arch/arm/boot/dts/hi3521a-rs-dm290e.dts
new file mode 100644
index 000000000000..b32c8392c93f
--- /dev/null
+++ b/arch/arm/boot/dts/hi3521a-rs-dm290e.dts
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2017 Marty Plummer <hanetzer@startmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 3 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+/dts-v1/;
+#include "hi3521a.dtsi"
+
+/ {
+	model = "RaySharp RS-DM-290E DVR Board";
+	compatible = "hisilicon,hi3521a";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0xf00000>;
+	};
+};
+
+&hi_sfc {
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&dual_timer0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/hi3521a.dtsi b/arch/arm/boot/dts/hi3521a.dtsi
new file mode 100644
index 000000000000..2af746fdec46
--- /dev/null
+++ b/arch/arm/boot/dts/hi3521a.dtsi
@@ -0,0 +1,310 @@
+/*
+ * Copyright (C) 2017 Marty Plummer <hanetzer@startmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 3 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <dt-bindings/clock/hi3521a-clock.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	chosen { };
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0>;
+		};
+	};
+
+	hi_sfc: spi-nor-controller@10000000 {
+		compatible = "hisilicon,hi3521a-spi-nor", "hisilicon,fmc-spi-nor";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x10000000 0x10000>, <0x14000000 0x1000000>;
+		reg-names = "control", "memory";
+		clocks = <&crg HI3521A_FMC_CLK>;
+		status = "disabled";
+	};
+
+	gic: interrupt-controller@10300000 {
+		compatible = "arm,pl390";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x10301000 0x1000>, <0x10302000 0x1000>;
+	};
+
+	clk_3m: clk_3m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <3000000>;
+	};
+
+	crg: clock-reset-controller@12040000 {
+		compatible = "hisilicon,hi3521a-crg";
+		#clock-cells = <1>;
+		#reset-cells = <2>;
+		reg = <0x12040000 0x10000>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		dmac: dma@10060000 {
+			compatible = "arm,pl080", "arm,primecell";
+			reg = <0x10060000 0x1000>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		dual_timer0: timer@12000000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x12000000 0x1000>;
+			clocks = <&clk_3m>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+
+		dual_timer1: timer@12010000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x12010000 0x1000>;
+			clocks = <&clk_3m>;
+			clock-name = "apb_pclk";
+			status = "disabled";
+		};
+
+		dual_timer2: timer@12020000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x12020000 0x1000>;
+			clocks = <&clk_3m>;
+			clock-name = "apb_pclk";
+			status = "disabled";
+		};
+
+		dual_timer3: timer@12030000 {
+			compatible = "arm,sp804", "arm,primecell";
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x12030000 0x1000>;
+			clocks = <&clk_3m>;
+			clock-name = "apb_pclk";
+			status = "disabled";
+		};
+
+		wdt0: watchdog@12070000 {
+			compatible = "arm,sp805", "arm,primecell";
+			arm,primecell-periphid = <0x00141805>;
+			reg = <0x12070000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_3m>;
+			clock-names = "apb_pclk";
+		};
+
+		uart0: serial@12080000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12080000 0x1000>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HI3521A_UART0_CLK>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@12090000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x12090000 0x1000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HI3521A_UART1_CLK>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@120a0000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x120a0000 0x1000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg HI3521A_UART2_CLK>;
+			clock-names = "apb_pclk";
+			status = "disabled";
+		};
+
+		gpio0: gpio@12150000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12150000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@12160000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12160000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio@12170000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12170000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio3: gpio@12180000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12180000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio4: gpio@12190000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12190000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio5: gpio@121a0000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x121a0000 0x1000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio6: gpio@121b0000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x121b0000 0x1000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio7: gpio@121c0000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x121c0000 0x1000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio8: gpio@121d0000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x121d0000 0x1000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio9: gpio@121e0000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x121e0000 0x1000>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio10: gpio@121f0000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x121f0000 0x1000>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio11: gpio@12200000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12200000 0x1000>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio12: gpio@12210000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12210000 0x1000>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio13: gpio@12220000 {
+			compatible = "arm,pl061", "arm,primecell";
+			reg = <0x12220000 0x1000>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.14.1

