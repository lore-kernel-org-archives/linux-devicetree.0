From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 1/2] dt-bindings: Document the Synopsys DW AXI DMA bindings
Date: Tue, 21 Feb 2017 23:38:03 +0300
Message-ID: <1487709484-868-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1487709484-868-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487709484-868-1-git-send-email-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the Synopsys
DesignWare AXI DMA controller.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/dma/snps,axi-dw-dmac.txt   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt

diff --git a/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
new file mode 100644
index 0000000..21666fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/snps,axi-dw-dmac.txt
@@ -0,0 +1,34 @@
+* Synopsys DesignWare AXI DMA Controller
+
+Required properties:
+- compatible: "snps,axi-dma-1.01a"
+- reg: Address range of the DMAC registers. This should include
+  all of the per-channel registers.
+- interrupt: Should contain the DMAC interrupt number.
+- interrupt-parent: Should be the phandle for the interrupt controller
+  that services interrupts for this device.
+- dma-channels: Number of channels supported by hardware.
+- snps,dma-masters: Number of AXI masters supported by the hardware.
+- snps,data-width: Maximum AXI data width supported by hardware.
+  (0 - 8bits, 1 - 16bits, 2 - 32bits, ..., 6 - 512bits)
+- snps,priority: Priority of channel. Array size is equal to the number of
+  dma-channels. Priority value must be programmed within [0:dma-channels-1]
+  range. (0 - minimum priority)
+- snps,block-size: Maximum block size supported by the controller channel.
+  Array size is equal to the number of dma-channels.
+
+Example:
+
+dmac: dma-controller@80000 {
+	compatible = "snps,axi-dma-1.01a";
+	reg = <0x80000 0x400>;
+	clocks = <&core_clk>;
+	interrupt-parent = <&intc>;
+	interrupts = <27>;
+
+	dma-channels = <4>;
+	snps,dma-masters = <2>;
+	snps,data-width = <3>;
+	snps,block-size = <4096 4096 4096 4096>;
+	snps,priority = <0 1 2 3>;
+};
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
