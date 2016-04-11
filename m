From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 3/5] irqchip: Add per-cpu interrupt partitioning library
Date: Mon, 11 Apr 2016 09:57:53 +0100
Message-ID: <1460365075-7316-4-git-send-email-marc.zyngier@arm.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Jason Cooper <jason@lakedaemon.net>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We've unfortunately started seeing a situation where percpu interrupts
are partitioned in the system: one arbitrary set of CPUs has an
interrupt connected to a type of device, while another disjoint
set of CPUs has the same interrupt connected to another type of device.

This makes it impossible to have a device driver requesting this interrupt
using the current percpu-interrupt abstraction, as the same interrupt number
is now potentially claimed by at least two drivers, and we forbid interrupt
sharing on per-cpu interrupt.

A solution to this is to turn things upside down. Let's assume that our
system describes all the possible partitions for a given interrupt, and
give each of them a unique identifier. It is then possible to create
a namespace where the affinity identifier itself is a form of interrupt
number. At this point, it becomes easy to implement a set of partitions
as a cascaded irqchip, each affinity identifier being the HW irq.

This allows us to keep a number of nice properties:
- Each partition results in a separate percpu-interrupt (with a restrictied
  affinity), which keeps drivers happy.
- Because the underlying interrupt is still per-cpu, the overhead of
  the indirection can be kept pretty minimal.
- The core code can ignore most of that crap.

For that purpose, we implement a small library that deals with some of
the boilerplate code, relying on platform-specific drivers to provide
a description of the affinity sets and a set of callbacks.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/irqchip/Kconfig                      |   3 +
 drivers/irqchip/Makefile                     |   1 +
 drivers/irqchip/irq-partition-percpu.c       | 256 +++++++++++++++++++++++++++
 include/linux/irqchip/irq-partition-percpu.h |  59 ++++++
 4 files changed, 319 insertions(+)
 create mode 100644 drivers/irqchip/irq-partition-percpu.c
 create mode 100644 include/linux/irqchip/irq-partition-percpu.h

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3e12479..ea1836b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -244,3 +244,6 @@ config IRQ_MXS
 config MVEBU_ODMI
 	bool
 	select GENERIC_MSI_IRQ_DOMAIN
+
+config PARTITION_PERCPU
+	bool
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index b03cfcb..e354b00c 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_REALVIEW_DT)		+= irq-gic-realview.o
 obj-$(CONFIG_ARM_GIC_V2M)		+= irq-gic-v2m.o
 obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-common.o
 obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v3-its-pci-msi.o irq-gic-v3-its-platform-msi.o
+obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
 obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
 obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
diff --git a/drivers/irqchip/irq-partition-percpu.c b/drivers/irqchip/irq-partition-percpu.c
new file mode 100644
index 0000000..ccd72c2
--- /dev/null
+++ b/drivers/irqchip/irq-partition-percpu.c
@@ -0,0 +1,256 @@
+/*
+ * Copyright (C) 2016 ARM Limited, All Rights Reserved.
+ * Author: Marc Zyngier <marc.zyngier@arm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqchip/irq-partition-percpu.h>
+#include <linux/irqdomain.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+struct partition_desc {
+	int				nr_parts;
+	struct partition_affinity	*parts;
+	struct irq_domain		*domain;
+	struct irq_desc			*chained_desc;
+	unsigned long			*bitmap;
+	struct irq_domain_ops		ops;
+};
+
+static bool partition_check_cpu(struct partition_desc *part,
+				unsigned int cpu, unsigned int hwirq)
+{
+	return cpumask_test_cpu(cpu, &part->parts[hwirq].mask);
+}
+
+static void partition_irq_mask(struct irq_data *d)
+{
+	struct partition_desc *part = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
+	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
+
+	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
+	    chip->irq_mask)
+		chip->irq_mask(data);
+}
+
+static void partition_irq_unmask(struct irq_data *d)
+{
+	struct partition_desc *part = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
+	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
+
+	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
+	    chip->irq_unmask)
+		chip->irq_unmask(data);
+}
+
+static int partition_irq_set_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool val)
+{
+	struct partition_desc *part = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
+	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
+
+	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
+	    chip->irq_set_irqchip_state)
+		return chip->irq_set_irqchip_state(data, which, val);
+
+	return -EINVAL;
+}
+
+static int partition_irq_get_irqchip_state(struct irq_data *d,
+					   enum irqchip_irq_state which,
+					   bool *val)
+{
+	struct partition_desc *part = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
+	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
+
+	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
+	    chip->irq_get_irqchip_state)
+		return chip->irq_get_irqchip_state(data, which, val);
+
+	return -EINVAL;
+}
+
+static int partition_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct partition_desc *part = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
+	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
+
+	if (chip->irq_set_type)
+		return chip->irq_set_type(data, type);
+
+	return -EINVAL;
+}
+
+static void partition_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct partition_desc *part = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
+	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
+
+	seq_printf(p, " %5s-%lu", chip->name, data->hwirq);
+}
+
+static struct irq_chip partition_irq_chip = {
+	.irq_mask		= partition_irq_mask,
+	.irq_unmask		= partition_irq_unmask,
+	.irq_set_type		= partition_irq_set_type,
+	.irq_get_irqchip_state	= partition_irq_get_irqchip_state,
+	.irq_set_irqchip_state	= partition_irq_set_irqchip_state,
+	.irq_print_chip		= partition_irq_print_chip,
+};
+
+static void partition_handle_irq(struct irq_desc *desc)
+{
+	struct partition_desc *part = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	int cpu = smp_processor_id();
+	int hwirq;
+
+	chained_irq_enter(chip, desc);
+
+	for_each_set_bit(hwirq, part->bitmap, part->nr_parts) {
+		if (partition_check_cpu(part, cpu, hwirq))
+			break;
+	}
+
+	if (unlikely(hwirq == part->nr_parts)) {
+		handle_bad_irq(desc);
+	} else {
+		unsigned int irq;
+		irq = irq_find_mapping(part->domain, hwirq);
+		generic_handle_irq(irq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int partition_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				  unsigned int nr_irqs, void *arg)
+{
+	int ret;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	struct irq_fwspec *fwspec = arg;
+	struct partition_desc *part;
+
+	BUG_ON(nr_irqs != 1);
+	ret = domain->ops->translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	part = domain->host_data;
+
+	set_bit(hwirq, part->bitmap);
+	irq_set_chained_handler_and_data(irq_desc_get_irq(part->chained_desc),
+					 partition_handle_irq, part);
+	irq_set_percpu_devid_partition(virq, &part->parts[hwirq].mask);
+	irq_domain_set_info(domain, virq, hwirq, &partition_irq_chip, part,
+			    handle_percpu_devid_irq, NULL, NULL);
+	irq_set_status_flags(virq, IRQ_NOAUTOEN);
+
+	return 0;
+}
+
+static void partition_domain_free(struct irq_domain *domain, unsigned int virq,
+				  unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	BUG_ON(nr_irqs != 1);
+
+	d = irq_domain_get_irq_data(domain, virq);
+	irq_set_handler(virq, NULL);
+	irq_domain_reset_irq_data(d);
+}
+
+int partition_translate_id(struct partition_desc *desc, void *partition_id)
+{
+	struct partition_affinity *part = NULL;
+	int i;
+
+	for (i = 0; i < desc->nr_parts; i++) {
+		if (desc->parts[i].partition_id == partition_id) {
+			part = &desc->parts[i];
+			break;
+		}
+	}
+
+	if (WARN_ON(!part)) {
+		pr_err("Failed to find partition\n");
+		return -EINVAL;
+	}
+
+	return i;
+}
+
+struct partition_desc *partition_create_desc(struct fwnode_handle *fwnode,
+					     struct partition_affinity *parts,
+					     int nr_parts,
+					     int chained_irq,
+					     const struct irq_domain_ops *ops)
+{
+	struct partition_desc *desc;
+	struct irq_domain *d;
+
+	BUG_ON(!ops->select || !ops->translate);
+
+	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
+	if (!desc)
+		return NULL;
+
+	desc->ops = *ops;
+	desc->ops.free = partition_domain_free;
+	desc->ops.alloc = partition_domain_alloc;
+
+	d = irq_domain_create_linear(fwnode, nr_parts, &desc->ops, desc);
+	if (!d)
+		goto out;
+	desc->domain = d;
+
+	desc->bitmap = kzalloc(sizeof(long) * BITS_TO_LONGS(nr_parts),
+			       GFP_KERNEL);
+	if (WARN_ON(!desc->bitmap))
+		goto out;
+
+	desc->chained_desc = irq_to_desc(chained_irq);
+	desc->nr_parts = nr_parts;
+	desc->parts = parts;
+
+	return desc;
+out:
+	if (d)
+		irq_domain_remove(d);
+	kfree(desc);
+
+	return NULL;
+}
+
+struct irq_domain *partition_get_domain(struct partition_desc *dsc)
+{
+	if (dsc)
+		return dsc->domain;
+
+	return NULL;
+}
diff --git a/include/linux/irqchip/irq-partition-percpu.h b/include/linux/irqchip/irq-partition-percpu.h
new file mode 100644
index 0000000..87433a5
--- /dev/null
+++ b/include/linux/irqchip/irq-partition-percpu.h
@@ -0,0 +1,59 @@
+/*
+ * Copyright (C) 2016 ARM Limited, All Rights Reserved.
+ * Author: Marc Zyngier <marc.zyngier@arm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/fwnode.h>
+#include <linux/cpumask.h>
+#include <linux/irqdomain.h>
+
+struct partition_affinity {
+	cpumask_t			mask;
+	void				*partition_id;
+};
+
+struct partition_desc;
+
+#ifdef CONFIG_PARTITION_PERCPU
+int partition_translate_id(struct partition_desc *desc, void *partition_id);
+struct partition_desc *partition_create_desc(struct fwnode_handle *fwnode,
+					     struct partition_affinity *parts,
+					     int nr_parts,
+					     int chained_irq,
+					     const struct irq_domain_ops *ops);
+struct irq_domain *partition_get_domain(struct partition_desc *dsc);
+#else
+static inline int partition_translate_id(struct partition_desc *desc,
+					 void *partition_id)
+{
+	return -EINVAL;
+}
+
+static inline
+struct partition_desc *partition_create_desc(struct fwnode_handle *fwnode,
+					     struct partition_affinity *parts,
+					     int nr_parts,
+					     int chained_irq,
+					     const struct irq_domain_ops *ops)
+{
+	return NULL;
+}
+
+static inline
+struct irq_domain *partition_get_domain(struct partition_desc *dsc)
+{
+	return NULL;
+}
+#endif
-- 
2.1.4
