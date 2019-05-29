From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 3/6] arm64: dts: k3-am6: Add SERDES DT node
Date: Wed, 29 May 2019 14:48:09 +0530
Message-ID: <20190529091812.20764-4-kishon@ti.com>
References: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529091812.20764-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Add DT node for SERDES0 and SERDES1.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 99d2402455d1..443de60576f8 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
  */
+#include <dt-bindings/phy/phy-am654-serdes.h>
 
 &cbass_main {
 	msmc_ram: sram@70000000 {
@@ -61,6 +62,36 @@
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	serdes0: serdes@900000 {
+		compatible = "ti,phy-am654-serdes";
+		reg = <0x0 0x900000 0x0 0x2000>;
+		reg-names = "serdes";
+		#phy-cells = <2>;
+		power-domains = <&k3_pds 153>;
+		clocks = <&k3_clks 153 4>, <&k3_clks 153 1>, <&serdes1 AM654_SERDES_LO_REFCLK>;
+		clock-output-names = "serdes0_cmu_refclk", "serdes0_lo_refclk", "serdes0_ro_refclk";
+		assigned-clocks = <&k3_clks 153 4>, <&serdes0 AM654_SERDES_CMU_REFCLK>;
+		assigned-clock-parents = <&k3_clks 153 8>, <&k3_clks 153 4>;
+		ti,serdes-clk = <&serdes0_clk>;
+		#clock-cells = <1>;
+		mux-controls = <&serdes_mux 0>;
+	};
+
+	serdes1: serdes@910000 {
+		compatible = "ti,phy-am654-serdes";
+		reg = <0x0 0x910000 0x0 0x2000>;
+		reg-names = "serdes";
+		#phy-cells = <2>;
+		power-domains = <&k3_pds 154>;
+		clocks = <&serdes0 AM654_SERDES_RO_REFCLK>, <&k3_clks 154 1>, <&k3_clks 154 5>;
+		clock-output-names = "serdes1_cmu_refclk", "serdes1_lo_refclk", "serdes1_ro_refclk";
+		assigned-clocks = <&k3_clks 154 5>, <&serdes1 AM654_SERDES_CMU_REFCLK>;
+		assigned-clock-parents = <&k3_clks 154 9>, <&k3_clks 154 5>;
+		ti,serdes-clk = <&serdes1_clk>;
+		#clock-cells = <1>;
+		mux-controls = <&serdes_mux 1>;
+	};
+
 	main_uart0: serial@2800000 {
 		compatible = "ti,am654-uart";
 		reg = <0x00 0x02800000 0x00 0x100>;
@@ -234,6 +265,16 @@
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x00100000 0x1c000>;
 
+		serdes0_clk: serdes_clk@4080 {
+			compatible = "syscon";
+			reg = <0x00004080 0x4>;
+		};
+
+		serdes1_clk: serdes_clk@4090 {
+			compatible = "syscon";
+			reg = <0x00004090 0x4>;
+		};
+
 		serdes_mux: mux-controller {
 			compatible = "mmio-mux";
 			#mux-control-cells = <1>;
-- 
2.17.1
