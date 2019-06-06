From: Anson.Huang@nxp.com
Subject: [PATCH RESEND] arm64: dts: imx8mm: Move gic node into soc node
Date: Thu,  6 Jun 2019 10:39:36 +0800
Message-ID: <20190606023936.25543-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

GIC is inside of SoC from architecture perspective, it should
be located inside of soc node in DT.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Resend the patch based on Shawn's imx/dt64 branch.
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 2128644..dcae59d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -169,15 +169,6 @@
 		clock-output-names = "clk_ext4";
 	};
 
-	gic: interrupt-controller@38800000 {
-		compatible = "arm,gic-v3";
-		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
-		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -810,5 +801,14 @@
 			dma-names = "rx-tx";
 			status = "disabled";
 		};
+
+		gic: interrupt-controller@38800000 {
+			compatible = "arm,gic-v3";
+			reg = <0x38800000 0x10000>, /* GIC Dist */
+			      <0x38880000 0xc0000>; /* GICR (RD_base + SGI_base) */
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.7.4
