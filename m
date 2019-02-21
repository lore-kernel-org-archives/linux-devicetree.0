From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 09/30 v2] irqchip: ixp4xx: Add DT bindings
Date: Thu, 21 Feb 2019 16:44:37 +0100
Message-ID: <20190221154458.23763-10-linus.walleij@linaro.org>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
Cc: Marc Zyngier <marc.zyngier@arm.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the IXP4xx interrupt
controller. It's a standard 2-cell controller.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Converted to use JSON yaml schema, why not.
- Not keeping Rob's ACK because I think he wants to take
  a second look.
---
 .../intel,ixp4xx-interrupt.yaml               | 57 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
new file mode 100644
index 000000000000..f32c08f270d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt/intel-ixp4xx-interrupt.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Intel IXP4xx XScale Networking Processors Interrupt Controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  This interrupt controller is found in the Intel IXP4xx processors.
+  Some processors have 32 interrupts, some have up to 64 interrupts.
+  The exact number of interrupts is determined from the compatible
+  string.
+
+  The distinct IXP4xx families with different interrupt controller
+  variations are IXP42x, IXP43x, IXP45x and IXP46x. Those four
+  families were the only ones to reach the developer and consumer
+  market.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - intel,ixp42x-interrupt
+          - intel,ixp43x-interrupt
+          - intel,ixp45x-interrupt
+          - intel,ixp46x-interrupt
+
+  reg:
+    description: The register bank for the interrupt controller.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+    description: The number of cells to define the interrupts.
+      with two cells specified in interrupt-controller/interrupts.txt
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    intcon: interrupt-controller@c8003000 {
+        compatible = "intel,ixp43x-interrupt";
+        reg = <0xc8003000 0x100>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a2fb67b75026..79f01af59a63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1650,6 +1650,7 @@ M:	Imre Kaloz <kaloz@openwrt.org>
 M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	arch/arm/mach-ixp4xx/
 F:	drivers/clocksource/timer-ixp4xx.c
 F:	drivers/gpio/gpio-ixp4xx.c
-- 
2.20.1
