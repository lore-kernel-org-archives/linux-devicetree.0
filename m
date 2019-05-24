From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 7/8] net: ethernet: ixp4xx: Add DT bindings
Date: Fri, 24 May 2019 18:22:29 +0200
Message-ID: <20190524162229.9185-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Cc: Krzysztof Halasa <khalasa@piap.pl>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the IXP4xx ethernet.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/net/intel,ixp4xx-ethernet.yaml   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml

diff --git a/Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml b/Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml
new file mode 100644
index 000000000000..4575a7e5aa4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/net/intel-ixp4xx-ethernet.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Intel IXP4xx ethernet
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Intel IXP4xx ethernet makes use of the IXP4xx NPE (Network
+  Processing Engine) and the IXP4xx Queue Mangager to process
+  the ethernet frames. It can optionally contain an MDIO bus to
+  talk to PHYs.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - const: intel,ixp4xx-ethernet
+
+  reg:
+    maxItems: 1
+    description: Ethernet MMIO address range
+
+  queue-rx:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    maxItems: 1
+    description: phandle to the RX queue on the NPE
+
+  queue-txready:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    maxItems: 1
+    description: phandle to the TX READY queue on the NPE
+
+required:
+  - compatible
+  - reg
+  - queue-rx
+  - queue-txready
+
+examples:
+  - |
+    ethernet@c8009000 {
+        compatible = "intel,ixp4xx-ethernet";
+        reg = <0xc8009000 0x1000>;
+        status = "disabled";
+        queue-rx = <&qmgr 3>;
+        queue-txready = <&qmgr 20>;
+    };
-- 
2.20.1
