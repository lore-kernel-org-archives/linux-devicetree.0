From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v6 1/2] dt-bindings: soc: al-pos: Amazon's Annapurna Labs POS
Date: Thu, 10 Oct 2019 14:41:20 +0300
Message-ID: <1570707681-865-2-git-send-email-talel@amazon.com>
References: <1570707681-865-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570707681-865-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, maz@kernel.org, mark.rutland@arm.com, arnd@arndb.de, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, talel@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

Document Amazon's Annapurna Labs POS SoC binding.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 .../bindings/edac/amazon,al-pos-edac.yaml          | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml

diff --git a/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml b/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
new file mode 100644
index 00000000..776f31f
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/amazon,al-pos-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amazon's Annapurna Labs POS
+
+maintainers:
+  - Talel Shenhar <talel@amazon.com>
+  - Talel Shenhar <talelshenhar@gmail.com>
+
+description: |
+  POS node is defined to describe the Point Of Serialization (POS) error
+  detection capability.
+
+properties:
+
+  compatible:
+    const: "amazon,al-pos-edac"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Interrupt for the error event.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    edac@f0070084 {
+      compatible = "amazon,al-pos-edac";
+      reg = <0x0 0xf0070084 0x0 0x00000008>;
+      interrupt-parent = <&amazon_system_fabric>;
+      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.7.4
