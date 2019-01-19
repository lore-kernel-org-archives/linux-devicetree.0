From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 15/15] spmi: pmic-arb: revert "disassociate old virq if hwirq mapping already exists"
Date: Sat, 19 Jan 2019 15:42:52 -0500
Message-ID: <20190119204252.18370-16-masneyb@onstation.org>
References: <20190119204252.18370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that spmi-gpio is a proper hierarchical IRQ chip, and all in-tree
users of device tree have been updated, we can now drop the hack that
was introduced to disassociate the old Linux virq if a hwirq mapping
already exists. That patch was introduced to not break git bisect for
any existing boards.

Driver was tested using gpio-keys and iadc/vadc on the LG Nexus 5
(hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v5:
- None

Changes since v4:
- None

Patch introduced in v4.

 drivers/spmi/spmi-pmic-arb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 5666b99c9a92..316e2708f3ba 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -745,15 +745,10 @@ static int qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
 				  irq_hw_number_t hwirq, unsigned int type)
 {
 	irq_flow_handler_t handler;
-	unsigned int old_virq;
 
 	dev_dbg(&pmic_arb->spmic->dev, "virq = %u, hwirq = %lu, type = %u\n",
 		virq, hwirq, type);
 
-	old_virq = irq_find_mapping(domain, hwirq);
-	if (old_virq)
-		irq_domain_disassociate(domain, old_virq);
-
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		handler = handle_edge_irq;
 	else if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
-- 
2.17.2
