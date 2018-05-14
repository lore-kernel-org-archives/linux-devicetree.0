Return-Path: <SRS0=ePA5=IB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-bl2nam02on0100.outbound.protection.outlook.com ([104.47.38.100]:3829
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753064AbeENME2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 14 May 2018 08:04:28 -0400
From: Wen He <wen.he_1@nxp.com>
Subject: [v4 5/6] arm64: dts: ls1046a: add qdma device tree nodes
Date: Mon, 14 May 2018 20:03:06 +0800
Message-ID: <20180514120307.15592-5-wen.he_1@nxp.com>
In-Reply-To: <20180514120307.15592-1-wen.he_1@nxp.com>
References: <20180514120307.15592-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: vinod.koul@intel.com, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, Wen He <wen.he_1@nxp.com>
List-ID: <devicetree@vger.kernel.org>

add the qDMA device tree nodes for LS1046A devices.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
chang in v4: 
	- no

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 136ebfa..6a925be 100644
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
+			queues = <2>;
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

