From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] dt: bindings: dma: xilinx: dpdma: DT bindings for Xilinx DPDMA
Date: Fri, 5 Jan 2018 18:14:07 -0800
Message-ID: <1515204848-3493-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ZynqMP includes the DisplayPort subsystem with its own DMA engine
called DPDMA. The DPDMA IP comes with 6 individual channels
(4 for display, 2 for audio). This documentation describes DT bindings
of DPDMA.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/dma/xilinx/xilinx_dpdma.txt           | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_dpdma.txt

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dpdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dpdma.txt
new file mode 100644
index 0000000..51016d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dpdma.txt
@@ -0,0 +1,64 @@
+Device-Tree bindings for Xilinx ZynqMP DP Subsystem DMA
+
+The ZynqMP DisplayPort subsystem handles DMA channel buffer management,
+blending, and audio mixing. The DisplayPort subsystem receives display
+and audio frames from DPDMA and transmits output to the DisplayPort IP core.
+
+Required properties:
+ - compatible: Should be "xlnx,dpdma".
+ - reg: Base address and size of the IP core.
+ - interrupts: Interrupt number.
+ - interrupts-parent: phandle for interrupt controller.
+ - clocks: phandle for AXI clock
+ - clock-names: The identification string, "axi_clk", is always required.
+
+Required child node properties:
+- compatible: Should be one of "xlnx,video0", "xlnx,video1", "xlnx,video2",
+  "xlnx,graphics", "xlnx,audio0", or "xlnx,audio1".
+
+Example:
+
+	xlnx_dpdma: axidpdma@43c10000 {
+		compatible = "xlnx,dpdma";
+		reg = <0x43c10000 0x1000>;
+		interrupts = <0 54 4>;
+		interrupt-parent = <&intc>;
+		clocks = <&clkc 16>;
+		clock-names = "axi_clk";
+
+		#dma-cells = <1>;
+		dma-video0channel {
+			compatible = "xlnx,video0";
+		};
+		dma-video1channel {
+			compatible = "xlnx,video1";
+		};
+		dma-video2channel {
+			compatible = "xlnx,video2";
+		};
+		dma-graphicschannel {
+			compatible = "xlnx,graphics";
+		};
+		dma-audio0channel {
+			compatible = "xlnx,audio0";
+		};
+		dma-audio1channel {
+			compatible = "xlnx,audio1";
+		};
+	};
+
+* DMA client
+
+Required properties:
+- dmas: a list of <[DPDMA device phandle] [Channel ID]> pairs. "Channel ID"
+  is defined as video0 = 0, video1 = 1, video2 = 2, graphics = 3, audio0 = 4,
+  and audio1 = 5.
+
+Example:
+
+	xlnx_drm {
+		...
+		dmas = <&xlnx_dpdma 3>;
+		dma-names = "dma";
+		...
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
