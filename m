From: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/2] irqchip: add support for Sigma Designs SMP86xx/SMP87xx interrupt controller
Date: Wed, 20 Jan 2016 18:07:17 +0000
Message-ID: <1453313237-18570-2-git-send-email-mans@mansr.com>
References: <1453313237-18570-1-git-send-email-mans@mansr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453313237-18570-1-git-send-email-mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the secondary interrupt controller used in Sigma
Designs SMP86xx and SMP87xx chips.

Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
---
Changes from v3:
- use of_address_to_resource() rather accessing "reg" property directly

Boot tested on SMP8643 (tango3) and SMP8759 (tango4)
---
 drivers/irqchip/Kconfig     |   5 +
 drivers/irqchip/Makefile    |   1 +
 drivers/irqchip/irq-tango.c | 232 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)
 create mode 100644 drivers/irqchip/irq-tango.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4d7294e5d982..399eda54b860 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -133,6 +133,11 @@ config ST_IRQCHIP
 	help
 	  Enables SysCfg Controlled IRQs on STi based platforms.
 
+config TANGO_IRQ
+	bool
+	select IRQ_DOMAIN
+	select GENERIC_IRQ_CHIP
+
 config TB10X_IRQC
 	bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 177f78f6e6d6..74512452cc8b 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_VERSATILE_FPGA_IRQ)	+= irq-versatile-fpga.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
 obj-$(CONFIG_ARCH_VT8500)		+= irq-vt8500.o
 obj-$(CONFIG_ST_IRQCHIP)		+= irq-st.o
+obj-$(CONFIG_TANGO_IRQ)			+= irq-tango.o
 obj-$(CONFIG_TB10X_IRQC)		+= irq-tb10x.o
 obj-$(CONFIG_XTENSA)			+= irq-xtensa-pic.o
 obj-$(CONFIG_XTENSA_MX)			+= irq-xtensa-mx.o
diff --git a/drivers/irqchip/irq-tango.c b/drivers/irqchip/irq-tango.c
new file mode 100644
index 000000000000..bdbb5c0ff7fe
--- /dev/null
+++ b/drivers/irqchip/irq-tango.c
@@ -0,0 +1,232 @@
+/*
+ * Copyright (C) 2014 Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/ioport.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+
+#define IRQ0_CTL_BASE		0x0000
+#define IRQ1_CTL_BASE		0x0100
+#define EDGE_CTL_BASE		0x0200
+#define IRQ2_CTL_BASE		0x0300
+
+#define IRQ_CTL_HI		0x18
+#define EDGE_CTL_HI		0x20
+
+#define IRQ_STATUS		0x00
+#define IRQ_RAWSTAT		0x04
+#define IRQ_EN_SET		0x08
+#define IRQ_EN_CLR		0x0c
+#define IRQ_SOFT_SET		0x10
+#define IRQ_SOFT_CLR		0x14
+
+#define EDGE_STATUS		0x00
+#define EDGE_RAWSTAT		0x04
+#define EDGE_CFG_RISE		0x08
+#define EDGE_CFG_FALL		0x0c
+#define EDGE_CFG_RISE_SET	0x10
+#define EDGE_CFG_RISE_CLR	0x14
+#define EDGE_CFG_FALL_SET	0x18
+#define EDGE_CFG_FALL_CLR	0x1c
+
+struct tangox_irq_chip {
+	void __iomem *base;
+	unsigned long ctl;
+};
+
+static inline u32 intc_readl(struct tangox_irq_chip *chip, int reg)
+{
+	return readl_relaxed(chip->base + reg);
+}
+
+static inline void intc_writel(struct tangox_irq_chip *chip, int reg, u32 val)
+{
+	writel_relaxed(val, chip->base + reg);
+}
+
+static void tangox_dispatch_irqs(struct irq_domain *dom, unsigned int status,
+				 int base)
+{
+	unsigned int hwirq;
+	unsigned int virq;
+
+	while (status) {
+		hwirq = __ffs(status);
+		virq = irq_find_mapping(dom, base + hwirq);
+		if (virq)
+			generic_handle_irq(virq);
+		status &= ~BIT(hwirq);
+	}
+}
+
+static void tangox_irq_handler(struct irq_desc *desc)
+{
+	struct irq_domain *dom = irq_desc_get_handler_data(desc);
+	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	struct tangox_irq_chip *chip = dom->host_data;
+	unsigned int status_lo, status_hi;
+
+	chained_irq_enter(host_chip, desc);
+
+	status_lo = intc_readl(chip, chip->ctl + IRQ_STATUS);
+	status_hi = intc_readl(chip, chip->ctl + IRQ_CTL_HI + IRQ_STATUS);
+
+	tangox_dispatch_irqs(dom, status_lo, 0);
+	tangox_dispatch_irqs(dom, status_hi, 32);
+
+	chained_irq_exit(host_chip, desc);
+}
+
+static int tangox_irq_set_type(struct irq_data *d, unsigned int flow_type)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct tangox_irq_chip *chip = gc->domain->host_data;
+	struct irq_chip_regs *regs = &gc->chip_types[0].regs;
+
+	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		intc_writel(chip, regs->type + EDGE_CFG_RISE_SET, d->mask);
+		intc_writel(chip, regs->type + EDGE_CFG_FALL_CLR, d->mask);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		intc_writel(chip, regs->type + EDGE_CFG_RISE_CLR, d->mask);
+		intc_writel(chip, regs->type + EDGE_CFG_FALL_SET, d->mask);
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		intc_writel(chip, regs->type + EDGE_CFG_RISE_CLR, d->mask);
+		intc_writel(chip, regs->type + EDGE_CFG_FALL_CLR, d->mask);
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		intc_writel(chip, regs->type + EDGE_CFG_RISE_SET, d->mask);
+		intc_writel(chip, regs->type + EDGE_CFG_FALL_SET, d->mask);
+		break;
+
+	default:
+		pr_err("Invalid trigger mode %x for IRQ %d\n",
+		       flow_type, d->irq);
+		return -EINVAL;
+	}
+
+	return irq_setup_alt_chip(d, flow_type);
+}
+
+static void __init tangox_irq_init_chip(struct irq_chip_generic *gc,
+					unsigned long ctl_offs,
+					unsigned long edge_offs)
+{
+	struct tangox_irq_chip *chip = gc->domain->host_data;
+	struct irq_chip_type *ct = gc->chip_types;
+	unsigned long ctl_base = chip->ctl + ctl_offs;
+	unsigned long edge_base = EDGE_CTL_BASE + edge_offs;
+	int i;
+
+	gc->reg_base = chip->base;
+	gc->unused = 0;
+
+	for (i = 0; i < 2; i++) {
+		ct[i].chip.irq_ack = irq_gc_ack_set_bit;
+		ct[i].chip.irq_mask = irq_gc_mask_disable_reg;
+		ct[i].chip.irq_mask_ack = irq_gc_mask_disable_reg_and_ack;
+		ct[i].chip.irq_unmask = irq_gc_unmask_enable_reg;
+		ct[i].chip.irq_set_type = tangox_irq_set_type;
+		ct[i].chip.name = gc->domain->name;
+
+		ct[i].regs.enable = ctl_base + IRQ_EN_SET;
+		ct[i].regs.disable = ctl_base + IRQ_EN_CLR;
+		ct[i].regs.ack = edge_base + EDGE_RAWSTAT;
+		ct[i].regs.type = edge_base;
+	}
+
+	ct[0].type = IRQ_TYPE_LEVEL_MASK;
+	ct[0].handler = handle_level_irq;
+
+	ct[1].type = IRQ_TYPE_EDGE_BOTH;
+	ct[1].handler = handle_edge_irq;
+
+	intc_writel(chip, ct->regs.disable, 0xffffffff);
+	intc_writel(chip, ct->regs.ack, 0xffffffff);
+}
+
+static void __init tangox_irq_domain_init(struct irq_domain *dom)
+{
+	struct irq_chip_generic *gc;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		gc = irq_get_domain_generic_chip(dom, i * 32);
+		tangox_irq_init_chip(gc, i * IRQ_CTL_HI, i * EDGE_CTL_HI);
+	}
+}
+
+static int __init tangox_irq_init(void __iomem *base, struct resource *baseres,
+				  struct device_node *node)
+{
+	struct tangox_irq_chip *chip;
+	struct irq_domain *dom;
+	struct resource res;
+	int irq;
+	int err;
+
+	irq = irq_of_parse_and_map(node, 0);
+	if (!irq)
+		panic("%s: failed to get IRQ", node->name);
+
+	err = of_address_to_resource(node, 0, &res);
+	if (err)
+		panic("%s: failed to get address", node->name);
+
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	chip->ctl = res.start - baseres->start;
+	chip->base = base;
+
+	dom = irq_domain_add_linear(node, 64, &irq_generic_chip_ops, chip);
+	if (!dom)
+		panic("%s: failed to create irqdomain", node->name);
+
+	err = irq_alloc_domain_generic_chips(dom, 32, 2, node->name,
+					     handle_level_irq, 0, 0, 0);
+	if (err)
+		panic("%s: failed to allocate irqchip", node->name);
+
+	tangox_irq_domain_init(dom);
+
+	irq_set_chained_handler(irq, tangox_irq_handler);
+	irq_set_handler_data(irq, dom);
+
+	return 0;
+}
+
+static int __init tangox_of_irq_init(struct device_node *node,
+				     struct device_node *parent)
+{
+	struct device_node *c;
+	struct resource res;
+	void __iomem *base;
+
+	base = of_iomap(node, 0);
+	if (!base)
+		panic("%s: of_iomap failed", node->name);
+
+	of_address_to_resource(node, 0, &res);
+
+	for_each_child_of_node(node, c)
+		tangox_irq_init(base, &res, c);
+
+	return 0;
+}
+IRQCHIP_DECLARE(tangox_intc, "sigma,smp8642-intc", tangox_of_irq_init);
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
