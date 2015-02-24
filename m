From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] ARM64: Add new Xilinx ZynqMP SoC
Date: Tue, 24 Feb 2015 08:56:16 +0100
Message-ID: <8ac3037c175711dec0adcd0d898be7d9722e0ed0.1424764548.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Robert Richter <rrichter@cavium.com>, Mark Brown <broonie@linaro.org>, Eddie Huang <eddie.huang@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Initial version of device tree for Xilinx ZynqMP SoC.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
---

 arch/arm64/Kconfig                          |   5 +
 arch/arm64/boot/dts/Makefile                |   1 +
 arch/arm64/boot/dts/xilinx/Makefile         |   5 +
 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts |  46 +++++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 301 ++++++++++++++++++++=
++++++++
 arch/arm64/configs/defconfig                |   1 +
 6 files changed, 359 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/Makefile
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp.dtsi

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1b8e97331ffb..9f805cf2e0b0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -228,6 +228,11 @@ config ARCH_XGENE
 	help
 	  This enables support for AppliedMicro X-Gene SOC Family
=20
+config ARCH_ZYNQMP
+	bool "Xilinx ZynqMP Family"
+	help
+	  This enables support for Xilinx ZynqMP Family
+
 endmenu
=20
 menu "Bus support"
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefil=
e
index e0350caf049e..ff088ec6ca5f 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -5,5 +5,6 @@ dts-dirs +=3D cavium
 dts-dirs +=3D exynos
 dts-dirs +=3D freescale
 dts-dirs +=3D mediatek
+dts-dirs +=3D xilinx
=20
 subdir-y	:=3D $(dts-dirs)
diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/=
xilinx/Makefile
new file mode 100644
index 000000000000..ae16427f6a4a
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/Makefile
@@ -0,0 +1,5 @@
+dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-ep108.dtb
+
+always		:=3D $(dtb-y)
+subdir-y	:=3D $(dts-dirs)
+clean-files	:=3D *.dtb
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/b=
oot/dts/xilinx/zynqmp-ep108.dts
new file mode 100644
index 000000000000..121a47fb4043
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -0,0 +1,46 @@
+/*
+ * dts file for Xilinx ZynqMP ep108 development board
+ *
+ * (c) Copyright 2014 - 2015, Xilinx, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+/dts-v1/;
+
+/include/ "zynqmp.dtsi"
+
+/ {
+	model =3D "ZynqMP EP108";
+
+	aliases {
+		serial0 =3D &uart0;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x40000000>;
+	};
+};
+
+&gem0 {
+	status =3D "okay";
+	phy-handle =3D <&phy0>;
+	phy-mode =3D "rgmii-id";
+	phy0: phy@0{
+		reg =3D <0>;
+		max-speed =3D <100>;
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
+
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/d=
ts/xilinx/zynqmp.dtsi
new file mode 100644
index 000000000000..d8402fd2dffa
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -0,0 +1,301 @@
+/*
+ * dts file for Xilinx ZynqMP
+ *
+ * (c) Copyright 2014 - 2015, Xilinx, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+/ {
+	compatible =3D "xlnx,zynqmp";
+	#address-cells =3D <2>;
+	#size-cells =3D <1>;
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		cpu@0 {
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			device_type =3D "cpu";
+			enable-method =3D "psci";
+			reg =3D <0x0>;
+		};
+
+		cpu@1 {
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			device_type =3D "cpu";
+			enable-method =3D "psci";
+			reg =3D <0x1>;
+		};
+
+		cpu@2 {
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			device_type =3D "cpu";
+			enable-method =3D "psci";
+			reg =3D <0x2>;
+		};
+
+		cpu@3 {
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			device_type =3D "cpu";
+			enable-method =3D "psci";
+			reg =3D <0x3>;
+		};
+	};
+
+	psci {
+		compatible =3D "arm,psci-0.2";
+		method =3D "smc";
+	};
+
+	pmu {
+		compatible =3D "arm,armv8-pmuv3";
+		interrupts =3D <0 143 4>,
+			     <0 144 4>,
+			     <0 145 4>,
+			     <0 146 4>;
+	};
+
+	amba_apu {
+		compatible =3D "simple-bus";
+		#address-cells =3D <2>;
+		#size-cells =3D <1>;
+		ranges;
+
+		timer {
+			compatible =3D "arm,armv8-timer";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <1 13 0xff01>,
+				     <1 14 0xff01>,
+				     <1 11 0xff01>,
+				     <1 10 0xff01>;
+		};
+
+		gic: interrupt-controller@f9010000 {
+			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+			#interrupt-cells =3D <3>;
+			reg =3D <0x0 0xf9010000 0x10000>,
+			      <0x0 0xf9020000 0x20000>,
+			      <0x0 0xf9040000 0x20000>,
+			      <0x0 0xf9060000 0x20000>;
+			interrupt-controller;
+		};
+	};
+
+	amba {
+		compatible =3D "simple-bus";
+		#address-cells =3D <2>;
+		#size-cells =3D <1>;
+		ranges;
+
+		misc_clk: misc_clk {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <25000000>;
+		};
+
+		ttc0: timer@ff110000 {
+			compatible =3D "cdns,ttc";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 36 4>, <0 37 4>, <0 38 4>;
+			reg =3D <0x0 0xff110000 0x1000>;
+			clocks =3D <&misc_clk>;
+			timer-width =3D <32>;
+		};
+
+		ttc1: timer@ff120000 {
+			compatible =3D "cdns,ttc";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 39 4>, <0 40 4>, <0 41 4>;
+			reg =3D <0x0 0xff120000 0x1000>;
+			clocks =3D <&misc_clk>;
+			timer-width =3D <32>;
+		};
+
+		ttc2: timer@ff130000 {
+			compatible =3D "cdns,ttc";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 42 4>, <0 43 4>, <0 44 4>;
+			reg =3D <0x0 0xff130000 0x1000>;
+			clocks =3D <&misc_clk>;
+			timer-width =3D <32>;
+		};
+
+		ttc3: timer@ff140000 {
+			compatible =3D "cdns,ttc";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 45 4>, <0 46 4>, <0 47 4>;
+			reg =3D <0x0 0xff140000 0x1000>;
+			clocks =3D <&misc_clk>;
+			timer-width =3D <32>;
+		};
+
+		uart0: serial@ff000000 {
+			compatible =3D "cdns,uart-r1p8";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 21 4>;
+			reg =3D <0x0 0xff000000 0x1000>;
+			clock-names =3D "uart_clk", "pclk";
+			clocks =3D <&misc_clk &misc_clk>;
+		};
+
+		uart1: serial@ff010000 {
+			compatible =3D "cdns,uart-r1p8";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 22 4>;
+			reg =3D <0x0 0xff010000 0x1000>;
+			clock-names =3D "uart_clk", "pclk";
+			clocks =3D <&misc_clk &misc_clk>;
+		};
+
+		gpio: gpio@ff0a0000 {
+			compatible =3D "xlnx,zynq-gpio-1.0";
+			status =3D "disabled";
+			#gpio-cells =3D <0x2>;
+			clocks =3D <&misc_clk>;
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 16 4>;
+			reg =3D <0x0 0xff0a0000 0x1000>;
+		};
+
+		gem0: ethernet@ff0b0000 {
+			compatible =3D "cdns,gem";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 57 4>;
+			reg =3D <0x0 0xff0b0000 0x1000>;
+			clock-names =3D "pclk", "hclk", "tx_clk";
+			clocks =3D <&misc_clk>, <&misc_clk>, <&misc_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		gem1: ethernet@ff0c0000 {
+			compatible =3D "cdns,gem";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 59 4>;
+			reg =3D <0x0 0xff0c0000 0x1000>;
+			clock-names =3D "pclk", "hclk", "tx_clk";
+			clocks =3D <&misc_clk>, <&misc_clk>, <&misc_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		gem2: ethernet@ff0d0000 {
+			compatible =3D "cdns,gem";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 61 4>;
+			reg =3D <0x0 0xff0d0000 0x1000>;
+			clock-names =3D "pclk", "hclk", "tx_clk";
+			clocks =3D <&misc_clk>, <&misc_clk>, <&misc_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		gem3: ethernet@ff0e0000 {
+			compatible =3D "cdns,gem";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 63 4>;
+			reg =3D <0x0 0xff0e0000 0x1000>;
+			clock-names =3D "pclk", "hclk", "tx_clk";
+			clocks =3D <&misc_clk>, <&misc_clk>, <&misc_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		spi0: spi@ff040000 {
+			compatible =3D "cdns,spi-r1p6";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 19 4>;
+			reg =3D <0x0 0xff040000 0x1000>;
+			clock-names =3D "ref_clk", "pclk";
+			clocks =3D <&misc_clk &misc_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		spi1: spi@ff050000 {
+			compatible =3D "cdns,spi-r1p6";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 20 4>;
+			reg =3D <0x0 0xff050000 0x1000>;
+			clock-names =3D "ref_clk", "pclk";
+			clocks =3D <&misc_clk &misc_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		i2c_clk: i2c_clk {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0x0>;
+			clock-frequency =3D <111111111>;
+		};
+
+		i2c0: i2c@ff020000 {
+			compatible =3D "cdns,i2c-r1p10";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 17 4>;
+			reg =3D <0x0 0xff020000 0x1000>;
+			clocks =3D <&i2c_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		i2c1: i2c@ff030000 {
+			compatible =3D "cdns,i2c-r1p10";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 18 4>;
+			reg =3D <0x0 0xff030000 0x1000>;
+			clocks =3D <&i2c_clk>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		sdhci0: sdhci@ff160000 {
+			compatible =3D "arasan,sdhci-8.9a";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 48 4>;
+			reg =3D <0x0 0xff160000 0x1000>;
+			clock-names =3D "clk_xin", "clk_ahb";
+			clocks =3D <&misc_clk>, <&misc_clk>;
+		};
+
+		sdhci1: sdhci@ff170000 {
+			compatible =3D "arasan,sdhci-8.9a";
+			status =3D "disabled";
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 49 4>;
+			reg =3D <0x0 0xff170000 0x1000>;
+			clock-names =3D "clk_xin", "clk_ahb";
+			clocks =3D <&misc_clk>, <&misc_clk>;
+		};
+
+		watchdog0: watchdog@fd4d0000 {
+			compatible =3D "cdns,wdt-r1p2";
+			status =3D "disabled";
+			clocks=3D <&misc_clk>;
+			interrupt-parent =3D <&gic>;
+			interrupts =3D <0 52 1>;
+			reg =3D <0x0 0xfd4d0000 0x1000>;
+			timeout-sec =3D <10>;
+		};
+	};
+};
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
index be1f12a5a5f0..4ffe4c951416 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -36,6 +36,7 @@ CONFIG_ARCH_MEDIATEK=3Dy
 CONFIG_ARCH_THUNDER=3Dy
 CONFIG_ARCH_VEXPRESS=3Dy
 CONFIG_ARCH_XGENE=3Dy
+CONFIG_ARCH_ZYNQMP=3Dy
 CONFIG_PCI=3Dy
 CONFIG_PCI_MSI=3Dy
 CONFIG_PCI_XGENE=3Dy
--=20
1.8.2.3
