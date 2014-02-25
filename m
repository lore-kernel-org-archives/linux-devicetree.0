From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: keystone: add support for K2 Lamarr SoC and EVM
Date: Tue, 25 Feb 2014 16:50:34 -0500
Message-ID: <1393365035-20083-4-git-send-email-santosh.shilimkar@ti.com>
References: <1393365035-20083-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393365035-20083-1-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>

Keystone2 Lamarr (K2L) is a dual Cortex A15 core based SoC with
4 DSPs. It has standard peripherals such as i2c, spi, uart, timer,
pcie etc., similar to k2hk, but different set of wireless hardware.
This patch add support for k2 Lamarr SoC and EVM. This re-uses the
common keystone.dtsi to include common bindings across the various
k2 devices.

Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2l-clocks.dtsi |  267 +++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/k2l-evm.dts     |   37 +++++
 arch/arm/boot/dts/k2l.dtsi        |   55 ++++++++
 3 files changed, 359 insertions(+)
 create mode 100644 arch/arm/boot/dts/k2l-clocks.dtsi
 create mode 100644 arch/arm/boot/dts/k2l-evm.dts
 create mode 100644 arch/arm/boot/dts/k2l.dtsi

diff --git a/arch/arm/boot/dts/k2l-clocks.dtsi b/arch/arm/boot/dts/k2l-clocks.dtsi
new file mode 100644
index 0000000..7764dc9
--- /dev/null
+++ b/arch/arm/boot/dts/k2l-clocks.dtsi
@@ -0,0 +1,267 @@
+/*
+ * Copyright 2013-2014 Texas Instruments, Inc.
+ *
+ * Keystone 2 lamarr SoC clock nodes
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+clocks {
+	armpllclk: armpllclk@2620370 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,pll-clock";
+		clocks = <&refclksys>;
+		clock-output-names = "arm-pll-clk";
+		reg = <0x02620370 4>;
+		reg-names = "control";
+	};
+
+	mainpllclk: mainpllclk@2310110 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,main-pll-clock";
+		clocks = <&refclksys>;
+		reg = <0x02620350 4>, <0x02310110 4>;
+		reg-names = "control", "multiplier";
+		fixed-postdiv = <2>;
+	};
+
+	papllclk: papllclk@2620358 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,pll-clock";
+		clocks = <&refclksys>;
+		clock-output-names = "pa-pll-clk";
+		reg = <0x02620358 4>;
+		reg-names = "control";
+	};
+
+	ddr3apllclk: ddr3apllclk@2620360 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,pll-clock";
+		clocks = <&refclksys>;
+		clock-output-names = "ddr-3a-pll-clk";
+		reg = <0x02620360 4>;
+		reg-names = "control";
+	};
+
+	clkdfeiqnsys: clkdfeiqnsys {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk12>;
+		clock-output-names = "dfe";
+		reg-names = "control", "domain";
+		reg = <0x02350004 0xb00>, <0x02350000 0x400>;
+		domain-id = <0>;
+	};
+
+	clkpcie1: clkpcie1 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk12>;
+		clock-output-names = "pcie";
+		reg = <0x0235002c 0xb00>, <0x02350000 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <4>;
+	};
+
+	clkgem1: clkgem1 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk1>;
+		clock-output-names = "gem1";
+		reg = <0x02350040 0xb00>, <0x02350024 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <9>;
+	};
+
+	clkgem2: clkgem2 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk1>;
+		clock-output-names = "gem2";
+		reg = <0x02350044 0xb00>, <0x02350028 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <10>;
+	};
+
+	clkgem3: clkgem3 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk1>;
+		clock-output-names = "gem3";
+		reg = <0x02350048 0xb00>, <0x0235002c 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <11>;
+	};
+
+	clktac: clktac {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "tac";
+		reg = <0x02350064 0xb00>, <0x02350044 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <17>;
+	};
+
+	clkrac: clkrac {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "rac";
+		reg = <0x02350068 0xb00>, <0x02350044 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <17>;
+	};
+
+	clkdfepd0: clkdfepd0 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "dfe-pd0";
+		reg = <0x0235006c 0xb00>, <0x02350044 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <18>;
+	};
+
+	clkfftc0: clkfftc0 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "fftc-0";
+		reg = <0x02350070 0xb00>, <0x0235004c 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <19>;
+	};
+
+	clkosr: clkosr {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "osr";
+		reg = <0x02350088 0xb00>, <0x0235004c 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <21>;
+	};
+
+	clktcp3d0: clktcp3d0 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "tcp3d-0";
+		reg = <0x0235008c 0xb00>, <0x02350058 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <22>;
+	};
+
+	clktcp3d1: clktcp3d1 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "tcp3d-1";
+		reg = <0x02350094 0xb00>, <0x02350058 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <23>;
+	};
+
+	clkvcp0: clkvcp0 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "vcp-0";
+		reg = <0x0235009c 0xb00>, <0x02350060 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <24>;
+	};
+
+	clkvcp1: clkvcp1 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "vcp-1";
+		reg = <0x023500a0 0xb00>, <0x02350060 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <24>;
+	};
+
+	clkvcp2: clkvcp2 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "vcp-2";
+		reg = <0x023500a4 0xb00>, <0x02350060 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <24>;
+	};
+
+	clkvcp3: clkvcp3 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "vcp-3";
+		reg = <0x0235000a8 0xb00>, <0x02350060 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <24>;
+	};
+
+	clkbcp: clkbcp {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "bcp";
+		reg = <0x023500bc 0xb00>, <0x02350068 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <26>;
+	};
+
+	clkdfepd1: clkdfepd1 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "dfe-pd1";
+		reg = <0x023500c0 0xb00>, <0x02350044 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <27>;
+	};
+
+	clkfftc1: clkfftc1 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "fftc-1";
+		reg = <0x023500c4 0xb00>, <0x023504c0 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <28>;
+	};
+
+	clkiqnail: clkiqnail {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&chipclk13>;
+		clock-output-names = "iqn-ail";
+		reg = <0x023500c8 0xb00>, <0x0235004c 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <29>;
+	};
+
+	clkuart2: clkuart2 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&clkmodrst0>;
+		clock-output-names = "uart2";
+		reg = <0x02350000 0xb00>, <0x02350000 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <0>;
+	};
+
+	clkuart3: clkuart3 {
+		#clock-cells = <0>;
+		compatible = "ti,keystone,psc-clock";
+		clocks = <&clkmodrst0>;
+		clock-output-names = "uart3";
+		reg = <0x02350000 0xb00>, <0x02350000 0x400>;
+		reg-names = "control", "domain";
+		domain-id = <0>;
+	};
+};
diff --git a/arch/arm/boot/dts/k2l-evm.dts b/arch/arm/boot/dts/k2l-evm.dts
new file mode 100644
index 0000000..ebf316a
--- /dev/null
+++ b/arch/arm/boot/dts/k2l-evm.dts
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2014 Texas Instruments, Inc.
+ *
+ * Keystone 2 Lamarr EVM device tree
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+/dts-v1/;
+
+#include "keystone.dtsi"
+#include "k2l.dtsi"
+
+/ {
+	compatible =  "ti,k2l-evm";
+	model = "Texas Instruments Keystone 2 Lamarr EVM";
+
+	soc {
+		clocks {
+			refclksys: refclksys {
+				#clock-cells = <0>;
+				compatible = "fixed-clock";
+				clock-frequency = <122880000>;
+				clock-output-names = "refclk-sys";
+			};
+		};
+	};
+};
+
+&usb_phy {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/k2l.dtsi b/arch/arm/boot/dts/k2l.dtsi
new file mode 100644
index 0000000..1f7f479
--- /dev/null
+++ b/arch/arm/boot/dts/k2l.dtsi
@@ -0,0 +1,55 @@
+/*
+ * Copyright 2014 Texas Instruments, Inc.
+ *
+ * Keystone 2 Lamarr SoC specific device tree
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&gic>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a15";
+			device_type = "cpu";
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a15";
+			device_type = "cpu";
+			reg = <1>;
+		};
+	};
+
+	soc {
+
+		/include/ "k2l-clocks.dtsi"
+
+		uart2: serial@02348400 {
+			compatible = "ns16550a";
+			current-speed = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			reg = <0x02348400 0x100>;
+			clocks	= <&clkuart2>;
+			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>;
+		};
+
+		uart3:	serial@02348800 {
+			compatible = "ns16550a";
+			current-speed = <115200>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			reg = <0x02348800 0x100>;
+			clocks	= <&clkuart3>;
+			interrupts = <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
