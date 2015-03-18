From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V4 1/3] dt-bindings: dma: Add binding for jz4780-dma
Date: Wed, 18 Mar 2015 16:16:35 +0000
Message-ID: <1426695397-54906-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1426695397-54906-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426695397-54906-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex@alex-smith.me.uk, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

Add device tree bindings for the DMA controller on JZ4780 SoCs, used by
the dma-jz4780 driver.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V3 -> V4
None

V3 -> V2
Changed binding.
Used to be 3 DMA cells required. <&dma TX_type RX_type Reserved>
Now 2 DMA cells are required. <&dma Transfer_type Reserved>

This is more common in DMA bindings.
And I couldn't figure any reason that 3 cells were used.

V1 -> V2 None
---
 .../devicetree/bindings/dma/jz4780-dma.txt         | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
new file mode 100644
index 0000000..f25feee
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
@@ -0,0 +1,56 @@
+* Ingenic JZ4780 DMA Controller
+
+Required properties:
+
+- compatible: Should be "ingenic,jz4780-dma"
+- reg: Should contain the DMA controller registers location and length.
+- interrupts: Should contain the interrupt specifier of the DMA controller.
+- interrupt-parent: Should be the phandle of the interrupt controller that
+- clocks: Should contain a clock specifier for the JZ4780 PDMA clock.
+- #dma-cells: Must be <2>. Number of integer cells in the dmas property of
+  DMA clients (see below).
+
+Optional properties:
+
+- ingenic,reserved-channels: Bitmask of channels to reserve for devices that
+  need a specific channel. These channels will only be assigned when explicitly
+  requested by a client. The primary use for this is channels 0 and 1, which
+  can be configured to have special behaviour for NAND/BCH when using
+  programmable firmware.
+
+Example:
+
+dma: dma@13420000 {
+	compatible = "ingenic,jz4780-dma";
+	reg = <0x13420000 0x10000>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <10>;
+
+	clocks = <&cgu JZ4780_CLK_PDMA>;
+
+	#dma-cells = <2>;
+
+	ingenic,reserved-channels = <0x3>;
+};
+
+DMA clients must use the format described in dma.txt, giving a phandle to the
+DMA controller plus the following 2 integer cells:
+
+1. Request type: The DMA request type for transfers to/from the device on
+   the allocated channel, as defined in the SoC documentation.
+
+2. Channel: If set to 0xffffffff, any available channel will be allocated for
+   the client. Otherwise, the exact channel specified will be used. The channel
+   should be reserved on the DMA controller using the ingenic,reserved-channels
+   property.
+
+Example:
+
+uart0: serial@10030000 {
+	...
+	dmas = <&dma 0x14 0xffffffff
+		&dma 0x15 0xffffffff>;
+	dma-names = "tx", "rx";
+	...
+};
-- 
1.9.1
