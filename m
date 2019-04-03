From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Date: Wed,  3 Apr 2019 09:48:05 +0200
Message-ID: <98fcc297e7387228ef8bfd825bbd7cfd4c8e0a37.1554277681.git-series.maxime.ripard@bootlin.com>
References: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2
  - Fix the regex for the NAND chip node
  - Added Rob's R-b tag

Changes from v1
  - Added controller constraints to the generic options
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
 2 files changed, 96 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
new file mode 100644
index 000000000000..d5834b197e96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/allwinner,sun4i-a10-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 NAND Controller Device Tree Bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    const: allwinner,sun4i-a10-nand
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: ahb
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+  pinctrl-names: true
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+  "^nand@[a-f0-9]+$":
+    properties:
+      reg:
+        maxItems: 1
+        minimum: 0
+        maximum: 7
+
+      nand-ecc-mode: true
+
+      nand-ecc-algo:
+        const: bch
+
+      nand-ecc-step-size:
+        enum: [ 512, 1024 ]
+
+      nand-ecc-strength:
+        maximum: 80
+
+      allwinner,rb:
+        description:
+          Contains the native Ready/Busy IDs.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-array
+          - minItems: 1
+            maxItems: 2
+            items:
+              minimum: 0
+              maximum: 1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
deleted file mode 100644
index dcd5a5d80dc0..000000000000
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Allwinner NAND Flash Controller (NFC)
-
-Required properties:
-- compatible : "allwinner,sun4i-a10-nand".
-- reg : shall contain registers location and length for data and reg.
-- interrupts : shall define the nand controller interrupt.
-- #address-cells: shall be set to 1. Encode the nand CS.
-- #size-cells : shall be set to 0.
-- clocks : shall reference nand controller clocks.
-- clock-names : nand controller internal clock names. Shall contain :
-    * "ahb" : AHB gating clock
-    * "mod" : nand controller clock
-
-Optional properties:
-- dmas : shall reference DMA channel associated to the NAND controller.
-- dma-names : shall be "rxtx".
-
-Optional children nodes:
-Children nodes represent the available nand chips.
-
-Optional properties:
-- reset : phandle + reset specifier pair
-- reset-names : must contain "ahb"
-- allwinner,rb : shall contain the native Ready/Busy ids.
-- nand-ecc-mode : one of the supported ECC modes ("hw", "soft", "soft_bch" or
-		  "none")
-
-see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
-
-
-Examples:
-nfc: nand@1c03000 {
-	compatible = "allwinner,sun4i-a10-nand";
-	reg = <0x01c03000 0x1000>;
-	interrupts = <0 37 1>;
-	clocks = <&ahb_gates 13>, <&nand_clk>;
-	clock-names = "ahb", "mod";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
-
-	nand@0 {
-		reg = <0>;
-		allwinner,rb = <0>;
-		nand-ecc-mode = "soft_bch";
-	};
-};
-- 
git-series 0.9.1
