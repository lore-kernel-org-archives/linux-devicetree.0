From: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Subject: [PATCH 1/2] dt-bindings: dmaengine: Add Milbeaut AXI DMA controller bindings
Date: Mon, 25 Mar 2019 13:15:13 +0900
Message-ID: <1553487314-9185-2-git-send-email-kasai.kazuhiro@socionext.com>
References: <1553487314-9185-1-git-send-email-kasai.kazuhiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553487314-9185-1-git-send-email-kasai.kazuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kanematsu.shinji@socionext.com, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, linux-kernel@vger.kernel.org, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

Add Milbeaut AXI DMA controller bindings. This DMA controller has
only capable of memory to memory transfer.

Signed-off-by: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
---
 .../devicetree/bindings/dma/xdmac-milbeaut.txt     | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xdmac-milbeaut.txt

diff --git a/Documentation/devicetree/bindings/dma/xdmac-milbeaut.txt b/Documentation/devicetree/bindings/dma/xdmac-milbeaut.txt
new file mode 100644
index 0000000..3a77fb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xdmac-milbeaut.txt
@@ -0,0 +1,24 @@
+* Milbeaut AXI DMA Controller
+
+Milbeaut AXI DMA controller has only memory to memory transfer capability.
+
+* DMA controller
+
+Required property:
+- compatible: 		Should be  "socionext,milbeaut-m10v-xdmac"
+- reg:			Should contain DMA registers location and length.
+- interrupts: 		Should contain all of the per-channel DMA interrupts.
+- #dma-cells: 		Should be 1.
+- dma-channels: 	Number of DMA channels supported by the controller.
+
+Example:
+	xdmac0: dma-controller@1c250000 {
+		compatible = "socionext,milbeaut-m10v-xdmac";
+		reg = <0x1c250000 0x1000>;
+		interrupts = <0 17 0x4>,
+			     <0 18 0x4>,
+			     <0 19 0x4>,
+			     <0 20 0x4>;
+		#dma-cells = <1>;
+		dma-channels = <4>;
+	};
-- 
1.9.1
