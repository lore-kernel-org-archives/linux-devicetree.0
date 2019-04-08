From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 10/31 v3] irqchip: ixp4xx: Add DT bindings
Date: Mon,  8 Apr 2019 08:28:10 +0200
Message-ID: <20190408062831.16422-11-linus.walleij@linaro.org>
References: <20190408062831.16422-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408062831.16422-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the IXP4xx interrupt
controller. It's a standard 2-cell controller.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Dropped oneOf on compatible
- Dropped description on reg, set maxItems 1
- Drop the description on interrupt-cells
- Collect Rob's review tag
ChangeLog v1->v2:
- Converted to use JSON yaml schema, why not.
- Not keeping Rob's ACK because I think he wants to take
  a second look.
---
 .../intel,ixp4xx-interrupt.yaml               | 54 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
new file mode 100644
index 000000000000..bae10e261fa9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
@@ -0,0 +1,54 @@
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
+    items:
+      - enum:
+        - intel,ixp42x-interrupt
+        - intel,ixp43x-interrupt
+        - intel,ixp45x-interrupt
+        - intel,ixp46x-interrupt
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
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
index bc918f318797..ad05704fbd68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1690,6 +1690,7 @@ M:	Imre Kaloz <kaloz@openwrt.org>
 M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	arch/arm/mach-ixp4xx/
 F:	drivers/clocksource/timer-ixp4xx.c
 F:	drivers/gpio/gpio-ixp4xx.c
-- 
2.20.1
