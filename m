From: jassisinghbrar@gmail.com
Subject: [PATCH 1/2] dt-bindings: milbeaut-m10v-xdmac: Add Socionext Milbeaut XDMAC bindings
Date: Sun, 18 Aug 2019 00:22:24 -0500
Message-ID: <20190818052224.17857-1-jassisinghbrar@gmail.com>
References: <20190818052154.17789-1-jassisinghbrar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190818052154.17789-1-jassisinghbrar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vkoul@kernel.org, robh+dt@kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Document the devicetree bindings for Socionext Milbeaut XDMAC
controller. Controller only supports Mem->Mem transfers. Number
of physical channels are determined by the number of irqs registered.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 .../bindings/dma/milbeaut-m10v-xdmac.txt      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt

diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
new file mode 100644
index 000000000000..1f15512e3f19
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
@@ -0,0 +1,24 @@
+* Milbeaut AXI DMA Controller
+
+Milbeaut AXI DMA controller has only memory to memory transfer capability.
+
+* DMA controller
+
+Required property:
+- compatible: 	Should be  "socionext,milbeaut-m10v-xdmac"
+- reg:		Should contain DMA registers location and length.
+- interrupts: 	Should contain all of the per-channel DMA interrupts.
+                Number of channels is configurable - 2, 4 or 8, so
+                the number of interrupts specfied should be {2,4,8}.
+- #dma-cells: 	Should be 1.
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
+	};
-- 
2.17.1
