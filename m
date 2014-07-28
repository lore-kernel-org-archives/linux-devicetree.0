From: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/2] dma: Add Xilinx AXI DMA DT Binding Documentation
Date: Mon, 28 Jul 2014 17:47:48 +0530
Message-ID: <1406549869-24422-1-git-send-email-sthokal@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, levex-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Device-tree binding documentation of Xilinx DMA Engine

Signed-off-by: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- Change property 'xlnx,data-width' to 'xlnx,datawidth' in the description
  to match the implementation.

Changes in v2:
None
---
 .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |   65 ++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
new file mode 100644
index 0000000..18e8bcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
@@ -0,0 +1,65 @@
+Xilinx AXI DMA engine, it does transfers between memory and AXI4 stream
+target devices. It can be configured to have one channel or two channels.
+If configured as two channels, one is to transmit to the device and another
+is to receive from the device.
+
+Required properties:
+- compatible: Should be "xlnx,axi-dma-1.00.a"
+- #dma-cells: Should be <1>, see "dmas" property below
+- reg: Should contain DMA registers location and length.
+- dma-channel child node: Should have atleast one channel and can have upto
+	two channels per device. This node specifies the properties of each
+	DMA channel (see child node properties below).
+
+Optional properties:
+- xlnx,include-sg: Tells whether configured for Scatter-mode in
+	the hardware.
+
+Required child node properties:
+- compatible: It should be either "xlnx,axi-dma-mm2s-channel" or
+	"xlnx,axi-dma-s2mm-channel".
+- interrupts: Should contain per channel DMA interrupts.
+- xlnx,datawidth: Should contain the stream data width, take values
+	{32,64...1024}.
+
+Option child node properties:
+- xlnx,include-dre: Tells whether hardware is configured for Data
+	Realignment Engine.
+
+Example:
+++++++++
+
+axi_dma_0: axidma@40400000 {
+	compatible = "xlnx,axi-dma-1.00.a";
+	#dma_cells = <1>;
+	reg = < 0x40400000 0x10000 >;
+	dma-channel@40400000 {
+		compatible = "xlnx,axi-dma-mm2s-channel";
+		interrupts = < 0 59 4 >;
+		xlnx,datawidth = <0x40>;
+	} ;
+	dma-channel@40400030 {
+		compatible = "xlnx,axi-dma-s2mm-channel";
+		interrupts = < 0 58 4 >;
+		xlnx,datawidth = <0x40>;
+	} ;
+} ;
+
+
+* DMA client
+
+Required properties:
+- dmas: a list of <[DMA device phandle] [Channel ID]> pairs,
+	where Channel ID is '0' for write/tx and '1' for read/rx
+	channel.
+- dma-names: a list of DMA channel names, one per "dmas" entry
+
+Example:
+++++++++
+
+dmatest_0: dmatest@0 {
+	compatible ="xlnx,axi-dma-test-1.00.a";
+	dmas = <&axi_dma_0 0
+		&axi_dma_0 1>;
+	dma-names = "dma0", "dma1";
+} ;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
