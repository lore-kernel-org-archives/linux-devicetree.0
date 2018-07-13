From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] irqchip: ingenic: Add support for the JZ4725B SoC
Date: Fri, 13 Jul 2018 16:49:09 +0200
Message-ID: <20180713144909.10657-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The interrupt controller of the JZ4725B works the same way as the other
JZ SoCs from Ingenic; so we just add a new compatible string.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt | 1 +
 drivers/irqchip/irq-ingenic.c                                           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
index 5f89fb635a1b..f97fd8ab5e45 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
@@ -4,6 +4,7 @@ Required properties:
 
 - compatible : should be "ingenic,<socname>-intc". Valid strings are:
     ingenic,jz4740-intc
+    ingenic,jz4725b-intc
     ingenic,jz4770-intc
     ingenic,jz4775-intc
     ingenic,jz4780-intc
diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index fc5953dea509..2ff08986b536 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -165,6 +165,7 @@ static int __init intc_1chip_of_init(struct device_node *node,
 	return ingenic_intc_of_init(node, 1);
 }
 IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", intc_1chip_of_init);
+IRQCHIP_DECLARE(jz4725b_intc, "ingenic,jz4725b-intc", intc_1chip_of_init);
 
 static int __init intc_2chip_of_init(struct device_node *node,
 	struct device_node *parent)
-- 
2.11.0
