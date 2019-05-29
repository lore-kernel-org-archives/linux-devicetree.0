From: yibin.gong@nxp.com
Subject: [PATCH v3 8/8] ARM: dts: imx7ulp: add edma device node
Date: Wed, 29 May 2019 17:08:48 +0800
Message-ID: <20190529090848.34350-9-yibin.gong@nxp.com>
References: <20190529090848.34350-1-yibin.gong@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529090848.34350-1-yibin.gong@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, mark.rutland@arm.com, vkoul@kernel.org, dan.j.williams@intel.com
Cc: linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Robin Gong <yibin.gong@nxp.com>

Add edma device node in dts.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
---
 arch/arm/boot/dts/imx7ulp.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
index d6b7110..b4f7adf 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -100,6 +100,34 @@
 		reg = <0x40000000 0x800000>;
 		ranges;
 
+		edma1: dma-controller@40080000 {
+			#dma-cells = <2>;
+			compatible = "fsl,imx7ulp-edma";
+			reg = <0x40080000 0x2000>,
+				<0x40210000 0x1000>;
+			dma-channels = <32>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "dma", "dmamux0";
+			clocks = <&pcc2 IMX7ULP_CLK_DMA1>,
+				 <&pcc2 IMX7ULP_CLK_DMA_MUX1>;
+		};
+
 		lpuart4: serial@402d0000 {
 			compatible = "fsl,imx7ulp-lpuart";
 			reg = <0x402d0000 0x1000>;
-- 
2.7.4
