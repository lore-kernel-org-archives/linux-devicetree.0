From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: gpio: Convert Arm PL061 to json-schema
Date: Mon, 13 May 2019 19:50:33 -0500
Message-ID: <20190514005033.15593-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert the Arm PL061 GPIO controller binding to json-schema format.

As I'm the author for all but the gpio-ranges line, make the schema dual
GPL/BSD license.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This warns on a few platforms missing clocks, interrupt-controller 
and/or #interrupt-cells. We could not make those required, but really 
they should be IMO. OTOH, it's platforms like Spear and Calxeda which 
aren't too active, so I don't know that we want to fix them.

 .../devicetree/bindings/gpio/pl061-gpio.txt   | 10 ---
 .../devicetree/bindings/gpio/pl061-gpio.yaml  | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 10 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/pl061-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
deleted file mode 100644
index 89058d375b7c..000000000000
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-ARM PL061 GPIO controller
-
-Required properties:
-- compatible : "arm,pl061", "arm,primecell"
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-  - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- gpio-controller : Marks the device node as a GPIO controller.
-- interrupts : Interrupt mapping for GPIO IRQ.
-- gpio-ranges : Interaction with the PINCTRL subsystem.
diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
new file mode 100644
index 000000000000..313b17229247
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM PL061 GPIO controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Rob Herring <robh@kernel.org>
+
+# We need a select here so we don't match all nodes with 'arm,primecell'
+select:
+  properties:
+    compatible:
+      contains:
+        const: arm,pl061
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - const: arm,pl061
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    oneOf:
+      - maxItems: 1
+      - maxItems: 8
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - clocks
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+...
-- 
2.20.1
