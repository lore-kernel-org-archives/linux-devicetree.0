From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/5] dt-bindings: MIPS: lantiq: Add documentation for the External Bus Unit
Date: Sat, 27 Jul 2019 19:53:11 +0200
Message-ID: <20190727175315.28834-2-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org, hauke@hauke-m.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Lantiq SoCs contain a so-called External Bus Unit.

It attaches PCI memory as well as NAND and NOR flash. Additioanlly it
contains an interrupt-controller for the PCI_INTA interrupt line.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/mips/lantiq/lantiq,ebu.yaml      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
new file mode 100644
index 000000000000..0b0b27d0b64b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,ebu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq External Bus Unit (EBU) bindings
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    enum:
+      - lantiq,falcon-ebu
+      - lantiq,xway-ebu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The EBU module clock
+
+  interrupt-controller:
+    type: boolean
+
+  interrupt-cells:
+    const: 2
+
+  interrupts:
+    items:
+      - description: The EBU module interrupt line
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller@e105300 {
+        compatible = "lantiq,xway-ebu";
+        reg = <0xe105300 0x100>;
+        clocks = <&pmu 10>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&icu0>;
+        interrupts = <30>;
+    };
+...
-- 
2.22.0
