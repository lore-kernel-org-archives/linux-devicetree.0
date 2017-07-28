From: Alexandru Gagniuc <alex.g@adaptrum.com>
Subject: [PATCH 5/5] ARC: DTS: Add device-tree for Anarion-based development board
Date: Fri, 28 Jul 2017 15:07:05 -0700
Message-ID: <20170728220707.13960-6-alex.g@adaptrum.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170728220707.13960-1-alex.g@adaptrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandru Gagniuc <alex.g@adaptrum.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <vgupta@synopsys.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexandru Gagniuc <alex.g@adaptrum.com>
---
 arch/arc/boot/dts/adaptrum_anarion.dtsi     | 107 ++++++++++++++++++++++++++++
 arch/arc/boot/dts/adaptrum_anarion_fpga.dts |  49 +++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
 create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts

diff --git a/arch/arc/boot/dts/adaptrum_anarion.dtsi b/arch/arc/boot/dts/adaptrum_anarion.dtsi
new file mode 100644
index 0000000..f50958f
--- /dev/null
+++ b/arch/arc/boot/dts/adaptrum_anarion.dtsi
@@ -0,0 +1,107 @@
+/*
+ * (C) Copyright 2017 Adaptrum, Inc.
+ * Written by Alexandru Gagniuc <alex.g@adaptrum.com> for Adaptrum, Inc.
+ * Licensed under the GPLv2 or (at your option) any later version
+ */
+
+#include "skeleton.dtsi"
+
+/ {
+	compatible = "adaptrum,anarion";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc {
+		compatible = "simple-bus";
+		device_type = "soc";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		interrupt-parent = <&core_intc>;
+
+		core_intc: interrupt-controller {
+			compatible = "snps,arc700-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		uart0: serial@f2202100 {
+			compatible = "ns16550";
+			reg = <0xf2202100 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		uart1: serial@f2202200 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xf2202200 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		uart2: serial@f2202300 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xf2202300 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		uart3: serial@f2202400 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0xf2202400 0x20>;
+			interrupts = <8>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clock-frequency = <192000000>;
+			status = "disabled";
+		};
+
+		qspi: qspi@f200f000 {
+			compatible = "adaptrum,anarion-qspi";
+			reg = <0xf200f000 0x1000>,
+			      <0x20000000 0x08000000>;
+
+			interrupts = <10>;
+			status = "disabled";
+		};
+
+		gmac0: ethernet@f2010000 {
+			compatible = "snps,dwmac";
+			reg = <0xf2010000 0x4000>;
+
+			interrupt-parent = <&core_intc>;
+			interrupts = <20>;
+			interrupt-names = "macirq";
+
+			clocks = <&core_clk>;
+			clock-names = "stmmaceth";
+
+			snps,pbl = <32>;
+			status = "disabled";
+		};
+
+		gmac1: ethernet@f2014000 {
+			compatible = "adaptrum,anarion-gmac", "snps,dwmac";
+			reg = <0xf2014000 0x4000>, <0xf2018100 8>;
+
+			interrupt-parent = <&core_intc>;
+			interrupts = <21>;
+			interrupt-names = "macirq";
+
+			clocks = <&core_clk>;
+			clock-names = "stmmaceth";
+
+			snps,pbl = <32>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arc/boot/dts/adaptrum_anarion_fpga.dts b/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
new file mode 100644
index 0000000..36173b2
--- /dev/null
+++ b/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
@@ -0,0 +1,49 @@
+/*
+ * (C) Copyright 2017 Adaptrum, Inc.
+ * Written by Alexandru Gagniuc <alex.g@adaptrum.com> for Adaptrum, Inc.
+ * Licensed under the GPLv2 or (at your option) any later version
+ */
+
+/dts-v1/;
+
+#include "adaptrum_anarion.dtsi"
+
+/ {
+	model = "adaptrum,anarion";
+	compatible = "adaptrum,anarion";
+
+	chosen {
+		bootargs = "earlycon console=ttyS0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	core_clk: core_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <12000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+	flash0: w25q128fvn@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		spi-max-frequency = <70000000>;
+		m25p,fast-read;
+	};
+};
+
+&gmac1 {
+	phy-mode = "rgmii";
+	status = "okay";
+};
-- 
2.9.3
