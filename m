From: David Daney <david.daney@cavium.com>
Subject: [PATCH v6 2/6] genirq: Add handle_fasteoi_{level,edge}_irq flow handlers.
Date: Tue, 11 Apr 2017 10:21:05 -0700
Message-ID: <1491931269-15650-3-git-send-email-david.daney@cavium.com>
References: <1491931269-15650-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491931269-15650-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Follow-on patch for gpio-thunderx uses a irqdomain hierarchy which
requires slightly different flow handlers, add them to chip.c which
contains most of the other flow handlers.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 include/linux/irq.h |   2 ++
 kernel/irq/chip.c   | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index f887351..3db0eb8 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -518,6 +518,8 @@ static inline int irq_set_parent(int irq, int parent_irq)
 extern int irq_chip_pm_get(struct irq_data *data);
 extern int irq_chip_pm_put(struct irq_data *data);
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
+extern void handle_fasteoi_edge_irq(struct irq_desc *desc);
+extern void handle_fasteoi_level_irq(struct irq_desc *desc);
 extern void irq_chip_enable_parent(struct irq_data *data);
 extern void irq_chip_disable_parent(struct irq_data *data);
 extern void irq_chip_ack_parent(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 73ea90b..213105d 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -981,6 +981,108 @@ void irq_cpu_offline(void)
 
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 /**
+ *	handle_fasteoi_edge_irq - irq handler for edge hierarchy
+ *	stacked on transparent controllers
+ *
+ *	@desc:	the interrupt description structure for this irq
+ *
+ *	Like handle_fasteoi_irq(), but for use with hierarchy where
+ *	the irq_chip also needs to have its ->irq_ack() function
+ *	called.
+ */
+void handle_fasteoi_edge_irq(struct irq_desc *desc)
+{
+	struct irq_chip *chip = desc->irq_data.chip;
+
+	raw_spin_lock(&desc->lock);
+
+	if (!irq_may_run(desc))
+		goto out;
+
+	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
+
+	/*
+	 * If its disabled or no action available
+	 * then mask it and get out of here:
+	 */
+	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
+		desc->istate |= IRQS_PENDING;
+		mask_irq(desc);
+		goto out;
+	}
+
+	kstat_incr_irqs_this_cpu(desc);
+	if (desc->istate & IRQS_ONESHOT)
+		mask_irq(desc);
+
+	/* Start handling the irq */
+	desc->irq_data.chip->irq_ack(&desc->irq_data);
+
+	preflow_handler(desc);
+	handle_irq_event(desc);
+
+	cond_unmask_eoi_irq(desc, chip);
+
+	raw_spin_unlock(&desc->lock);
+	return;
+out:
+	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
+		chip->irq_eoi(&desc->irq_data);
+	raw_spin_unlock(&desc->lock);
+}
+EXPORT_SYMBOL_GPL(handle_fasteoi_edge_irq);
+
+/**
+ *	handle_fasteoi_level_irq - irq handler for level hierarchy
+ *	stacked on transparent controllers
+ *
+ *	@desc:	the interrupt description structure for this irq
+ *
+ *	Like handle_fasteoi_irq(), but for use with hierarchy where
+ *	the irq_chip also needs to have its ->irq_mask_ack() function
+ *	called.
+ */
+void handle_fasteoi_level_irq(struct irq_desc *desc)
+{
+	struct irq_chip *chip = desc->irq_data.chip;
+
+	raw_spin_lock(&desc->lock);
+	mask_ack_irq(desc);
+
+	if (!irq_may_run(desc))
+		goto out;
+
+	desc->istate &= ~(IRQS_REPLAY | IRQS_WAITING);
+
+	/*
+	 * If its disabled or no action available
+	 * then mask it and get out of here:
+	 */
+	if (unlikely(!desc->action || irqd_irq_disabled(&desc->irq_data))) {
+		desc->istate |= IRQS_PENDING;
+		mask_irq(desc);
+		goto out;
+	}
+
+	kstat_incr_irqs_this_cpu(desc);
+	if (desc->istate & IRQS_ONESHOT)
+		mask_irq(desc);
+
+	preflow_handler(desc);
+	handle_irq_event(desc);
+
+	cond_unmask_eoi_irq(desc, chip);
+
+	raw_spin_unlock(&desc->lock);
+	return;
+out:
+	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
+		chip->irq_eoi(&desc->irq_data);
+	raw_spin_unlock(&desc->lock);
+}
+EXPORT_SYMBOL_GPL(handle_fasteoi_level_irq);
+
+/**
  * irq_chip_enable_parent - Enable the parent interrupt (defaults to unmask if
  * NULL)
  * @data:	Pointer to interrupt specific data
-- 
1.8.3.1
