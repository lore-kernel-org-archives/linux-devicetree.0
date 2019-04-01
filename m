From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 2/4] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Date: Mon,  1 Apr 2019 23:13:54 +0200
Message-ID: <5bbd086f909e2331103fbf9afbe75cc5b8782f36.1554153146.git-series.maxime.ripard@bootlin.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +-------------------------------------------
 2 files changed, 81 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
new file mode 100644
index 000000000000..174294b9e9c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -0,0 +1,81 @@
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
+  "^nand@[a-z0-9]+$":
+    properties:
+      reg:
+        maxItems: 1
+
+      nand-ecc-mode: true
+      nand-ecc-step-size: true
+      nand-ecc-strength: true
+
+      allwinner,rb:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Contains the native Ready/Busy IDs.
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
