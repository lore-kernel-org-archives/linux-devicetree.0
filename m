From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 2/2] dt-bindings: irq: Convert Allwinner NMI Controller to a
 schema
Date: Tue, 23 Jul 2019 15:26:58 +0200
Message-ID: <20190723132658.5068-2-maxime.ripard@bootlin.com>
References: <20190723132658.5068-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190723132658.5068-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Allwinner SoCs have an interrupt controller called NMI supported in
Linux, with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../allwinner,sun7i-a20-sc-nmi.yaml           | 83 +++++++++++++++++++
 .../allwinner,sunxi-nmi.txt                   | 29 -------
 2 files changed, 83 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
new file mode 100644
index 000000000000..cb8077b0c8dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A20 Non-Maskable Interrupt Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun6i-a31-r-intc
+          - allwinner,sun7i-a20-sc-nmi
+          - allwinner,sun9i-a80-sc-nmi
+
+          # Deprecated
+          - allwinner,sun6i-a31-sc-nmi
+
+  required:
+    - compatible
+
+properties:
+  "#interrupt-cells":
+    const: 2
+    description:
+      The first cell is the IRQ number, the second cell the trigger
+      type as defined in interrupt.txt in this directory.
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun6i-a31-r-intc
+      - const: allwinner,sun7i-a20-sc-nmi
+      - items:
+        - const: allwinner,sun8i-a83t-r-intc
+        - const: allwinner,sun6i-a31-r-intc
+      - const: allwinner,sun9i-a80-sc-nmi
+      - items:
+        - const: allwinner,sun50i-a64-r-intc
+        - const: allwinner,sun6i-a31-r-intc
+      - items:
+        - const: allwinner,sun50i-h6-r-intc
+        - const: allwinner,sun6i-a31-r-intc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+required:
+  - "#interrupt-cells"
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1c00030 {
+        compatible = "allwinner,sun7i-a20-sc-nmi";
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        reg = <0x01c00030 0x0c>;
+        interrupt-parent = <&gic>;
+        interrupts = <0 0 4>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
deleted file mode 100644
index 24beadf7ba83..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Allwinner Sunxi NMI Controller
-==============================
-
-Required properties:
-
-- compatible : should be one of the following:
-  - "allwinner,sun7i-a20-sc-nmi"
-  - "allwinner,sun6i-a31-sc-nmi" (deprecated)
-  - "allwinner,sun6i-a31-r-intc"
-  - "allwinner,sun9i-a80-nmi"
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 2. The first cell is the IRQ number, the
-  second cell the trigger type as defined in interrupt.txt in this directory.
-- interrupts: Specifies the interrupt line (NMI) which is handled by
-  the interrupt controller in the parent controller's notation. This value
-  shall be the NMI.
-
-Example:
-
-sc-nmi-intc@1c00030 {
-	compatible = "allwinner,sun7i-a20-sc-nmi";
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	reg = <0x01c00030 0x0c>;
-	interrupt-parent = <&gic>;
-	interrupts = <0 0 4>;
-};
-- 
2.21.0
