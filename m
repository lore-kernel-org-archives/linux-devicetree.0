Return-Path: <SRS0=g8kN=XL=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] dt-bindings: hspi: Convert bindings to json-schema
Date: Mon, 16 Sep 2019 09:53:52 +0200
Message-Id: <20190916075352.32108-1-horms+renesas@verge.net.au>
To: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Convert Renesas HSPI bindings documentation to json-schema.
Also name bindings documentation file according to the compat string
being documented.

As a side effect of this change all currently supported/used compat
strings are listed while no while card compat string is documented.
This, in my opinion, is desirable as only supported hardware should
be documented.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
Tested using:
  ARCH=arm make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,hspi.yaml

v2
- reference spi-controller.yaml# and thus do not document
  #address-cells and #size-cells properties.
  These properties are still listed as required.
- Drop comment regarding pinctrl properties.
  These are not needed as only one state, "default", is supported
- Document clocks and power-domains properties.
  The clocks property is required. Add these properties to the example.
- Drop unnecessary interrupt-parent property from example.
---
 .../devicetree/bindings/spi/renesas,hspi.yaml      | 57 ++++++++++++++++++++++
 Documentation/devicetree/bindings/spi/sh-hspi.txt  | 26 ----------
 2 files changed, 57 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/renesas,hspi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/sh-hspi.txt

diff --git a/Documentation/devicetree/bindings/spi/renesas,hspi.yaml b/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
new file mode 100644
index 000000000000..c429cf4bea5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/renesas,hspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas HSPI
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - renesas,hspi-r8a7778 # R-Car M1A
+        - renesas,hspi-r8a7779 # R-Car H1
+      - const: renesas,hspi
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
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7778-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    hspi0: spi@fffc7000 {
+        compatible = "renesas,hspi-r8a7778", "renesas,hspi";
+        reg = <0xfffc7000 0x18>;
+        interrupts = <0 63 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp0_clks R8A7778_CLK_HSPI>;
+        power-domains = <&cpg_clocks>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+
diff --git a/Documentation/devicetree/bindings/spi/sh-hspi.txt b/Documentation/devicetree/bindings/spi/sh-hspi.txt
deleted file mode 100644
index b9d1e4d11a77..000000000000
--- a/Documentation/devicetree/bindings/spi/sh-hspi.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Renesas HSPI.
-
-Required properties:
-- compatible       : "renesas,hspi-<soctype>", "renesas,hspi" as fallback.
-		     Examples with soctypes are:
-		       - "renesas,hspi-r8a7778" (R-Car M1)
-		       - "renesas,hspi-r8a7779" (R-Car H1)
-- reg              : Offset and length of the register set for the device
-- interrupts       : Interrupt specifier
-- #address-cells   : Must be <1>
-- #size-cells      : Must be <0>
-
-Pinctrl properties might be needed, too.  See
-Documentation/devicetree/bindings/pinctrl/renesas,*.
-
-Example:
-
-	hspi0: spi@fffc7000 {
-		compatible = "renesas,hspi-r8a7778", "renesas,hspi";
-		reg = <0xfffc7000 0x18>;
-		interrupt-parent = <&gic>;
-		interrupts = <0 63 IRQ_TYPE_LEVEL_HIGH>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-- 
2.11.0
