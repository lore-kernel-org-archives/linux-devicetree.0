From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] irqchip: Add driver for Loongson-1 interrupt controller
Date: Tue, 22 Jan 2019 23:45:56 +0800
Message-ID: <20190122154557.22689-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, paul.burton@mips.com, devicetree@vger.kernel.org, tglx@linutronix.de, robh+dt@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

This controller appeared on Loongson-1 family MCUs
including Loongson-1B and Loongson-1C.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig    |   9 ++
 drivers/irqchip/Makefile   |   1 +
 drivers/irqchip/irq-ls1x.c | 194 +++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/irqchip/irq-ls1x.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3d1e60779078..5dcb5456cd14 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -406,6 +406,15 @@ config IMX_IRQSTEER
 	help
 	  Support for the i.MX IRQSTEER interrupt multiplexer/remapper.
 
+config LS1X_IRQ
+	bool "Loongson-1 Interrupt Controller"
+	depends on MACH_LOONGSON32
+	default y
+	select IRQ_DOMAIN
+	select GENERIC_IRQ_CHIP
+	help
+	  Support for the Loongson-1 platform Interrupt Controller.
+
 endmenu
 
 config SIFIVE_PLIC
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index c93713d24b86..7acd0e36d0b4 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -94,3 +94,4 @@ obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
 obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
+obj-$(CONFIG_LS1X_IRQ)			+= irq-ls1x.o
diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
new file mode 100644
index 000000000000..f8ca738ed25c
--- /dev/null
+++ b/drivers/irqchip/irq-ls1x.c
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2019, Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *  Loongson-1 platform IRQ support
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/irqchip.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <asm/io.h>
+
+#include <asm/mach-loongson32/irq.h>
+
+struct ls_intc_data {
+	void __iomem *base;
+	unsigned int chip;
+};
+
+#define MAX_CHIPS	5
+#define LS_REG_INTC_STATUS	0x00
+#define LS_REG_INTC_EN	0x04
+#define LS_REG_INTC_SET	0x08
+#define LS_REG_INTC_CLR	0x0c
+#define LS_REG_INTC_POL 0x10
+#define LS_REG_INTC_EDGE 0x14
+#define CHIP_SIZE		0x18
+
+static irqreturn_t intc_cascade(int irq, void *data)
+{
+	struct ls_intc_data *intc = irq_get_handler_data(irq);
+	uint32_t irq_reg;
+
+	irq_reg = readl(intc->base + (CHIP_SIZE * intc->chip)
+					+ LS_REG_INTC_STATUS);
+	generic_handle_irq(__fls(irq_reg) + (intc->chip * 32) + LS1X_IRQ_BASE);
+
+	return IRQ_HANDLED;
+}
+
+static void ls_intc_set_bit(
+	struct irq_chip_generic *gc, unsigned int offset,
+	u32 mask, bool set)
+{
+	if (set)
+		writel(readl(gc->reg_base + offset) |
+		mask, gc->reg_base + offset);
+	else
+		writel(readl(gc->reg_base + offset) &
+		~mask, gc->reg_base + offset);
+}
+
+static int ls_intc_set_type(struct irq_data *data, unsigned int type)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
+	u32 mask = data->mask;
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		ls_intc_set_bit(gc, LS_REG_INTC_EDGE, mask, false);
+		ls_intc_set_bit(gc, LS_REG_INTC_POL, mask, true);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		ls_intc_set_bit(gc, LS_REG_INTC_EDGE, mask, false);
+		ls_intc_set_bit(gc, LS_REG_INTC_POL, mask, false);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		ls_intc_set_bit(gc, LS_REG_INTC_EDGE, mask, true);
+		ls_intc_set_bit(gc, LS_REG_INTC_POL, mask, true);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		ls_intc_set_bit(gc, LS_REG_INTC_EDGE, mask, true);
+		ls_intc_set_bit(gc, LS_REG_INTC_POL, mask, false);
+		break;
+	case IRQ_TYPE_NONE:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+
+static struct irqaction intc_cascade_action = {
+	.handler = intc_cascade,
+	.name = "intc cascade interrupt",
+};
+
+static int __init ls_intc_of_init(struct device_node *node,
+				       unsigned int num_chips)
+{
+	struct ls_intc_data *intc[MAX_CHIPS];
+	struct irq_chip_generic *gc;
+	struct irq_chip_type *ct;
+	struct irq_domain *domain;
+	void __iomem *base;
+	int parent_irq[MAX_CHIPS], err = 0;
+	unsigned int i = 0;
+
+	base = of_iomap(node, 0);
+	if (!base)
+		return -ENODEV;
+
+	for (i = 0; i < num_chips; i++) {
+		/* Mask all irqs */
+		writel(0x0, base + (i * CHIP_SIZE) +
+		       LS_REG_INTC_EN);
+
+		/* Set all irqs to high level triggered */
+		writel(0xffffffff, base + (i * CHIP_SIZE) +
+		       LS_REG_INTC_POL);
+
+		intc[i] = kzalloc(sizeof(*intc[i]), GFP_KERNEL);
+		if (!intc[i]) {
+			err = -ENOMEM;
+			goto out_err;
+		}
+
+		intc[i]->base = base;
+		intc[i]->chip = i;
+
+		parent_irq[i] = irq_of_parse_and_map(node, i);
+		if (!parent_irq[i]) {
+			pr_warn("unable to get parent irq for irqchip %u", i);
+			kfree(intc[i]);
+			intc[i] = NULL;
+			err = -EINVAL;
+			goto out_err;
+		}
+
+		err = irq_set_handler_data(parent_irq[i], intc[i]);
+		if (err)
+			goto out_err;
+
+		gc = irq_alloc_generic_chip("INTC", 1,
+					    LS1X_IRQ_BASE + (i * 32),
+					    base + (i * CHIP_SIZE),
+					    handle_level_irq);
+
+		ct = gc->chip_types;
+		ct->regs.mask = LS_REG_INTC_EN;
+		ct->regs.ack = LS_REG_INTC_CLR;
+		ct->chip.irq_unmask = irq_gc_mask_set_bit;
+		ct->chip.irq_mask = irq_gc_mask_clr_bit;
+		ct->chip.irq_ack = irq_gc_ack_set_bit;
+		ct->chip.irq_set_type = ls_intc_set_type;
+
+		irq_setup_generic_chip(gc, IRQ_MSK(32), 0, 0,
+				       IRQ_NOPROBE | IRQ_LEVEL);
+	}
+
+	domain = irq_domain_add_legacy(node, num_chips * 32, LS1X_IRQ_BASE, 0,
+				       &irq_domain_simple_ops, NULL);
+	if (!domain) {
+		pr_warn("unable to register IRQ domain\n");
+		err = -EINVAL;
+		goto out_err;
+	}
+
+	for (i = 0; i < num_chips; i++)
+		setup_irq(parent_irq[i], &intc_cascade_action);
+
+	return 0;
+
+out_err:
+	for (i = 0; i < MAX_CHIPS; i++) {
+		if (intc[i]) {
+			kfree(intc[i]);
+			irq_dispose_mapping(parent_irq[i]);
+		} else {
+			break;
+		}
+	}
+	return err;
+}
+
+static int __init intc_4chip_of_init(struct device_node *node,
+				     struct device_node *parent)
+{
+	return ls_intc_of_init(node, 4);
+}
+IRQCHIP_DECLARE(ls1b_intc, "loongson,ls1b-intc", intc_4chip_of_init);
+
+static int __init intc_5chip_of_init(struct device_node *node,
+	struct device_node *parent)
+{
+	return ls_intc_of_init(node, 5);
+}
+IRQCHIP_DECLARE(ls1c_intc, "loongson,ls1c-intc", intc_5chip_of_init);
-- 
2.20.1
