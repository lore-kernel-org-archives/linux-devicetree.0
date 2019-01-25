From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 4/9] mfd: pm8xxx: disassociate old virq if hwirq mapping already exists
Date: Fri, 25 Jan 2019 11:22:57 -0500
Message-ID: <20190125162302.14036-5-masneyb@onstation.org>
References: <20190125162302.14036-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Check to see if the hwirq is already associated with another virq on
this IRQ domain. If so, then disassociate it before associating the
hwirq with the new virq.

This is a temporary hack that is needed in order to not break git
bisect for existing boards. The next patch in this series converts
ssbi-gpio to be a hierarchical IRQ chip, then there are several patches
to update all of the device tree files, and finally this patch will be
reverted within the same patch series.

IRQs for ssbi-gpio are all initially setup without an IRQ hierarchy
this driver is probed due to the interrupts property in device tree.
Once ssbi-gpio is converted to be a hierarchical IRQ chip in the next
patch, existing users of gpio[d]_to_irq() will call pmic_gpio_to_irq(),
and that will use the new IRQ chip code in ssbi-gpio that sets up the
IRQ in an IRQ hierarchy. The hwirq is now associated with two Linux
virqs and interrupts will not work as expected. This patch corrects
that issue.

This change was not tested on any actual hardware, however the same
change was made to spmi-pmic-arb.c and tested on a LG Nexus 5
(hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/mfd/qcom-pm8xxx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index a976890c4019..97b931465601 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -387,6 +387,11 @@ static void pm8xxx_irq_domain_map(struct pm_irq_chip *chip,
 				  irq_hw_number_t hwirq, unsigned int type)
 {
 	irq_flow_handler_t handler;
+	unsigned int old_virq;
+
+	old_virq = irq_find_mapping(domain, hwirq);
+	if (old_virq)
+		irq_domain_disassociate(domain, old_virq);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		handler = handle_edge_irq;
-- 
2.17.2
