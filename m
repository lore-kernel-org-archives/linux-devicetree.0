From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Fri, 8 Dec 2017 15:33:00 +0100
Message-ID: <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The LS1021A allows inverting the polarity of six interrupt lines
IRQ[0:5] via the scfg_intpcr register, effectively allowing
IRQ_TYPE_LEVEL_LOW and IRQ_TYPE_EDGE_FALLING for those. We just need to
check the type, set the relevant bit in INTPCR accordingly, and fixup
the type argument before calling the GIC's irq_set_type.

In fact, the power-on-reset value of the INTPCR register is so that all
six lines have their polarity inverted. Hence any hardware connected to
those lines is unusable without this: If the line is indeed active low,
the generic GIC code will reject an irq spec with IRQ_TYPE_LEVEL_LOW,
while if the line is active high, we must obviously disable the polarity
inversion before unmasking the interrupt.

I suspect other layerscape SOCs may have something similar, but I have
neither hardware nor documentation.

Since we only need to keep a single pointer in the chip_data (the syscon
regmap), the code could be a little simpler by dropping the struct
extirq_chip_data and just store the regmap directly - but I don't know
if I do need to add a lock or something else to the chip_data, so for
this RFC I've kept the struct.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
Marc, Alexander, thanks a lot for your hints. This is what I came up
with, mostly just copy-pasted from the mtk-sysirq case. I've tested
that it works as expected on my board.

 .../interrupt-controller/fsl,ls1021a-extirq.txt    |  19 +++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-ls1021a.c                      | 157 +++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
 create mode 100644 drivers/irqchip/irq-ls1021a.c

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
new file mode 100644
index 000000000000..53b04b6e1a80
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
@@ -0,0 +1,19 @@
+* Freescale LS1021A external IRQs
+
+The LS1021A supports inverting the polarity of six external interrupt lines.
+
+Required properties:
+- compatible: should be "fsl,ls1021a-extirq"
+- interrupt-controller: Identifies the node as an interrupt controller
+- #interrupt-cells: Use the same format as specified by GIC in arm,gic.txt.
+- interrupt-parent: phandle of GIC.
+- syscon: phandle of Supplemental Configuration Unit (scfg).
+
+Example:
+		extirq: interrupt-controller@15701ac {
+			compatible = "fsl,ls1021a-extirq";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupt-parent = <&gic>;
+			syscon = <&scfg>;
+		};
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index b842dfdc903f..d4576dce24b2 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -80,3 +80,4 @@ obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
 obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
+obj-$(CONFIG_SOC_LS1021A)		+= irq-ls1021a.o
diff --git a/drivers/irqchip/irq-ls1021a.c b/drivers/irqchip/irq-ls1021a.c
new file mode 100644
index 000000000000..2ec4fc023549
--- /dev/null
+++ b/drivers/irqchip/irq-ls1021a.c
@@ -0,0 +1,157 @@
+#define pr_fmt(fmt) "irq-ls1021a: " fmt
+
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define INTPCR_REG 0x01ac
+#define NIRQ 6
+
+struct extirq_chip_data {
+	struct regmap *syscon;
+};
+
+static int
+ls1021a_extirq_set_type(struct irq_data *data, unsigned int type)
+{
+	irq_hw_number_t hwirq = data->hwirq;
+	struct extirq_chip_data *chip_data = data->chip_data;
+	u32 value, mask;
+	int ret;
+
+	mask = 1U << (31 - hwirq);
+	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
+		if (type == IRQ_TYPE_LEVEL_LOW)
+			type = IRQ_TYPE_LEVEL_HIGH;
+		else
+			type = IRQ_TYPE_EDGE_RISING;
+		value = mask;
+	} else {
+		value = 0;
+	}
+
+	/* Don't do the INTPCR_REG update if the parent irq_set_type will EINVAL. */
+	if (type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_EDGE_RISING)
+		return -EINVAL;
+
+	/* regmap does internal locking, but do we need to provide our
+	 * own across the parent irq_set_type call? */
+	regmap_update_bits(chip_data->syscon, INTPCR_REG, mask, value);
+
+	data = data->parent_data;
+	ret = data->chip->irq_set_type(data, type);
+
+	return ret;
+}
+
+static struct irq_chip extirq_chip = {
+	.name			= "LS1021A_EXTIRQ",
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_eoi		= irq_chip_eoi_parent,
+	.irq_set_type		= ls1021a_extirq_set_type,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
+static int
+ls1021a_extirq_domain_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
+				unsigned long *hwirq, unsigned int *type)
+{
+	if (!is_of_node(fwspec->fwnode))
+		return -EINVAL;
+
+	if (fwspec->param_count != 3)
+		return -EINVAL;
+
+	/* No PPI should point to this domain */
+	if (fwspec->param[0] != 0)
+		return -EINVAL;
+
+	*hwirq = fwspec->param[1];
+	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+	return 0;
+}
+
+static int
+ls1021a_extirq_domain_alloc(struct irq_domain *domain, unsigned int virq,
+			    unsigned int nr_irqs, void *arg)
+{
+	static const unsigned xlate[NIRQ] = {163,164,165,167,168,169};
+	int i;
+	irq_hw_number_t hwirq;
+	struct irq_fwspec *fwspec = arg;
+	struct irq_fwspec gic_fwspec;
+
+	if (fwspec->param_count != 3)
+		return -EINVAL;
+
+	if (fwspec->param[0])
+		return -EINVAL;
+
+	hwirq = fwspec->param[1];
+	for (i = 0; i < nr_irqs; i++)
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &extirq_chip,
+					      domain->host_data);
+
+	gic_fwspec.fwnode = domain->parent->fwnode;
+	gic_fwspec.param_count = 3;
+	gic_fwspec.param[0] = 0;
+	gic_fwspec.param[1] = xlate[hwirq];
+	gic_fwspec.param[2] = fwspec->param[2];
+	
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &gic_fwspec);
+}
+
+static const struct irq_domain_ops extirq_domain_ops = {
+	.translate	= ls1021a_extirq_domain_translate,
+	.alloc		= ls1021a_extirq_domain_alloc,
+	.free		= irq_domain_free_irqs_common,
+};
+
+static int __init
+ls1021a_extirq_of_init(struct device_node *node, struct device_node *parent)
+{
+
+	struct irq_domain *domain, *domain_parent;
+	struct extirq_chip_data *chip_data;
+	int ret;
+
+	domain_parent = irq_find_host(parent);
+	if (!domain_parent) {
+		pr_err("interrupt-parent not found\n");
+		return -EINVAL;
+	}
+
+	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
+	if (!chip_data)
+		return -ENOMEM;
+
+	chip_data->syscon = syscon_regmap_lookup_by_phandle(node, "syscon");
+	if (IS_ERR(chip_data->syscon)) {
+		ret = PTR_ERR(chip_data->syscon);
+		goto out_free_chip;
+	}
+
+	domain = irq_domain_add_hierarchy(domain_parent, 0, NIRQ, node,
+					  &extirq_domain_ops, chip_data);
+	if (!domain) {
+		ret = -ENOMEM;
+		goto out_free_chip;
+	}
+
+	return 0;
+
+out_free_chip:
+	kfree(chip_data);
+	return ret;
+}
+
+IRQCHIP_DECLARE(ls1021a_extirq, "fsl,ls1021a-extirq", ls1021a_extirq_of_init);
-- 
2.7.4
