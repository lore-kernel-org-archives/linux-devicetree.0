From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 14/15] spmi: pmic-arb: validate type when mapping IRQ
Date: Sat, 19 Jan 2019 15:42:51 -0500
Message-ID: <20190119204252.18370-15-masneyb@onstation.org>
References: <20190119204252.18370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

qpnpint_irq_domain_map did not validate the IRQ type and this can cause
IRQs to not work as expected if an unsupported type (such as
IRQ_TYPE_NONE) is passed in. Now that spmi-gpio is a hierarchical IRQ
controller, and all device tree bindings have been updated, add
additional validation to the type field.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Patch introduced in v6

 drivers/spmi/spmi-pmic-arb.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index bc7dc1d6e4b2..5666b99c9a92 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -740,9 +740,9 @@ static int qpnpint_irq_domain_translate(struct irq_domain *d,
 }
 
 
-static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
-				   struct irq_domain *domain, unsigned int virq,
-				   irq_hw_number_t hwirq, unsigned int type)
+static int qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
+				  struct irq_domain *domain, unsigned int virq,
+				  irq_hw_number_t hwirq, unsigned int type)
 {
 	irq_flow_handler_t handler;
 	unsigned int old_virq;
@@ -756,11 +756,15 @@ static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		handler = handle_edge_irq;
-	else
+	else if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
 		handler = handle_level_irq;
+	else
+		return -EINVAL;
 
 	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
 			    handler, NULL, NULL);
+
+	return 0;
 }
 
 static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
@@ -777,9 +781,12 @@ static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < nr_irqs; i++)
-		qpnpint_irq_domain_map(pmic_arb, domain, virq + i, hwirq + i,
-				       type);
+	for (i = 0; i < nr_irqs; i++) {
+		ret = qpnpint_irq_domain_map(pmic_arb, domain, virq + i,
+					     hwirq + i, type);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.17.2
