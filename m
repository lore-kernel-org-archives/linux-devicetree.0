From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 2/9] dt-bindings: rng: amlogic,meson-rng: convert to yaml
Date: Thu,  1 Aug 2019 15:56:37 +0200
Message-ID: <20190801135644.12843-3-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/rng/amlogic,meson-rng.txt        | 21 -----------
 .../bindings/rng/amlogic,meson-rng.yaml       | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
deleted file mode 100644
index 4d403645ac9b..000000000000
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Amlogic Meson Random number generator
-=====================================
-
-Required properties:
-
-- compatible : should be "amlogic,meson-rng"
-- reg : Specifies base physical address and size of the registers.
-
-Optional properties:
-
-- clocks : phandle to the following named clocks
-- clock-names: Name of core clock, must be "core"
-
-Example:
-
-rng {
-	compatible = "amlogic,meson-rng";
-	reg = <0x0 0xc8834000 0x0 0x4>;
-	clocks = <&clkc CLKID_RNG0>;
-	clock-names = "core";
-};
diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
new file mode 100644
index 000000000000..a9ff3cb35c5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/amlogic,meson-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Random number generator
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-rng
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: core
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    rng@c8834000 {
+          compatible = "amlogic,meson-rng";
+          reg = <0xc8834000 0x4>;
+    };
-- 
2.22.0
