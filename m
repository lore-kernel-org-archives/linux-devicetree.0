From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 04/19] irqchip: Export generic chip domain map/unmap functions
Date: Thu,  5 Sep 2019 22:43:01 +0800
Message-ID: <20190905144316.12527-5-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

Export irq_map_generic_chip, irq_unmap_generic_chip so drivers
can use them to construct their own generic chip domain ops.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/linux/irq.h       | 1 +
 kernel/irq/generic-chip.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fb301cf29148..3637c24046e1 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1060,6 +1060,7 @@ int irq_gc_set_wake(struct irq_data *d, unsigned int on);
 /* Setup functions for irq_chip_generic */
 int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 			 irq_hw_number_t hw_irq);
+void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq);
 struct irq_chip_generic *
 irq_alloc_generic_chip(const char *name, int nr_ct, unsigned int irq_base,
 		       void __iomem *reg_base, irq_flow_handler_t handler);
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index e2999a070a99..211b15c0d647 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -423,8 +423,9 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 	irq_modify_status(virq, dgc->irq_flags_to_clear, dgc->irq_flags_to_set);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(irq_map_generic_chip);
 
-static void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
+void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
 {
 	struct irq_data *data = irq_domain_get_irq_data(d, virq);
 	struct irq_domain_chip_generic *dgc = d->gc;
@@ -443,6 +444,7 @@ static void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
 			    NULL);
 
 }
+EXPORT_SYMBOL_GPL(irq_unmap_generic_chip);
 
 struct irq_domain_ops irq_generic_chip_ops = {
 	.map	= irq_map_generic_chip,
-- 
2.22.0
