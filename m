Return-Path: <SRS0=r8rx=KJ=nxp.com=wen.he_1@kernel.org>
From: Wen He <wen.he_1@nxp.com>
Subject: [v7 7/7] arm: dts: ls1021a: add qdma device tree nodes
Date: Wed, 25 Jul 2018 19:29:19 +0800
Message-Id: <20180725112919.31340-7-wen.he_1@nxp.com>
In-Reply-To: <20180725112919.31340-1-wen.he_1@nxp.com>
References: <20180725112919.31340-1-wen.he_1@nxp.com>
To: vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, wen.he_1@nxp.com
List-ID: <devicetree@vger.kernel.org>

add the qDMA device tree nodes for LS1021A devices.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index c55d479..061c839 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -571,6 +571,21 @@
 				 <&clockgen 4 1>;
 		};
 
+		qdma: dma-controller@8390000 {
+			compatible = "fsl,ls1021a-qdma";
+			reg = <0x0 0x8398000 0x0 0x1000>, /* Controller regs */
+				<0x0 0x8399000 0x0 0x1000>, /* Status regs */
+				<0x0 0x839a000 0x0 0x2000>; /* Block regs */
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "qdma-error", "qdma-queue";
+			dma-channels = <8>;
+			fsl,queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 		dcu: dcu@2ce0000 {
 			compatible = "fsl,ls1021a-dcu";
 			reg = <0x0 0x2ce0000 0x0 0x10000>;
-- 
1.7.1
