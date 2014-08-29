From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 05/12] MIPS: GIC: Add device-tree support
Date: Fri, 29 Aug 2014 15:14:32 -0700
Message-ID: <1409350479-19108-6-git-send-email-abrestic@chromium.org>
References: <1409350479-19108-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409350479-19108-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device-tree support for the MIPS GIC.  With DT, no per-platform
static device interrupt mapping is supplied and instead all device
interrupts are specified through the DT.  The GIC-to-CPU interrupts
must also be specified in the DT.

Platforms using DT-based probing of the GIC need only supply the
GIC_NUM_INTRS and, if necessary, MIPS_GIC_IRQ_BASE values and
call of_irq_init() with an of_device_id table including the GIC.

Currenlty only legacy and vecotred interrupt modes are supported.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/mips/include/asm/gic.h |  15 ++++++
 arch/mips/kernel/irq-gic.c  | 122 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 135 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/gic.h b/arch/mips/include/asm/gic.h
index d7699cf..1146803 100644
--- a/arch/mips/include/asm/gic.h
+++ b/arch/mips/include/asm/gic.h
@@ -339,6 +339,10 @@ struct gic_shared_intr_map {
 #define GIC_CPU_INT3		3 /* .		      */
 #define GIC_CPU_INT4		4 /* .		      */
 #define GIC_CPU_INT5		5 /* Core Interrupt 7 */
+#define GIC_NUM_CPU_INT		6
+
+/* Add 2 to convert GIC CPU pin to core interrupt */
+#define GIC_CPU_PIN_OFFSET	2
 
 /* Local GIC interrupts. */
 #define GIC_INT_TMR		(GIC_CPU_INT5)
@@ -381,4 +385,15 @@ extern void gic_disable_interrupt(int irq_vec);
 extern void gic_irq_ack(struct irq_data *d);
 extern void gic_finish_irq(struct irq_data *d);
 extern void gic_platform_init(int irqs, struct irq_chip *irq_controller);
+
+#ifdef CONFIG_IRQ_DOMAIN
+extern int gic_of_init(struct device_node *node, struct device_node *parent);
+#else
+static inline int gic_of_init(struct device_node *node,
+			      struct device_node *parent)
+{
+	return 0;
+}
+#endif
+
 #endif /* _ASM_GICREGS_H */
diff --git a/arch/mips/kernel/irq-gic.c b/arch/mips/kernel/irq-gic.c
index 9e9d8b9..be8bea4 100644
--- a/arch/mips/kernel/irq-gic.c
+++ b/arch/mips/kernel/irq-gic.c
@@ -8,8 +8,10 @@
  */
 #include <linux/bitmap.h>
 #include <linux/init.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/smp.h>
-#include <linux/irq.h>
+#include <linux/interrupt.h>
 #include <linux/clocksource.h>
 
 #include <asm/io.h>
@@ -243,7 +245,7 @@ static DEFINE_SPINLOCK(gic_lock);
 static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 			    bool force)
 {
-	unsigned int irq = (d->irq - gic_irq_base);
+	unsigned int irq = d->irq - gic_irq_base;
 	cpumask_t	tmp = CPU_MASK_NONE;
 	unsigned long	flags;
 	int		i;
@@ -400,3 +402,119 @@ void __init gic_init(unsigned long gic_base_addr,
 
 	gic_platform_init(numintrs, &gic_irq_controller);
 }
+
+#ifdef CONFIG_IRQ_DOMAIN
+/* CPU core IRQs used by GIC */
+static int gic_cpu_pin[GIC_NUM_CPU_INT];
+static int num_gic_cpu_pins;
+
+/* Index of core IRQ used by a particular GIC IRQ */
+static int gic_irq_pin[GIC_NUM_INTRS];
+
+static inline int gic_irq_to_cpu_pin(unsigned int hwirq)
+{
+	return gic_cpu_pin[gic_irq_pin[hwirq]] - MIPS_CPU_IRQ_BASE -
+		GIC_CPU_PIN_OFFSET;
+}
+
+static int gic_irq_domain_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(irq, &gic_irq_controller, handle_level_irq);
+
+	GICWRITE(GIC_REG_ADDR(SHARED, GIC_SH_MAP_TO_PIN(hw)),
+		 GIC_MAP_TO_PIN_MSK | gic_irq_to_cpu_pin(hw));
+	/* Map to VPE 0 by default */
+	GIC_SH_MAP_TO_VPE_SMASK(hw, 0);
+	set_bit(hw, pcpu_masks[0].pcpu_mask);
+
+	return 0;
+}
+
+static int gic_irq_domain_xlate(struct irq_domain *d, struct device_node *ctrlr,
+				const u32 *intspec, unsigned int intsize,
+				unsigned long *out_hwirq,
+				unsigned int *out_type)
+{
+	if (intsize != 2 && intsize != 3)
+		return -EINVAL;
+
+	if (intspec[0] >= GIC_NUM_INTRS)
+		return -EINVAL;
+	*out_hwirq = intspec[0];
+
+	*out_type = intspec[1] & IRQ_TYPE_SENSE_MASK;
+
+	if (intsize == 3) {
+		if (intspec[2] >= num_gic_cpu_pins)
+			return -EINVAL;
+		gic_irq_pin[intspec[0]] = intspec[2];
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops gic_irq_domain_ops = {
+	.map = gic_irq_domain_map,
+	.xlate = gic_irq_domain_xlate,
+};
+
+static void gic_irq_dispatch(unsigned int irq, struct irq_desc *desc)
+{
+	struct irq_domain *domain = irq_get_handler_data(irq);
+	unsigned int hwirq;
+
+	while ((hwirq = gic_get_int()) != GIC_NUM_INTRS) {
+		irq = irq_linear_revmap(domain, hwirq);
+		generic_handle_irq(irq);
+	}
+}
+
+void __init __weak gic_platform_init(int irqs, struct irq_chip *irq_controller)
+{
+}
+
+int __init gic_of_init(struct device_node *node, struct device_node *parent)
+{
+	struct irq_domain *domain;
+	struct resource res;
+	int i;
+
+	if (cpu_has_veic) {
+		pr_err("GIC EIC mode not supported with DT yet\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(gic_cpu_pin); i++) {
+		gic_cpu_pin[i] = irq_of_parse_and_map(node, i);
+		if (!gic_cpu_pin[i])
+			break;
+		num_gic_cpu_pins++;
+	}
+	if (!num_gic_cpu_pins) {
+		pr_err("No GIC to CPU interrupts specified\n");
+		return -ENODEV;
+	}
+
+	if (of_address_to_resource(node, 0, &res)) {
+		pr_err("Failed to get GIC memory range\n");
+		return -ENODEV;
+	}
+
+	gic_init(res.start, resource_size(&res), NULL, 0, MIPS_GIC_IRQ_BASE);
+
+	domain = irq_domain_add_legacy(node, GIC_NUM_INTRS, MIPS_GIC_IRQ_BASE,
+				       0, &gic_irq_domain_ops, NULL);
+	if (!domain) {
+		pr_err("Failed to add GIC IRQ domain\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < num_gic_cpu_pins; i++) {
+		irq_set_chained_handler(gic_cpu_pin[i], gic_irq_dispatch);
+		irq_set_handler_data(gic_cpu_pin[i], domain);
+	}
+
+	return 0;
+}
+#endif
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
