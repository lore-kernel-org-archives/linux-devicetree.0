From: Joe.C <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 3/7] irqchip: gic: Support hierarchy irq domain.
Date: Thu, 9 Oct 2014 22:29:36 +0800
Message-ID: <1412864980-20273-4-git-send-email-yingjoe.chen@mediatek.com>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, yingjoe.chen@gmail.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add support to use gic as a parent for stacked irq domain.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 drivers/irqchip/irq-gic.c | 56 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index dda6dbc..17f5aa6 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -767,19 +767,17 @@ void __init gic_init_physaddr(struct device_node *node)
 static int gic_irq_domain_map(struct irq_domain *d, unsigned int irq,
 				irq_hw_number_t hw)
 {
+	irq_domain_set_hwirq_and_chip(d, irq, hw, &gic_chip, d->host_data);
 	if (hw < 32) {
 		irq_set_percpu_devid(irq);
-		irq_set_chip_and_handler(irq, &gic_chip,
-					 handle_percpu_devid_irq);
+		irq_set_handler(irq, handle_percpu_devid_irq);
 		set_irq_flags(irq, IRQF_VALID | IRQF_NOAUTOEN);
 	} else {
-		irq_set_chip_and_handler(irq, &gic_chip,
-					 handle_fasteoi_irq);
+		irq_set_handler(irq, handle_fasteoi_irq);
 		set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
 
 		gic_routable_irq_domain_ops->map(d, irq, hw);
 	}
-	irq_set_chip_data(irq, d->host_data);
 	return 0;
 }
 
@@ -795,8 +793,6 @@ static int gic_irq_domain_xlate(struct irq_domain *d,
 {
 	unsigned long ret = 0;
 
-	if (d->of_node != controller)
-		return -EINVAL;
 	if (intsize < 3)
 		return -EINVAL;
 
@@ -839,6 +835,46 @@ static struct notifier_block gic_cpu_notifier = {
 };
 #endif
 
+
+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
+static int gic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	int i, ret;
+	irq_hw_number_t hwirq;
+	unsigned int type = IRQ_TYPE_NONE;
+	struct of_phandle_args *irq_data = arg;
+
+	ret = gic_irq_domain_xlate(domain, irq_data->np, irq_data->args,
+				   irq_data->args_count, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++)
+		gic_irq_domain_map(domain, virq+i, hwirq+i);
+
+	return 0;
+}
+
+static void gic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
+				unsigned int nr_irqs)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_set_handler(virq + i, NULL);
+		irq_domain_set_hwirq_and_chip(domain, virq + i, 0, NULL, NULL);
+	}
+}
+
+static const struct irq_domain_ops gic_irq_domain_hierarchy_ops = {
+	.alloc = gic_irq_domain_alloc,
+	.free = gic_irq_domain_free,
+};
+#else
+#define gic_irq_domain_hierarchy_ops 0
+#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
+
 static const struct irq_domain_ops gic_irq_domain_ops = {
 	.map = gic_irq_domain_map,
 	.unmap = gic_irq_domain_unmap,
@@ -952,7 +988,11 @@ void __init gic_init_bases(unsigned int gic_nr, int irq_start,
 
 	gic_irqs -= hwirq_base; /* calculate # of irqs to allocate */
 
-	if (of_property_read_u32(node, "arm,routable-irqs",
+	if (IS_ENABLED(CONFIG_IRQ_DOMAIN_HIERARCHY) &&
+		of_find_property(node, "arm,irq-domain-hierarchy", NULL))
+		gic->domain = irq_domain_add_linear(node, gic_irqs,
+					&gic_irq_domain_hierarchy_ops, gic);
+	else if (of_property_read_u32(node, "arm,routable-irqs",
 				 &nr_routable_irqs)) {
 		irq_base = irq_alloc_descs(irq_start, 16, gic_irqs,
 					   numa_node_id());
-- 
1.8.1.1.dirty
