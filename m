From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 2/3] dt-bindings: dma: Convert Allwinner A10 DMA to a schema
Date: Sat, 20 Jul 2019 11:26:06 +0200
Message-ID: <20190720092607.31095-2-maxime.ripard@bootlin.com>
References: <20190720092607.31095-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190720092607.31095-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Chen-Yu Tsai <wens@csie.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The older Allwinner SoCs have a DMA controller supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../bindings/dma/allwinner,sun4i-a10-dma.yaml | 55 +++++++++++++++++++
 .../devicetree/bindings/dma/sun4i-dma.txt     | 45 ---------------
 2 files changed, 55 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/sun4i-dma.txt

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
new file mode 100644
index 000000000000..15abc0f9429f
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/allwinner,sun4i-a10-dma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 DMA Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is either 0 or 1, the former to use the normal
+      DMA, 1 for dedicated DMA. The second cell is the request line
+      number.
+
+  compatible:
+    const: allwinner,sun4i-a10-dma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - "#dma-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    dma: dma-controller@1c02000 {
+        compatible = "allwinner,sun4i-a10-dma";
+        reg = <0x01c02000 0x1000>;
+        interrupts = <27>;
+        clocks = <&ahb_gates 6>;
+        #dma-cells = <2>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/dma/sun4i-dma.txt b/Documentation/devicetree/bindings/dma/sun4i-dma.txt
deleted file mode 100644
index 8ad556aca70b..000000000000
--- a/Documentation/devicetree/bindings/dma/sun4i-dma.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Allwinner A10 DMA Controller
-
-This driver follows the generic DMA bindings defined in dma.txt.
-
-Required properties:
-
-- compatible:	Must be "allwinner,sun4i-a10-dma"
-- reg:		Should contain the registers base address and length
-- interrupts:	Should contain a reference to the interrupt used by this device
-- clocks:	Should contain a reference to the parent AHB clock
-- #dma-cells :	Should be 2, first cell denoting normal or dedicated dma,
-		second cell holding the request line number.
-
-Example:
-	dma: dma-controller@1c02000 {
-		compatible = "allwinner,sun4i-a10-dma";
-		reg = <0x01c02000 0x1000>;
-		interrupts = <27>;
-		clocks = <&ahb_gates 6>;
-		#dma-cells = <2>;
-	};
-
-Clients:
-
-DMA clients connected to the Allwinner A10 DMA controller must use the
-format described in the dma.txt file, using a three-cell specifier for
-each channel: a phandle plus two integer cells.
-The three cells in order are:
-
-1. A phandle pointing to the DMA controller.
-2. Whether it is using normal (0) or dedicated (1) channels
-3. The port ID as specified in the datasheet
-
-Example:
-	spi2: spi@1c17000 {
-		compatible = "allwinner,sun4i-a10-spi";
-		reg = <0x01c17000 0x1000>;
-		interrupts = <0 12 4>;
-		clocks = <&ahb_gates 22>, <&spi2_clk>;
-		clock-names = "ahb", "mod";
-		dmas = <&dma 1 29>, <&dma 1 28>;
-		dma-names = "rx", "tx";
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-- 
2.21.0
