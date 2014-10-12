From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [RFC 5/7] irqchip: nvic: increase number of external interrupts to 112
Date: Sun, 12 Oct 2014 20:13:59 +0200
Message-ID: <a6cf6073e13cfbb98674b0cc9e75330ee821883e.1413136383.git.stefan@agner.ch>
References: <cover.1413136383.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
References: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So far only vectors for up to 48 external interrupts have been
registred in the vector table. Increase the amount of registred
external vectors to 112. Also add a warning in case NVIC reports
support for more interrupts than 128.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/kernel/entry-v7m.S | 4 ++--
 drivers/irqchip/irq-nvic.c  | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 2260f18..1c5deac 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -136,6 +136,6 @@ ENTRY(vector_table)
 	.long	__invalid_entry		@ 13 - Reserved
 	.long	__pendsv_entry		@ 14 - PendSV
 	.long	__invalid_entry		@ 15 - SysTick
-	.rept	64 - 16
-	.long	__irq_entry		@ 16..64 - External Interrupts
+	.rept	128 - 16
+	.long	__irq_entry		@ 16..128 - External Interrupts
 	.endr
diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index 4ff0805..3ecb5fe 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -69,6 +69,8 @@ static int __init nvic_of_init(struct device_node *node,
 	if (irqs > NVIC_MAX_IRQ)
 		irqs = NVIC_MAX_IRQ;
 
+	WARN(irqs > 128, "vector table in entry-v7m.S configured for 128 irqs");
+
 	nvic_irq_domain =
 		irq_domain_add_linear(node, irqs, &irq_generic_chip_ops, NULL);
 	if (!nvic_irq_domain) {
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
