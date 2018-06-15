Return-Path: <SRS0=Z3/K=JB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva020.nxp.com ([92.121.34.13]:43727 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965521AbeFOKYb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Jun 2018 06:24:31 -0400
From: Wen He <wen.he_1@nxp.com>
Subject: [v6 7/7] arm: dts: ls1021a: add qdma device tree nodes
Date: Fri, 15 Jun 2018 18:22:36 +0800
Message-Id: <20180615102236.32859-7-wen.he_1@nxp.com>
In-Reply-To: <20180615102236.32859-1-wen.he_1@nxp.com>
References: <20180615102236.32859-1-wen.he_1@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, wen.he_1@nxp.com
List-ID: <devicetree@vger.kernel.org>

add the qDMA device tree nodes for LS1021A devices.
Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v6:
	- no

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

