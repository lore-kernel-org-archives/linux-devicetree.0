From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] dt-bindings: crypto: Convert Allwinner A10 Security Engine to
 a schema
Date: Thu, 11 Jul 2019 14:23:01 +0200
Message-ID: <20190711122301.8193-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The older Allwinner SoCs have a crypto engine that is supported in Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../crypto/allwinner,sun4i-a10-crypto.yaml    | 79 +++++++++++++++++++
 .../devicetree/bindings/crypto/sun4i-ss.txt   | 23 ------
 2 files changed, 79 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
 delete mode 100644 Documentation/devicetree/bindings/crypto/sun4i-ss.txt

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
new file mode 100644
index 000000000000..80b3e7350a73
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/allwinner,sun4i-a10-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Security System Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-crypto
+      - items:
+        - const: allwinner,sun5i-a13-crypto
+        - const: allwinner,sun4i-a10-crypto
+      - items:
+        - const: allwinner,sun6i-a31-crypto
+        - const: allwinner,sun4i-a10-crypto
+      - items:
+        - const: allwinner,sun7i-a20-crypto
+        - const: allwinner,sun4i-a10-crypto
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: allwinner,sun6i-a31-crypto
+
+then:
+  required:
+    - resets
+    - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto: crypto-engine@1c15000 {
+      compatible = "allwinner,sun4i-a10-crypto";
+      reg = <0x01c15000 0x1000>;
+      interrupts = <86>;
+      clocks = <&ahb_gates 5>, <&ss_clk>;
+      clock-names = "ahb", "mod";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/crypto/sun4i-ss.txt b/Documentation/devicetree/bindings/crypto/sun4i-ss.txt
deleted file mode 100644
index f2dc3d9bca92..000000000000
--- a/Documentation/devicetree/bindings/crypto/sun4i-ss.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Allwinner Security System found on A20 SoC
-
-Required properties:
-- compatible : Should be "allwinner,sun4i-a10-crypto".
-- reg: Should contain the Security System register location and length.
-- interrupts: Should contain the IRQ line for the Security System.
-- clocks : List of clock specifiers, corresponding to ahb and ss.
-- clock-names : Name of the functional clock, should be
-	* "ahb" : AHB gating clock
-	* "mod" : SS controller clock
-
-Optional properties:
- - resets : phandle + reset specifier pair
- - reset-names : must contain "ahb"
-
-Example:
-	crypto: crypto-engine@1c15000 {
-		compatible = "allwinner,sun4i-a10-crypto";
-		reg = <0x01c15000 0x1000>;
-		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&ahb_gates 5>, <&ss_clk>;
-		clock-names = "ahb", "mod";
-	};
-- 
2.21.0
