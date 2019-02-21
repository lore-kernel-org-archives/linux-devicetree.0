From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/30 v2] clocksource/drivers/ixp4xx: Add DT bindings
Date: Thu, 21 Feb 2019 16:44:39 +0100
Message-ID: <20190221154458.23763-12-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Intel IXP4xx
timers.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Switch to JSON YAML schema, why not.
- Not collecting any review tags as this changed a bit.
---
 .../bindings/timer/intel,ixp4xx-timer.yaml    | 42 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml b/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
new file mode 100644
index 000000000000..a36a0746c056
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2018 Linaro Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/timer/intel-ixp4xx-timer.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Intel IXP4xx XScale Networking Processors Timers
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: This timer is found in the Intel IXP4xx processors.
+
+properties:
+  compatible:
+    items:
+      - const: intel,ixp4xx-timer
+
+  reg:
+    description: Should contain registers location and length
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Timer 1 interrupt
+      - description: Timer 2 interrupt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@c8005000 {
+        compatible = "intel,ixp4xx-timer";
+        reg = <0xc8005000 0x100>;
+        interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 79f01af59a63..bd04142b1026 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1651,6 +1651,7 @@ M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
+F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
 F:	arch/arm/mach-ixp4xx/
 F:	drivers/clocksource/timer-ixp4xx.c
 F:	drivers/gpio/gpio-ixp4xx.c
-- 
2.20.1
