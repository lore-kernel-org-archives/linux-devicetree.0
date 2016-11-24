From: Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH v2 3/3] arm64: dts: r8a7796: Add CAN FD support
Date: Thu, 24 Nov 2016 16:13:41 +0000
Message-ID: <1480004021-4037-4-git-send-email-chris.paterson2@renesas.com>
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
 <1480004021-4037-1-git-send-email-chris.paterson2@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1480004021-4037-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <chris.paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

Adds CAN FD controller node for r8a7796.

Based on a patch for r8a7795 by Ramesh Shanmugasundaram.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 47fa29c..1ed1886 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -392,6 +392,30 @@
 			status = "disabled";
 		};
 
+		canfd: can@e66c0000 {
+			compatible = "renesas,r8a7796-canfd",
+				     "renesas,rcar-gen3-canfd";
+			reg = <0 0xe66c0000 0 0x8000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				   <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 914>,
+			       <&cpg CPG_CORE R8A7796_CLK_CANFD>,
+			       <&can_clk>;
+			clock-names = "fck", "canfd", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R8A7796_CLK_CANFD>;
+			assigned-clock-rates = <40000000>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+
+			channel1 {
+				status = "disabled";
+			};
+		};
+
 		scif2: serial@e6e88000 {
 			compatible = "renesas,scif-r8a7796",
 				     "renesas,rcar-gen3-scif", "renesas,scif";
-- 
1.9.1
