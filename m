From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v7 5/6] arm: dts: mt2712: Add clock controller device nodes
Date: Tue, 28 Nov 2017 15:28:21 +0800
Message-ID: <1511854102-23195-7-git-send-email-weiyi.lu@mediatek.com>
References: <1511854102-23195-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511854102-23195-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add clock controller nodes for MT2712, include topckgen, infracfg,
pericfg, mcucfg and apmixedsys. This patch also add six oscillators that
provide clocks for MT2712.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 115 ++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 5d4e406..5703793 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -5,6 +5,7 @@
  * SPDX-License-Identifier: (GPL-2.0 OR MIT)
  */
 
+#include <dt-bindings/clock/mt2712-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -98,6 +99,48 @@
 		#clock-cells = <0>;
 	};
 
+	clk26m: oscillator@0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	clk32k: oscillator@1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "clk32k";
+	};
+
+	clkfpc: oscillator@2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+		clock-output-names = "clkfpc";
+	};
+
+	clkaud_ext_i_0: oscillator@3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <6500000>;
+		clock-output-names = "clkaud_ext_i_0";
+	};
+
+	clkaud_ext_i_1: oscillator@4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <196608000>;
+		clock-output-names = "clkaud_ext_i_1";
+	};
+
+	clkaud_ext_i_2: oscillator@5 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <180633600>;
+		clock-output-names = "clkaud_ext_i_2";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
@@ -111,6 +154,24 @@
 			      (GIC_CPU_MASK_RAW(0x13) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	topckgen: syscon@10000000 {
+		compatible = "mediatek,mt2712-topckgen", "syscon";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	infracfg: syscon@10001000 {
+		compatible = "mediatek,mt2712-infracfg", "syscon";
+		reg = <0 0x10001000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	pericfg: syscon@10003000 {
+		compatible = "mediatek,mt2712-pericfg", "syscon";
+		reg = <0 0x10003000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	uart5: serial@1000f000 {
 		compatible = "mediatek,mt2712-uart",
 			     "mediatek,mt6577-uart";
@@ -121,6 +182,18 @@
 		status = "disabled";
 	};
 
+	apmixedsys: syscon@10209000 {
+		compatible = "mediatek,mt2712-apmixedsys", "syscon";
+		reg = <0 0x10209000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	mcucfg: syscon@10220000 {
+		compatible = "mediatek,mt2712-mcucfg", "syscon";
+		reg = <0 0x10220000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	sysirq: interrupt-controller@10220a80 {
 		compatible = "mediatek,mt2712-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -192,5 +265,47 @@
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
+
+	mfgcfg: syscon@13000000 {
+		compatible = "mediatek,mt2712-mfgcfg", "syscon";
+		reg = <0 0x13000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	mmsys: syscon@14000000 {
+		compatible = "mediatek,mt2712-mmsys", "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	imgsys: syscon@15000000 {
+		compatible = "mediatek,mt2712-imgsys", "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	bdpsys: syscon@15010000 {
+		compatible = "mediatek,mt2712-bdpsys", "syscon";
+		reg = <0 0x15010000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vdecsys: syscon@16000000 {
+		compatible = "mediatek,mt2712-vdecsys", "syscon";
+		reg = <0 0x16000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vencsys: syscon@18000000 {
+		compatible = "mediatek,mt2712-vencsys", "syscon";
+		reg = <0 0x18000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	jpgdecsys: syscon@19000000 {
+		compatible = "mediatek,mt2712-jpgdecsys", "syscon";
+		reg = <0 0x19000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
 };
 
-- 
1.9.1
