From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/6] irqchip: Add the ingenic-tcu-intc driver
Date: Fri, 29 Dec 2017 13:59:39 +0100
Message-ID: <20171229125942.27305-4-paul@crapouillou.net>
References: <20171229125942.27305-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229125942.27305-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This simple driver handles the IRQ chip of the TCU
(Timer Counter Unit) of the JZ47xx Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/interrupt-controller/ingenic,tcu.txt  |  32 +++++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-ingenic-tcu.c                  | 156 +++++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
 create mode 100644 drivers/irqchip/irq-ingenic-tcu.c

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
new file mode 100644
index 000000000000..a3e6318f8461
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
@@ -0,0 +1,32 @@
+Ingenic SoCs Timer/Counter Unit Interrupt Controller
+
+Required properties:
+
+- compatible : should be "ingenic,<socname>-tcu-intc". Valid strings are:
+  * ingenic,jz4740-tcu-intc
+  * ingenic,jz4770-tcu-intc
+  * ingenic,jz4780-tcu-intc
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- interrupt-parent : phandle of the interrupt controller.
+- interrupts : Specifies the interrupt the controller is connected to.
+
+Example:
+
+/ {
+	regmap {
+		compatible = "simple-mfd", "syscon";
+		reg = <0x10002000 0x1000>;
+
+		tcu: interrupt-controller {
+			compatible = "ingenic,jz4740-tcu-intc";
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <15>;
+		};
+	};
+};
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c70476b34a53..d3d0ce7c554a 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -267,6 +267,11 @@ config INGENIC_IRQ
 	depends on MACH_INGENIC
 	default y
 
+config INGENIC_TCU_IRQ
+	bool
+	depends on MACH_INGENIC || COMPILE_TEST
+	default y
+
 config RENESAS_H8300H_INTC
         bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index d2df34a54d38..b8070ee21d8a 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_RENESAS_H8300H_INTC)	+= irq-renesas-h8300h.o
 obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
+obj-$(CONFIG_INGENIC_TCU_IRQ)	+= irq-ingenic-tcu.o
 obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
 obj-$(CONFIG_PIC32_EVIC)		+= irq-pic32-evic.o
 obj-$(CONFIG_MVEBU_GICP)		+= irq-mvebu-gicp.o
diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
new file mode 100644
index 000000000000..56630349d253
--- /dev/null
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -0,0 +1,156 @@
+/*
+ * JZ4740 SoC TCU IRQ driver
+ *
+ * Copyright (C) 2016 Paul Cercueil <paul@crapouillou.net>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/bitops.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/syscon/ingenic-tcu.h>
+
+static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
+{
+	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
+	struct regmap *map = gc->private;
+	uint32_t irq_reg, irq_mask;
+	unsigned int i;
+
+	regmap_read(map, REG_TFR, &irq_reg);
+	regmap_read(map, REG_TMR, &irq_mask);
+
+	chained_irq_enter(irq_chip, desc);
+
+	irq_reg &= ~irq_mask;
+
+	for (i = 0; i < 32; i++) {
+		if (irq_reg & BIT(i))
+			generic_handle_irq(irq_linear_revmap(domain, i));
+	}
+
+	chained_irq_exit(irq_chip, desc);
+}
+
+static void ingenic_tcu_gc_unmask_enable_reg(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
+	struct regmap *map = gc->private;
+	u32 mask = d->mask;
+
+	irq_gc_lock(gc);
+	regmap_write(map, ct->regs.ack, mask);
+	regmap_write(map, ct->regs.enable, mask);
+	*ct->mask_cache |= mask;
+	irq_gc_unlock(gc);
+}
+
+static void ingenic_tcu_gc_mask_disable_reg(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
+	struct regmap *map = gc->private;
+	u32 mask = d->mask;
+
+	irq_gc_lock(gc);
+	regmap_write(map, ct->regs.disable, mask);
+	*ct->mask_cache &= ~mask;
+	irq_gc_unlock(gc);
+}
+
+static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
+	struct regmap *map = gc->private;
+	u32 mask = d->mask;
+
+	irq_gc_lock(gc);
+	regmap_write(map, ct->regs.ack, mask);
+	regmap_write(map, ct->regs.disable, mask);
+	irq_gc_unlock(gc);
+}
+
+static int __init ingenic_tcu_intc_of_init(struct device_node *node,
+	struct device_node *parent)
+{
+	struct irq_domain *domain;
+	struct irq_chip_generic *gc;
+	struct irq_chip_type *ct;
+	int err, i, num_parent_irqs;
+	unsigned int parent_irqs[3];
+	struct regmap *map;
+
+	num_parent_irqs = of_property_count_elems_of_size(
+			node, "interrupts", 4);
+	if (num_parent_irqs < 0 || num_parent_irqs > ARRAY_SIZE(parent_irqs))
+		return -EINVAL;
+
+	map = syscon_node_to_regmap(node->parent);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	domain = irq_domain_add_linear(node, 32, &irq_generic_chip_ops, NULL);
+	if (!domain)
+		return -ENOMEM;
+
+	err = irq_alloc_domain_generic_chips(domain, 32, 1, "TCU",
+			handle_level_irq, 0, IRQ_NOPROBE | IRQ_LEVEL, 0);
+	if (err)
+		goto out_domain_remove;
+
+	gc = irq_get_domain_generic_chip(domain, 0);
+	ct = gc->chip_types;
+
+	gc->wake_enabled = IRQ_MSK(32);
+	gc->private = map;
+
+	ct->regs.disable = REG_TMSR;
+	ct->regs.enable = REG_TMCR;
+	ct->regs.ack = REG_TFCR;
+	ct->chip.irq_unmask = ingenic_tcu_gc_unmask_enable_reg;
+	ct->chip.irq_mask = ingenic_tcu_gc_mask_disable_reg;
+	ct->chip.irq_mask_ack = ingenic_tcu_gc_mask_disable_reg_and_ack;
+	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
+
+	/* Mask all IRQs by default */
+	regmap_write(map, REG_TMSR, IRQ_MSK(32));
+
+	for (i = 0; i < num_parent_irqs; i++) {
+		parent_irqs[i] = irq_of_parse_and_map(node, i);
+		if (!parent_irqs[i]) {
+			err = -EINVAL;
+			goto out_unmap_irqs;
+		}
+
+		irq_set_chained_handler_and_data(parent_irqs[i],
+				ingenic_tcu_intc_cascade, domain);
+	}
+
+	return 0;
+
+out_unmap_irqs:
+	for (; i > 0; i--)
+		irq_dispose_mapping(parent_irqs[i - 1]);
+out_domain_remove:
+	irq_domain_remove(domain);
+	return err;
+}
+IRQCHIP_DECLARE(jz4740_tcu_intc, "ingenic,jz4740-tcu-intc",
+		ingenic_tcu_intc_of_init);
+IRQCHIP_DECLARE(jz4770_tcu_intc, "ingenic,jz4770-tcu-intc",
+		ingenic_tcu_intc_of_init);
+IRQCHIP_DECLARE(jz4780_tcu_intc, "ingenic,jz4780-tcu-intc",
+		ingenic_tcu_intc_of_init);
-- 
2.11.0
