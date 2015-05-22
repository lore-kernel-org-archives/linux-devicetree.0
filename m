From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 04/15] MIPS: i8259: DT support
Date: Fri, 22 May 2015 16:51:03 +0100
Message-ID: <1432309875-9712-5-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support probing the i8259 programmable interrupt controller, as found on
the Malta board, and using its interrupts via device tree.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---

 arch/mips/include/asm/i8259.h |  1 +
 arch/mips/kernel/i8259.c      | 43 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/i8259.h b/arch/mips/include/asm/i8259.h
index c7e2784..a7fbcd6 100644
--- a/arch/mips/include/asm/i8259.h
+++ b/arch/mips/include/asm/i8259.h
@@ -41,6 +41,7 @@ extern int i8259A_irq_pending(unsigned int irq);
 extern void make_8259A_irq(unsigned int irq);
 
 extern void init_i8259_irqs(void);
+extern int i8259_of_init(struct device_node *node, struct device_node *parent);
 
 /*
  * Do the traditional i8259 interrupt polling thing.  This is for the few
diff --git a/arch/mips/kernel/i8259.c b/arch/mips/kernel/i8259.c
index a74ec3a..74f6752 100644
--- a/arch/mips/kernel/i8259.c
+++ b/arch/mips/kernel/i8259.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/of_irq.h>
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 #include <linux/irq.h>
@@ -21,6 +22,8 @@
 #include <asm/i8259.h>
 #include <asm/io.h>
 
+#include "../../drivers/irqchip/irqchip.h"
+
 /*
  * This is the 'legacy' 8259A Programmable Interrupt Controller,
  * present in the majority of PC/AT boxes.
@@ -327,7 +330,7 @@ static struct irq_domain_ops i8259A_ops = {
  * driver compatibility reasons interrupts 0 - 15 to be the i8259
  * interrupts even if the hardware uses a different interrupt numbering.
  */
-void __init init_i8259_irqs(void)
+struct irq_domain * __init __init_i8259_irqs(struct device_node *node)
 {
 	struct irq_domain *domain;
 
@@ -336,10 +339,46 @@ void __init init_i8259_irqs(void)
 
 	init_8259A(0);
 
-	domain = irq_domain_add_legacy(NULL, 16, I8259A_IRQ_BASE, 0,
+	domain = irq_domain_add_legacy(node, 16, I8259A_IRQ_BASE, 0,
 				       &i8259A_ops, NULL);
 	if (!domain)
 		panic("Failed to add i8259 IRQ domain");
 
 	setup_irq(I8259A_IRQ_BASE + PIC_CASCADE_IR, &irq2);
+	return domain;
+}
+
+void __init init_i8259_irqs(void)
+{
+	__init_i8259_irqs(NULL);
+}
+
+static void i8259_irq_dispatch(unsigned int irq, struct irq_desc *desc)
+{
+	struct irq_domain *domain = irq_get_handler_data(irq);
+	int hwirq = i8259_irq();
+
+	if (hwirq < 0)
+		return;
+
+	irq = irq_linear_revmap(domain, hwirq);
+	generic_handle_irq(irq);
+}
+
+int __init i8259_of_init(struct device_node *node, struct device_node *parent)
+{
+	struct irq_domain *domain;
+	unsigned int parent_irq;
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq) {
+		pr_err("Failed to map i8259 parent IRQ\n");
+		return -ENODEV;
+	}
+
+	domain = __init_i8259_irqs(node);
+	irq_set_handler_data(parent_irq, domain);
+	irq_set_chained_handler(parent_irq, i8259_irq_dispatch);
+	return 0;
 }
+IRQCHIP_DECLARE(i8259, "intel,i8259", i8259_of_init);
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
