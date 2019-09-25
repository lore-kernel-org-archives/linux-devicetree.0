From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 2/5] dt-bindings: mfd: Document the Xylon LogiCVC multi-function device
Date: Wed, 25 Sep 2019 10:45:52 +0200
Message-ID: <20190925084555.147771-3-paul.kocialkowski@bootlin.com>
References: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

The LogiCVC is a display engine which also exposes GPIO functionality.
For this reason, it is described as a multi-function device that is expected
to provide register access to its children nodes for gpio and display.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/mfd/xylon,logicvc.yaml           | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
new file mode 100644
index 000000000000..f7a2a13d7918
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Bootlin
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xylon LogiCVC multi-function device
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+description: |
+  The LogiCVC is a display controller that also contains a GPIO controller.
+  As a result, a multi-function device is exposed as parent of the display
+  and GPIO blocks.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - xylon,logicvc-3.02.a
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - xylon,logicvc-3.02.a
+
+  required:
+    - compatible
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    &amba {
+      logicvc: logicvc@43c00000 {
+        compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
+        reg = <0x43c00000 0x6000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        logicvc_gpio: gpio@40 {
+          compatible = "xylon,logicvc-3.02.a-gpio";
+          reg = <0x40 0x40>;
+          ...
+        };
+        ...
+      };
+      ...
+    };
-- 
2.23.0
