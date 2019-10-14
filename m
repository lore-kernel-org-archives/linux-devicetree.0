From: Wen He <wen.he_1@nxp.com>
Subject: [v3] arm64: dts: ls1028a: Update the property of the DT node dpclk
Date: Mon, 14 Oct 2019 15:13:27 +0800
Message-ID: <20191014071327.28961-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-devel@linux.nxdi.nxp.com, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

Update the property #clock-cells = <1> to #clock-cells = <0> of the
dpclk, since the Display output pixel clock driver provides single
clock output.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v3:
        - according the maintainer correction node name
        - update the commit message

 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 51fa8f57fdac..616b150a15aa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -82,7 +82,7 @@
 	dpclk: clock-controller@f1f0000 {
 		compatible = "fsl,ls1028a-plldig";
 		reg = <0x0 0xf1f0000 0x0 0xffff>;
-		#clock-cells = <1>;
+		#clock-cells = <0>;
 		clocks = <&osc_27m>;
 	};
 
@@ -665,7 +665,7 @@
 		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
 			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "DE", "SE";
-		clocks = <&dpclk 0>, <&clockgen 2 2>, <&clockgen 2 2>,
+		clocks = <&dpclk>, <&clockgen 2 2>, <&clockgen 2 2>,
 			 <&clockgen 2 2>;
 		clock-names = "pxlclk", "mclk", "aclk", "pclk";
 		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
-- 
2.17.1
