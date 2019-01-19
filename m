From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 04/15] spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical IRQ chips
Date: Sat, 19 Jan 2019 15:42:41 -0500
Message-ID: <20190119204252.18370-5-masneyb@onstation.org>
References: <20190119204252.18370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert the spmi-pmic-arb IRQ code to use the version 2 IRQ interface
in order to support hierarchical IRQ chips. This is necessary so that
spmi-gpio can be setup as a hierarchical IRQ chip with pmic-arb as the
parent. IRQ chips in device tree should be usable from the start without
the consumer having to make an additional call to gpio[d]_to_irq() to
get the proper IRQ on the parent.

The old qpnpint_irq_domain_map function would hardcode the handler as
handle_level_irq, however qpnpint_irq_set_type would later override the
handler. Properly set the handler when the IRQ is mapped. This new code
doesn't return an error for IRQ_TYPE_NONE and preserves the existing
behavior of using handle_level_irq since there are some broken device
tree bindings that need to be corrected first.

Driver was tested on a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
The broken device tree bindings are corrected in this patch series and
additional validation to the type field is added later in the series.

Changes since v5:
- Properly set handler to edge or level when the IRQ is mapped.

Changes since v4:
- None

Changes since v3:
- None

Changes since v2:
- Don't move pmic_gpio_of_match block. Use device_get_match_data instead
  of of_match_device.
- Correct build warning on arm64: warning: cast from pointer to integer
  of different size

 drivers/spmi/spmi-pmic-arb.c | 67 +++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 360b8218f322..928759242e42 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -666,7 +666,8 @@ static int qpnpint_get_irqchip_state(struct irq_data *d,
 	return 0;
 }
 
-static int qpnpint_irq_request_resources(struct irq_data *d)
+static int qpnpint_irq_domain_activate(struct irq_domain *domain,
+				       struct irq_data *d, bool reserve)
 {
 	struct spmi_pmic_arb *pmic_arb = irq_data_get_irq_chip_data(d);
 	u16 periph = hwirq_to_per(d->hwirq);
@@ -692,27 +693,25 @@ static struct irq_chip pmic_arb_irqchip = {
 	.irq_set_type	= qpnpint_irq_set_type,
 	.irq_set_wake	= qpnpint_irq_set_wake,
 	.irq_get_irqchip_state	= qpnpint_get_irqchip_state,
-	.irq_request_resources = qpnpint_irq_request_resources,
 	.flags		= IRQCHIP_MASK_ON_SUSPEND,
 };
 
-static int qpnpint_irq_domain_dt_translate(struct irq_domain *d,
-					   struct device_node *controller,
-					   const u32 *intspec,
-					   unsigned int intsize,
-					   unsigned long *out_hwirq,
-					   unsigned int *out_type)
+static int qpnpint_irq_domain_translate(struct irq_domain *d,
+					struct irq_fwspec *fwspec,
+					unsigned long *out_hwirq,
+					unsigned int *out_type)
 {
 	struct spmi_pmic_arb *pmic_arb = d->host_data;
+	u32 *intspec = fwspec->param;
 	u16 apid, ppid;
 	int rc;
 
 	dev_dbg(&pmic_arb->spmic->dev, "intspec[0] 0x%1x intspec[1] 0x%02x intspec[2] 0x%02x\n",
 		intspec[0], intspec[1], intspec[2]);
 
-	if (irq_domain_get_of_node(d) != controller)
+	if (irq_domain_get_of_node(d) != pmic_arb->spmic->dev.of_node)
 		return -EINVAL;
-	if (intsize != 4)
+	if (fwspec->param_count != 4)
 		return -EINVAL;
 	if (intspec[0] > 0xF || intspec[1] > 0xFF || intspec[2] > 0x7)
 		return -EINVAL;
@@ -740,17 +739,43 @@ static int qpnpint_irq_domain_dt_translate(struct irq_domain *d,
 	return 0;
 }
 
-static int qpnpint_irq_domain_map(struct irq_domain *d,
-				  unsigned int virq,
-				  irq_hw_number_t hwirq)
+
+static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
+				   struct irq_domain *domain, unsigned int virq,
+				   irq_hw_number_t hwirq, unsigned int type)
 {
-	struct spmi_pmic_arb *pmic_arb = d->host_data;
+	irq_flow_handler_t handler;
+
+	dev_dbg(&pmic_arb->spmic->dev, "virq = %u, hwirq = %lu, type = %u\n",
+		virq, hwirq, type);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		handler = handle_edge_irq;
+	else
+		handler = handle_level_irq;
+
+	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
+			    handler, NULL, NULL);
+}
+
+static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
+				    unsigned int virq, unsigned int nr_irqs,
+				    void *data)
+{
+	struct spmi_pmic_arb *pmic_arb = domain->host_data;
+	struct irq_fwspec *fwspec = data;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int ret, i;
+
+	ret = qpnpint_irq_domain_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
 
-	dev_dbg(&pmic_arb->spmic->dev, "virq = %u, hwirq = %lu\n", virq, hwirq);
+	for (i = 0; i < nr_irqs; i++)
+		qpnpint_irq_domain_map(pmic_arb, domain, virq + i, hwirq + i,
+				       type);
 
-	irq_set_chip_and_handler(virq, &pmic_arb_irqchip, handle_level_irq);
-	irq_set_chip_data(virq, d->host_data);
-	irq_set_noprobe(virq);
 	return 0;
 }
 
@@ -1126,8 +1151,10 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
 };
 
 static const struct irq_domain_ops pmic_arb_irq_domain_ops = {
-	.map	= qpnpint_irq_domain_map,
-	.xlate	= qpnpint_irq_domain_dt_translate,
+	.activate = qpnpint_irq_domain_activate,
+	.alloc = qpnpint_irq_domain_alloc,
+	.free = irq_domain_free_irqs_common,
+	.translate = qpnpint_irq_domain_translate,
 };
 
 static int spmi_pmic_arb_probe(struct platform_device *pdev)
-- 
2.17.2
