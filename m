From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: [PATCH v5 1/2] dt-bindings: dma: Add Spreadtrum SC9860 DMA controller
Date: Tue, 24 Oct 2017 13:47:49 +0800
Message-ID: <84d9f80ce9853ae8441ef91e8701ba516db8f697.1508824012.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC9860 DMA
controller device.

Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v4:
 - No updates.

Changes since v3:
 - No updates.

Changes since v2:
 - No updates.

Changes since v1:
 - Fix typos.
---
 Documentation/devicetree/bindings/dma/sprd-dma.txt |   41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sprd-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
new file mode 100644
index 0000000..7a10fea
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
@@ -0,0 +1,41 @@
+* Spreadtrum DMA controller
+
+This binding follows the generic DMA bindings defined in dma.txt.
+
+Required properties:
+- compatible: Should be "sprd,sc9860-dma".
+- reg: Should contain DMA registers location and length.
+- interrupts: Should contain one interrupt shared by all channel.
+- #dma-cells: must be <1>. Used to represent the number of integer
+	cells in the dmas property of client device.
+- #dma-channels : Number of DMA channels supported. Should be 32.
+- clock-names: Should contain the clock of the DMA controller.
+- clocks: Should contain a clock specifier for each entry in clock-names.
+
+Example:
+
+Controller:
+apdma: dma-controller@20100000 {
+	compatible = "sprd,sc9860-dma";
+	reg = <0x20100000 0x4000>;
+	interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+	#dma-cells = <1>;
+	#dma-channels = <32>;
+	clock-names = "enable";
+	clocks = <&clk_ap_ahb_gates 5>;
+};
+
+
+Client:
+DMA clients connected to the Spreadtrum DMA controller must use the format
+described in the dma.txt file, using a two-cell specifier for each channel.
+The two cells in order are:
+1. A phandle pointing to the DMA controller.
+2. The channel id.
+
+spi0: spi@70a00000{
+	...
+	dma-names = "rx_chn", "tx_chn";
+	dmas = <&apdma 11>, <&apdma 12>;
+	...
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
