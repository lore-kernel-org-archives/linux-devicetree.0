Return-Path: <SRS0=oVvL=IM=nxp.com=wen.he_1@kernel.org>
From: Wen He <wen.he_1@nxp.com>
Subject: [v5 4/6] arm64: dts: ls1043a: add qdma device tree nodes
Date: Fri, 25 May 2018 19:19:18 +0800
Message-ID: <20180525111920.24498-4-wen.he_1@nxp.com>
In-Reply-To: <20180525111920.24498-1-wen.he_1@nxp.com>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, wen.he_1@nxp.com
List-ID: <devicetree@vger.kernel.org>

add the qDMA device tree nodes for LS1043A devices.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v5:
	- Replace dts node variable 'queues' to 'fsl,queues' that add vendor prefix

change in v4:
	- no

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 1109f22..48f9165 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -673,6 +673,21 @@
 			dma-coherent;
 		};
 
+		qdma: dma-controller@8380000 {
+			compatible = "fsl,ls1021a-qdma", "fsl,ls1043a-qdma";
+			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
+				<0x0 0x8390000 0x0 0x10000>, /* Status regs */
+				<0x0 0x83a0000 0x0 0x40000>; /* Block regs */
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "qdma-error", "qdma-queue";
+			dma-channels = <8>;
+			fsl,queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 		msi1: msi-controller1@1571000 {
 			compatible = "fsl,ls1043a-msi";
 			reg = <0x0 0x1571000 0x0 0x8>;
-- 
1.7.1
