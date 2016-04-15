From: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma device tree binding documentation
Date: Fri, 15 Apr 2016 14:22:53 +0530
Message-ID: <1460710374-25077-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Device-tree binding documentation for Xilinx zynqmp dma engine used in
Zynq UltraScale+ MPSoC.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
Changes in v6:
- Removed desc-axi-cache/dst-axi-cache/src-axi-cache properties
  from the binding doc as it allow broken combinations when dma-coherent
  is set as suggested by Rob.
- Fixed minor comments given by Rob related coding(lower case DT node name).
Changes in v5:
- Use dma-coherent flag for coherent transfers as suggested by rob.
- Removed unnecessary properties from binding doc as suggested by Rob.
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None.

 .../devicetree/bindings/dma/xilinx/zynqmp_dma.txt  | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt

diff --git a/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
new file mode 100644
index 0000000..f0f0b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
@@ -0,0 +1,44 @@
+Xilinx ZynqMP DMA engine, it does support memory to memory transfers,
+memory to device and device to memory transfers. It also has flow
+control and rate control support for slave/peripheral dma access.
+
+Required properties:
+- compatible		: Should be "xlnx,zynqmp-dma-1.0"
+- reg			: Memory map for gdma/adma module access.
+- interrupt-parent	: Interrupt controller the interrupt is routed through
+- interrupts		: Should contain DMA channel interrupt.
+- xlnx,bus-width	: Axi buswidth in bits. Should contain 128 or 64
+- clock-names		: List of input clocks "clk_main", "clk_apb"
+			  (see clock bindings for details)
+
+Optional properties:
+- xlnx,include-sg	: Indicates the controller to operate in simple or
+			  scatter gather dma mode
+- xlnx,ratectrl		: Scheduling interval in terms of clock cycles for
+			  source AXI transaction
+- xlnx,overfetch	: Tells whether the channel is allowed to over
+			  fetch the data
+- xlnx,src-issue	: Number of AXI outstanding transactions on source side
+- xlnx,src-burst-len	: AXI length for data read. Support only power of
+			  2 byte values.
+- xlnx,dst-burst-len	: AXI length for data write. Support only power of
+			  2 byte values.
+- dma-coherent		: Present if dma operations are coherent.
+
+Example:
+++++++++
+fpd_dma_chan1: dma@fd500000 {
+	compatible = "xlnx,zynqmp-dma-1.0";
+	reg = <0x0 0xFD500000 0x1000>;
+	interrupt-parent = <&gic>;
+	interrupts = <0 117 4>;
+	clock-names = "clk_main", "clk_apb";
+	xlnx,bus-width = <128>;
+	xlnx,include-sg;
+	xlnx,overfetch;
+	dma-coherent;
+	xlnx,ratectrl = <0>;
+	xlnx,src-issue = <16>;
+	xlnx,src-burst-len = <4>;
+	xlnx,dst-burst-len = <4>;
+};
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
