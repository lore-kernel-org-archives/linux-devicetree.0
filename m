From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: media: Convert Allwinner A10 IR to a schema
Date: Mon, 19 Aug 2019 20:26:19 +0200
Message-ID: <20190819182619.29065-2-mripard@kernel.org>
References: <20190819182619.29065-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819182619.29065-1-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mchehab@kernel.org, sean@mess.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The older Allwinner SoCs have a IR receiver supported in Linux, with a
matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../media/allwinner,sun4i-a10-ir.yaml         | 80 +++++++++++++++++++
 .../devicetree/bindings/media/sunxi-ir.txt    | 35 --------
 2 files changed, 80 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
new file mode 100644
index 000000000000..98c1bdde9a86
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Infrared Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+allOf:
+  - $ref: "rc.yaml#"
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-ir
+      - const: allwinner,sun5i-a13-ir
+      - items:
+          - const: allwinner,sun8i-a83t-ir
+          - const: allwinner,sun6i-a31-ir
+      - const: allwinner,sun6i-a31-ir
+      - items:
+          - const: allwinner,sun50i-a64-ir
+          - const: allwinner,sun6i-a31-ir
+      - items:
+          - const: allwinner,sun50i-h6-ir
+          - const: allwinner,sun6i-a31-ir
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
+      - const: apb
+      - const: ir
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    default: 8000000
+    description:
+      IR Receiver clock frequency, in Hertz.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+examples:
+  - |
+      ir0: ir@1c21800 {
+          compatible = "allwinner,sun4i-a10-ir";
+          clocks = <&apb0_gates 6>, <&ir0_clk>;
+          clock-names = "apb", "ir";
+          clock-frequency = <3000000>;
+          resets = <&apb0_rst 1>;
+          interrupts = <0 5 1>;
+          reg = <0x01C21800 0x40>;
+          linux,rc-map-name = "rc-rc6-mce";
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
deleted file mode 100644
index 81eaf95fb764..000000000000
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
-
-Required properties:
-- compatible	    :
-	"allwinner,sun4i-a10-ir"
-	"allwinner,sun5i-a13-ir"
-	"allwinner,sun6i-a31-ir"
-	"allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"
-	"allwinner,sun50i-h6-ir", "allwinner,sun6i-a31-ir"
-- clocks	    : list of clock specifiers, corresponding to
-		      entries in clock-names property;
-- clock-names	    : should contain "apb" and "ir" entries;
-- interrupts	    : should contain IR IRQ number;
-- reg		    : should contain IO map address for IR.
-
-Required properties since A31:
-- resets	    : phandle + reset specifier pair
-
-Optional properties:
-- linux,rc-map-name: see rc.txt file in the same directory.
-- clock-frequency  : IR Receiver clock frequency, in Hertz. Defaults to 8 MHz
-		     if missing.
-
-Example:
-
-ir0: ir@1c21800 {
-	compatible = "allwinner,sun4i-a10-ir";
-	clocks = <&apb0_gates 6>, <&ir0_clk>;
-	clock-names = "apb", "ir";
-	clock-frequency = <3000000>;
-	resets = <&apb0_rst 1>;
-	interrupts = <0 5 1>;
-	reg = <0x01C21800 0x40>;
-	linux,rc-map-name = "rc-rc6-mce";
-};
-- 
2.21.0
