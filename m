From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/4] irqchip: mtk-sysirq: support second intpol base
Date: Thu, 8 Sep 2016 18:49:51 +0800
Message-ID: <1473331794-27542-3-git-send-email-mars.cheng@mediatek.com>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473331794-27542-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Original mtk-sysirq does not support multiple intpol bases. However,
there are some mtk chips need it.

Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/irqchip/irq-mtk-sysirq.c |   42 +++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 63ac73b..20f488a 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -24,7 +24,10 @@
 
 struct mtk_sysirq_chip_data {
 	spinlock_t lock;
+	unsigned int intpol_num;
+	unsigned int intpol_num_ex;
 	void __iomem *intpol_base;
+	void __iomem *intpol_base_ex;
 };
 
 static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
@@ -32,14 +35,22 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 	irq_hw_number_t hwirq = data->hwirq;
 	struct mtk_sysirq_chip_data *chip_data = data->chip_data;
 	u32 offset, reg_index, value;
+	void __iomem *intpol_base;
 	unsigned long flags;
 	int ret;
 
+	if (hwirq >= (chip_data->intpol_num)) {
+		intpol_base = chip_data->intpol_base_ex;
+		reg_index = (hwirq - chip_data->intpol_num) >> 5;
+	} else {
+		intpol_base = chip_data->intpol_base;
+		reg_index = hwirq >> 5;
+	}
+
 	offset = hwirq & 0x1f;
-	reg_index = hwirq >> 5;
 
 	spin_lock_irqsave(&chip_data->lock, flags);
-	value = readl_relaxed(chip_data->intpol_base + reg_index * 4);
+	value = readl_relaxed(intpol_base + reg_index * 4);
 	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
 		if (type == IRQ_TYPE_LEVEL_LOW)
 			type = IRQ_TYPE_LEVEL_HIGH;
@@ -49,7 +60,7 @@ static int mtk_sysirq_set_type(struct irq_data *data, unsigned int type)
 	} else {
 		value &= ~(1 << offset);
 	}
-	writel(value, chip_data->intpol_base + reg_index * 4);
+	writel(value, intpol_base + reg_index * 4);
 
 	data = data->parent_data;
 	ret = data->chip->irq_set_type(data, type);
@@ -124,7 +135,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 {
 	struct irq_domain *domain, *domain_parent;
 	struct mtk_sysirq_chip_data *chip_data;
-	int ret, size, intpol_num;
+	int ret, size, total_intpol_num;
 	struct resource res;
 
 	domain_parent = irq_find_host(parent);
@@ -142,7 +153,8 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		return -ENOMEM;
 
 	size = resource_size(&res);
-	intpol_num = size * 8;
+	chip_data->intpol_num = size * 8;
+	total_intpol_num = chip_data->intpol_num;
 	chip_data->intpol_base = ioremap(res.start, size);
 	if (!chip_data->intpol_base) {
 		pr_err("mtk_sysirq: unable to map sysirq register\n");
@@ -150,8 +162,22 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 		goto out_free;
 	}
 
-	domain = irq_domain_add_hierarchy(domain_parent, 0, intpol_num, node,
-					  &sysirq_domain_ops, chip_data);
+	/* if we get the second base, handle it, or just go on */
+	ret = of_address_to_resource(node, 1, &res);
+	if (!ret) { /* if we get the second base, handle it */
+		size = resource_size(&res);
+		chip_data->intpol_num_ex = size * 8;
+		total_intpol_num += chip_data->intpol_num_ex;
+		chip_data->intpol_base_ex = ioremap(res.start, size);
+		if (!chip_data->intpol_base_ex) {
+			pr_err("mtk_sysirq: unable to map sysirq register\n");
+			ret = -ENXIO;
+			goto out_free_ex;
+		}
+	}
+
+	domain = irq_domain_add_hierarchy(domain_parent, 0, total_intpol_num,
+					  node, &sysirq_domain_ops, chip_data);
 	if (!domain) {
 		ret = -ENOMEM;
 		goto out_unmap;
@@ -161,6 +187,8 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	return 0;
 
 out_unmap:
+	iounmap(chip_data->intpol_base_ex);
+out_free_ex:
 	iounmap(chip_data->intpol_base);
 out_free:
 	kfree(chip_data);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
