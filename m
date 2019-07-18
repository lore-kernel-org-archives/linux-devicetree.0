From: Anson.Huang@nxp.com
Subject: [PATCH 3/4] ARM: dts: imx6ul: move GIC to right location in DT
Date: Thu, 18 Jul 2019 17:15:07 +0800
Message-ID: <20190718091508.3248-3-Anson.Huang@nxp.com>
References: <20190718091508.3248-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718091508.3248-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

GIC is inside of SoC from architecture perspective, it should
be located inside of soc node in DT.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6ul.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 81d4b49..da1eae6 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -93,18 +93,6 @@
 		};
 	};
 
-	intc: interrupt-controller@a01000 {
-		compatible = "arm,gic-400", "arm,cortex-a7-gic";
-		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		interrupt-parent = <&intc>;
-		reg = <0x00a01000 0x1000>,
-		      <0x00a02000 0x2000>,
-		      <0x00a04000 0x2000>,
-		      <0x00a06000 0x2000>;
-	};
-
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
@@ -171,6 +159,18 @@
 			reg = <0x00900000 0x20000>;
 		};
 
+		intc: interrupt-controller@a01000 {
+			compatible = "arm,gic-400", "arm,cortex-a7-gic";
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			reg = <0x00a01000 0x1000>,
+			      <0x00a02000 0x2000>,
+			      <0x00a04000 0x2000>,
+			      <0x00a06000 0x2000>;
+		};
+
 		dma_apbh: dma-apbh@1804000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
 			reg = <0x01804000 0x2000>;
-- 
2.7.4
