From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 02/12] irqchip: nvic: support hierarchy irq domain
Date: Fri, 13 Mar 2015 00:36:10 +0100
Message-ID: <1426203380-7155-3-git-send-email-stefan@agner.ch>
References: <1426203380-7155-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426203380-7155-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add support for hierarchy irq domain. Use to support the interrupt
router found in Vybrid SoC, which is between the NVIC and the
peripherals.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/irqchip/irq-nvic.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index 4ff0805..5fac910 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -49,6 +49,31 @@ nvic_handle_irq(irq_hw_number_t hwirq, struct pt_regs *regs)
 	handle_IRQ(irq, regs);
 }
 
+static int nvic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	int i, ret;
+	irq_hw_number_t hwirq;
+	unsigned int type = IRQ_TYPE_NONE;
+	struct of_phandle_args *irq_data = arg;
+
+	ret = irq_domain_xlate_onecell(domain, irq_data->np, irq_data->args,
+				   irq_data->args_count, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++)
+		irq_map_generic_chip(domain, virq + i, hwirq + i);
+
+	return 0;
+}
+
+static const struct irq_domain_ops nvic_irq_domain_ops = {
+	.xlate = irq_domain_xlate_onecell,
+	.alloc = nvic_irq_domain_alloc,
+	.free = irq_domain_free_irqs_top,
+};
+
 static int __init nvic_of_init(struct device_node *node,
 			       struct device_node *parent)
 {
@@ -70,7 +95,8 @@ static int __init nvic_of_init(struct device_node *node,
 		irqs = NVIC_MAX_IRQ;
 
 	nvic_irq_domain =
-		irq_domain_add_linear(node, irqs, &irq_generic_chip_ops, NULL);
+		irq_domain_add_linear(node, irqs, &nvic_irq_domain_ops, NULL);
+
 	if (!nvic_irq_domain) {
 		pr_warn("Failed to allocate irq domain\n");
 		return -ENOMEM;
-- 
2.3.1
