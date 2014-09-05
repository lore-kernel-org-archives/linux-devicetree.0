From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 13/16] irqchip: mips-gic: Add generic IPI support when using DT
Date: Fri,  5 Sep 2014 10:30:15 -0700
Message-ID: <1409938218-9026-14-git-send-email-abrestic@chromium.org>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409938218-9026-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When DT-based probing is used for the GIC and the GIC is also used
for IPIs (i.e. MIPS_GIC_IPI=y), set up the last 2 * NR_CPUs GIC
interrupts as the reschedule and call IPIs.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes from v1:
 - removed open-coding of irq_set_type
---
 drivers/irqchip/irq-mips-gic.c | 81 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index d885749..82a35cf 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/interrupt.h>
 #include <linux/clocksource.h>
@@ -479,6 +480,84 @@ void __init gic_init(unsigned long gic_base_addr,
 static int gic_cpu_pin[GIC_NUM_CPU_INT];
 static int num_gic_cpu_pins;
 
+#ifdef CONFIG_MIPS_GIC_IPI
+static int gic_resched_int_base;
+static int gic_call_int_base;
+
+unsigned int plat_ipi_resched_int_xlate(unsigned int cpu)
+{
+	return gic_resched_int_base + cpu;
+}
+
+unsigned int plat_ipi_call_int_xlate(unsigned int cpu)
+{
+	return gic_call_int_base + cpu;
+}
+
+static irqreturn_t ipi_resched_interrupt(int irq, void *dev_id)
+{
+	scheduler_ipi();
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t ipi_call_interrupt(int irq, void *dev_id)
+{
+	smp_call_function_interrupt();
+
+	return IRQ_HANDLED;
+}
+
+static struct irqaction irq_resched = {
+	.handler	= ipi_resched_interrupt,
+	.flags		= IRQF_PERCPU,
+	.name		= "IPI resched"
+};
+
+static struct irqaction irq_call = {
+	.handler	= ipi_call_interrupt,
+	.flags		= IRQF_PERCPU,
+	.name		= "IPI call"
+};
+
+static __init void gic_ipi_init_one(struct irq_domain *domain,
+				    unsigned int hwirq, int cpu,
+				    struct irqaction *action)
+{
+	int irq = irq_create_mapping(domain, hwirq);
+	int i;
+
+	GIC_SH_MAP_TO_VPE_SMASK(hwirq, cpu);
+	for (i = 0; i < NR_CPUS; i++)
+		clear_bit(hwirq, pcpu_masks[i].pcpu_mask);
+	set_bit(hwirq, pcpu_masks[cpu].pcpu_mask);
+
+	irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
+
+	irq_set_chip_and_handler(irq, &gic_irq_controller, handle_percpu_irq);
+	setup_irq(irq, action);
+}
+
+static __init void gic_ipi_init(struct irq_domain *domain)
+{
+	int i;
+
+	/* Use last 2 * NR_CPUS interrupts as IPIs */
+	gic_resched_int_base = GIC_NUM_INTRS - nr_cpu_ids;
+	gic_call_int_base = gic_resched_int_base - nr_cpu_ids;
+
+	for (i = 0; i < nr_cpu_ids; i++) {
+		gic_ipi_init_one(domain, gic_call_int_base + i, i, &irq_call);
+		gic_ipi_init_one(domain, gic_resched_int_base + i, i,
+				 &irq_resched);
+	}
+}
+#else
+static inline void gic_ipi_init(struct irq_domain *domain)
+{
+}
+#endif
+
 static int gic_irq_domain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hw)
 {
@@ -563,6 +642,8 @@ int __init gic_of_init(struct device_node *node, struct device_node *parent)
 		irq_set_handler_data(irq, domain);
 	}
 
+	gic_ipi_init(domain);
+
 	return 0;
 }
 IRQCHIP_DECLARE(mips_gic, "mti,global-interrupt-controller", gic_of_init);
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
