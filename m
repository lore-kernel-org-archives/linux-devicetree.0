From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 4/5] irqchip/gic-v3: Add support for partitioned PPIs
Date: Mon, 11 Apr 2016 09:57:54 +0100
Message-ID: <1460365075-7316-5-git-send-email-marc.zyngier@arm.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460365075-7316-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Plug the partitioning layer into the GICv3 PPI code, parsing the
DT and building the partition affinities and providing the generic
code with partition data and callbacks.

Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 drivers/irqchip/Kconfig      |   1 +
 drivers/irqchip/irq-gic-v3.c | 176 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ea1836b..6c17de7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -27,6 +27,7 @@ config ARM_GIC_V3
 	select IRQ_DOMAIN
 	select MULTI_IRQ_HANDLER
 	select IRQ_DOMAIN_HIERARCHY
+	select PARTITION_PERCPU
 
 config ARM_GIC_V3_ITS
 	bool
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 5b7d3c2..f83e5f4 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -29,6 +29,7 @@
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/irqchip/irq-partition-percpu.h>
 
 #include <asm/cputype.h>
 #include <asm/exception.h>
@@ -44,6 +45,7 @@ struct redist_region {
 };
 
 struct gic_chip_data {
+	struct fwnode_handle	*fwnode;
 	void __iomem		*dist_base;
 	struct redist_region	*redist_regions;
 	struct rdists		rdists;
@@ -51,6 +53,7 @@ struct gic_chip_data {
 	u64			redist_stride;
 	u32			nr_redist_regions;
 	unsigned int		irq_nr;
+	struct partition_desc	*ppi_descs[16];
 };
 
 static struct gic_chip_data gic_data __read_mostly;
@@ -812,10 +815,62 @@ static void gic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
 	}
 }
 
+static int gic_irq_domain_select(struct irq_domain *d,
+				 struct irq_fwspec *fwspec,
+				 enum irq_domain_bus_token bus_token)
+{
+	/* Not for us */
+        if (fwspec->fwnode != d->fwnode)
+		return 0;
+
+	/* If this is not DT, then we have a single domain */
+	if (!is_of_node(fwspec->fwnode))
+		return 1;
+
+	/*
+	 * If this is a PPI and we have a 4th (non-null) parameter,
+	 * then we need to match the partition domain.
+	 */
+	if (fwspec->param_count >= 4 &&
+	    fwspec->param[0] == 1 && fwspec->param[3] != 0)
+		return d == partition_get_domain(gic_data.ppi_descs[fwspec->param[1]]);
+
+	return d == gic_data.domain;
+}
+
 static const struct irq_domain_ops gic_irq_domain_ops = {
 	.translate = gic_irq_domain_translate,
 	.alloc = gic_irq_domain_alloc,
 	.free = gic_irq_domain_free,
+	.select = gic_irq_domain_select,
+};
+
+static int partition_domain_translate(struct irq_domain *d,
+				      struct irq_fwspec *fwspec,
+				      unsigned long *hwirq,
+				      unsigned int *type)
+{
+	struct device_node *np;
+	int ret;
+
+	np = of_find_node_by_phandle(fwspec->param[3]);
+	if (WARN_ON(!np))
+		return -EINVAL;
+
+	ret = partition_translate_id(gic_data.ppi_descs[fwspec->param[1]],
+				     of_node_to_fwnode(np));
+	if (ret < 0)
+		return ret;
+
+	*hwirq = ret;
+	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
+}
+
+static const struct irq_domain_ops partition_domain_ops = {
+	.translate = partition_domain_translate,
+	.select = gic_irq_domain_select,
 };
 
 static void gicv3_enable_quirks(void)
@@ -843,6 +898,7 @@ static int __init gic_init_bases(void __iomem *dist_base,
 	if (static_key_true(&supports_deactivate))
 		pr_info("GIC: Using split EOI/Deactivate mode\n");
 
+	gic_data.fwnode = handle;
 	gic_data.dist_base = dist_base;
 	gic_data.redist_regions = rdist_regs;
 	gic_data.nr_redist_regions = nr_redist_regions;
@@ -901,6 +957,119 @@ static int __init gic_validate_dist_version(void __iomem *dist_base)
 	return 0;
 }
 
+static int get_cpu_number(struct device_node *dn)
+{
+	const __be32 *cell;
+	u64 hwid;
+	int i;
+
+	cell = of_get_property(dn, "reg", NULL);
+	if (!cell)
+		return -1;
+
+	hwid = of_read_number(cell, of_n_addr_cells(dn));
+
+	/*
+	 * Non affinity bits must be set to 0 in the DT
+	 */
+	if (hwid & ~MPIDR_HWID_BITMASK)
+		return -1;
+
+	for (i = 0; i < num_possible_cpus(); i++)
+		if (cpu_logical_map(i) == hwid)
+			return i;
+
+	return -1;
+}
+
+/* Create all possible partitions at boot time */
+static void gic_populate_ppi_partitions(struct device_node *gic_node)
+{
+	struct device_node *parts_node, *child_part;
+	int part_idx = 0, i;
+	int nr_parts;
+	struct partition_affinity *parts;
+
+	parts_node = of_find_node_by_name(gic_node, "ppi-partitions");
+	if (!parts_node)
+		return;
+
+	nr_parts = of_get_child_count(parts_node);
+
+	if (!nr_parts)
+		return;
+
+	parts = kzalloc(sizeof(*parts) * nr_parts, GFP_KERNEL);
+	if (WARN_ON(!parts))
+		return;
+
+	for_each_child_of_node(parts_node, child_part) {
+		struct partition_affinity *part;
+		int n;
+
+		part = &parts[part_idx];
+
+		part->partition_id = of_node_to_fwnode(child_part);
+
+		pr_info("GIC: PPI partition %s[%d] { ",
+			child_part->name, part_idx);
+
+		n = of_property_count_elems_of_size(child_part, "affinity",
+						    sizeof(u32));
+		WARN_ON(n <= 0);
+
+		for (i = 0; i < n; i++) {
+			int err, cpu;
+			u32 cpu_phandle;
+			struct device_node *cpu_node;
+
+			err = of_property_read_u32_index(child_part, "affinity",
+							 i, &cpu_phandle);
+			if (WARN_ON(err))
+				continue;
+
+			cpu_node = of_find_node_by_phandle(cpu_phandle);
+			if (WARN_ON(!cpu_node))
+				continue;
+
+			cpu = get_cpu_number(cpu_node);
+			if (WARN_ON(cpu == -1))
+				continue;
+
+			pr_cont("%s[%d] ", cpu_node->full_name, cpu);
+
+			cpumask_set_cpu(cpu, &part->mask);
+		}
+
+		pr_cont("}\n");
+		part_idx++;
+	}
+
+	for (i = 0; i < 16; i++) {
+		unsigned int irq;
+		struct partition_desc *desc;
+		struct irq_fwspec ppi_fwspec = {
+			.fwnode		= gic_data.fwnode,
+			.param_count	= 3,
+			.param		= {
+				[0]	= 1,
+				[1]	= i,
+				[2]	= IRQ_TYPE_NONE,
+			},
+		};
+
+		irq = irq_create_fwspec_mapping(&ppi_fwspec);
+		if (WARN_ON(!irq))
+			continue;
+		desc = partition_create_desc(gic_data.fwnode, parts, nr_parts,
+					     irq, &partition_domain_ops);
+		if (WARN_ON(!desc))
+			continue;
+
+		gic_data.ppi_descs[i] = desc;
+	}
+}
+
 static int __init gic_of_init(struct device_node *node, struct device_node *parent)
 {
 	void __iomem *dist_base;
@@ -952,8 +1121,11 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 
 	err = gic_init_bases(dist_base, rdist_regs, nr_redist_regions,
 			     redist_stride, &node->fwnode);
-	if (!err)
-		return 0;
+	if (err)
+		goto out_unmap_rdist;
+
+	gic_populate_ppi_partitions(node);
+	return 0;
 
 out_unmap_rdist:
 	for (i = 0; i < nr_redist_regions; i++)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
