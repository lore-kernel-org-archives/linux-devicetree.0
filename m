From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 08/18] dt-bindings: interrupt-controller: Add Loongson-3 HTINTC
Date: Fri, 30 Aug 2019 12:32:22 +0800
Message-ID: <20190830043232.20191-3-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Document Loongson-3 HyperTransport Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,ls3-htintc.yaml                  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
new file mode 100644
index 000000000000..51fee46ab060
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-htintc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 HyperTransport Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips to transfer
+  interrupts from PCH connected on HyperTransport bus.
+
+properties:
+  compatible:
+    const: loongson,ls3-htintc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+    description: |
+      Four parent interrupts that recieve chained interrupt randomly.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    htintc: interrupt-controller@fb000080 {
+      compatible = "loongson,ls3-htintc";
+      reg = <0xfb000080 0x100>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&iointc>;
+      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+            <25 IRQ_TYPE_LEVEL_HIGH>,
+            <26 IRQ_TYPE_LEVEL_HIGH>,
+            <27 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.22.0
