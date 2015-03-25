From: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH v3 1/2] dma: Add Xilinx Central DMA DT Binding Documentation
Date: Wed, 25 Mar 2015 10:36:54 +0530
Message-ID: <1568e880-ee7f-4aa5-a5de-8c615be0ca6c@BN1BFFO11FD008.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: appand-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Device-tree binding documentation of Xilinx Central DMA Engine.

Signed-off-by: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- Used proper alignment for all the properties.
Changes in v2:
- Change property 'xlnx,data-width' to 'xlnx,datawidth' in the description
  to match the implementation.

 .../devicetree/bindings/dma/xilinx/xilinx_cdma.txt | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
new file mode 100644
index 0000000..aba3b10
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
@@ -0,0 +1,54 @@
+Xilinx AXI CDMA engine, it does transfers between memory-mapped source
+address and a memory-mapped destination address.
+
+Required properties:
+- compatible		: Should be "xlnx,axi-cdma-1.00.a"
+- #dma-cells		: Should be <1>, see "dmas" property below
+- reg			: Should contain cdma registers location and length.
+- dma-channel child node: Should have only one channel
+
+Optional properties:
+- xlnx,include-sg	: Tells whether configured for Scatter-mode in
+			  the hardware.
+
+Required child node properties:
+- compatible		: It should be "xlnx,axi-cdma-channel".
+- interrupts		: Should contain per channel CDMA interrupts.
+- xlnx,datawidth	: Should contain the stream data width, take values
+			  {32,64...1024}.
+
+Option child node properties:
+- xlnx,include-dre	: Tells whether hardware is configured for Data
+			  Realignment Engine.
+
+Example:
+++++++++
+
+axi_cdma_0: axicdma@7e200000 {
+       compatible = "xlnx,axi-cdma-1.00.a";
+       #dma_cells = <1>;
+       reg = < 0x7e200000 0x10000 >;
+       dma-channel@7e200000 {
+               compatible = "xlnx,axi-cdma-channel";
+               interrupts = < 0 55 4 >;
+               xlnx,datawidth = <0x40>;
+       } ;
+} ;
+
+
+* DMA client
+
+Required properties:
+- dmas		: a list of <[Central DMA device phandle] [Channel ID]> pairs,
+		  where Channel ID is '0' for write/tx and '1' for read/rx
+                  channel.
+- dma-names	: a list of DMA channel names, one per "dmas" entry
+
+Example:
+++++++++
+
+cdmatest_0: cdmatest@0 {
+       compatible ="xlnx,axi-cdma-test-1.00.a";
+       dmas = <&axi_cdma_0 0>;
+       dma-names = "cdma0";
+} ;
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
