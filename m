From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 4/9] dt-bindings: reset: amlogic,meson-reset: convert to yaml
Date: Thu,  1 Aug 2019 15:56:39 +0200
Message-ID: <20190801135644.12843-5-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/reset/amlogic,meson-reset.txt    | 19 ---------
 .../bindings/reset/amlogic,meson-reset.yaml   | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
deleted file mode 100644
index 28ef6c295c76..000000000000
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Amlogic Meson SoC Reset Controller
-=======================================
-
-Please also refer to reset.txt in this directory for common reset
-controller binding usage.
-
-Required properties:
-- compatible: Should be "amlogic,meson8b-reset", "amlogic,meson-gxbb-reset" or
-	"amlogic,meson-axg-reset".
-- reg: should contain the register address base
-- #reset-cells: 1, see below
-
-example:
-
-reset: reset-controller {
-	compatible = "amlogic,meson-gxbb-reset";
-	reg = <0x0 0x04404 0x0 0x20>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
new file mode 100644
index 000000000000..dd211bf84f25
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson SoC Reset Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    oneOf:
+     - enum:
+       - amlogic,meson8b-reset
+     - enum:
+       - amlogic,meson-gxbb-reset
+     - enum:
+       - amlogic,meson-axg-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+examples:
+  - |
+    reset-controller@c884404 {
+          compatible = "amlogic,meson-gxbb-reset";
+          reg = <0xc884404 0x20>;
+          #reset-cells = <1>;
+    };
-- 
2.22.0
