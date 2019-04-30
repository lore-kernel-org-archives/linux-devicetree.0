From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 13/14] irqchip: ti-sci-inta: Add msi domain support
Date: Tue, 30 Apr 2019 15:42:29 +0530
Message-ID: <20190430101230.21794-14-lokeshvutla@ti.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430101230.21794-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a msi domain that is child to the INTA domain. Clients
uses the INTA msi bus layer to allocate irqs in this
msi domain.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes sinece v7:
-None

 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-ti-sci-inta.c | 40 ++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7c84a71bcd88..1fab40487d63 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -441,6 +441,7 @@ config TI_SCI_INTA_IRQCHIP
 	depends on TI_SCI_PROTOCOL
 	select IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
+	select TI_SCI_INTA_MSI_DOMAIN
 	help
 	  This enables the irqchip driver support for K3 Interrupt aggregator
 	  over TI System Control Interface available on some new TI's SoCs.
diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index 87e0abe0041f..011b60a49e3f 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -18,6 +18,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/soc/ti/ti_sci_inta_msi.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <asm-generic/msi.h>
 
@@ -28,6 +29,9 @@
 #define HWIRQ_TO_DEVID(hwirq)	(((hwirq) >> (TI_SCI_DEV_ID_SHIFT)) & \
 				 (TI_SCI_DEV_ID_MASK))
 #define HWIRQ_TO_IRQID(hwirq)	((hwirq) & (TI_SCI_IRQ_ID_MASK))
+#define TO_HWIRQ(dev, index)	((((dev) & TI_SCI_DEV_ID_MASK) << \
+				 TI_SCI_DEV_ID_SHIFT) | \
+				((index) & TI_SCI_IRQ_ID_MASK))
 
 #define MAX_EVENTS_PER_VINT	64
 #define VINT_ENABLE_SET_OFFSET	0x0
@@ -484,9 +488,34 @@ static const struct irq_domain_ops ti_sci_inta_irq_domain_ops = {
 	.alloc		= ti_sci_inta_irq_domain_alloc,
 };
 
+static struct irq_chip ti_sci_inta_msi_irq_chip = {
+	.name			= "MSI-INTA",
+	.flags			= IRQCHIP_SUPPORTS_LEVEL_MSI,
+};
+
+static void ti_sci_inta_msi_set_desc(msi_alloc_info_t *arg,
+				     struct msi_desc *desc)
+{
+	struct platform_device *pdev = to_platform_device(desc->dev);
+
+	arg->desc = desc;
+	arg->hwirq = TO_HWIRQ(pdev->id, desc->inta.dev_index);
+}
+
+static struct msi_domain_ops ti_sci_inta_msi_ops = {
+	.set_desc	= ti_sci_inta_msi_set_desc,
+};
+
+static struct msi_domain_info ti_sci_inta_msi_domain_info = {
+	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+		   MSI_FLAG_LEVEL_CAPABLE),
+	.ops	= &ti_sci_inta_msi_ops,
+	.chip	= &ti_sci_inta_msi_irq_chip,
+};
+
 static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 {
-	struct irq_domain *parent_domain, *domain;
+	struct irq_domain *parent_domain, *domain, *msi_domain;
 	struct device_node *parent_node, *node;
 	struct ti_sci_inta_irq_domain *inta;
 	struct device *dev = &pdev->dev;
@@ -551,6 +580,15 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	msi_domain = ti_sci_inta_msi_create_irq_domain(of_node_to_fwnode(node),
+						&ti_sci_inta_msi_domain_info,
+						domain);
+	if (!msi_domain) {
+		irq_domain_remove(domain);
+		dev_err(dev, "Failed to allocate msi domain\n");
+		return -ENOMEM;
+	}
+
 	INIT_LIST_HEAD(&inta->vint_list);
 	mutex_init(&inta->vint_mutex);
 
-- 
2.21.0
