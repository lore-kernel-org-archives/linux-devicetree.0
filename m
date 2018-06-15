Return-Path: <SRS0=Z3/K=JB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva020.nxp.com ([92.121.34.13]:43667 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936215AbeFOKYY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Jun 2018 06:24:24 -0400
From: Wen He <wen.he_1@nxp.com>
Subject: [v6 4/7] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA controller bindings
Date: Fri, 15 Jun 2018 18:22:33 +0800
Message-Id: <20180615102236.32859-4-wen.he_1@nxp.com>
In-Reply-To: <20180615102236.32859-1-wen.he_1@nxp.com>
References: <20180615102236.32859-1-wen.he_1@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, wen.he_1@nxp.com
List-ID: <devicetree@vger.kernel.org>

Document the devicetree bindings for NXP Layerscape qDMA controller
which could be found on NXP QorIQ Layerscape SoCs.

Signed-off-by: Wen He <wen.he_1@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/dma/fsl-qdma.txt |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt

diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
new file mode 100644
index 0000000..99b3d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
@@ -0,0 +1,41 @@
+NXP Layerscape SoC qDMA Controller
+==================================
+
+This device follows the generic DMA bindings defined in dma/dma.txt.
+
+Required properties:
+
+- compatible:		Must be one of
+			 "fsl,ls1021a-qdma": for LS1021A Board
+			 "fsl,ls1043a-qdma": for ls1043A Board
+			 "fsl,ls1046a-qdma": for ls1046A Board
+- reg:			Should contain the register's base address and length.
+- interrupts:		Should contain a reference to the interrupt used by this
+			device.
+- interrupt-names:	Should contain interrupt names:
+			 "qdma-error": the error interrupt
+			 "qdma-queue": the queue interrupt
+- fsl,queues:		Should contain number of queues supported.
+
+Optional properties:
+
+- dma-channels:		Number of DMA channels supported by the controller.
+- big-endian:		If present registers and hardware scatter/gather descriptors
+			of the qDMA are implemented in big endian mode, otherwise in little
+			mode.
+
+Examples:
+
+	qdma: dma-controller@8390000 {
+		compatible = "fsl,ls1021a-qdma";
+		reg = <0x0 0x8398000 0x0 0x2000 /* Controller registers */
+		       0x0 0x839a000 0x0 0x2000>; /* Block registers */
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "qdma-error", "qdma-queue";
+		dma-channels = <8>;
+		queues = <2>;
+		big-endian;
+	};
+
+DMA clients must use the format described in dma/dma.txt file.
-- 
1.7.1

