From: Wen He <wen.he_1@nxp.com>
Subject: [v2 1/2] arm64: dts: ls1028a: Update the clock providers for the Mali DP500
Date: Fri, 20 Sep 2019 16:34:18 +0800
Message-ID: <20190920083419.5092-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-devel@linux.nxdi.nxp.com, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

In order to maximise performance of the LCD Controller's 64-bit AXI
bus, for any give speed bin of the device, the AXI master interface
clock(ACLK) clock can be up to CPU_frequency/2, which is already
capable of optimal performance. In general, ACLK is always expected
to be equal to CPU_frequency/2. APB slave interface clock(PCLK) and
Main processing clock(PCLK) both are tied to the same clock as ACLK.

This change followed the LS1028A Architecture Specification Manual.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v2:
        - add details commit description for this change. 
        - v1: Link: https://lore.kernel.org/patchwork/patch/1119145/

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 72b9a75976a1..51fa8f57fdac 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -86,20 +86,6 @@
 		clocks = <&osc_27m>;
 	};
 
-	aclk: clock-axi {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <650000000>;
-		clock-output-names= "aclk";
-	};
-
-	pclk: clock-apb {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <650000000>;
-		clock-output-names= "pclk";
-	};
-
 	reboot {
 		compatible ="syscon-reboot";
 		regmap = <&dcfg>;
@@ -679,7 +665,8 @@
 		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
 			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "DE", "SE";
-		clocks = <&dpclk 0>, <&aclk>, <&aclk>, <&pclk>;
+		clocks = <&dpclk 0>, <&clockgen 2 2>, <&clockgen 2 2>,
+			 <&clockgen 2 2>;
 		clock-names = "pxlclk", "mclk", "aclk", "pclk";
 		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
 		arm,malidp-arqos-value = <0xd000d000>;
-- 
2.17.1
