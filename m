From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 9/9] mfd: pm8xxx: revert "disassociate old virq if hwirq mapping already exists"
Date: Fri, 25 Jan 2019 11:23:02 -0500
Message-ID: <20190125162302.14036-10-masneyb@onstation.org>
References: <20190125162302.14036-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that ssbi-gpio is a proper hierarchical IRQ chip, and all in-tree
users of device tree have been updated, we can now drop the hack that
was introduced to disassociate the old Linux virq if a hwirq mapping
already exists. That patch was introduced to not break git bisect for
any existing boards.

This change was not tested on any actual hardware, however the same
change was made to spmi-pmic-arb.c and tested on a LG Nexus 5
(hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/mfd/qcom-pm8xxx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 97b931465601..a976890c4019 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -387,11 +387,6 @@ static void pm8xxx_irq_domain_map(struct pm_irq_chip *chip,
 				  irq_hw_number_t hwirq, unsigned int type)
 {
 	irq_flow_handler_t handler;
-	unsigned int old_virq;
-
-	old_virq = irq_find_mapping(domain, hwirq);
-	if (old_virq)
-		irq_domain_disassociate(domain, old_virq);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		handler = handle_edge_irq;
-- 
2.17.2
