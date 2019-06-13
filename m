From: jassisinghbrar@gmail.com
Subject: [PATCH 1/2] dt-bindings: milbeaut-m10v-hdmac: Add Socionext Milbeaut HDMAC bindings
Date: Wed, 12 Jun 2019 19:52:37 -0500
Message-ID: <20190613005237.1996-1-jassisinghbrar@gmail.com>
References: <20190613005109.1867-1-jassisinghbrar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613005109.1867-1-jassisinghbrar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, orito.takao@socionext.com, masami.hiramatsu@linaro.org, kasai.kazuhiro@socionext.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Document the devicetree bindings for Socionext Milbeaut HDMAC
controller. Controller has upto 8 floating channels, that need
a predefined slave-id to work from a set of slaves.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 .../bindings/dma/milbeaut-m10v-hdmac.txt           | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt

diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
new file mode 100644
index 000000000000..a104fcb9e73d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
@@ -0,0 +1,51 @@
+* Milbeaut AHB DMA Controller
+
+Milbeaut AHB DMA controller has transfer capability bellow.
+ - memory to memory transfer
+ - device to memory transfer
+ - memory to device transfer
+
+Required property:
+- compatible:       Should be  "socionext,milbeaut-m10v-hdmac"
+- reg:              Should contain DMA registers location and length.
+- interrupts:       Should contain all of the per-channel DMA interrupts.
+- #dma-cells:       Should be 1. Specify the ID of the slave.
+- clocks:           Phandle to the clock used by the HDMAC module.
+
+
+Example:
+
+	hdmac1: hdmac@1e110000 {
+		compatible = "socionext,milbeaut-m10v-hdmac";
+		reg = <0x1e110000 0x10000>;
+		interrupts = <0 132 4>,
+			     <0 133 4>,
+			     <0 134 4>,
+			     <0 135 4>,
+			     <0 136 4>,
+			     <0 137 4>,
+			     <0 138 4>,
+			     <0 139 4>;
+		#dma-cells = <1>;
+		clocks = <&dummy_clk>;
+	};
+
+* DMA client
+
+Clients have to specify the DMA requests with phandles in a list.
+
+Required properties:
+- dmas:             List of one or more DMA request specifiers. One DMA request specifier
+                    consists of a phandle to the DMA controller followed by the integer
+                    specifying the request line.
+- dma-names:        List of string identifiers for the DMA requests. For the correct
+                    names, have a look at the specific client driver.
+
+Example:
+
+	sni_spi1: spi@1e800100 {
+		...
+		dmas = <&hdmac1 22>, <&hdmac1 21>;
+		dma-names = "tx", "rx";
+		...
+	};
-- 
2.17.1
