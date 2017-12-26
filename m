From: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
Subject: [V2 3/6] dt-bindings: fsl-qdma: add device tree for qDMA driver
Date: Tue, 26 Dec 2017 13:47:51 +0800
Message-ID: <20171226054754.14969-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, jiafei.pan-3arQi8VN3Tc@public.gmane.org, jiaheng.fan-3arQi8VN3Tc@public.gmane.org, Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add NXP Layerscape queue direct memory access controller(qDMA) support.
This module can be found on NXP QorIQ Layerscape Socs.

Signed-off-by: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
---
change in v2:
	- Remove indentation
	- Add "Should be" before 'fsl,ls1021a-qdma'
	- Replace 'channels' by 'dma-channels'
	- Replace 'qdma@8390000' by 'dma-controller@8390000'

 Documentation/devicetree/bindings/dma/fsl-qdma.txt |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt

diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
new file mode 100644
index 0000000..000472b
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
@@ -0,0 +1,40 @@
+* NXP Layerscape queue Direct Memory Access Controller(qDMA) Controller
+
+The qDMA controller transfers blocks of data between one source and one or more
+destinations. The blocks of data transferred can be represented in memory as contiguous
+or non-contiguous using scatter/gather table(s). Channel virtualization is supported
+through enqueuing of DMA jobs to, or dequeuing DMA jobs from, different work
+queues.
+
+* qDMA Controller
+Required properties:
+- compatible : Should be "fsl,ls1021a-qdma" or "fsl,ls1043a-qdma", "fsl,ls1021a-qdma"
+- reg : Specifies base physical address(s) and size of the qDMA registers.
+	The region is qDMA control register's address and size.
+- interrupts : A list of interrupt-specifiers, one for each entry in
+	interrupt-names.
+- interrupt-names : Should contain:
+	"qdma-error" - the error interrupt
+	"qdma-queue" - the queue interrupt
+- dma-channels : Number of DMA channels supported by the controller
+- queues : Number of queues supported by driver
+
+Optional properties:
+- big-endian: If present registers and hardware scatter/gather descriptors
+	of the qDMA are implemented in big endian mode, otherwise in little
+	mode.
+
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
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
