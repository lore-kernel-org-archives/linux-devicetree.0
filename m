From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 1/4 v4] irqchip: Ingenic: Change interrupt handling form cascade to chained_irq.
Date: Mon, 29 Jul 2019 01:34:30 +0800
Message-ID: <1564335273-22931-2-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

The interrupt handling method is changed from old-style cascade to
chained_irq which is more appropriate. Also, it can process the
corner situation that more than one irq is coming to a single
chip at the same time.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index f126255..49f7685 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 platform IRQ support
+ *  Ingenic XBurst platform IRQ support
  */
 
 #include <linux/errno.h>
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/ingenic.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
@@ -32,22 +33,34 @@ struct ingenic_intc_data {
 #define JZ_REG_INTC_PENDING	0x10
 #define CHIP_SIZE		0x20
 
-static irqreturn_t intc_cascade(int irq, void *data)
+static void ingenic_chained_handle_irq(struct irq_desc *desc)
 {
-	struct ingenic_intc_data *intc = irq_get_handler_data(irq);
-	uint32_t irq_reg;
+	struct ingenic_intc_data *intc = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	bool have_irq = false;
+	uint32_t pending;
 	unsigned i;
 
+	chained_irq_enter(chip, desc);
 	for (i = 0; i < intc->num_chips; i++) {
-		irq_reg = readl(intc->base + (i * CHIP_SIZE) +
+		pending = readl(intc->base + (i * CHIP_SIZE) +
 				JZ_REG_INTC_PENDING);
-		if (!irq_reg)
+		if (!pending)
 			continue;
 
-		generic_handle_irq(__fls(irq_reg) + (i * 32) + JZ4740_IRQ_BASE);
+		have_irq = true;
+		while (pending) {
+			int bit = __fls(pending);
+
+			generic_handle_irq(bit + (i * 32) + JZ4740_IRQ_BASE);
+			pending &= ~BIT(bit);
+		}
 	}
 
-	return IRQ_HANDLED;
+	if (!have_irq)
+		spurious_interrupt();
+
+	chained_irq_exit(chip, desc);
 }
 
 static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
@@ -70,11 +83,6 @@ void ingenic_intc_irq_resume(struct irq_data *data)
 	intc_irq_set_mask(gc, gc->mask_cache);
 }
 
-static struct irqaction intc_cascade_action = {
-	.handler = intc_cascade,
-	.name = "SoC intc cascade interrupt",
-};
-
 static int __init ingenic_intc_of_init(struct device_node *node,
 				       unsigned num_chips)
 {
@@ -139,7 +147,8 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 	if (!domain)
 		pr_warn("unable to register IRQ domain\n");
 
-	setup_irq(parent_irq, &intc_cascade_action);
+	irq_set_chained_handler_and_data(parent_irq,
+					ingenic_chained_handle_irq, intc);
 	return 0;
 
 out_unmap_irq:
-- 
2.7.4
