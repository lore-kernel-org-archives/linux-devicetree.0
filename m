From: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 2/4] dma: fsl-qdma: add devicetree documentation for qDMA driver.
Date: Tue, 19 Dec 2017 14:41:57 +0800
Message-ID: <20171219064157.29586-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/dma/fsl-qdma.txt | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt

diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
new file mode 100644
index 000000000000..b076177b4863
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
@@ -0,0 +1,42 @@
+* Freescale queue Direct Memory Access Controller(qDMA) Controller
+
+  The qDMA controller transfers blocks of data between one source and one or more
+destinations. The blocks of data transferred can be represented in memory as contiguous
+or non-contiguous using scatter/gather table(s). Channel virtualization is supported
+through enqueuing of DMA jobs to, or dequeuing DMA jobs from, different work
+queues.
+
+* qDMA Controller
+Required properties:
+- compatible :
+	- "fsl,ls1021a-qdma",
+	Or "fsl,ls1043a-qdma" followed by "fsl,ls1021a-qdma",
+- reg : Specifies base physical address(s) and size of the qDMA registers.
+	The region is qDMA control register's address and size.
+- interrupts : A list of interrupt-specifiers, one for each entry in
+	interrupt-names.
+- interrupt-names : Should contain:
+	"qdma-error" - the error interrupt
+	"qdma-queue" - the queue interrupt
+- channels : Number of channels supported by the controller
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
+	qdma: qdma@8390000 {
+		compatible = "fsl,ls1021a-qdma";
+		reg = <0x0 0x8398000 0x0 0x2000 /* Controller registers */
+		       0x0 0x839a000 0x0 0x2000>; /* Block registers */
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "qdma-error", "qdma-queue";
+		channels = <8>;
+		queues = <2>;
+		big-endian;
+	};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
