From: Peng Ma <peng.ma@nxp.com>
Subject: [PATCH 3/3] arm64: dts: ls1046a: add qdma device tree nodes
Date: Thu,  6 Dec 2018 19:18:23 +0800
Message-ID: <20181206111823.45985-3-peng.ma@nxp.com>
References: <20181206111823.45985-1-peng.ma@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206111823.45985-1-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, shawnguo@kernel.org
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Ma <peng.ma@nxp.com>, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

add the qDMA device tree nodes for LS1046A devices.

Signed-off-by: Wen He <wen.he_1@nxp.com>
Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
change in v12:
	- used GIC_SPI and IRQ_TYPE_LEVEL_HIGH to instead immediate
	number

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 51cbd50..8fcce79 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -704,6 +704,27 @@
 					<0000 0 0 4 &gic GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		qdma: dma-controller@8380000 {
+			compatible = "fsl,ls1046a-qdma", "fsl,ls1021a-qdma";
+			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
+			      <0x0 0x8390000 0x0 0x10000>, /* Status regs */
+			      <0x0 0x83a0000 0x0 0x40000>; /* Block regs */
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "qdma-error", "qdma-queue0",
+				"qdma-queue1", "qdma-queue2", "qdma-queue3";
+			dma-channels = <8>;
+			block-number = <1>;
+			block-offset = <0x10000>;
+			fsl,dma-queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 	};
 
 	reserved-memory {
-- 
1.7.1
