Return-Path: <SRS0=Z3/K=JB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva020.nxp.com ([92.121.34.13]:43693 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965553AbeFOKY2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Jun 2018 06:24:28 -0400
From: Wen He <wen.he_1@nxp.com>
Subject: [v6 6/7] arm64: dts: ls1046a: add qdma device tree nodes
Date: Fri, 15 Jun 2018 18:22:35 +0800
Message-Id: <20180615102236.32859-6-wen.he_1@nxp.com>
In-Reply-To: <20180615102236.32859-1-wen.he_1@nxp.com>
References: <20180615102236.32859-1-wen.he_1@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, wen.he_1@nxp.com
List-ID: <devicetree@vger.kernel.org>

add the qDMA device tree nodes for LS1046A devices.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v6:
	- no

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 136ebfa..27988e2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -597,6 +597,21 @@
 				 <&clockgen 4 1>;
 		};
 
+		qdma: dma-controller@8380000 {
+			compatible = "fsl,ls1021a-qdma", "fsl,ls1046a-qdma";
+			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
+				<0x0 0x8390000 0x0 0x10000>, /* Status regs */
+				<0x0 0x83a0000 0x0 0x40000>; /* Block regs */
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "qdma-error", "qdma-queue";
+			dma-channels = <8>;
+			fsl,queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 		usb0: usb@2f00000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x2f00000 0x0 0x10000>;
-- 
1.7.1

