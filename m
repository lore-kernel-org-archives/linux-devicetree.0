From: Wen He <wen.he_1@nxp.com>
Subject: [v1 3/3] arm64: dts: ls1028a: Add properties node for Display output pixel clock
Date: Mon, 12 Aug 2019 18:02:24 +0800
Message-ID: <20190812100224.34502-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: leoyang.li@nxp.com, liviu.dudau@arm.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

The LS1028A has a clock domain PXLCLK0 used for the Display output
interface in the display core, independent of the system bus frequency,
for flexible clock design. This display core has its own pixel clock.

This patch enable the pixel clock provider on the LS1028A.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 2d31e1c09e74..0c54ba3214af 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -70,11 +70,18 @@
 		clock-output-names = "sysclk";
 	};
 
-	dpclk: clock-dp {
+	osc_27m: clock-osc-27m {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
-		clock-output-names= "dpclk";
+		clock-output-names = "phy_27m";
+	};
+
+	dpclk: clock-controller@f1f0000 {
+		compatible = "fsl,ls1028a-plldig";
+		reg = <0x0 0xf1f0000 0x0 0xffff>;
+		#clock-cells = <1>;
+		clocks = <&osc_27m>;
 	};
 
 	aclk: clock-axi {
@@ -557,7 +564,7 @@
 		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
 			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "DE", "SE";
-		clocks = <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
+		clocks = <&dpclk 0>, <&aclk>, <&aclk>, <&pclk>;
 		clock-names = "pxlclk", "mclk", "aclk", "pclk";
 		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
 		arm,malidp-arqos-value = <0xd000d000>;
-- 
2.17.1
